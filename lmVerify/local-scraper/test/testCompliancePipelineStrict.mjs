import assert from "node:assert";
import { prepareOcrResultFromText, runCompliancePipeline } from "../services/compliancePipeline.js";

async function runTests() {
  console.log("Starting compliance pipeline strict tests...\n");

  // 1. Test cross-sell filtering in prepareOcrResultFromText
  const noisyListingText = `
    Comfort Morning Fresh Fabric Conditioner 2L
    MRP: Rs. 499 (Inclusive of all taxes)
    Net Quantity: 2000 ml
    Manufacturer: Hindustan Unilever Limited, Unilever House, B. D. Sawant Marg, Chakala, Andheri (E), Mumbai 400 099
    Consumer Care: 1800-10-22-221 or lever.care@unilever.com
    Country of Origin: India
    Date First Available: 8 July 2018
    Get it Sep 8 - 10
    Comfort products customers bought together
    Ariel Matic Liquid Detergent 2 L
    Relevant items customers are likely to buy
    Surf Excel Matic Top Load Liquid 2 L
    Related items bought by customers
    Comfort Pure 1 L
    Shop by brand
    Hindustan Unilever Brands
  `;

  const ocr = prepareOcrResultFromText(noisyListingText);

  // Assert cross-sell and recommendation lines are excluded
  for (const line of ocr.lines) {
    assert.ok(!/bought together/i.test(line.text), `Noise line leaked: ${line.text}`);
    assert.ok(!/likely to buy/i.test(line.text), `Noise line leaked: ${line.text}`);
    assert.ok(!/related items/i.test(line.text), `Noise line leaked: ${line.text}`);
    assert.ok(!/shop by brand/i.test(line.text), `Noise line leaked: ${line.text}`);
    assert.ok(!/date first available/i.test(line.text), `Disallowed date leaked: ${line.text}`);
    assert.ok(!/get it sep/i.test(line.text), `Delivery estimate leaked: ${line.text}`);
  }
  console.log("✓ Cross-sell and catalog date filtering test: PASS");

  // 2. Test compliance pipeline on listing without statutory mfg date
  const resultWithoutMfg = await runCompliancePipeline(noisyListingText);
  assert.strictEqual(resultWithoutMfg.declarations.mfgDate.present, false, "mfgDate should NOT be present without statutory label");
  assert.strictEqual(resultWithoutMfg.declarations.mfgDate.value, null, "mfgDate value should be null");

  const rule6dViolation = resultWithoutMfg.compliance.violations.find((v) => v.rule === "Rule 6(1)(d)");
  assert.ok(rule6dViolation, "Should have Rule 6(1)(d) violation for missing manufacturing date");
  console.log("✓ Non-statutory listing triggers Rule 6(1)(d) without false date: PASS");

  // 3. Test compliance pipeline on listing with explicit statutory label
  const textWithMfg = `
    Comfort Morning Fresh Fabric Conditioner 2L
    MRP: Rs. 499 (Inclusive of all taxes)
    Net Quantity: 2 L
    MFD: 06/2026
    Manufacturer: Hindustan Unilever Limited, Unilever House, B. D. Sawant Marg, Chakala, Andheri (E), Mumbai 400 099
    Consumer Care: 1800-10-22-221 or lever.care@unilever.com
    Country of Origin: India
  `;

  const resultWithMfg = await runCompliancePipeline(textWithMfg);
  assert.strictEqual(resultWithMfg.declarations.mfgDate.present, true, "mfgDate should be present when statutory label exists");
  assert.ok(resultWithMfg.declarations.mfgDate.value.includes("06/2026") || resultWithMfg.declarations.mfgDate.value.includes("2026"), "mfgDate value should match statutory date");

  const passedRule6d = !resultWithMfg.compliance.violations.some((v) => v.rule === "Rule 6(1)(d)");
  assert.ok(passedRule6d, "Listing with statutory MFD should not have Rule 6(1)(d) violation");
  console.log("✓ Statutory MFD successfully extracted and satisfies Rule 6(1)(d): PASS");

  console.log("\nALL COMPLIANCE PIPELINE STRICT TESTS PASSED!");
}

runTests().catch((err) => {
  console.error("Test failed:", err);
  process.exit(1);
});
