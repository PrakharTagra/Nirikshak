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
  // Check if this is a multi-image batch result
  if (pythonResult?.items && Array.isArray(pythonResult.items)) {
    let globalIndex = 0;
    const allLines = [];
    const perImage = [];

    pythonResult.items.forEach((item, imgIdx) => {
      const itemRegions = item.ocr?.regions || item.regions || [];
      const itemLines = itemRegions
        .map((region) => ({
          id: globalIndex++,
          imageIndex: imgIdx,
          sourceImage: item.filename || `panel_${imgIdx + 1}`,
          text: String(region.text || '').trim(),
          confidence: region.confidence ?? null,
          bbox: region.bbox ?? null,
          heightPx: region.pixel_height ?? null,
          heightMm: null,
          language: region.language ?? null,
          contrast: region.contrast ?? null,
        }))
        .filter((line) => line.text);

      allLines.push(...itemLines);
      perImage.push({
        imageIndex: imgIdx,
        filename: item.filename,
        text: item.extracted_text || itemLines.map((l) => l.text).join('\n'),
        lines: itemLines,
        regions: itemRegions,
        metadata: item.metadata || {},
      });
    });

    const combinedRegions = pythonResult.combined_regions || allLines;
    const combinedText =
      pythonResult.combined_text ||
      perImage.map((pi) => `--- [Panel: ${pi.filename}] ---\n${pi.text}`).join('\n\n');

    return {
      lines: allLines,
      regions: combinedRegions,
      text: combinedText,
      engine: 'RapidOCR',
      isMultiImage: pythonResult.items.length > 1,
      imageCount: pythonResult.items.length,
      perImage,
      contrastAnalysis: pythonResult.contrast_analysis || null,
      metadata: pythonResult.items[0]?.metadata || {},
      raw: pythonResult,
    };
  }

  // Single-image result
  const regions = pythonResult?.ocr?.regions || pythonResult?.regions || [];

  const lines = regions
    .map((region, index) => ({
      id: index,
      imageIndex: 0,
      sourceImage: pythonResult?.filename || 'image_1',
      text: String(region.text || '').trim(),
      confidence: region.confidence ?? null,
      bbox: region.bbox ?? null,
      heightPx: region.pixel_height ?? null,
      heightMm: null,
      language: region.language ?? null,
      contrast: region.contrast ?? null,
    }))
    .filter((line) => line.text);

  return {
    lines,
    regions,
    text: pythonResult?.ocr?.text || pythonResult?.extracted_text || lines.map((l) => l.text).join('\n'),
    engine: pythonResult?.ocr?.engine || 'RapidOCR',
    isMultiImage: false,
    imageCount: 1,
    perImage: [
      {
        imageIndex: 0,
        filename: pythonResult?.filename || 'image_1',
        text: pythonResult?.extracted_text || lines.map((l) => l.text).join('\n'),
        lines,
        regions,
        metadata: pythonResult?.metadata || {},
      },
    ],
    contrastAnalysis: pythonResult?.ocr?.contrast_analysis || pythonResult?.contrast_analysis || null,
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
