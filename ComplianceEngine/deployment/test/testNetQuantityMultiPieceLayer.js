'use strict';

const assert = require('assert');
const {
  analyzeNetQuantityWithClearance,
  identifyNetQuantityCluster,
  extractMultiPieceFacts,
  parseQuantityPiece,
} = require('../src/pipeline/netQuantityClearanceLayer');
const { analyzeFont } = require('../src/pipeline/stage5_fontAnalysis');
const { ensureFieldDefaults } = require('../src/pipeline/groqDeclarationExtractor');
const { buildPackageRecord } = require('../src/pipeline/orchestrator');
const { runComplianceCheck } = require('../src/pipeline/stage6_ruleEngine');

console.log('--- Running Multi-Piece Net Quantity & Clearance Layer Tests ---');

// Test 1: Multi-piece cluster detection and composite bounding box construction
{
  const lines = [
    { id: 0, imageIndex: 0, text: 'Brand Best All-In-One', bbox: [[50, 20], [300, 20], [300, 50], [50, 50]] },
    { id: 1, imageIndex: 0, text: 'Net Quantity:', bbox: [[50, 100], [180, 100], [180, 120], [50, 120]], heightPx: 20 },
    { id: 2, imageIndex: 0, text: 'Refills (3 Numbers x 45 ml)', bbox: [[50, 125], [260, 125], [260, 145], [50, 145]], heightPx: 20 },
    { id: 3, imageIndex: 0, text: '135 ml', bbox: [[50, 150], [120, 150], [120, 170], [50, 170]], heightPx: 20 },
  ];

  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clusterFound, true, 'Expected cluster to be found');
  assert.strictEqual(res.multiPieceFacts.pieceCount, 3, 'Expected 3 pieces');
  assert.strictEqual(res.multiPieceFacts.totalValue, 135, 'Expected totalValue 135');
  assert.strictEqual(res.multiPieceFacts.totalUnit, 'ml', 'Expected unit ml');

  // Composite box should span from x=50 to x=260, and y=100 to y=170
  assert.strictEqual(res.netQuantityBox.x1, 50);
  assert.strictEqual(res.netQuantityBox.x2, 260);
  assert.strictEqual(res.netQuantityBox.y1, 100);
  assert.strictEqual(res.netQuantityBox.y2, 170);

  // Clearance should pass because all lines inside/around are part of the Net Quantity declaration!
  assert.strictEqual(res.clearanceOk, true, 'Clearance should be OK for multi-piece declaration without external text');
  assert.strictEqual(res.overlappingTexts.length, 0);
  console.log('✓ Test 1: Multi-piece cluster (3 pieces, 135ml) unified into composite box with compliant clearance');
}

// Test 2: External intruding text strictly triggers clearance issue
{
  const h = 20;
  // Net Quantity composite box: x: 50..260, y: 100..170
  // Rule 8(1) exclusion box: y: 100-20=80 .. 170+20=190, x: 50-40=10 .. 260+40=300
  const lines = [
    { id: 1, imageIndex: 0, text: 'Net Quantity:', bbox: [[50, 100], [180, 100], [180, 120], [50, 120]], heightPx: h },
    { id: 2, imageIndex: 0, text: 'Refills (3 Numbers x 45 ml)', bbox: [[50, 125], [260, 125], [260, 145], [50, 145]], heightPx: h },
    { id: 3, imageIndex: 0, text: '135 ml', bbox: [[50, 150], [120, 150], [120, 170], [50, 170]], heightPx: h },
    // External intruding text at y=175 (within bottom exclusion margin y=170..190)
    { id: 4, imageIndex: 0, text: 'Super Saver Discount Pack', bbox: [[60, 175], [240, 175], [240, 188], [60, 188]], heightPx: 13 },
  ];

  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clearanceOk, false, 'Expected clearance failure due to intruding promotional slogan');
  assert.ok(res.overlappingTexts.includes('Super Saver Discount Pack'));
  console.log('✓ Test 2: External promotional text within Rule 8(1) exclusion boundary accurately triggers clearance violation');
}

// Test 3: Multi-panel isolation (text on other panels does NOT trigger false clearance failure)
{
  const lines = [
    // Panel 0: Clean Net Quantity declaration
    { id: 1, imageIndex: 0, text: 'Net Quantity:', bbox: [[50, 100], [180, 100], [180, 120], [50, 120]], heightPx: 20 },
    { id: 2, imageIndex: 0, text: '3 Units x 50 g', bbox: [[50, 125], [200, 125], [200, 145], [50, 145]], heightPx: 20 },
    { id: 3, imageIndex: 0, text: '150 g', bbox: [[50, 150], [100, 150], [100, 170], [50, 170]], heightPx: 20 },

    // Panel 1: Back panel lines with colliding pixel coordinates
    { id: 10, imageIndex: 1, text: 'Ingredients: Aqua, Sodium Laureth Sulfate', bbox: [[55, 105], [280, 105], [280, 120], [55, 120]], heightPx: 15 },
    { id: 11, imageIndex: 1, text: 'Manufactured by ABC Chemicals Ltd.', bbox: [[55, 130], [280, 130], [280, 145], [55, 145]], heightPx: 15 },
  ];

  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clearanceOk, true, 'Panel 1 lines must not trigger false clearance failure on Panel 0');
  assert.strictEqual(res.overlappingTexts.length, 0);
  console.log('✓ Test 3: Cross-panel coordinate isolation prevents false clearance violations across multi-image packaging');
}

// Test 4: LLM partial-mapping healing (LLM mapped only 1 piece, intermediate layer heals total quantity)
{
  const rawOcrText = `
AllOut ULTRA
SAVER PACK
Recommended by Indian Medical Association
Net Quantity:
Refills
(3 Numbers x 45 ml)
135 ml
MRP Rs. 260.00
`;

  // Simulate LLM returning only the first piece (45 ml) because it was written first
  const llmOutput = {
    commodityClassification: {
      brandName: 'AllOut',
      genericName: 'Liquid Vaporiser Refill',
      scheduleCategory: null,
      physicalForm: 'liquid',
      isFoodArticle: false,
      isIndustrialOrInstitutional: false,
      isImported: false,
      countryOfOrigin: 'India',
      dimensionsRelevant: false,
      manufacturerIsNotPacker: false,
    },
    commodityName: { present: true, value: 'Liquid Vaporiser Refill', perProductBreakdown: false },
    manufacturer: { present: true, name: 'Brion Consumer Products', address: 'Gurugram' },
    packer: { present: false, name: null, address: false },
    importer: { present: false, name: null, address: false },
    netQuantity: {
      present: true,
      value: 45, // LLM mistakenly only mapped one piece!
      unit: 'ml',
      unitKind: 'volume',
      rawText: '45 ml',
      qualifiedWhenPacked: false,
      onTagCardOrTapeDevice: false,
      symbolUsed: 'ml',
    },
    mfgDate: { present: true, value: '02/2026', rawText: 'Mfg Date 02/2026' },
    mrp: { present: true, value: 260, currency: 'Rs.', rawText: 'Rs. 260.00', inclusiveOfTaxesStated: true },
    dimensions: { present: false, rawText: '' },
    consumerCare: { present: true, telephone: '1800-123-456' },
    standardPackDeclaration: { present: false },
    sheetCount: { present: false },
    multiComponentDeclarationHandled: false,
  };

  const healed = ensureFieldDefaults(llmOutput, rawOcrText);
  assert.strictEqual(healed.netQuantity.value, 135, 'Expected healed total net quantity to be 135 ml, not 45 ml');
  assert.strictEqual(healed.netQuantity.pieceCount, 3, 'Expected healed pieceCount to be 3');
  assert.strictEqual(healed.netQuantity.pieces.length, 1);
  assert.strictEqual(healed.netQuantity.pieces[0].count, 3);
  assert.strictEqual(healed.netQuantity.pieces[0].value, 45);

  const pkgRecord = buildPackageRecord(healed, {
    netQuantityMultiPiece: { pieceCount: 3, totalValue: 135, totalUnit: 'ml' },
    contrastOk: true,
  });
  assert.strictEqual(pkgRecord.commodity.netQuantityValue, 135);
  assert.strictEqual(pkgRecord.commodity.pieceCount, 3);
  assert.strictEqual(pkgRecord.commodity.isMultiProductPackage, true);
  console.log('✓ Test 4: LLM partial mapping healed from 45ml to 135ml across 3 pieces in declarations & packageRecord');
}

// Test 5: Contrast evaluation per statutory Rule 9(1)(b)
{
  // When Net Quantity and MRP contrast are compliant (e.g. 3.5:1 and 8.0:1),
  // non-statutory lines (e.g. random logo or slogan) do NOT fail the product under Rule 9(1)(b)
  const ocrResult = {
    lines: [
      {
        id: 0,
        text: 'Recommended by Doctors',
        contrast: { contrast_ratio: 1.2, contrast_ok: false }, // random background text with low contrast
      },
      {
        id: 1,
        text: 'Net Qty: 90 ml (2 Numbers x 45 ml)',
        contrast: { contrast_ratio: 3.5, contrast_ok: true }, // statutory numeral -> compliant
      },
      {
        id: 2,
        text: 'MRP Rs. 175.00',
        contrast: { contrast_ratio: 8.0, contrast_ok: true }, // statutory numeral -> compliant
      },
    ],
    contrastAnalysis: {
      overall_contrast_ok: false, // overall contains the failing slogan
      min_contrast_ratio: 1.2,
    },
  };

  const fontMetrics = analyzeFont(ocrResult);
  assert.strictEqual(fontMetrics.contrastOk, true, 'Rule 9(1)(b) must pass because Net Quantity and MRP numerals contrast conspicuously');
  assert.strictEqual(fontMetrics.failingDeclarations.length, 0);

  const pkg = {
    commodity: { netQuantityValue: 90, netQuantityUnit: 'ml' },
    declarations: {
      manufacturer: { present: true, address: true },
      commodityName: { present: true },
      netQuantity: { present: true, value: 90, unit: 'ml' },
      mfgDate: { present: true },
      mrp: { present: true, inclusiveOfTaxesStated: true },
      consumerCare: { present: true },
    },
    labelMetrics: fontMetrics,
  };

  const compliance = runComplianceCheck(pkg);
  const rule9Viol = compliance.violations.find((v) => v.rule === 'Rule 9(1)(b)');
  assert.strictEqual(rule9Viol, undefined, 'Did not expect Rule 9(1)(b) violation when statutory numerals pass');
  console.log('✓ Test 5: Statutory Rule 9(1)(b) correctly approves product when RSP & Net Quantity contrast conspicuously');
}

console.log('\nALL 5 MULTI-PIECE NET QUANTITY & CLEARANCE TESTS PASSED SUCCESSFULLY!');
