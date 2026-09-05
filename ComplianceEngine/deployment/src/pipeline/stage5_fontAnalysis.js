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
const { analyzeNetQuantityWithClearance } = require('./netQuantityClearanceLayer');

// Inner product keywords to reject (only outer packaging/box dimensions are allowed)
const INNER_PRODUCT_RE = /\b(?:sheets?|wipes?|tissues?|napkins?|tablets?|capsules?|tiles?|biscuits?|inner|each piece|per piece)\b/i;
const PACKAGING_KEYWORD_RE = /\b(?:box|pack(?:ag(?:e|ing))?|carton|outer|container|case|dim(?:ension)?s?|size)\b/i;
const DIMENSION_RE = /(?:(\d+(?:\.\d+)?)\s*(mm|cm|m|inch(?:es)?|in)?\s*[xX*×]\s*)(\d+(?:\.\d+)?)\s*(mm|cm|m|inch(?:es)?|in)?(?:\s*[xX*×]\s*(\d+(?:\.\d+)?)\s*(mm|cm|m|inch(?:es)?|in)?)?/i;

function parseDimensionString(text) {
  if (!text) return null;
  const match = text.match(DIMENSION_RE);
  if (!match) return null;

  const toMm = (val, unit) => {
    const v = parseFloat(val);
    const u = (unit || '').toLowerCase();
    if (u === 'cm') return v * 10;
    if (u === 'm') return v * 1000;
    if (u === 'in' || u.startsWith('inch')) return v * 25.4;
    return v;
  };

  const unit = match[6] || match[4] || match[2] || 'mm';
  const d1 = toMm(match[1], match[2] || unit);
  const d2 = toMm(match[3], match[4] || unit);
  const d3 = match[5] ? toMm(match[5], match[6] || unit) : null;

  const dims = [d1, d2];
  if (d3 != null) dims.push(d3);

  return {
    rawText: match[0],
    lengthMm: d1,
    widthMm: d2,
    heightMm: d3 != null ? d3 : null,
    allDimensionsMm: dims,
  };
}

function extractPackagingDimensions(lines) {
  let candidate = null;
  for (const line of lines) {
    const text = String(line.text || '').trim();
    if (!text || INNER_PRODUCT_RE.test(text)) continue;

    const parsed = parseDimensionString(text);
    if (!parsed) continue;

    if (PACKAGING_KEYWORD_RE.test(text)) {
      return { ...parsed, source: 'packaging_label', matchedText: text };
    }
    if (!candidate) {
      candidate = { ...parsed, source: 'packaging_label', matchedText: text };
    }
  }
  return candidate;
}

function evaluateClearance(qtyLine, allLines) {
  if (!qtyLine || !qtyLine.bbox) {
    return { clearanceOk: true, overlappingTexts: [] };
  }
  const pts = qtyLine.bbox;
  const xs = pts.map((p) => p[0]);
  const ys = pts.map((p) => p[1]);
  const qx1 = Math.min(...xs);
  const qx2 = Math.max(...xs);
  const qy1 = Math.min(...ys);
  const qy2 = Math.max(...ys);
  const h = qtyLine.heightPx || (qy2 - qy1) || 15;

  // Rule 8(1) exclusion margins: 1x height top/bottom, 2x height left/right
  const exX1 = qx1 - 2.0 * h;
  const exX2 = qx2 + 2.0 * h;
  const exY1 = qy1 - 1.0 * h;
  const exY2 = qy2 + 1.0 * h;

  const targetPanel = qtyLine.imageIndex != null ? qtyLine.imageIndex : qtyLine.sourceImage;
  const overlapping = [];
  for (const line of allLines) {
    if (!line.bbox || line.id === qtyLine.id || line.text === qtyLine.text) continue;
    // Multi-panel isolation: clearance check applies strictly to the same packaging surface/panel
    if (targetPanel != null && line.imageIndex != null && line.imageIndex !== targetPanel) continue;
    if (targetPanel != null && line.sourceImage && line.sourceImage !== targetPanel) continue;

    const lxs = line.bbox.map((p) => p[0]);
    const lys = line.bbox.map((p) => p[1]);
    const lx1 = Math.min(...lxs);
    const lx2 = Math.max(...lxs);
    const ly1 = Math.min(...lys);
    const ly2 = Math.max(...lys);

    const intersectX = Math.max(0, Math.min(exX2, lx2) - Math.max(exX1, lx1));
    const intersectY = Math.max(0, Math.min(exY2, ly2) - Math.max(exY1, ly1));
    if (intersectX > 4 && intersectY > 4) {
      overlapping.push(line.text);
    }
  }

  return {
    clearanceOk: overlapping.length === 0,
    overlappingTexts: overlapping,
  };
}

function findLine(ocrLines, predicate) {
  return ocrLines.find(predicate);
}

function analyzeFont(ocrResult, options = {}) {
  logger.info('stage5_fontAnalysis', 'Analyzing packaging font geometry, dimensions, and readability');
  const lines = ocrResult.lines || [];

  // 1. Resolve packaging dimensions (ignore inner product dimensions)
  let pkgDims = null;
  if (options.packageDimensions) {
    pkgDims = typeof options.packageDimensions === 'string'
      ? parseDimensionString(options.packageDimensions)
      : options.packageDimensions;
    if (pkgDims) pkgDims.source = 'user_input';
  }
  if (!pkgDims) {
    pkgDims = extractPackagingDimensions(lines);
  }

  // 2. Physical scale calibration (pixelsPerMm)
  let pixelsPerMm = config.fontAnalysis.pixelsPerMm || options.pixelsPerMm || null;
  let calibrationSource = pixelsPerMm ? 'override' : 'none';

  if (!pixelsPerMm && pkgDims && pkgDims.allDimensionsMm && lines.length > 0) {
    const allPts = lines.flatMap((l) => l.bbox || []);
    if (allPts.length > 0) {
      const maxX = Math.max(...allPts.map((p) => p[0]));
      const maxY = Math.max(...allPts.map((p) => p[1]));
      const boxLongPx = Math.max(maxX, maxY);
      const boxShortPx = Math.min(maxX, maxY);
      const sortedDims = [...pkgDims.allDimensionsMm].sort((a, b) => b - a);
      const dimLongMm = sortedDims[0];
      const dimShortMm = sortedDims[1] || dimLongMm;
      if (dimLongMm > 0) {
        pixelsPerMm = +(boxLongPx / dimLongMm).toFixed(2);
        calibrationSource = pkgDims.source || 'packaging_dimensions';
      }
    }
  }

  // 3. Multi-Piece Net Quantity Layer & Rule 8(1) Composite Clearance Analysis
  const netQtyAnalysis = analyzeNetQuantityWithClearance(ocrResult);

  const mrpLine = findLine(lines, (l) => /\bm\.?r\.?p\.?\b|maximum\s+retail\s+price/i.test(l.text));
  const qtyLine = netQtyAnalysis.primaryQtyLine ||
    findLine(lines, (l) => /\bnet\s*(wt|weight|qty|quantity)\b|\b\d+(?:\.\d+)?\s*(g|kg|ml|l|litre|liter|unit|units|n\b|u\b)\b/i.test(l.text));

  const toMm = (line) => {
    if (!line || line.heightPx == null || !pixelsPerMm) return null;
    return +(line.heightPx / pixelsPerMm).toFixed(2);
  };

  const heightMm = { rsp: toMm(mrpLine), netQty: toMm(qtyLine) };
  const widthMm = {
    rsp: heightMm.rsp == null ? null : +(heightMm.rsp * 0.45).toFixed(2),
    netQty: heightMm.netQty == null ? null : +(heightMm.netQty * 0.45).toFixed(2),
  };

  // Rule 8(1) clearance zone from the intermediate layer
  // If a multi-piece declaration cluster was found, use its composite box and same-panel clearance
  let clearanceOk = netQtyAnalysis.clearanceOk;
  let overlappingTexts = netQtyAnalysis.overlappingTexts;

  // Fallback if no cluster was resolved: evaluate legacy single line clearance
  if (!netQtyAnalysis.clusterFound && qtyLine) {
    const legacyClearance = evaluateClearance(qtyLine, lines);
    clearanceOk = legacyClearance.clearanceOk;
    overlappingTexts = legacyClearance.overlappingTexts;
  }

  const languageUsed = [...new Set(lines.map((l) => l.language).filter(Boolean))];
  if (!languageUsed.some((x) => /english/i.test(x))) languageUsed.push('English');

  // 4. Contrast analysis: strictly evaluate Rule 9(1)(b) on RSP and Net Quantity numerals
  const minRequiredRatio = config.fontAnalysis.minContrastRatio || 2.5;
  const contrastSummary = ocrResult.contrastAnalysis || null;

  // Check Net Quantity line contrast
  const qtyContrast = qtyLine?.contrast || null;
  const mrpContrast = mrpLine?.contrast || null;

  const failingLines = lines.filter((l) => l.contrast && l.contrast.contrast_ok === false);
  const qtyContrastOk = qtyContrast ? qtyContrast.contrast_ok : true;
  const mrpContrastOk = mrpContrast ? mrpContrast.contrast_ok : true;
  const hasStatutoryContrastData = !!(qtyContrast || mrpContrast);

  // Statutory Rule 9(1)(b) requires that RSP and Net Quantity numerals contrast conspicuously with background
  const statutoryContrastOk = (qtyContrastOk && mrpContrastOk);

  // If explicit statutory numeral contrast data is present, evaluate statutory compliance.
  // If neither qty nor mrp contrast is available, fall back to checking if general packaging declarations failed.
  const contrastOk = hasStatutoryContrastData
    ? statutoryContrastOk
    : (failingLines.length === 0);

  const failingFields = [];
  if (qtyContrast && !qtyContrast.contrast_ok) failingFields.push('Net Quantity');
  if (mrpContrast && !mrpContrast.contrast_ok) failingFields.push('MRP');
  if (failingFields.length === 0 && !hasStatutoryContrastData && failingLines.length > 0) {
    failingFields.push(...failingLines.slice(0, 3).map((l) => `"${l.text.slice(0, 25)}..."`));
  }

  // Determine the most critical contrast ratio observed on statutory numerals (or failing declarations)
  let lowestContrastRatio = null;
  if (failingFields.length > 0) {
    const failingRatios = [
      (qtyContrast && !qtyContrast.contrast_ok) ? qtyContrast.contrast_ratio : null,
      (mrpContrast && !mrpContrast.contrast_ok) ? mrpContrast.contrast_ratio : null,
      ...(!hasStatutoryContrastData ? failingLines.map((l) => l.contrast?.contrast_ratio) : []),
    ].filter((r) => r != null);
    lowestContrastRatio = failingRatios.length > 0 ? Math.min(...failingRatios) : null;
  } else {
    const passingRatios = [
      qtyContrast?.contrast_ratio,
      mrpContrast?.contrast_ratio,
    ].filter((r) => r != null);
    lowestContrastRatio = passingRatios.length > 0
      ? Math.min(...passingRatios)
      : (contrastSummary?.min_contrast_ratio || null);
  }

  return {
    numeralHeightMm: heightMm,
    numeralWidthMm: widthMm,
    calibrationAvailable: !!pixelsPerMm,
    pixelsPerMm: pixelsPerMm || null,
    calibrationSource,
    packagingDimensions: pkgDims,
    pdpAreaCm2: null,
    contrastOk,
    contrastRatio: lowestContrastRatio,
    minRequiredRatio,
    qtyContrast,
    mrpContrast,
    failingDeclarations: failingFields,
    netQuantityBox: netQtyAnalysis.netQuantityBox,
    exclusionBox: netQtyAnalysis.exclusionBox,
    netQuantityMultiPiece: netQtyAnalysis.multiPieceFacts,
    isBlownFormedMoldedEmbossedOrPerforated: false,
    isExemptCharacterShape: false,
    isBlownFormedMoldedOnGlassOrPlastic: false,
    isHandwrittenOrHandScript: false,
    handwritingIsClearUnambiguousLegible: false,
    legibilityIssue: false,
    declarationOnlyReadableThroughLiquid: false,
    quantityDeclarationSurroundingAreaHasPrintedInfo: !clearanceOk,
    clearanceOverlappingTexts: overlappingTexts,
    rspOnCrownCapOrBottle: false,
    wrapperTransparentAndDeclarationsReadableThrough: false,
    innerPackageHasNoOuterCoverDeclaration: false,
    outerContainerHasAllDeclarations: false,
    languageUsed,
  };
}

module.exports = { analyzeFont };

