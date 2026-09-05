/**
 * netQuantityClearanceLayer.js
 *
 * Intermediate layer for Net Quantity analysis:
 * 1. Recognizes complete Net Quantity declarations on packaging, including multi-piece
 *    and multi-component products (e.g., 2, 3, or 4 pieces, per-piece breakdown values,
 *    and aggregated total quantities).
 * 2. Unifies all lines belonging to the declaration into a single composite bounding box.
 * 3. Constructs the statutory Rule 8(1) proviso exclusion box (clear above/below by >= 1x
 *    numeral height, left/right by >= 2x numeral height).
 * 4. Checks for intruding text strictly within the same image panel, ignoring all net quantity
 *    lines and values, and emits clearance violations only if external printed text intrudes.
 * 5. Provides structured multi-piece facts to resolve LLM partial-mapping issues.
 */
'use strict';

const logger = require('../utils/logger');

// Regex patterns for detecting net quantity anchors and components
const NET_QTY_HEADER_RE = /\b(?:net\s*(?:quantity|qty|wt|weight|content|contents)|quantity|qty)\b/i;
const COUNT_UNIT_RE = /\b(\d+)\s*(?:numbers?|units?|pieces?|pcs?|nos?|pkts?|refills?|packs?|n\b|u\b)\b/i;
const MULTIPLIER_RE = /(?:\(?\s*(\d+)\s*(?:numbers?|units?|pieces?|n|u|refills?|nos?)?\s*[xX*×]\s*(\d+(?:\.\d+)?)\s*(ml|l|litre|litres|liter|liters|g|gm|gms|kg|m|cm|mm)?\s*\)?)|(?:[xX*×]\s*(\d+))/i;
const MEASURE_VAL_RE = /\b(\d+(?:\.\d+)?)\s*(ml|l|litre|litres|liter|liters|g|gm|gms|kg|m|cm|mm|n\b|u\b|units?|pieces?|nos?)\b/i;
const PROMO_OR_DISCLAIMER_RE = /\b(?:offer|valid|till|stocks?|when\s+compared|compared\s+to|single|free|mfg\.?\s*lic|plot\s*no|works?)\b/i;

// Statutory declarations that are distinctly NOT net quantity and must never be clustered into it
const NON_NET_QTY_DECLARATIONS_RE = /\b(?:expiry|exp\b|best\s*before|use\s*by|mfg|manufactur|packer|packing|import|mrp|retail\s*price|incl|taxes|batch|voltage|wattage|power|composition|warning|caution|instruction|direction|safety|ingredients?|feedback|complaint|consumer\s*care|care@|toll\s*free)\b/i;

function getAABB(pts) {
  if (!pts || pts.length === 0) return null;
  const xs = pts.map((p) => p[0]);
  const ys = pts.map((p) => p[1]);
  return {
    x1: Math.min(...xs),
    y1: Math.min(...ys),
    x2: Math.max(...xs),
    y2: Math.max(...ys),
  };
}

function parseQuantityPiece(text) {
  if (!text) return null;

  // Check multiplier format: "(2 Numbers x 45 ml)" or "3 x 100 g" or "x2"
  const multiMatch = text.match(MULTIPLIER_RE);
  if (multiMatch) {
    if (multiMatch[1] && multiMatch[2]) {
      const count = parseInt(multiMatch[1], 10);
      const val = parseFloat(multiMatch[2]);
      const unit = (multiMatch[3] || '').toLowerCase();
      return { count, value: val, unit, isMultiplier: true, raw: text };
    }
    if (multiMatch[4]) {
      const count = parseInt(multiMatch[4], 10);
      return { count, value: null, unit: null, isCountOnly: true, raw: text };
    }
  }

  // Check measure format: "90 ml", "500 g", "3 N"
  const measureMatch = text.match(MEASURE_VAL_RE);
  if (measureMatch) {
    const val = parseFloat(measureMatch[1]);
    const unit = measureMatch[2].toLowerCase();
    const isCount = ['n', 'u', 'unit', 'units', 'piece', 'pieces', 'nos'].includes(unit);
    return {
      count: isCount ? val : null,
      value: val,
      unit: unit,
      isCountOnly: isCount,
      raw: text,
    };
  }

  return null;
}

/**
 * Identifies the complete Net Quantity declaration across OCR lines.
 * Handles single lines as well as multi-line declarations (e.g. header line,
 * piece count line, per-piece breakdown line, total quantity line).
 */
function identifyNetQuantityCluster(allLines = []) {
  if (!allLines || allLines.length === 0) return null;

  // Group lines by imageIndex (or sourceImage)
  const panels = new Map();
  for (const line of allLines) {
    const panelKey = line.imageIndex != null ? line.imageIndex : (line.sourceImage || 0);
    if (!panels.has(panelKey)) panels.set(panelKey, []);
    panels.get(panelKey).push(line);
  }

  let bestCluster = null;
  let highestScore = -1;

  for (const [panelKey, panelLines] of panels.entries()) {
    // 1. Locate anchor lines containing explicit Net Quantity keywords
    const headerCandidates = panelLines.filter((l) => {
      const txt = String(l.text || '').trim();
      return NET_QTY_HEADER_RE.test(txt) && !PROMO_OR_DISCLAIMER_RE.test(txt) && !NON_NET_QTY_DECLARATIONS_RE.test(txt);
    });

    for (const anchor of headerCandidates) {
      const anchorBox = getAABB(anchor.bbox);
      if (!anchorBox) continue;

      const clusterLines = [anchor];
      const seenIds = new Set([anchor.id]);

      // Iteratively expand cluster to include adjacent lines that provide pieces/breakdown/total
      let added = true;
      while (added) {
        added = false;
        const curBox = getAABB(clusterLines.flatMap((l) => l.bbox));
        const curH = Math.max(...clusterLines.map((l) => l.heightPx || 20));

        for (const candidate of panelLines) {
          if (seenIds.has(candidate.id)) continue;
          const candBox = getAABB(candidate.bbox);
          if (!candBox) continue;

          const candTxt = String(candidate.text || '').trim();
          if (!candTxt) continue;
          if (NON_NET_QTY_DECLARATIONS_RE.test(candTxt)) continue;
          if (PROMO_OR_DISCLAIMER_RE.test(candTxt)) continue;

          const isQtyValue = MEASURE_VAL_RE.test(candTxt) ||
            MULTIPLIER_RE.test(candTxt) ||
            COUNT_UNIT_RE.test(candTxt) ||
            /\b(?:refills?|device|plug|bottle|tablets?|capsules?|nos?|units?|pieces?)\b/i.test(candTxt);

          if (!isQtyValue) continue;

          // Check spatial proximity to current cluster bounding box
          const candH = candBox.y2 - candBox.y1;
          const vertOverlap = Math.max(0, Math.min(curBox.y2, candBox.y2) - Math.max(curBox.y1, candBox.y1));
          const isSameRow = vertOverlap >= 0.3 * Math.min(candH, curH);

          const vertDist = isSameRow ? 0 : Math.max(0, Math.max(candBox.y1 - curBox.y2, curBox.y1 - candBox.y2));
          const horizDist = Math.max(0, Math.max(candBox.x1 - curBox.x2, curBox.x1 - candBox.x2));

          const adjacentRow = vertDist <= curH * 2.2 && (horizDist <= curH * 3.5 || (candBox.x2 >= curBox.x1 && candBox.x1 <= curBox.x2));
          const adjacentCol = isSameRow && horizDist <= curH * 6.0;

          if (adjacentRow || adjacentCol) {
            clusterLines.push(candidate);
            seenIds.add(candidate.id);
            added = true;
          }
        }
      }

      // Compute cluster score
      let score = 10;
      const combinedTxt = clusterLines.map((l) => l.text).join(' ');
      if (MULTIPLIER_RE.test(combinedTxt)) score += 5;
      if (MEASURE_VAL_RE.test(combinedTxt)) score += 5;
      if (clusterLines.length > 1) score += 3;

      if (score > highestScore) {
        highestScore = score;
        bestCluster = {
          panelKey,
          panelLines,
          anchor,
          declarationLines: clusterLines,
        };
      }
    }
  }

  // Fallback if no explicit header was found: look for isolated valid quantity declaration
  if (!bestCluster) {
    for (const [panelKey, panelLines] of panels.entries()) {
      for (const line of panelLines) {
        const txt = String(line.text || '').trim();
        if (PROMO_OR_DISCLAIMER_RE.test(txt)) continue;
        if (NON_NET_QTY_DECLARATIONS_RE.test(txt)) continue;
        if (MEASURE_VAL_RE.test(txt)) {
          bestCluster = {
            panelKey,
            panelLines,
            anchor: line,
            declarationLines: [line],
          };
          break;
        }
      }
      if (bestCluster) break;
    }
  }

  return bestCluster;
}

/**
 * Extracts structured multi-piece facts from the Net Quantity cluster lines.
 */
function extractMultiPieceFacts(clusterLines) {
  if (!clusterLines || clusterLines.length === 0) {
    return {
      totalValue: null,
      totalUnit: null,
      pieceCount: null,
      pieces: [],
      rawText: '',
      numeralHeightPx: null,
    };
  }

  const rawText = clusterLines.map((l) => l.text).join('\n');
  let pieceCount = null;
  let totalValue = null;
  let totalUnit = null;
  const pieces = [];

  for (const line of clusterLines) {
    const txt = String(line.text || '');

    // Check for multiplier / breakdown (e.g. "(2 Numbers x 45 ml)", "3 x 100 g")
    const mMatch = txt.match(MULTIPLIER_RE);
    if (mMatch) {
      if (mMatch[1] && mMatch[2]) {
        const count = parseInt(mMatch[1], 10);
        const eachVal = parseFloat(mMatch[2]);
        const unit = (mMatch[3] || 'ml').toLowerCase();
        pieceCount = count;
        pieces.push({ count, value: eachVal, unit, rawText: mMatch[0] });
        if (!totalValue) {
          totalValue = +(count * eachVal).toFixed(2);
          totalUnit = unit;
        }
      } else if (mMatch[4]) {
        pieceCount = parseInt(mMatch[4], 10);
      }
    }

    // Check count unit (e.g. "3 Pieces", "2 Numbers", "3 N")
    const cMatch = txt.match(COUNT_UNIT_RE);
    if (cMatch && !pieceCount) {
      pieceCount = parseInt(cMatch[1], 10);
    }

    // Check direct measure values (e.g. "90 ml", "500 g")
    const valMatch = txt.match(MEASURE_VAL_RE);
    if (valMatch) {
      const v = parseFloat(valMatch[1]);
      const u = valMatch[2].toLowerCase();
      const isCountUnit = ['n', 'u', 'unit', 'units', 'piece', 'pieces', 'nos'].includes(u);
      if (isCountUnit) {
        if (!pieceCount) pieceCount = v;
      } else {
        if (!totalValue || v >= totalValue) {
          totalValue = v;
          totalUnit = u;
        }
      }
    }
  }

  if (pieces.length > 0 && pieceCount && pieces[0].value) {
    const expectedTotal = +(pieces[0].count * pieces[0].value).toFixed(2);
    if (totalValue == null || totalValue === pieces[0].value) {
      totalValue = expectedTotal;
      totalUnit = pieces[0].unit || totalUnit;
    }
  }

  // Measure representative numeral height
  const heights = clusterLines.map((l) => l.heightPx).filter((h) => h != null && h > 0);
  const numeralHeightPx = heights.length > 0 ? Math.max(...heights) : null;

  return {
    totalValue,
    totalUnit,
    pieceCount,
    pieces,
    rawText,
    numeralHeightPx,
  };
}

/**
 * Main function: analyzes the Net Quantity declaration, creates the complete
 * enclosing box, computes Rule 8(1) clear space, and checks for external text intrusions.
 */
function analyzeNetQuantityWithClearance(ocrResult) {
  const allLines = ocrResult?.lines || [];
  if (allLines.length === 0) {
    return {
      clusterFound: false,
      netQuantityBox: null,
      exclusionBox: null,
      clearanceOk: true,
      overlappingTexts: [],
      declarationLines: [],
      multiPieceFacts: { totalValue: null, totalUnit: null, pieceCount: null, pieces: [], rawText: '' },
      numeralHeightPx: null,
      primaryQtyLine: null,
    };
  }

  const cluster = identifyNetQuantityCluster(allLines);
  if (!cluster) {
    return {
      clusterFound: false,
      netQuantityBox: null,
      exclusionBox: null,
      clearanceOk: true,
      overlappingTexts: [],
      declarationLines: [],
      multiPieceFacts: { totalValue: null, totalUnit: null, pieceCount: null, pieces: [], rawText: '' },
      numeralHeightPx: null,
      primaryQtyLine: null,
    };
  }

  const { panelLines, declarationLines, anchor } = cluster;
  const multiPieceFacts = extractMultiPieceFacts(declarationLines);

  // 1. Build composite box enclosing ALL declaration lines
  const allPts = declarationLines.flatMap((l) => l.bbox || []);
  const netQuantityBox = getAABB(allPts);
  if (!netQuantityBox) {
    return {
      clusterFound: true,
      netQuantityBox: null,
      exclusionBox: null,
      clearanceOk: true,
      overlappingTexts: [],
      declarationLines,
      multiPieceFacts,
      numeralHeightPx: null,
      primaryQtyLine: anchor,
    };
  }

  // 2. Determine effective numeral height (h)
  const h = multiPieceFacts.numeralHeightPx || (netQuantityBox.y2 - netQuantityBox.y1) || 15;

  // 3. Rule 8(1) statutory exclusion boundaries:
  //    Above & below: >= 1x numeral height
  //    Left & right:  >= 2x numeral height
  const exX1 = netQuantityBox.x1 - 2.0 * h;
  const exX2 = netQuantityBox.x2 + 2.0 * h;
  const exY1 = netQuantityBox.y1 - 1.0 * h;
  const exY2 = netQuantityBox.y2 + 1.0 * h;

  const exclusionBox = {
    x1: Math.round(exX1),
    y1: Math.round(exY1),
    x2: Math.round(exX2),
    y2: Math.round(exY2),
    numeralHeightPx: Math.round(h),
  };

  // 4. Clearance check: STRICTLY on the SAME panel, excluding all Net Quantity lines & values
  const declarationLineIds = new Set(declarationLines.map((l) => l.id));
  const declarationTexts = new Set(declarationLines.map((l) => String(l.text || '').trim().toLowerCase()));

  const overlappingTexts = [];
  const overlappingDetails = [];

  for (const line of panelLines) {
    if (declarationLineIds.has(line.id)) continue;
    const txt = String(line.text || '').trim();
    if (!txt || declarationTexts.has(txt.toLowerCase())) continue;
    // Statutory Rule 8(1) proviso applies to other printed information (ignore single stray OCR noise punctuation/chars)
    if (!/[a-zA-Z0-9]{2,}/.test(txt)) continue;

    const lBox = getAABB(line.bbox);
    if (!lBox) continue;

    // AABB intersection with the Rule 8(1) exclusion margin
    const intersectX = Math.max(0, Math.min(exX2, lBox.x2) - Math.max(exX1, lBox.x1));
    const intersectY = Math.max(0, Math.min(exY2, lBox.y2) - Math.max(exY1, lBox.y1));

    if (intersectX > 4 && intersectY > 4) {
      overlappingTexts.push(txt);

      // Determine relative intrusion position and actual distance
      let position = 'surrounding';
      let actualDistancePx = 0;
      let requiredDistancePx = 1.0 * h;

      if (lBox.y2 <= netQuantityBox.y1 + 4) {
        position = 'above';
        actualDistancePx = Math.max(0, netQuantityBox.y1 - lBox.y2);
        requiredDistancePx = 1.0 * h;
      } else if (lBox.y1 >= netQuantityBox.y2 - 4) {
        position = 'below';
        actualDistancePx = Math.max(0, lBox.y1 - netQuantityBox.y2);
        requiredDistancePx = 1.0 * h;
      } else if (lBox.x2 <= netQuantityBox.x1 + 4) {
        position = 'to the left of';
        actualDistancePx = Math.max(0, netQuantityBox.x1 - lBox.x2);
        requiredDistancePx = 2.0 * h;
      } else if (lBox.x1 >= netQuantityBox.x2 - 4) {
        position = 'to the right of';
        actualDistancePx = Math.max(0, lBox.x1 - netQuantityBox.x2);
        requiredDistancePx = 2.0 * h;
      } else {
        position = 'overlapping';
        actualDistancePx = 0;
        requiredDistancePx = 1.0 * h;
      }

      const deficitPx = Math.max(0, requiredDistancePx - actualDistancePx);
      const overlapPx = Math.round(Math.min(intersectX, intersectY));

      overlappingDetails.push({
        text: txt,
        position,
        actualDistancePx: Math.round(actualDistancePx),
        requiredDistancePx: Math.round(requiredDistancePx),
        deficitPx: Math.round(deficitPx),
        overlapPx,
        bbox: lBox,
      });
    }
  }

  const clearanceOk = overlappingTexts.length === 0;

  // Select the primary representative line for downstream height calculations
  const primaryLine = declarationLines.find((l) => MEASURE_VAL_RE.test(l.text) || MULTIPLIER_RE.test(l.text)) || anchor;

  return {
    clusterFound: true,
    panelIndex: cluster.panelKey,
    netQuantityBox,
    exclusionBox,
    clearanceOk,
    overlappingTexts,
    overlappingDetails,
    declarationLines,
    multiPieceFacts,
    numeralHeightPx: h,
    primaryQtyLine: primaryLine,
  };
}

module.exports = {
  analyzeNetQuantityWithClearance,
  identifyNetQuantityCluster,
  extractMultiPieceFacts,
  parseQuantityPiece,
};
