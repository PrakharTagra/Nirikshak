'use strict';

const assert = require('assert');
const { analyzeFont } = require('../src/pipeline/stage5_fontAnalysis');
const { runComplianceCheck } = require('../src/pipeline/stage6_ruleEngine');

console.log('--- Running Stage 5 Font & Readability Tests ---');

// Test 1: Packaging dimensions parsed from label, inner product dimensions rejected
{
  const ocrResult = {
    lines: [
      { text: 'Brand X Baby Wipes', bbox: [[0, 0], [1000, 0], [1000, 50], [0, 50]] },
      { text: 'Sheet size: 15 cm x 15 cm', bbox: [[0, 60], [300, 60], [300, 100], [0, 100]] }, // inner product -> must ignore!
      { text: 'Outer Box Dimensions: 100 x 50 x 25 mm', bbox: [[0, 110], [500, 110], [500, 150], [0, 150]] }, // box -> must pick!
      { text: 'Net Qty: 80 Units', heightPx: 40, bbox: [[0, 160], [400, 160], [400, 200], [0, 200]] },
      { text: 'MRP Rs. 150.00', heightPx: 40, bbox: [[0, 220], [400, 220], [400, 260], [0, 260]] },
    ],
  };

  const metrics = analyzeFont(ocrResult);
  assert.ok(metrics.packagingDimensions, 'Expected packagingDimensions to be resolved');
  assert.strictEqual(metrics.packagingDimensions.lengthMm, 100);
  assert.strictEqual(metrics.packagingDimensions.widthMm, 50);
  assert.strictEqual(metrics.packagingDimensions.heightMm, 25);
  assert.strictEqual(metrics.calibrationAvailable, true, 'Expected calibrationAvailable to be true');
  assert.ok(metrics.pixelsPerMm > 0, 'Expected positive pixelsPerMm');
  console.log(`✓ Test 1: Packaging dimensions parsed (${metrics.packagingDimensions.lengthMm}x${metrics.packagingDimensions.widthMm}x${metrics.packagingDimensions.heightMm} mm, scale: ${metrics.pixelsPerMm} px/mm), inner item dimensions rejected`);
}

// Test 2: User-supplied dimensions establish scale when not present on label
{
  const ocrResult = {
    lines: [
      { text: 'Shampoo Bottle', bbox: [[0, 0], [500, 0], [500, 1000], [0, 1000]] },
      { text: 'Net Quantity: 200 ml', heightPx: 30, bbox: [[50, 400], [300, 400], [300, 430], [50, 430]] },
      { text: 'MRP Rs. 180/-', heightPx: 30, bbox: [[50, 500], [300, 500], [300, 530], [50, 530]] },
    ],
  };

  const metrics = analyzeFont(ocrResult, { packageDimensions: '100x50x20 mm' });
  assert.strictEqual(metrics.packagingDimensions.source, 'user_input');
  assert.strictEqual(metrics.packagingDimensions.lengthMm, 100);
  assert.strictEqual(metrics.calibrationAvailable, true);
  assert.ok(metrics.numeralHeightMm.netQty > 0, 'Expected measured mm height for netQty');
  console.log(`✓ Test 2: User-supplied dimensions established physical scale (${metrics.numeralHeightMm.netQty} mm)`);
}

// Test 3: Rule 8(1) clear space surrounding Net Quantity
{
  // Qty box at y=100..120, numeral height = 20px
  // Exclusion zone is y = 100 - 20 .. 120 + 20 = 80..140
  const qtyLine = {
    id: 1,
    text: 'Net Wt. 200g',
    heightPx: 20,
    bbox: [[100, 100], [250, 100], [250, 120], [100, 120]],
  };

  // Case A: Intruding line right below Qty (y=125..135, within exclusion margin)
  const intrudingLine = {
    id: 2,
    text: 'Free Gift Inside',
    heightPx: 10,
    bbox: [[120, 125], [230, 125], [230, 135], [120, 135]],
  };

  const ocrFail = { lines: [qtyLine, intrudingLine] };
  const metricsFail = analyzeFont(ocrFail);
  assert.strictEqual(metricsFail.quantityDeclarationSurroundingAreaHasPrintedInfo, true, 'Expected clearance failure');

  // Verify Rule 8(1) violation in rule engine
  const pkg = {
    commodity: { netQuantityValue: 200, netQuantityUnit: 'g' },
    declarations: {
      manufacturer: { present: true, address: true },
      commodityName: { present: true },
      netQuantity: { present: true, value: 200, unit: 'g' },
      mfgDate: { present: true },
      mrp: { present: true, inclusiveOfTaxesStated: true },
      consumerCare: { present: true },
    },
    labelMetrics: metricsFail,
  };

  const compliance = runComplianceCheck(pkg);
  const rule8Viol = compliance.violations.find((v) => v.rule.startsWith('Rule 8(1)'));
  assert.ok(rule8Viol, 'Expected Rule 8(1) violation in rule engine');
  console.log('✓ Test 3: Rule 8(1) surrounding clear space properly triggers violation when printed info intrudes');
}

// Test 4: Rule 7(2) Table I minimum numeral height enforcement
{
  // Declared quantity: 250 g -> Rule 7 Table I band: 200 to 500 g -> requires min 2.0 mm
  const pkgFail = {
    commodity: { netQuantityValue: 250, netQuantityUnit: 'g' },
    declarations: {
      manufacturer: { present: true, address: true },
      commodityName: { present: true },
      netQuantity: { present: true, value: 250, unit: 'g' },
      mfgDate: { present: true },
      mrp: { present: true, inclusiveOfTaxesStated: true },
      consumerCare: { present: true },
    },
    labelMetrics: {
      numeralHeightMm: { netQty: 1.2, rsp: 1.2 }, // 1.2 mm is below required 2.0 mm!
      contrastOk: true,
      quantityDeclarationSurroundingAreaHasPrintedInfo: false,
    },
  };

  const resFail = runComplianceCheck(pkgFail);
  const rule7Viol = resFail.violations.find((v) => v.rule === 'Rule 7(2)');
  assert.ok(rule7Viol, 'Expected Rule 7(2) violation for numeral height below 2.0mm');
  assert.ok(rule7Viol.message.includes('1.2mm; minimum required is 2mm'));
  console.log('✓ Test 4: Rule 7(2) properly rejects numeral height below Table I minimum');
}

console.log('\nALL 4 STAGE 5 INTEGRATION TESTS PASSED SUCCESSFULLY!');
