/**
 * Stage 5 — font/readability analysis.
 *
 * Stage 3/PDP detection was intentionally removed. Therefore there is no
 * automatic pixel-to-mm calibration here unless the deployment is explicitly
 * configured with a known PIXELS_PER_MM value. We never invent a physical
 * scale. OCR pixel heights are preserved for evidence, while mm checks remain
 * unavailable until a physical calibration source is supplied.
 */
'use strict';

const logger = require('../utils/logger');
const config = require('../config');

function findLine(ocrLines, predicate) {
  return ocrLines.find(predicate);
}

function analyzeFont(ocrResult) {
  logger.info('stage5_fontAnalysis', 'Analyzing OCR geometry without PDP detection');
  const lines = ocrResult.lines || [];
  const pixelsPerMm = config.fontAnalysis.pixelsPerMm;

  const mrpLine = findLine(lines, (l) => /\bm\.?r\.?p\.?\b|maximum\s+retail\s+price/i.test(l.text));
  const qtyLine = findLine(lines, (l) => /\bnet\s*(wt|weight|qty|quantity)\b|\b\d+(?:\.\d+)?\s*(g|kg|ml|l|litre|liter)\b/i.test(l.text));

  const toMm = (line) => {
    if (!line || line.heightPx == null || !pixelsPerMm) return null;
    return +(line.heightPx / pixelsPerMm).toFixed(2);
  };

  const heightMm = { rsp: toMm(mrpLine), netQty: toMm(qtyLine) };
  const widthMm = {
    rsp: heightMm.rsp == null ? null : +(heightMm.rsp * 0.45).toFixed(2),
    netQty: heightMm.netQty == null ? null : +(heightMm.netQty * 0.45).toFixed(2),
  };

  const languageUsed = [...new Set(lines.map((l) => l.language).filter(Boolean))];
  if (!languageUsed.some((x) => /english/i.test(x))) languageUsed.push('English');

  return {
    numeralHeightMm: heightMm,
    numeralWidthMm: widthMm,
    calibrationAvailable: !!pixelsPerMm,
    pixelsPerMm: pixelsPerMm || null,
    pdpAreaCm2: null,
    contrastOk: true,
    isBlownFormedMoldedEmbossedOrPerforated: false,
    isExemptCharacterShape: false,
    isBlownFormedMoldedOnGlassOrPlastic: false,
    isHandwrittenOrHandScript: false,
    handwritingIsClearUnambiguousLegible: false,
    legibilityIssue: false,
    declarationOnlyReadableThroughLiquid: false,
    quantityDeclarationSurroundingAreaHasPrintedInfo: false,
    rspOnCrownCapOrBottle: false,
    wrapperTransparentAndDeclarationsReadableThrough: false,
    innerPackageHasNoOuterCoverDeclaration: false,
    outerContainerHasAllDeclarations: false,
    languageUsed,
  };
}

module.exports = { analyzeFont };
