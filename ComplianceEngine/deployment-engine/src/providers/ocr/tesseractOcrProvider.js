/**
 * providers/ocr/tesseractOcrProvider.js
 * Real OCR integration point using `tesseract.js`. NOT wired in by
 * default (see config: OCR_PROVIDER=tesseract to enable) because it
 * requires the `tesseract.js` package and downloads trained-data on
 * first run — install it in your deployment environment:
 *
 *   npm install tesseract.js
 *
 * The output shape must match mockOcrProvider.js: an array of
 * `{ text, heightPx, fieldHint? }` lines. Tesseract's raw output only
 * gives you `text` + geometry (via `recognize(..., { ... }).data.words`
 * with per-word bounding boxes) — `fieldHint` is NOT provided by OCR
 * itself. Stage 5 (extraction) is written to work either way: if
 * `fieldHint` is present it's used directly (mock path); if absent,
 * Stage 5 falls back to its own regex/NER classification of the raw
 * text (real-OCR path). See stage5_extraction.js's `classifyLine()`.
 */

'use strict';

async function runOcr(preprocessed /*, detection */) {
  // eslint-disable-next-line global-require
  const Tesseract = require('tesseract.js'); // throws clearly if not installed

  const { data } = await Tesseract.recognize(preprocessed.path, 'eng+hin');

  const lines = (data.lines || []).map((line) => ({
    text: line.text.trim(),
    heightPx: line.bbox ? line.bbox.y1 - line.bbox.y0 : null,
    // fieldHint intentionally omitted — Stage 5 classifies raw OCR text.
  }));

  return { lines, rawConfidence: data.confidence };
}

module.exports = { runOcr };
