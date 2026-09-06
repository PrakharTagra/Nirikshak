/**
 * services/compliancePipeline.js
 *
 * Connects lmVerify with the ComplianceEngine post-OCR pipeline:
 * 1. Formats raw scraped listing text into normalized OCR structure (lines + text).
 * 2. Stage 5/6 Mapping: Groq structured declaration extraction with regex fallback.
 * 3. Stage 5 Font/Label Metrics: baseline geometry & legibility analysis.
 * 4. Package Record Builder: canonical commodity classification, unit normalization.
 * 5. Stage 6/7 Codified Rule Engine: deterministic Legal Metrology (Packaged Commodities) Rules, 2011 checks.
 */

import { createRequire } from "module";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const require = createRequire(import.meta.url);

import { runOcrOnProductImages } from "./ocrService.js";

const complianceEnginePipelineDir = path.resolve(
  __dirname,
  "../../../ComplianceEngine/orchestrator/src/pipeline"
);

const { extract, regexExtract } = require(
  path.join(complianceEnginePipelineDir, "stage5_extraction")
);
const { analyzeFont } = require(
  path.join(complianceEnginePipelineDir, "stage5_fontAnalysis")
);
const { buildPackageRecord } = require(
  path.join(complianceEnginePipelineDir, "orchestrator")
);
const { runComplianceCheck } = require(
  path.join(complianceEnginePipelineDir, "stage6_ruleEngine")
);

const BOILERPLATE_PATTERNS = [
  /^skip to main content/i,
  /keyboard shortcuts/i,
  /^delivering to/i,
  /hello, sign in/i,
  /account & lists/i,
  /returns & orders/i,
  /all fresh prime video/i,
  /add to wish list/i,
  /other sellers on amazon/i,
  /save extra with/i,
  /cashback:/i,
  /partner offers:/i,
  /top reviews from/i,
  /verified purchase/i,
  /helpful report/i,
  /amazon science/i,
  /careers/i,
  /press releases/i,
  /make money with us/i,
  /conditions of use/i,
  /privacy notice/i,
  /interest-based ads/i,
  /©\s*\d{4}/i,
  /how are ratings calculated/i,
  /write a product review/i,
  /customers say/i,
  /customers who bought this/i,
  /customers who viewed/i,
  /customers who/i,
  /bought together/i,
  /likely to buy/i,
  /related items/i,
  /shop by brand/i,
  /similar brands/i,
  /compare with similar/i,
  /products related to this/i,
  /products related/i,
  /more items to (?:explore|consider)/i,
  /inspired by your/i,
  /brands in this category/i,
  /top picks for you/i,
  /what other items do customers/i,
  /frequently bought/i,
  /date first available/i,
  /best sellers in/i,
  /sponsored/i,
  /free delivery/i,
  /fastest delivery/i,
  /see more product details/i,
  /report an issue with this product/i,
  /get it by/i,
  /get it \w+/i,
  /delivery by/i,
];

const LM_KEYWORDS = /manufacturer|packer|importer|mfd|pkd|mrp|maximum retail price|inclusive of all taxes|incl\. of|net quantity|net wt|volume|weight|generic name|country of origin|dimensions|customer care|helpline|complaint|phone|email|conditioner|detergent|salt|food|pouch|refill|liquid|solid|size|brand|model|item dimensions|product dimensions/i;

/**
 * Extracts high-value packaging declaration lines from JSON-LD blocks,
 * schema.org Product structures, or raw JSON.
 */
export function extractStructuredDeclarations(structuredDataOrJson) {
  if (!structuredDataOrJson) return [];
  const lines = [];

  let data = structuredDataOrJson;
  if (typeof data === "string") {
    try {
      data = JSON.parse(data);
    } catch {
      return [];
    }
  }

  const blocks = Array.isArray(data.jsonLd)
    ? data.jsonLd
    : Array.isArray(data)
    ? data
    : [data];

  for (const block of blocks) {
    if (!block || typeof block !== "object") continue;

    if (block.name) lines.push(`Product Name: ${block.name}`);
    if (block.brand) {
      const b = typeof block.brand === "object" ? block.brand.name : block.brand;
      if (b) lines.push(`Brand: ${b}`);
    }
    if (block.manufacturer) {
      const m = typeof block.manufacturer === "object" ? (block.manufacturer.name || block.manufacturer.legalName) : block.manufacturer;
      if (m) lines.push(`Manufacturer: ${m}`);
    }
    if (block.offers) {
      const offers = Array.isArray(block.offers) ? block.offers : [block.offers];
      for (const off of offers) {
        if (off.price) {
          const cur = off.priceCurrency || "INR";
          lines.push(`M.R.P. / Price: ${cur} ${off.price} (Inclusive of all taxes)`);
        }
      }
    }
    if (block.netQuantity || block.weight || block.volume) {
      lines.push(`Net Quantity: ${block.netQuantity || block.weight || block.volume}`);
    }
    if (block.countryOfOrigin) {
      lines.push(`Country of Origin: ${block.countryOfOrigin}`);
    }
    if (block.model || block.mpn || block.sku) {
      lines.push(`Model / SKU: ${block.model || block.mpn || block.sku}`);
    }
    if (block.category) {
      lines.push(`Category: ${block.category}`);
    }
  }

  return lines;
}

/**
 * Cleans, segments, and prioritizes raw web listing text so that
 * extraction services (Groq or regex) receive dense, high-relevance
 * packaging declarations and stay comfortably within token limits.
 *
 * @param {string} rawText
 * @param {object|string} [structuredData] - Optional JSON-LD or structured payload
 * @returns {{ lines: Array<{ id: number, text: string }>, text: string }}
 */
export function prepareOcrResultFromText(rawText, structuredData = null, imageOcrLines = []) {
  let text = String(rawText || "").trim();

  // If rawText is itself a JSON payload, parse it
  let directJsonLines = [];
  if (text.startsWith("{") || text.startsWith("[")) {
    try {
      directJsonLines = extractStructuredDeclarations(JSON.parse(text));
    } catch {
      // Treat as regular text
    }
  }

  const structuredLines = [
    ...directJsonLines,
    ...extractStructuredDeclarations(structuredData),
  ];

  // If text is flat (e.g. joined by spaces or ||), split on key boundaries
  if (text.split("\n").length < 10 && text.length > 300) {
    text = text.replace(/\|\|/g, "\n");
    text = text.replace(
      /(?=(?:Manufacturer|Packer|Importer|Generic Name|Brand|Country of Origin|Net Quantity|Item Form|Item Weight|Item Volume|M\.?R\.?P\.?|Price|Inclusive of all taxes|Customer Care|Customer Service|Phone|Email|Helpline|Date First Available|Product Dimensions|Item Dimensions|About this item|Safety Information|Directions|Brand:)[\s:]+)/gi,
      "\n"
    );
  }

  // Format OCR lines from product packaging images
  const packagingOcrTextLines = (imageOcrLines || []).map((line) => {
    const l = typeof line === "string" ? line : line.text;
    return `[Product Packaging Label]: ${l}`;
  });

  const rawLines = [
    ...packagingOcrTextLines,
    ...structuredLines,
    ...text.split("\n").map((l) => l.trim()).filter(Boolean),
  ];
  const seen = new Set();
  const highPriority = [];
  const normalPriority = [];

  for (const line of rawLines) {
    if (line.length < 2) continue;
    // Skip boilerplate navigation/review lines
    if (BOILERPLATE_PATTERNS.some((p) => p.test(line))) continue;
    // Skip overly long lines that lack LM keywords
    if (line.length > 500 && !LM_KEYWORDS.test(line)) continue;

    const norm = line.toLowerCase();
    if (seen.has(norm)) continue;
    seen.add(norm);

    if (line.startsWith("[Product Packaging Label]") || LM_KEYWORDS.test(line)) {
      highPriority.push(line);
    } else {
      normalPriority.push(line);
    }
  }

  // Budget maximum characters to stay well within Groq's TPM limit (~10,000 characters / 2,500 tokens)
  const MAX_CHARS = 10000;
  const chosenLines = [];
  let totalChars = 0;

  for (const line of [...highPriority, ...normalPriority]) {
    if (totalChars + line.length > MAX_CHARS) break;
    chosenLines.push(line);
    totalChars += line.length + 1;
  }

  const formattedLines = chosenLines.map((lineText, idx) => ({
    id: idx,
    text: lineText,
    confidence: lineText.startsWith("[Product Packaging Label]") ? 0.95 : 1.0,
    bbox: null,
    heightPx: null,
    heightMm: null,
    language: "English",
  }));

  const cleanedText = chosenLines.join("\n");

  return {
    text: cleanedText,
    lines: formattedLines,
    engine: "web-listing-and-packaging-ocr",
    isMultiImage: packagingOcrTextLines.length > 0,
    imageCount: packagingOcrTextLines.length > 0 ? 2 : 1,
  };
}

/**
 * Runs the full post-OCR mapping and rule engine verification on listing text
 * and product packaging images.
 *
 * @param {string} rawText - Verbatim listing text
 * @param {object} [context] - Optional metadata (url, platform, images, productImages, structuredData, etc.)
 * @returns {Promise<object>} { declarations, packageRecord, compliance, summary, imageOcr }
 */
export async function runCompliancePipeline(rawText, context = {}) {
  if (!rawText || !rawText.trim()) {
    throw new Error("runCompliancePipeline: rawText is required.");
  }

  // 1. Run OCR on Product Packaging Images only (if provided)
  const productImages =
    context.productImages ||
    context.images?.productImages ||
    (Array.isArray(context.images) ? context.images : context.images?.items) ||
    [];

  let imageOcr = { success: true, imagesProcessed: 0, lines: [], combinedText: "" };
  if (productImages && productImages.length > 0) {
    try {
      imageOcr = await runOcrOnProductImages(productImages);
    } catch (ocrErr) {
      console.warn(`[compliancePipeline] Product image OCR warning: ${ocrErr.message}`);
    }
  }

  const ocrResult = prepareOcrResultFromText(
    rawText,
    context.structuredData,
    imageOcr.lines
  );

  // 2. Stage 5/6: Declaration Extraction / Mapping (Groq or regex fallback)
  const declarations = await extract(ocrResult, null);

  // 3. Stage 5: Font & Label Metrics
  const labelMetrics = analyzeFont(ocrResult);

  // 4. Package Record Construction (Marked as digital marketplace per Legal Metrology Rule 6(10))
  const packageRecord = buildPackageRecord(declarations, labelMetrics, {
    isDigitalMarketplace: true,
    isEcommerce: true,
    platform: context.platform,
    url: context.url,
  });
  if (packageRecord && packageRecord.commodity) {
    packageRecord.commodity.isDigitalMarketplace = true;
    packageRecord.commodity.isEcommerce = true;
  }

  // 5. Stage 6/7: Codified Legal Metrology Rule Engine
  const compliance = runComplianceCheck(packageRecord);

  // 6. Enforce Rule 6(10) Exemption for Digital Marketplace / E-Commerce:
  // Month and year of manufacture/packaging is explicitly exempt on online product listings.
  if (compliance && Array.isArray(compliance.violations)) {
    compliance.violations = compliance.violations.filter((v) => {
      const field = (v.field || "").toLowerCase();
      const rule = (v.rule || "").toLowerCase();
      const desc = (v.description || "").toLowerCase();
      if (
        field === "mfgdate" ||
        field === "manufacture_date" ||
        rule.includes("6(1)(d)") ||
        rule.includes("6(1)(g)") ||
        (desc.includes("manufacture") && (desc.includes("month") || desc.includes("date")))
      ) {
        return false;
      }
      return true;
    });

    compliance.summary = {
      total: compliance.violations.length,
      critical: compliance.violations.filter((v) => (v.severity || "").toLowerCase() === "critical").length,
      major: compliance.violations.filter((v) => (v.severity || "").toLowerCase() === "major").length,
      minor: compliance.violations.filter((v) => (v.severity || "").toLowerCase() === "minor").length,
    };
    compliance.compliant = compliance.violations.length === 0;
  }

  // Compute a unified summary for easy UI consumption
  const summary = {
    status: !compliance.applicable
      ? "exempt"
      : compliance.compliant
      ? "compliant"
      : "non_compliant",
    applicable: compliance.applicable,
    exemptionReason: compliance.exemptionReason || null,
    compliant: compliance.compliant,
    totalViolations: compliance.summary?.total ?? (compliance.violations?.length || 0),
    criticalViolations: compliance.summary?.critical ?? 0,
    majorViolations: compliance.summary?.major ?? 0,
    minorViolations: compliance.summary?.minor ?? 0,
    extractedCommodity: declarations.commodityName?.value || packageRecord.commodity?.genericName || null,
    brandName: packageRecord.commodity?.brandName || null,
    mrp: declarations.mrp?.value ?? null,
    netQuantity: declarations.netQuantity?.value != null
      ? `${declarations.netQuantity.value} ${declarations.netQuantity.unit || ""}`.trim()
      : null,
    imageOcrScanned: imageOcr.imagesProcessed,
  };

  return {
    url: context.url || null,
    platform: context.platform || null,
    crawledAt: context.crawledAt || new Date().toISOString(),
    declarations,
    packageRecord,
    compliance,
    summary,
    imageOcr: {
      imagesProcessed: imageOcr.imagesProcessed,
      linesCount: imageOcr.lines.length,
      combinedText: imageOcr.combinedText,
      results: imageOcr.results,
    },
    ocrResult: {
      lineCount: ocrResult.lines.length,
      textLength: ocrResult.text.length,
    },
  };
}

export { regexExtract, buildPackageRecord, runComplianceCheck };
