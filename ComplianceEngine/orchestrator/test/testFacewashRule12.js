const assert = require('assert');
const { buildPackageRecord } = require('../src/pipeline/orchestrator');
const { runComplianceCheck } = require('../src/pipeline/stage6_ruleEngine');

console.log('--- Testing Face Wash Rule 12(2) Compliance ---');

// Test Case 1: Face Wash with 300g (mass)
const declarations1 = {
  commodityName: { present: true, value: 'Face Wash (Brand: Nivea Men)' },
  commodityClassification: {
    brandName: 'Nivea Men',
    genericName: 'Face Wash',
    physicalForm: 'semi_solid',
  },
  netQuantity: {
    present: true,
    value: 300,
    unit: 'g',
    unitKind: 'mass',
    rawText: '300 g',
    pieceCount: 1,
  },
  mrp: { present: true, value: 345, rawText: 'Rs. 345.00' },
  manufacturer: { present: true, name: 'Nivea India Pvt Ltd', address: 'Mumbai' },
};

const pkgRecord1 = buildPackageRecord(declarations1, {}, {});
assert.strictEqual(pkgRecord1.commodity.physicalForm, 'semi_solid', 'Face wash should have physicalForm semi_solid');

const compliance1 = runComplianceCheck(declarations1, pkgRecord1, {}, {});
const r12Viol1 = compliance1.violations.find(v => v.rule.includes('Rule 12(2)'));
assert.strictEqual(r12Viol1, undefined, 'Rule 12(2) should NOT violate for face wash (semi_solid) with 300 g');
console.log('✓ Test 1 Passed: Face wash with 300g is COMPLIANT under Rule 12(2)');

// Test Case 2: Face Wash with 150ml (volume) - customarily sold by measure under proviso (a)
const declarations2 = {
  commodityName: { present: true, value: 'Cleanser Face Wash' },
  commodityClassification: {
    brandName: 'Himalaya',
    genericName: 'Face Wash',
    physicalForm: 'semi_solid',
  },
  netQuantity: {
    present: true,
    value: 150,
    unit: 'ml',
    unitKind: 'volume',
    rawText: '150 ml',
    pieceCount: 1,
  },
  mrp: { present: true, value: 180, rawText: 'Rs. 180.00' },
  manufacturer: { present: true, name: 'Himalaya Wellness', address: 'Bengaluru' },
};

const pkgRecord2 = buildPackageRecord(declarations2, {}, {});
const compliance2 = runComplianceCheck(declarations2, pkgRecord2, {}, {});
const r12Viol2 = compliance2.violations.find(v => v.rule.includes('Rule 12(2)'));
assert.strictEqual(r12Viol2, undefined, 'Rule 12(2) should NOT violate for face wash (semi_solid) with 150 ml under proviso (a)');
console.log('✓ Test 2 Passed: Face wash with 150ml is COMPLIANT under Rule 12(2) proviso (a)');

// Test Case 3: Face wash where LLM mistakenly returned physicalForm: 'liquid' but commodity is Face Wash
const declarations3 = {
  commodityName: { present: true, value: 'Nivea Men Dark Spot Reduction Face Wash' },
  commodityClassification: {
    brandName: 'Nivea Men',
    genericName: 'Dark Spot Reduction Face Wash',
    physicalForm: 'liquid', // Mistakenly 'liquid' from LLM
  },
  netQuantity: {
    present: true,
    value: 300,
    unit: 'g',
    unitKind: 'mass',
    rawText: '300 g',
    pieceCount: 1,
  },
  mrp: { present: true, value: 345, rawText: 'Rs. 345.00' },
  manufacturer: { present: true, name: 'Nivea India Pvt Ltd', address: 'Mumbai' },
};

const pkgRecord3 = buildPackageRecord(declarations3, {}, {});
assert.strictEqual(pkgRecord3.commodity.physicalForm, 'semi_solid', 'Healed physicalForm from liquid to semi_solid for face wash');
const compliance3 = runComplianceCheck(declarations3, pkgRecord3, {}, {});
const r12Viol3 = compliance3.violations.find(v => v.rule.includes('Rule 12(2)'));
assert.strictEqual(r12Viol3, undefined, 'Rule 12(2) healed and passed for face wash');
console.log('✓ Test 3 Passed: Healed physicalForm for Face wash with 300g passes Rule 12(2)');

console.log('\nALL FACE WASH RULE 12(2) TESTS PASSED!');
