'use strict';

const assert = require('assert');
const { normalizePythonOcr } = require('../src/pipeline/stage4_ocr');
const { analyzeFont } = require('../src/pipeline/stage5_fontAnalysis');
const { runComplianceCheck } = require('../src/pipeline/stage6_ruleEngine');

console.log('--- Running Contrasting Colors Module Tests ---');

// Test 1: stage4_ocr normalization with contrast data
{
  const pythonResult = {
    ocr: {
      text: 'Net Wt. 500g\nMRP Rs. 120.00',
      regions: [
        {
          text: 'Net Wt. 500g',
          confidence: 0.98,
          bbox: [[10, 10], [100, 10], [100, 30], [10, 30]],
          pixel_height: 20,
          contrast: {
            contrast_ratio: 12.5,
            contrast_ok: true,
            fg_hex: '#000000',
            bg_hex: '#FFFFFF',
          },
        },
        {
          text: 'MRP Rs. 120.00',
          confidence: 0.97,
          bbox: [[10, 40], [100, 40], [100, 60], [10, 60]],
          pixel_height: 20,
          contrast: {
            contrast_ratio: 1.8,
            contrast_ok: false,
            fg_hex: '#888888',
            bg_hex: '#AAAAAA',
          },
        },
      ],
      contrast_analysis: {
        overall_contrast_ok: false,
        min_contrast_ratio: 1.8,
        failing_regions_count: 1,
      },
    },
  };

  const normalized = normalizePythonOcr(pythonResult);
  assert.strictEqual(normalized.lines.length, 2);
  assert.strictEqual(normalized.lines[0].contrast.contrast_ok, true);
  assert.strictEqual(normalized.lines[1].contrast.contrast_ok, false);
  assert.strictEqual(normalized.contrastAnalysis.overall_contrast_ok, false);
  console.log('✓ Test 1: stage4_ocr normalization retains contrast data');
}

// Test 2: stage5_fontAnalysis evaluates failing contrast on MRP
{
  const ocrResult = {
    lines: [
      {
        text: 'Net Wt: 500g',
        heightPx: 30,
        contrast: {
          contrast_ratio: 8.5,
          contrast_ok: true,
          fg_hex: '#000000',
          bg_hex: '#FFFFFF',
        },
      },
      {
        text: 'MRP Rs. 99/-',
        heightPx: 30,
        contrast: {
          contrast_ratio: 1.9,
          contrast_ok: false,
          fg_hex: '#777777',
          bg_hex: '#888888',
        },
      },
    ],
  };

  const metrics = analyzeFont(ocrResult);
  assert.strictEqual(metrics.contrastOk, false, 'Expected contrastOk to be false when MRP contrast fails');
  assert.strictEqual(metrics.contrastRatio, 1.9);
  assert.ok(metrics.failingDeclarations.includes('MRP'));
  console.log('✓ Test 2: stage5_fontAnalysis flags failing MRP contrast');
}

// Test 3: stage5_fontAnalysis evaluates failing contrast on Net Quantity
{
  const ocrResult = {
    lines: [
      {
        text: 'Net Wt: 200g',
        heightPx: 25,
        contrast: {
          contrast_ratio: 1.5,
          contrast_ok: false,
          fg_hex: '#CCCCCC',
          bg_hex: '#FFFFFF',
        },
      },
      {
        text: 'MRP Rs. 50/-',
        heightPx: 25,
        contrast: {
          contrast_ratio: 14.0,
          contrast_ok: true,
          fg_hex: '#000000',
          bg_hex: '#FFFFFF',
        },
      },
    ],
  };

  const metrics = analyzeFont(ocrResult);
  assert.strictEqual(metrics.contrastOk, false, 'Expected contrastOk to be false when Net Qty contrast fails');
  assert.ok(metrics.failingDeclarations.includes('Net Quantity'));
  console.log('✓ Test 3: stage5_fontAnalysis flags failing Net Quantity contrast');
}

// Test 4: Rule Engine strictly rejects product when contrastOk is false (Rule 9(1)(b))
{
  const pkg = {
    commodity: {
      category: 'Biscuits',
      netQuantityValue: 200,
      netQuantityUnit: 'g',
    },
    declarations: {
      manufacturer: { present: true, address: true },
      commodityName: { present: true },
      netQuantity: { present: true, value: 200, unit: 'g' },
      mfgDate: { present: true },
      mrp: { present: true, inclusiveOfTaxesStated: true },
      consumerCare: { present: true },
    },
    labelMetrics: {
      contrastOk: false,
      contrastRatio: 1.8,
      minRequiredRatio: 2.5,
      failingDeclarations: ['MRP'],
      isBlownFormedMoldedOnGlassOrPlastic: false,
    },
  };

  const result = runComplianceCheck(pkg);
  assert.strictEqual(result.compliant, false, 'Expected package to be NON-COMPLIANT due to contrast failure');
  const contrastViolation = result.violations.find((v) => v.rule === 'Rule 9(1)(b)');
  assert.ok(contrastViolation, 'Expected Rule 9(1)(b) violation to be present');
  assert.strictEqual(contrastViolation.severity, 'critical', 'Expected severity to be critical');
  assert.ok(contrastViolation.message.includes('1.8:1'), 'Expected measured ratio in violation message');
  assert.ok(contrastViolation.message.includes('MRP'), 'Expected failing field in violation message');
  console.log('✓ Test 4: Rule Engine strictly rejects product failing contrast with CRITICAL Rule 9(1)(b) violation');
}

// Test 5: Rule Engine approves product when contrastOk is true
{
  const pkg = {
    commodity: {
      category: 'Biscuits',
      netQuantityValue: 200,
      netQuantityUnit: 'g',
    },
    declarations: {
      manufacturer: { present: true, address: true },
      commodityName: { present: true },
      netQuantity: { present: true, value: 200, unit: 'g' },
      mfgDate: { present: true },
      mrp: { present: true, inclusiveOfTaxesStated: true },
      consumerCare: { present: true },
    },
    labelMetrics: {
      contrastOk: true,
      contrastRatio: 12.0,
      minRequiredRatio: 2.5,
      isBlownFormedMoldedOnGlassOrPlastic: false,
    },
  };

  const result = runComplianceCheck(pkg);
  const contrastViolation = result.violations.find((v) => v.rule === 'Rule 9(1)(b)');
  assert.strictEqual(contrastViolation, undefined, 'Did not expect Rule 9(1)(b) violation');
  assert.strictEqual(result.compliant, true, 'Expected package to be COMPLIANT');
  console.log('✓ Test 5: Rule Engine approves product with compliant contrast');
}

// Test 6: Rule 9(1)(b) exemption for blown/formed text on glass/plastic
{
  const pkg = {
    commodity: {
      category: 'Beverage Bottle',
      netQuantityValue: 500,
      netQuantityUnit: 'ml',
    },
    declarations: {
      manufacturer: { present: true, address: true },
      commodityName: { present: true },
      netQuantity: { present: true, value: 500, unit: 'ml' },
      mfgDate: { present: true },
      mrp: { present: true, inclusiveOfTaxesStated: true },
      consumerCare: { present: true },
    },
    labelMetrics: {
      contrastOk: false,
      isBlownFormedMoldedOnGlassOrPlastic: true, // Legal exemption
    },
  };

  const result = runComplianceCheck(pkg);
  const contrastViolation = result.violations.find((v) => v.rule === 'Rule 9(1)(b)');
  assert.strictEqual(contrastViolation, undefined, 'Blown/molded text on glass/plastic is legally exempt from contrast');
  console.log('✓ Test 6: Rule 9(1)(b) properly applies glass/plastic embossing exemption');
}

console.log('\nALL 6 CONTRAST TESTS PASSED SUCCESSFULLY!');
