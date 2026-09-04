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

const complianceEnginePipelineDir = path.resolve(
  __dirname,
  "../../../ComplianceEngine/deployment/src/pipeline"
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
 * Cleans, segments, and prioritizes raw web listing text so that
 * extraction services (Groq or regex) receive dense, high-relevance
 * packaging declarations and stay comfortably within token limits.
 *
 * @param {string} rawText
 * @returns {{ lines: Array<{ id: number, text: string }>, text: string }}
 */
export function prepareOcrResultFromText(rawText) {
  let text = String(rawText || "").trim();

  // If text is flat (e.g. joined by spaces or ||), split on key boundaries
  if (text.split("\n").length < 10 && text.length > 300) {
    text = text.replace(/\|\|/g, "\n");
    text = text.replace(
      /(?=(?:Manufacturer|Packer|Importer|Generic Name|Brand|Country of Origin|Net Quantity|Item Form|Item Weight|Item Volume|M\.?R\.?P\.?|Price|Inclusive of all taxes|Customer Care|Customer Service|Phone|Email|Helpline|Date First Available|Product Dimensions|Item Dimensions|About this item|Safety Information|Directions|Brand:)[\s:]+)/gi,
      "\n"
    );
  }

  const rawLines = text.split("\n").map((l) => l.trim()).filter(Boolean);
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

    if (LM_KEYWORDS.test(line)) {
      highPriority.push(line);
    } else {
      normalPriority.push(line);
    }
  }

  // Budget maximum characters to stay well within Groq's 8,000 TPM limit (~10,000 characters / 2,500 tokens)
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
    confidence: 1.0,
    bbox: null,
    heightPx: null,
    heightMm: null,
    language: "English",
  }));

  const cleanedText = chosenLines.join("\n");

  return {
    text: cleanedText,
    lines: formattedLines,
    engine: "web-listing-text",
    isMultiImage: false,
    imageCount: 1,
  };
}

/**
 * Runs the full post-OCR mapping and rule engine verification on listing text.
 *
 * @param {string} rawText - Verbatim listing text
 * @param {object} [context] - Optional metadata (url, platform, images, etc.)
 * @returns {Promise<object>} { declarations, packageRecord, compliance, summary }
 */
export async function runCompliancePipeline(rawText, context = {}) {
  if (!rawText || !rawText.trim()) {
    throw new Error("runCompliancePipeline: rawText is required.");
  }

  const ocrResult = prepareOcrResultFromText(rawText);

  // 1. Stage 5/6: Declaration Extraction / Mapping (Groq or regex fallback)
  const declarations = await extract(ocrResult, null);

  // 2. Stage 5: Font & Label Metrics
  const labelMetrics = analyzeFont(ocrResult);

  // 3. Package Record Construction
  const packageRecord = buildPackageRecord(declarations, labelMetrics);

  // 4. Stage 6/7: Codified Legal Metrology Rule Engine
  const compliance = runComplianceCheck(packageRecord);

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
  };

  return {
    url: context.url || null,
    platform: context.platform || null,
    crawledAt: context.crawledAt || new Date().toISOString(),
    declarations,
    packageRecord,
    compliance,
    summary,
    ocrResult: {
      lineCount: ocrResult.lines.length,
      textLength: ocrResult.text.length,
    },
  };
}

export { regexExtract, buildPackageRecord, runComplianceCheck };
