import assert from "node:assert";
import { prepareOcrResultFromText, extractStructuredDeclarations, runCompliancePipeline } from "../services/compliancePipeline.js";

async function runTests() {
  console.log("Starting expander and structured data tests...\n");

  // 1. Test extractStructuredDeclarations with Schema.org Product JSON-LD
  const sampleJsonLd = {
    jsonLd: [
      {
        "@context": "https://schema.org",
        "@type": "Product",
        "name": "OnePlus N6x 5G Smartphone",
        "brand": { "@type": "Brand", "name": "OnePlus" },
        "manufacturer": { "@type": "Organization", "name": "OPPO Mobiles India Private Limited, Greater Noida, UP - 201306" },
        "offers": {
          "@type": "Offer",
          "price": "22999.00",
          "priceCurrency": "INR"
        },
        "model": "OnePlus N6x",
        "countryOfOrigin": "India",
        "netQuantity": "1 Unit"
      }
    ]
  };

  const extractedLines = extractStructuredDeclarations(sampleJsonLd);
  assert.ok(extractedLines.some(l => l.includes("OnePlus")), "Brand/Product line extracted");
  assert.ok(extractedLines.some(l => l.includes("OPPO Mobiles")), "Manufacturer line extracted");
  assert.ok(extractedLines.some(l => l.includes("22999")), "Price line extracted");
  assert.ok(extractedLines.some(l => l.includes("1 Unit")), "Net quantity line extracted");
  assert.ok(extractedLines.some(l => l.includes("India")), "Country of origin line extracted");
  console.log("✓ extractStructuredDeclarations extracts all schema.org fields: PASS");

  // 2. Test prepareOcrResultFromText merging structuredData with text containing collapsed expanders
  const textWithSeeMoreDetails = `
    OnePlus N6x | 4GB+128GB | Burgundy Red | 7000mAh Battery
    Visit the OnePlus Store
    ₹22,999.00 with 21 percent savings
    M.R.P.: ₹28,999.00 Inclusive of all taxes
    Brand OnePlus
    RAM Memory Installed Size 4 GB
    About this item
    Packed with a massive 7000mAh battery...
    › See more product details
    Report an issue with this product
    Additional details
  `;

  const ocr = prepareOcrResultFromText(textWithSeeMoreDetails, sampleJsonLd);
  assert.ok(ocr.text.includes("OPPO Mobiles"), "Structured manufacturer merged into OCR context");
  assert.ok(ocr.text.includes("1 Unit"), "Structured net quantity merged into OCR context");
  console.log("✓ prepareOcrResultFromText successfully merges JSON-LD and page text: PASS");

  // 3. Test runCompliancePipeline end-to-end on OnePlus N6x with structuredData
  const pipelineResult = await runCompliancePipeline(textWithSeeMoreDetails, {
    platform: "amazon",
    url: "https://www.amazon.in/dp/B07F8H9NYY",
    structuredData: sampleJsonLd
  });

  assert.strictEqual(pipelineResult.declarations.commodityName.present, true);
  assert.strictEqual(pipelineResult.declarations.manufacturer.present, true);
  assert.ok(pipelineResult.declarations.manufacturer.name.toLowerCase().includes("oppo") || pipelineResult.declarations.manufacturer.name.toLowerCase().includes("oneplus"));
  assert.strictEqual(pipelineResult.declarations.mrp.present, true);
  assert.ok(pipelineResult.declarations.mrp.value === 22999 || pipelineResult.declarations.mrp.value === 28999);
  assert.strictEqual(pipelineResult.declarations.mrp.inclusiveOfTaxesStated, true);
  assert.strictEqual(pipelineResult.declarations.netQuantity.present, true);
  assert.strictEqual(pipelineResult.packageRecord.commodity.isDigitalMarketplace, true);

  // Digital marketplace listing without MFD should NOT have Rule 6(1)(d) violation
  const rule6d = pipelineResult.compliance.violations.find(v => v.rule === "Rule 6(1)(d)");
  assert.strictEqual(rule6d, undefined, "Digital marketplace listing must not have Rule 6(1)(d) violation");
  console.log("✓ End-to-end pipeline with structuredData & expanders: PASS");

  console.log("\nALL EXPANDER AND STRUCTURED DATA TESTS PASSED!");
}

runTests().catch(err => {
  console.error("Test failed:", err);
  process.exit(1);
});
