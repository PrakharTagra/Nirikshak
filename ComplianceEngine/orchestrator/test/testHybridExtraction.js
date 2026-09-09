'use strict';

const assert = require('assert');
const { deterministicExtract } = require('../src/pipeline/deterministicExtractor');
const { ensureFieldDefaults } = require('../src/pipeline/groqDeclarationExtractor');
const { extract, regexExtract } = require('../src/pipeline/stage5_extraction');

console.log('--- Starting Hybrid Deterministic-Regex & LLM Extraction Tests ---');

// -------------------------------------------------------------
// Test 1: MRP Extraction across Statutory Legal Metrology Formats
// -------------------------------------------------------------
{
  const ocr1 = {
    lines: [
      { text: 'Tata Salt Lite' },
      { text: 'MRP Rs. 28/- incl. of all taxes' },
      { text: 'Net Quantity: 1 kg' },
    ],
  };
  const res1 = deterministicExtract(ocr1);
  assert.strictEqual(res1.mrp.present, true);
  assert.strictEqual(res1.mrp.value, 28);
  assert.strictEqual(res1.mrp.inclusiveOfTaxesStated, true);
  assert.strictEqual(res1.mrp.confidence, 'HIGH');

  // Comma-separated high price & Indian Rupee symbol
  const ocr2 = {
    lines: [
      { text: 'Prestige Induction Cooktop' },
      { text: 'Max. Retail Price ₹ 1,299.00 (Inclusive of all taxes)' },
      { text: 'Unit Sale Price: Rs. 1299.00/unit' },
      { text: 'Net Qty: 1 Unit' },
    ],
  };
  const res2 = deterministicExtract(ocr2);
  assert.strictEqual(res2.mrp.present, true);
  assert.strictEqual(res2.mrp.value, 1299);
  assert.strictEqual(res2.mrp.inclusiveOfTaxesStated, true);
  assert.ok(res2.mrp.unitSalePrice && res2.mrp.unitSalePrice.includes('1299'));

  console.log('✓ Test 1 Passed: MRP statutory formats & tax clauses extracted deterministically');
}

// -------------------------------------------------------------
// Test 2: Net Quantity with Standard SI Units and Prohibited Qualifiers
// -------------------------------------------------------------
{
  // Countable units: Unit, N, U
  const ocrCount = {
    lines: [{ text: 'Gillette Mach 3 Razor' }, { text: 'Net Qty.: 1 N' }],
  };
  const resCount = deterministicExtract(ocrCount);
  assert.strictEqual(resCount.netQuantity.value, 1);
  assert.strictEqual(resCount.netQuantity.unit, 'N');
  assert.strictEqual(resCount.netQuantity.unitKind, 'number');
  assert.strictEqual(resCount.netQuantity.symbolUsed, 'N');

  // Liquid volume: Litres
  const ocrVol = {
    lines: [{ text: 'Fortune Sunlite Refined Oil' }, { text: 'Net Quantity: 5 l' }],
  };
  const resVol = deterministicExtract(ocrVol);
  assert.strictEqual(resVol.netQuantity.value, 5);
  assert.strictEqual(resVol.netQuantity.unit, 'l');
  assert.strictEqual(resVol.netQuantity.unitKind, 'volume');

  // Prohibited qualifier: "when packed" (Rule 11(2))
  const ocrProhibited = {
    lines: [{ text: 'Bath Soap' }, { text: 'Net Weight: 125 g when packed' }, { text: 'MRP Rs. 40.00' }],
  };
  const resProhibited = deterministicExtract(ocrProhibited);
  assert.strictEqual(resProhibited.prohibitedWordsFound, true);

  console.log('✓ Test 2 Passed: Net Quantity standard units, symbols, and prohibited qualifiers verified');
}

// -------------------------------------------------------------
// Test 3: Manufacturing Date Statutory Labels vs Disallowed Dates
// -------------------------------------------------------------
{
  // Statutory Mfg label
  const ocrMfg = {
    lines: [
      { text: 'Parle-G Glucose Biscuits' },
      { text: 'Mfg. Date: 08/2026' },
      { text: 'Best Before 6 months from packaging' },
    ],
  };
  const resMfg = deterministicExtract(ocrMfg);
  assert.strictEqual(resMfg.mfgDate.present, true);
  assert.strictEqual(resMfg.mfgDate.value, '08/2026');
  assert.strictEqual(resMfg.mfgDate.confidence, 'HIGH');

  // Non-statutory dates (Expiry / Date first available) should NOT be extracted as Mfg Date
  const ocrInvalidDates = {
    lines: [
      { text: 'Date First Available: 15-04-2021' },
      { text: 'Expiry Date: 12/2028' },
      { text: 'Delivery by tomorrow' },
    ],
  };
  const resInvalid = deterministicExtract(ocrInvalidDates);
  assert.strictEqual(resInvalid.mfgDate.present, false);
  assert.strictEqual(resInvalid.mfgDate.value, null);

  console.log('✓ Test 3 Passed: Statutory Mfg Date extracted, disallowed expiry/catalog dates rejected');
}

// -------------------------------------------------------------
// Test 4: Consumer Care Contacts & Postal PIN Code (Rule 6(2), Rule 10)
// -------------------------------------------------------------
{
  const ocrCare = {
    lines: [
      { text: 'For Feedback or Complaints contact Consumer Care Cell' },
      { text: 'Toll Free Helpline: 1800-123-4567' },
      { text: 'Email: customercare@dabur.com' },
      { text: 'Visit www.dabur.com' },
      { text: 'Manufactured at Unit II, Pantnagar, Uttarakhand - 263153' },
    ],
  };
  const resCare = deterministicExtract(ocrCare);
  assert.strictEqual(resCare.consumerCare.present, true);
  assert.strictEqual(resCare.consumerCare.telephone, '1800-123-4567');
  assert.strictEqual(resCare.consumerCare.email, 'customercare@dabur.com');
  assert.strictEqual(resCare.consumerCare.website, 'www.dabur.com');
  assert.strictEqual(resCare.consumerCare.pinCode, '263153');

  console.log('✓ Test 4 Passed: Consumer Care telephone, email, website, and PIN code detected');
}

// -------------------------------------------------------------
// Test 5: Usable Sheets (Rule 16) and Non-standard Pack Disclaimer (Rule 5)
// -------------------------------------------------------------
{
  const ocrSpecial = {
    lines: [
      { text: 'Facial Tissue Box' },
      { text: 'Contains 100 usable sheets' },
      { text: 'Size: 20 cm x 15 cm' },
      { text: 'Not a standard pack size under Legal Metrology Rules 2011' },
    ],
  };
  const resSpecial = deterministicExtract(ocrSpecial);
  assert.strictEqual(resSpecial.sheetCount.present, true);
  assert.strictEqual(resSpecial.sheetCount.value, 100);
  assert.strictEqual(resSpecial.dimensions.present, true);
  assert.ok(resSpecial.dimensions.linearDimensions.includes('20 cm x 15 cm'));
  assert.strictEqual(resSpecial.standardPackDeclaration.present, true);

  console.log('✓ Test 5 Passed: Usable sheet count and non-standard pack disclaimer detected');
}

// -------------------------------------------------------------
// Test 6: Reconciliation: Deterministic Regex overrides LLM Hallucinations
// -------------------------------------------------------------
{
  const ocrText = 'MRP Rs. 999.00 for 1 Unit incl. of all taxes\nNet Quantity: 1 Unit\nMfg Date: 05/2026\nHelpline: 1800-444-5555';
  const anchors = deterministicExtract({ lines: ocrText.split('\n').map((t) => ({ text: t })) });

  // Simulate flawed LLM response where model mistook "1 Unit" for price 1
  const flawedLlmOutput = {
    mrp: { present: true, value: 1, rawText: 'for 1 Unit' }, // Flawed LLM misparse
    netQuantity: { present: true, value: null, unit: null },
    mfgDate: { present: false, value: null },
    consumerCare: { present: true, telephone: null, email: null },
    commodityName: { present: true, value: 'Electric Trimmer' },
    manufacturer: { present: true, name: 'Philips India Ltd', address: 'Gurugram' },
  };

  const healed = ensureFieldDefaults(flawedLlmOutput, ocrText, anchors);
  // Reconciled to the true statutory regex MRP (999 instead of 1)
  assert.strictEqual(healed.mrp.value, 999);
  assert.strictEqual(healed.mrp.inclusiveOfTaxesStated, true);
  // Reconciled net quantity and mfgDate
  assert.strictEqual(healed.netQuantity.value, 1);
  assert.strictEqual(healed.mfgDate.value, '05/2026');
  assert.strictEqual(healed.consumerCare.telephone, '1800-444-5555');
  // Retained LLM semantic extractions
  assert.strictEqual(healed.commodityName.value, 'Electric Trimmer');
  assert.strictEqual(healed.manufacturer.name, 'Philips India Ltd');

  console.log('✓ Test 6 Passed: Deterministic regex anchors successfully heal and override flawed LLM extractions');
}

// -------------------------------------------------------------
// Test 7: Full Pipeline Stage 6 extract() in Hybrid/Regex mode
// -------------------------------------------------------------
(async () => {
  const ocr = {
    lines: [
      { text: 'Brand: Scalpe Pro' },
      { text: 'Generic Name: Anti-Dandruff Shampoo' },
      { text: 'Net Volume: 200 ml' },
      { text: 'MRP Rs. 340/- (Inclusive of all taxes)' },
      { text: 'Mfd. by Glenmark Pharmaceuticals Ltd, Baddi, Himachal Pradesh 173205' },
      { text: 'Mfg Date: 07/2026' },
      { text: 'Consumer Care: 1800-222-123 care@glenmark.com' },
    ],
  };

  const fullResult = await extract(ocr, null);
  assert.strictEqual(fullResult.mrp.value, 340);
  assert.strictEqual(fullResult.mrp.inclusiveOfTaxesStated, true);
  assert.strictEqual(fullResult.netQuantity.value, 200);
  assert.strictEqual(fullResult.netQuantity.unit, 'ml');
  assert.strictEqual(fullResult.mfgDate.value, '07/2026');
  assert.strictEqual(fullResult.consumerCare.telephone, '1800-222-123');
  assert.strictEqual(fullResult.consumerCare.email, 'care@glenmark.com');
  assert.strictEqual(fullResult.manufacturer.present, true);
  assert.strictEqual(fullResult.commodityClassification.physicalForm, 'liquid');

  console.log('✓ Test 7 Passed: Full extract() pipeline produces strictly conformant Legal Metrology contract');
  console.log('\n--- ALL HYBRID EXTRACTION TESTS PASSED SUCCESSFULLY! ---');
})();
