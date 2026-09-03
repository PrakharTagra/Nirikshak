'use strict';

const assert = require('assert');
const { regexExtract } = require('../src/pipeline/stage5_extraction');

(async () => {
  const ocr = {
    lines: [
      { text: 'Iodised Salt', heightPx: 40 },
      { text: 'Net Wt. 1kg', heightPx: 48 },
      { text: 'MRP Rs.28/- incl. of all taxes', heightPx: 48 },
      { text: 'Mfd. by ABC Salts Pvt Ltd, Plot 4 Industrial Area, Kutch, Gujarat - 370001', heightPx: 24 },
      { text: 'Mfg: 06/2026', heightPx: 24 },
      { text: 'For complaints call 1800-123-4567 or care@abcsalts.example', heightPx: 20 },
    ],
  };
  const result = regexExtract(ocr, { category: 'salt' });
  assert.strictEqual(result.netQuantity.value, 1);
  assert.strictEqual(result.netQuantity.unit, 'kg');
  assert.strictEqual(result.mrp.value, 28);
  assert.strictEqual(result.mrp.currency, 'INR');
  assert.strictEqual(result.manufacturer.present, true);
  assert.strictEqual(result.mfgDate.present, true);
  assert.strictEqual(result.consumerCare.present, true);
  assert.ok(result.dimensions && result.standardPackDeclaration && result.sheetCount);
  console.log('Stage 6 extraction contract test: PASS');
})();
