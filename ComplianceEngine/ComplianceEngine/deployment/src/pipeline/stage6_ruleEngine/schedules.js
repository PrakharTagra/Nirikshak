/**
 * schedules.js
 * Data tables transcribed directly from the Legal Metrology (Packaged
 * Commodities) Rules, 2011 (G.S.R. 202(E), 7th March 2011).
 * Every table below cites the Schedule/Rule it comes from.
 */

'use strict';

/* ------------------------------------------------------------------ */
/* FIRST SCHEDULE — Maximum Permissible Error (See Rule 2(e), 22)     */
/* ------------------------------------------------------------------ */

// Table I — MPE on net quantity declared by weight or volume (g or ml)
// Each band gives EITHER a percentage of declared quantity OR a fixed
// g/ml value — never both (matches the PDF table exactly).
const FIRST_SCHEDULE_TABLE_I = [
  { min: 0, max: 50, percent: 9, fixed: null },
  { min: 50, max: 100, percent: null, fixed: 4.5 },
  { min: 100, max: 200, percent: 4.5, fixed: null },
  { min: 200, max: 300, percent: null, fixed: 9 },
  { min: 300, max: 500, percent: 3, fixed: null },
  { min: 500, max: 1000, percent: null, fixed: 15 },
  { min: 1000, max: 10000, percent: 1.5, fixed: null },
  { min: 10000, max: 15000, percent: null, fixed: 150 },
  { min: 15000, max: Infinity, percent: 1.0, fixed: null },
];

// Table II — MPE on net quantity declared by length, area or number
const FIRST_SCHEDULE_TABLE_II = {
  length: { upTo10m: 0.02, thereafter: 0.01, breakpoint: 10 }, // metres
  area: { upTo10sqm: 0.04, thereafter: 0.01, breakpoint: 10 }, // sq. metres
  number: { flat: 0.02 },
};

function getMPEFromFirstSchedule(declaredQty, unit) {
  // unit: 'g' | 'kg' | 'ml' | 'l'  -> normalize to g/ml
  const norm = normalizeToGramsOrMl(declaredQty, unit);
  const band = FIRST_SCHEDULE_TABLE_I.find(
    (b) => norm >= b.min && norm < b.max
  );
  if (!band) return null;
  if (band.fixed !== null) return { type: 'fixed', value: band.fixed, unit: 'g_or_ml' };
  return { type: 'percent', value: band.percent };
}

function normalizeToGramsOrMl(value, unit) {
  const u = (unit || '').toLowerCase();
  if (u === 'kg') return value * 1000;
  if (u === 'l' || u === 'litre' || u === 'liter') return value * 1000;
  return value; // already g or ml
}

/* ------------------------------------------------------------------ */
/* RULE 7 — Minimum numeral height on the Principal Display Panel     */
/* ------------------------------------------------------------------ */

// Table I — by net quantity in weight/volume
const RULE7_TABLE_I = [
  { min: 0, max: 200, normalMm: 1, blownMm: 2 }, // upto 200g/ml
  { min: 200, max: 500, normalMm: 2, blownMm: 4 },
  { min: 500, max: Infinity, normalMm: 4, blownMm: 6 },
];

// Table II — by net quantity in length/area/number OR PDP area (cm2)
const RULE7_TABLE_II = [
  { min: 0, max: 100, normalMm: 1, blownMm: 2 },
  { min: 100, max: 500, normalMm: 2, blownMm: 4 },
  { min: 500, max: 2500, normalMm: 4, blownMm: 6 },
  { min: 2500, max: Infinity, normalMm: 6, blownMm: 6 },
];

function getMinNumeralHeightMm(declaredQty, unit, isBlownFormedMoldedEmbossedPerforated) {
  const isWeightOrVolume = ['g', 'kg', 'ml', 'l'].includes((unit || '').toLowerCase());
  const norm = isWeightOrVolume ? normalizeToGramsOrMl(declaredQty, unit) : declaredQty;
  const table = isWeightOrVolume ? RULE7_TABLE_I : RULE7_TABLE_II;
  const band = table.find((b) => norm >= b.min && norm < b.max);
  if (!band) return null;
  return isBlownFormedMoldedEmbossedPerforated ? band.blownMm : band.normalMm;
}

/* ------------------------------------------------------------------ */
/* SECOND SCHEDULE — Standard package sizes (See Rule 5)              */
/* ------------------------------------------------------------------ */
/* Structure per commodity:
 *   fixedSizes:        explicit allowed sizes (g or ml)
 *   thereafterMultipleOf: after the largest fixedSize, only multiples
 *                      of this value are allowed (null = no "thereafter")
 *   unit:              'g' or 'ml'
 *   belowFixedRule:    special rule for quantities below the smallest
 *                      fixed size (e.g. "no restriction", "multiples of 10g")
 *   notes:             free-text caveat from the PDF (variants, restrictions)
 */
const SECOND_SCHEDULE = {
  'baby food': {
    fixedSizes: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 5000, 10000],
    thereafterMultipleOf: null,
    unit: 'g',
  },
  'weaning food': {
    fixedSizes: [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 2000, 5000, 10000],
    thereafterMultipleOf: null,
    unit: 'g',
  },
  biscuits: {
    fixedSizes: [25, 50, 75, 100, 150, 200, 250, 300],
    thereafterMultipleOf: 100,
    thereafterUpTo: 1000,
    unit: 'g',
  },
  'bread (including brown bread, excluding bun)': {
    fixedSizes: [100],
    thereafterMultipleOf: 100,
    unit: 'g',
  },
  'butter and margarine (un-canned)': {
    fixedSizes: [25, 50, 100, 200, 500, 1000, 2000, 5000],
    thereafterMultipleOf: 5000,
    unit: 'g',
  },
  'cereals and pulses': {
    fixedSizes: [100, 200, 500, 1000, 2000, 5000],
    thereafterMultipleOf: 5000,
    unit: 'g',
  },
  coffee: {
    fixedSizes: [25, 50, 100, 200, 250, 500, 1000],
    thereafterMultipleOf: 1000,
    unit: 'g',
  },
  tea: {
    fixedSizes: [25, 50, 100, 125, 250, 500, 1000],
    thereafterMultipleOf: 1000,
    unit: 'g',
  },
  'reconstituted beverage materials': {
    fixedSizes: [25, 50, 100, 125, 200, 500, 1000],
    thereafterMultipleOf: 1000,
    unit: 'g',
  },
  'edible oils, vanaspati, ghee, butter oil': {
    fixedSizes: [50, 100, 200, 500, 1000, 2000, 3000, 5000],
    thereafterMultipleOf: 5000,
    unit: 'g_or_ml',
    notes:
      'If declared by volume, equivalent mass in brackets, same letter size (per Second Schedule note).',
  },
  'milk powder': {
    fixedSizes: [50, 100, 200, 500, 1000],
    thereafterMultipleOf: 500,
    belowFixedRule: 'no_restriction_below_50g',
    unit: 'g',
  },
  'non-soapy detergents (powder)': {
    fixedSizes: [50, 100, 200, 500, 700, 1000, 1500, 2000],
    thereafterMultipleOf: 1000,
    belowFixedRule: 'no_restriction_below_50g',
    unit: 'g',
  },
  'rice (powdered), flour, atta, rawa, suji': {
    fixedSizes: [100, 200, 500, 1000, 2000, 5000],
    thereafterMultipleOf: 5000,
    unit: 'g',
  },
  salt: {
    fixedSizes: [50, 100, 200, 500, 750, 1000, 2000, 5000],
    thereafterMultipleOf: 5000,
    belowFixedRule: 'multiples_of_10g_below_50g',
    unit: 'g',
  },
  'soap - laundry': {
    fixedSizes: [50, 75, 100],
    thereafterMultipleOf: 50,
    unit: 'g',
  },
  'soap - non-soapy detergent cakes/bars': {
    fixedSizes: [50, 75, 100, 125, 150, 200, 250, 300],
    thereafterMultipleOf: 100,
    unit: 'g',
  },
  'soap - toilet (incl. bath soap cakes)': {
    fixedSizes: [25, 50, 75, 100, 125, 150],
    thereafterMultipleOf: 50,
    unit: 'g',
  },
  'aerated soft drinks / non-alcoholic beverages': {
    fixedSizes: [65, 100, 125, 150, 200, 250, 300, 330, 500, 750, 1000, 1500, 2000, 3000, 4000, 5000],
    thereafterMultipleOf: null,
    unit: 'ml',
    notes: '65ml and 125ml sizes are for fruit-based drinks only; 330ml is for cans only.',
  },
  'mineral water and drinking water': {
    fixedSizes: [100, 150, 200, 250, 300, 500, 750, 1000, 1500, 2000, 3000, 4000, 5000],
    thereafterMultipleOf: null,
    unit: 'ml',
  },
  'cement in bags': {
    fixedSizes: [1000, 2000, 5000, 10000, 20000, 25000, 40000, 50000],
    thereafterMultipleOf: null,
    unit: 'g',
    notes: '40kg size is for white cement only.',
  },
  'paint, varnish etc. - (a) paint (other than paste/solid), varnish, stains, enamels': {
    fixedSizes: [50, 100, 200, 500, 1000, 2000, 3000, 4000, 5000],
    thereafterMultipleOf: 5000,
    unit: 'ml',
  },
  'paint, varnish etc. - (b) paste paint and solid paint': {
    fixedSizes: [500, 1000, 1500, 2000, 3000, 5000, 7000],
    thereafterMultipleOf: 5000,
    unit: 'g',
  },
  'paint, varnish etc. - (c) base paint': {
    fixedSizes: [450, 500, 900, 925, 950, 975, 1000, 3600, 3700, 3800, 3900, 4000],
    thereafterMultipleOf: null,
    unit: 'ml',
    notes: 'No restriction above 4 litre.',
  },
};

/* ------------------------------------------------------------------ */
/* THIRD SCHEDULE — Commodities eligible for "when packed" qualifier  */
/* (See Rule 11(4))                                                   */
/* ------------------------------------------------------------------ */
const THIRD_SCHEDULE = ['all kinds of soaps', 'lotions', 'cream (other than cream of milk)'];

/* ------------------------------------------------------------------ */
/* FOURTH SCHEDULE — Unit-of-declaration exceptions (See Rule 12(2))  */
/* ------------------------------------------------------------------ */
const FOURTH_SCHEDULE = {
  'aerosol products': 'weight',
  'acids in liquid form': 'weight_or_volume',
  'compressed or liquefied gas (not lpg)': 'weight_and_equivalent_volume',
  curd: 'weight',
  'electric cables': 'length_or_weight',
  'electric wire': 'length_or_weight',
  'fencing wire': 'number_or_weight',
  'fruits, all kinds': 'number_or_weight',
  'furnace oil': 'weight_or_volume',
  'non edible vegetable oil': 'weight_or_volume',
  'edible oil, vanaspati ghee and butter oil': 'weight_or_volume',
  'heavy residual fuel oil': 'weight',
  'industrial diesel fuel': 'volume',
  'honey, malt-extract, golden syrup treacle': 'weight',
  'ice cream and other similar frozen products': 'volume',
  'liquid chemicals': 'weight_or_volume',
  'liquefied petroleum gas': 'weight',
  'nails, wood screws': 'number_or_weight',
  'paints other than paste paint or solid paint, varnish, stains, enamels': 'volume',
  'paste paint, solid paint': 'weight',
  'rasgulla, gulabjamun and other sweet preparations': 'weight',
  'ready-made garments': 'number',
  'sauces, all kinds': 'weight',
  'tyres and tubes': 'number',
  yarn: 'weight_or_length',
  'cosmetics including creams, shampoo, lotions and perfumes': 'weight_or_measure',
};

module.exports = {
  FIRST_SCHEDULE_TABLE_I,
  FIRST_SCHEDULE_TABLE_II,
  getMPEFromFirstSchedule,
  normalizeToGramsOrMl,
  RULE7_TABLE_I,
  RULE7_TABLE_II,
  getMinNumeralHeightMm,
  SECOND_SCHEDULE,
  THIRD_SCHEDULE,
  FOURTH_SCHEDULE,
};
