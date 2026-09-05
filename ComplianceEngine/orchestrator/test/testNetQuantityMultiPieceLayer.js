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

  // Verify that Rule Engine formats the error showing actual measurements and deficits
  const metrics = analyzeFont({ lines }, { pixelsPerMm: 10 });
  const pkg = {
    commodity: { netQuantityValue: 135, netQuantityUnit: 'ml' },
    declarations: {
      manufacturer: { present: true, address: true },
      commodityName: { present: true },
      netQuantity: { present: true, value: 135, unit: 'ml' },
      mfgDate: { present: true },
      mrp: { present: true, inclusiveOfTaxesStated: true },
      consumerCare: { present: true },
    },
    labelMetrics: metrics,
  };
  const compliance = runComplianceCheck(pkg);
  const r8Viol = compliance.violations.find((v) => v.rule === 'Rule 8(1) proviso');
  assert.ok(r8Viol, 'Expected Rule 8(1) proviso violation');
  assert.ok(r8Viol.message.includes('Measured numeral height: 2mm (20px)'), 'Expected actual numeral height measurement');
  assert.ok(r8Viol.message.includes('Required clear space: ≥ 2mm (20px) above/below (1x height), ≥ 4mm (40px) left/right (2x height)'), 'Expected required measurements');
  assert.ok(r8Viol.message.includes('Super Saver Discount Pack'), 'Expected intruding text name');
  assert.ok(r8Viol.message.includes('lacks 1.5mm (15px) of clear space'), 'Expected deficit measurement');
  console.log(`✓ Test 2: Rule 8(1) proviso error displays exact measurements & deficit:\n    "${r8Viol.message}"`);
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

// Test 6: Multi-product combo pack (Device + Refills with different units of measurement)
{
  const rawOcrText = `
ELECTRIC AIR FRESHENER
aer plug Air Freshener device + 2 refills
Manufactured by Godrej Consumer Supplies Limited
RS No:108/8, PIPDIC Industrial Estate, Puducherry-607402
Packed on 06/26
MRP 275.00/- Incl. of all taxes
Net Content
lU Godrej aer plug Device
(23.1g)
2U x 25ml
50ml(46.2g)
For complaints call 18002660007 or Care@godrejcp.com
`;

  const llmOutput = {
    commodityClassification: {
      brandName: 'Godrej',
      genericName: 'Electric Air Freshener',
      scheduleCategory: null,
      physicalForm: 'countable', // LLM initially classified machine as countable
      isFoodArticle: false,
      isIndustrialOrInstitutional: false,
      isImported: false,
      countryOfOrigin: 'India',
      dimensionsRelevant: false,
      manufacturerIsNotPacker: false,
    },
    commodityName: { present: true, value: 'Electric Air Freshener', perProductBreakdown: false },
    manufacturer: { present: true, name: 'Godrej Consumer Supplies Limited', address: 'Puducherry-607402' },
    packer: { present: false, name: null, address: false },
    importer: { present: false, name: null, address: false },
    netQuantity: {
      present: true,
      value: 50,
      unit: 'ml',
      unitKind: 'volume',
      rawText: '2U x 25ml 50ml(46.2g)',
      qualifiedWhenPacked: false,
      onTagCardOrTapeDevice: false,
      symbolUsed: 'ml',
    },
    mfgDate: { present: true, value: '06/26', rawText: 'Packed on 06/26' },
    mrp: { present: true, value: 275, currency: 'INR', rawText: '275.00/-', inclusiveOfTaxesStated: true },
    dimensions: { present: false, rawText: '' },
    consumerCare: { present: true, telephone: '18002660007', email: 'Care@godrejcp.com' },
    standardPackDeclaration: { present: false },
    sheetCount: { present: false },
    multiComponentDeclarationHandled: false,
  };

  const healed = ensureFieldDefaults(llmOutput, rawOcrText);
  assert.strictEqual(healed.commodityName.perProductBreakdown, true, 'Expected perProductBreakdown to be true for multi-product pack');
  assert.strictEqual(healed.commodityClassification.physicalForm, 'combination', 'Expected physicalForm combination for device + liquid refills');
  assert.strictEqual(healed.netQuantity.value, 50);
  assert.strictEqual(healed.netQuantity.unit, 'ml');

  const pkgRecord = buildPackageRecord(healed, {
    netQuantityMultiPiece: { pieceCount: 3, totalValue: 50, totalUnit: 'ml' },
    contrastOk: true,
  });
  assert.strictEqual(pkgRecord.commodity.physicalForm, 'combination');
  assert.strictEqual(pkgRecord.commodity.isMultiProductPackage, true);

  const compliance = runComplianceCheck(pkgRecord);
  const r6Viol = compliance.violations.find((v) => v.rule === 'Rule 6(1)(b)');
  const r12Viol = compliance.violations.find((v) => v.rule === 'Rule 12(2)');
  assert.strictEqual(r6Viol, undefined, 'Rule 6(1)(b) must PASS because product names and quantities are explicitly declared');
  assert.strictEqual(r12Viol, undefined, 'Rule 12(2) must PASS because combination packages can have different units per Rule 12(1)');
  assert.strictEqual(compliance.compliant, true, 'Product must be fully COMPLIANT with 0 violations');
  console.log('✓ Test 6: Multi-product combo pack (Device + Refills) passes Rule 6(1)(b) & Rule 12(2) with 0 violations');
}

// Test 7: Image annotator generates green bounding box around Net Quantity and spatial clearance box
async function testAnnotator() {
  const { annotateNetQuantityImage } = require('../src/pipeline/netQuantityImageAnnotator');
  const fs = require('fs');
  const path = require('path');

  // Create a minimal test image with sharp
  const sharp = require('sharp');
  const testImgPath = path.join(__dirname, 'temp_test_panel.png');
  const testOutPath = path.join(__dirname, 'temp_test_annotated.png');

  await sharp({
    create: {
      width: 400,
      height: 400,
      channels: 3,
      background: { r: 240, g: 240, b: 240 },
    },
  }).png().toFile(testImgPath);

  const res = await annotateNetQuantityImage({
    imagePath: testImgPath,
    outputPath: testOutPath,
    netQuantityBox: { x1: 50, y1: 100, x2: 260, y2: 170 },
    exclusionBox: { x1: 10, y1: 80, x2: 300, y2: 190 },
    intrusions: [],
    numeralHeightPx: 20,
    numeralHeightMm: 2.0,
  });

  assert.strictEqual(res, testOutPath, 'Expected annotator to return output path');
  assert.ok(fs.existsSync(testOutPath), 'Expected annotated image file to exist');
  assert.ok(fs.statSync(testOutPath).size > 1000, 'Expected non-empty annotated image');

  fs.unlinkSync(testImgPath);
  fs.unlinkSync(testOutPath);
  console.log('✓ Test 7: Image annotator generates green bounding box image for product output directory');
}

// Test 8: Generic packaging - "Net Quantity: 1Unit" strictly identifies ONLY that line
{
  const lines = [
    { id: 1, imageIndex: 0, text: 'Item Name:150M Wireless Mini UsB Adapter', bbox: [[150, 480], [450, 480], [450, 500], [150, 500]] },
    { id: 2, imageIndex: 0, text: 'Generic Name:Wireless Mini UsB Adapter', bbox: [[150, 510], [440, 510], [440, 530], [150, 530]] },
    { id: 3, imageIndex: 0, text: 'Model No.:INT WiAD 150', bbox: [[150, 550], [350, 550], [350, 570], [150, 570]] },
    { id: 4, imageIndex: 0, text: 'Net Quantity:1Unit', bbox: [[152, 613], [289, 613], [289, 635], [152, 635]], heightPx: 22 },
    { id: 5, imageIndex: 0, text: 'Advanced', bbox: [[150, 640], [220, 640], [220, 655], [150, 655]] },
    { id: 6, imageIndex: 0, text: 'Month & Year of Manufacture:February 2026', bbox: [[150, 660], [460, 660], [460, 680], [150, 680]] },
    { id: 7, imageIndex: 0, text: 'Maximum Retail Price for 1Unit999.00/-', bbox: [[150, 700], [480, 700], [480, 720], [150, 720]] },
  ];

  const cluster = identifyNetQuantityCluster(lines);
  assert.ok(cluster, 'Expected cluster to be found');
  assert.strictEqual(cluster.declarationLines.length, 1, 'Declaration should strictly contain ONLY the Net Quantity line');
  assert.strictEqual(cluster.declarationLines[0].text, 'Net Quantity:1Unit');
  assert.strictEqual(cluster.anchor.text, 'Net Quantity:1Unit');

  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.fullCompositeBox.x1, 152);
  assert.strictEqual(res.fullCompositeBox.x2, 289);
  // Bounding box width is decreased to minimum corresponding to the measurement "1Unit"
  assert.strictEqual(res.netQuantityBox.x1, 251);
  assert.strictEqual(res.netQuantityBox.x2, 289);
  assert.strictEqual(res.netQuantityBox.y1, 613);
  assert.strictEqual(res.netQuantityBox.y2, 635);
  // Rule 8(1) clear space passes without false intrusion from "Advanced"
  assert.strictEqual(res.clearanceOk, true);
  console.log('✓ Test 8: "Net Quantity: 1Unit" bounding box width corrected to measurement minimum (x: 251..289, 38px) with compliant clearance');
}

// Test 9: No statutory Net Quantity header returns null (no unconstrained guessing from random numbers)
{
  const linesWithoutHeader = [
    { id: 1, imageIndex: 0, text: 'USB 2.0 High Speed Dongle 150M', bbox: [[50, 50], [300, 50], [300, 70], [50, 70]] },
    { id: 2, imageIndex: 0, text: 'Box Size 85 x 14 x 85 mm', bbox: [[50, 100], [250, 100], [250, 120], [50, 120]] },
    { id: 3, imageIndex: 0, text: 'MRP Rs. 999.00', bbox: [[50, 150], [200, 150], [200, 170], [50, 170]] },
  ];

  const cluster = identifyNetQuantityCluster(linesWithoutHeader);
  assert.strictEqual(cluster, null, 'Without Net Quantity header, no guessing should occur');
  console.log('✓ Test 9: Packages without statutory Net Quantity header correctly yield null without false guessing');
}

// Test 10: "Net Qty.:" variation detection and tight bounding
{
  const lines = [
    { id: 1, imageIndex: 0, text: 'Manufactured by ABC Corp.', bbox: [[50, 50], [250, 50], [250, 70], [50, 70]] },
    { id: 2, imageIndex: 0, text: 'Net Qty.: 100 g', bbox: [[50, 100], [180, 100], [180, 122], [50, 122]], heightPx: 22 },
    { id: 3, imageIndex: 0, text: 'MRP Rs. 150.00', bbox: [[50, 140], [200, 140], [200, 160], [50, 160]] },
  ];

  const cluster = identifyNetQuantityCluster(lines);
  assert.ok(cluster, 'Expected cluster for Net Qty.:');
  assert.strictEqual(cluster.declarationLines.length, 1);
  assert.strictEqual(cluster.declarationLines[0].text, 'Net Qty.: 100 g');
  assert.strictEqual(cluster.anchor.text, 'Net Qty.: 100 g');

  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.fullCompositeBox.x1, 50);
  assert.strictEqual(res.fullCompositeBox.x2, 180);
  // Bounding box width is decreased to minimum corresponding to "100 g"
  assert.strictEqual(res.netQuantityBox.x1, 137);
  assert.strictEqual(res.netQuantityBox.x2, 180);
  assert.strictEqual(res.netQuantityBox.y1, 100);
  assert.strictEqual(res.netQuantityBox.y2, 122);
  assert.strictEqual(res.clearanceOk, true);
  console.log('✓ Test 10: "Net Qty.: 100 g" strictly identified with measurement minimum width (x: 137..180, 43px)');
}

// Test 11: Single-line declaration with dot leaders "Net Qty.: .... 100 g"
{
  const lines = [
    { id: 1, imageIndex: 0, text: 'Net Qty.: .... 100 g', bbox: [[50, 100], [250, 100], [250, 122], [50, 122]], heightPx: 22 },
  ];

  const cluster = identifyNetQuantityCluster(lines);
  assert.ok(cluster, 'Expected cluster for Net Qty.: .... 100 g');
  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clusterFound, true);
  // Full composite box spans from header to measurement
  assert.strictEqual(res.fullCompositeBox.x1, 50);
  assert.strictEqual(res.fullCompositeBox.x2, 250);
  // Minimal measurement box excludes "Net Qty.: ...." and isolates "100 g"
  assert.strictEqual(res.netQuantityBox.x1, 200);
  assert.strictEqual(res.netQuantityBox.x2, 250);
  console.log('✓ Test 11: "Net Qty.: .... 100 g" dot leaders excluded from minimum measurement box (x: 200..250, 50px)');
}

// Test 12: Multi-box declaration across wide gap / table layout: "Net Qty.: ...." + "100 g"
{
  const lines = [
    { id: 1, imageIndex: 0, text: 'Net Qty.: ....', bbox: [[50, 100], [180, 100], [180, 122], [50, 122]], heightPx: 22 },
    { id: 2, imageIndex: 0, text: '100 g', bbox: [[450, 100], [500, 100], [500, 122], [450, 122]], heightPx: 22 },
  ];

  const cluster = identifyNetQuantityCluster(lines);
  assert.ok(cluster, 'Expected cluster across wide dot-leader row');
  assert.strictEqual(cluster.declarationLines.length, 2);

  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clusterFound, true);
  assert.strictEqual(res.fullCompositeBox.x1, 50);
  assert.strictEqual(res.fullCompositeBox.x2, 500);
  // Minimal measurement box is strictly the pure measurement line
  assert.strictEqual(res.netQuantityBox.x1, 450);
  assert.strictEqual(res.netQuantityBox.x2, 500);
  assert.strictEqual(res.multiPieceFacts.totalValue, 100);
  assert.strictEqual(res.multiPieceFacts.totalUnit, 'g');
  console.log('✓ Test 12: "Net Qty.: ...." and separate "100 g" clustered across wide gap with tight measurement box (x: 450..500)');
}

// Test 13: Dabur Fem OCR failure case: "Neroe" + "60g" + "(40g + 20g Free)"
{
  const lines = [
    { id: 149, imageIndex: 0, text: 'Neroe', bbox: [[426, 487], [513, 487], [513, 530], [426, 530]], heightPx: 43 },
    { id: 148, imageIndex: 0, text: '60g', bbox: [[601, 487], [645, 487], [645, 530], [601, 530]], heightPx: 43 },
    { id: 150, imageIndex: 0, text: '(40g + 20g Free)', bbox: [[703, 487], [853, 487], [853, 530], [703, 530]], heightPx: 43 },
  ];

  const cluster = identifyNetQuantityCluster(lines);
  assert.ok(cluster, 'Expected Neroe to be recognized as Priority 1 Net Qty header');
  assert.strictEqual(cluster.declarationLines.length, 3);

  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clusterFound, true);
  assert.strictEqual(res.fullCompositeBox.x1, 426);
  assert.strictEqual(res.fullCompositeBox.x2, 853);
  // Minimal measurement box isolates pure "60g"
  assert.strictEqual(res.netQuantityBox.x1, 601);
  assert.strictEqual(res.netQuantityBox.x2, 645);
  assert.strictEqual(res.multiPieceFacts.totalValue, 60);
  assert.strictEqual(res.multiPieceFacts.totalUnit, 'g');
  // Clearance passes: promo line (40g + 20g Free) is inside declaration and not an intrusion
  assert.strictEqual(res.clearanceOk, true);
  console.log('✓ Test 13: Dabur Fem "Neroe" + "60g" + "(40g + 20g Free)" produces tight 44px box on 60g with compliant clearance');
}

// Test 14: "Net. Qty.: 50 ml" with dot after Net
{
  const lines = [
    { id: 1, imageIndex: 0, text: 'Net. Qty.: 50 ml', bbox: [[60, 80], [200, 80], [200, 102], [60, 102]], heightPx: 22 },
  ];

  const cluster = identifyNetQuantityCluster(lines);
  assert.ok(cluster, 'Expected cluster for Net. Qty.:');
  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clusterFound, true);
  assert.strictEqual(res.netQuantityBox.x1, 156);
  assert.strictEqual(res.netQuantityBox.x2, 200);
  console.log('✓ Test 14: "Net. Qty.: 50 ml" with dot after Net correctly identified and tightly bounded');
}

// Test 15: Standalone "Net Qty.: ...." without separate measurement found still produces non-null box
{
  const lines = [
    { id: 1, imageIndex: 0, text: 'Net Qty.: ....', bbox: [[50, 100], [180, 100], [180, 122], [50, 122]], heightPx: 22 },
  ];

  const cluster = identifyNetQuantityCluster(lines);
  assert.ok(cluster);
  const res = analyzeNetQuantityWithClearance({ lines });
  assert.strictEqual(res.clusterFound, true);
  assert.ok(res.netQuantityBox != null, 'netQuantityBox must not be null');
  assert.strictEqual(res.netQuantityBox.x1, 50);
  assert.strictEqual(res.netQuantityBox.x2, 180);
  console.log('✓ Test 15: Standalone "Net Qty.: ...." without separate measurement still yields non-null bounding box');
}

testAnnotator().then(() => {
  console.log('\nALL 15 MULTI-PIECE NET QUANTITY & CLEARANCE TESTS PASSED SUCCESSFULLY!');
}).catch((err) => {
  console.error('Test 7 failed:', err);
  process.exit(1);
});


