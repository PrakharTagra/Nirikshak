/**
 * pipeline/stage4_fontAnalysis.js
 * Converts OCR line geometry (pixels) into the `labelMetrics` object
 * the rule engine (Stage 6, Rule 7/9 checks) expects, using the
 * pixel-to-mm calibration scale from Stage 2.
 *
 * Real-deployment hook: contrast detection (`contrastOk`) currently
 * defaults to `true` because it requires actual pixel-color analysis
 * (sample numeral color vs. local background color) — wire this up
 * with OpenCV (`cv.mean()` over the numeral mask vs. surrounding
 * region) when real image processing is added in Stage 1/2.
 */

'use strict';

const logger = require('../utils/logger');

function findLine(ocrLines, fieldHint) {
  return ocrLines.find((l) => l.fieldHint === fieldHint);
}

function analyzeFont(ocrResult, detection) {
  logger.info('stage4_fontAnalysis', 'Computing numeral height/width in mm');
  const lines = ocrResult.lines || [];

  const mrpLine = findLine(lines, 'mrp');
  const qtyLine = findLine(lines, 'netQuantity');

  const heightMm = { rsp: null, netQty: null };
  const widthMm = { rsp: null, netQty: null };

  if (mrpLine) {
    heightMm.rsp = mrpLine.heightMm != null ? mrpLine.heightMm : +(mrpLine.heightPx / detection.pxPerMm).toFixed(2);
    widthMm.rsp = +(heightMm.rsp * 0.45).toFixed(2); // typical Helvetica-numeral aspect ratio
  }
  if (qtyLine) {
    heightMm.netQty = qtyLine.heightMm != null ? qtyLine.heightMm : +(qtyLine.heightPx / detection.pxPerMm).toFixed(2);
    widthMm.netQty = +(heightMm.netQty * 0.45).toFixed(2);
  }

  const languageUsed = [
    ...new Set(
      lines
        .map((l) => l.language)
        .filter(Boolean)
        .concat(['English']) // OCR ran in English by default; add detected languages on top
    ),
  ];

  return {
    numeralHeightMm: heightMm,
    numeralWidthMm: widthMm,
    isBlownFormedMoldedEmbossedOrPerforated: !!detection.isBlownFormedMoldedEmbossedOrPerforated,
    isExemptCharacterShape: false,
    pdpAreaCm2: detection.pdpAreaCm2,
    contrastOk: true, // see hook note above
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
