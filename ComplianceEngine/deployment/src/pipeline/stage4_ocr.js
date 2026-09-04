/**
 * Stage 4 — OCR adapter.
 *
 * RapidOCR itself runs in the Python service immediately after Stage 2.
 * This adapter converts the Python Stage-4 result into the deployment engine's
 * canonical `{ lines: [...] }` contract used by Stage 5/6.
 */
'use strict';

const logger = require('../utils/logger');

function normalizePythonOcr(pythonResult) {
  const regions = pythonResult?.ocr?.regions || pythonResult?.regions || [];

  const lines = regions.map((region, index) => ({
    id: index,
    text: String(region.text || '').trim(),
    confidence: region.confidence ?? null,
    bbox: region.bbox ?? null,
    heightPx: region.pixel_height ?? null,
    heightMm: null,
    language: region.language ?? null,
  })).filter((line) => line.text);

  return {
    lines,
    regions,
    text: pythonResult?.ocr?.text || pythonResult?.extracted_text || lines.map((l) => l.text).join('\n'),
    engine: pythonResult?.ocr?.engine || 'RapidOCR',
    timing: pythonResult?.ocr?.timing || null,
    metadata: pythonResult?.metadata || {},
    raw: pythonResult?.ocr || null,
  };
}

async function extractText(preprocessed) {
  logger.info('stage4_ocr', 'Using RapidOCR output returned by the Python Stage 4 service');
  return normalizePythonOcr(preprocessed.integrationResult);
}

module.exports = { extractText, normalizePythonOcr };
