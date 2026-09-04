/**
 * providers/ocr/mockOcrProvider.js
 * Stands in for a real OCR engine (Tesseract / Google Cloud Vision /
 * PaddleOCR). Returns text lines with pixel bounding boxes AND a
 * `fieldHint` — in a real deployment, `fieldHint` is what Stage 5's
 * NLP/NER model would infer from raw OCR text; here it's supplied
 * directly by the mock so the rest of the pipeline (extraction →
 * rule engine → report) can be exercised end-to-end without a
 * trained model.
 *
 * Two demo scenarios are keyed off the filename (see
 * mockDetectionProvider.js for the same convention):
 *   *compliant*     -> a fully compliant 1kg salt packet
 *   *noncompliant*   -> a biscuit packet with several real violations
 *   anything else    -> a generic partial-info packet
 */

'use strict';

const SCENARIO_LINES = {
  compliant: [
    { text: 'Iodised Salt', fieldHint: 'commodityName', heightPx: 40 },
    { text: 'Net Wt. 1kg', fieldHint: 'netQuantity', heightPx: 48 },
    { text: 'MRP Rs.28/- incl. of all taxes', fieldHint: 'mrp', heightPx: 48 },
    { text: 'Mfd. by ABC Salts Pvt Ltd, Plot 4 Industrial Area, Kutch, Gujarat - 370001', fieldHint: 'manufacturer', heightPx: 24 },
    { text: 'Mfg: 06/2026', fieldHint: 'mfgDate', heightPx: 24 },
    { text: 'For complaints call 1800-123-4567 or care@abcsalts.example', fieldHint: 'consumerCare', heightPx: 20 },
    { text: 'Hindi aur English mein', fieldHint: 'language_marker', heightPx: 20, language: 'Hindi' },
  ],
  noncompliant: [
    { text: 'Cream Biscuits', fieldHint: 'commodityName', heightPx: 40 },
    { text: 'Net Wt. approximately 90g', fieldHint: 'netQuantity', heightPx: 10 },
    { text: 'MRP Rs.20/-', fieldHint: 'mrp', heightPx: 10 },
    { text: 'Mfd. by XYZ Foods', fieldHint: 'manufacturer', heightPx: 24 },
    // no mfgDate line at all
    // no consumerCare line at all
  ],
  default: [
    { text: 'Product Sample', fieldHint: 'commodityName', heightPx: 30 },
    { text: 'Net Wt. 250g', fieldHint: 'netQuantity', heightPx: 20 },
    { text: 'Mfd. by Sample Co, 12 Market Road, Delhi - 110001', fieldHint: 'manufacturer', heightPx: 20 },
  ],
};

function pickScenario(imagePath) {
  const lower = imagePath.toLowerCase();
  if (lower.includes('noncompliant') || lower.includes('non_compliant')) return SCENARIO_LINES.noncompliant;
  if (lower.includes('compliant')) return SCENARIO_LINES.compliant;
  return SCENARIO_LINES.default;
}

async function runOcr(preprocessed, detection) {
  const lines = pickScenario(preprocessed.path);
  return {
    lines: lines.map((l) => ({
      ...l,
      heightMm: +(l.heightPx / detection.pxPerMm).toFixed(2),
    })),
  };
}

module.exports = { runOcr };
