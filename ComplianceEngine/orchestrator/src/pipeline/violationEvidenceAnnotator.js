/**
 * violationEvidenceAnnotator.js
 *
 * Generates photographic bounding-box evidence images for EVERY violation
 * detected by the Legal Metrology compliance rule engine.
 *
 * Capabilities:
 *  1. Net Quantity Spatial Clearance (Rule 8(1) proviso): green measurement box,
 *     clearance boundary, and red highlighted intrusion boxes with deficit measurements.
 *  2. Net Quantity Numeral Height / Unit Symbols (Rule 7, Rule 13(5)(ii)):
 *     bounding box around declaration line highlighting non-compliant symbol / size.
 *  3. Maximum Retail Price (Rule 6(1)(f)):
 *     bounding box highlighting price line, missing inclusive of taxes, or MRP defect.
 *  4. Month & Year of Manufacture (Rule 6(1)(d)):
 *     bounding box highlighting date declaration or statutory missing date frame.
 *  5. Manufacturer / Packer / Importer (Rule 6(1)(a)):
 *     bounding box highlighting name/incomplete address, or missing declaration frame.
 *  6. Consumer Care / Grievance (Rule 6(1)(h)):
 *     bounding box on contact line or missing contact frame.
 *  7. Label Contrast (Rule 9(1)(b)):
 *     bounding box around low-contrast text with measured ratio vs required threshold.
 *  8. Any other statutory violation:
 *     scans OCR lines for candidate text, draws high-visibility red bounding box with
 *     statutory rule banner and violation pill.
 */
'use strict';

const fs = require('fs');
const path = require('path');
const logger = require('../utils/logger');

let sharp = null;
try {
  sharp = require('sharp');
} catch (err) {
  logger.warn('violationEvidenceAnnotator', `Sharp not loaded: ${err.message}`);
}

function escapeXml(str) {
  return String(str || '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

function normalizeBbox(b) {
  if (!b) return null;
  if (Array.isArray(b) && b.length > 0 && Array.isArray(b[0])) {
    const xs = b.map((p) => p[0]);
    const ys = b.map((p) => p[1]);
    return {
      x1: Math.min(...xs),
      y1: Math.min(...ys),
      x2: Math.max(...xs),
      y2: Math.max(...ys),
    };
  }
  if (typeof b.x1 === 'number' && typeof b.y1 === 'number') {
    return { x1: b.x1, y1: b.y1, x2: b.x2, y2: b.y2 };
  }
  return null;
}

function mergeBboxes(boxes) {
  const valid = boxes.map(normalizeBbox).filter(Boolean);
  if (valid.length === 0) return null;
  return {
    x1: Math.min(...valid.map((b) => b.x1)),
    y1: Math.min(...valid.map((b) => b.y1)),
    x2: Math.max(...valid.map((b) => b.x2)),
    y2: Math.max(...valid.map((b) => b.y2)),
  };
}

/**
 * Locate relevant OCR lines and panel index for a given violation.
 */
function findViolationTarget(violation, ocrResult, declarations, labelMetrics) {
  const field = (violation.field || '').toLowerCase();
  const rule = (violation.rule || '').toLowerCase();
  const msg = (violation.message || '').toLowerCase();

  const lines = ocrResult?.lines || [];

  // Case 1: Net Quantity
  if (field === 'netquantity' || rule.includes('8(1)') || rule.includes('rule 7') || rule.includes('13(5)')) {
    const pIdx = labelMetrics?.panelIndex != null ? labelMetrics.panelIndex : 0;
    if (labelMetrics?.netQuantityBox) {
      return {
        panelIndex: pIdx,
        bbox: labelMetrics.netQuantityBox,
        exclusionBox: labelMetrics.exclusionBox,
        intrusions: labelMetrics.clearanceDetails?.intrusions || [],
        targetText: declarations?.netQuantity?.rawText || 'Net Quantity',
        isClearance: rule.includes('8(1)'),
      };
    }
    // Search lines for Net Quantity
    const nqLines = lines.filter((l) =>
      /\bnet\s*(?:quantity|qty|wt|weight)\b|\b\d+(?:\.\d+)?\s*(?:unit|units|n\b|u\b|g|kg|ml|l)\b/i.test(l.text)
    );
    if (nqLines.length > 0) {
      const best = nqLines[0];
      const merged = mergeBboxes(nqLines.slice(0, 3).map((l) => l.bbox));
      return {
        panelIndex: best.imageIndex ?? 0,
        bbox: merged || normalizeBbox(best.bbox),
        targetText: best.text,
      };
    }
  }

  // Case 2: MRP
  if (field === 'mrp' || rule.includes('6(1)(f)') || rule.includes('mrp')) {
    const mrpLines = lines.filter((l) =>
      /\bm\.?r\.?p\.?\b|maximum\s+retail\s+price|₹|rs\.?\b|incl.*tax/i.test(l.text)
    );
    if (mrpLines.length > 0) {
      const best = mrpLines[0];
      const merged = mergeBboxes(mrpLines.slice(0, 3).map((l) => l.bbox));
      return {
        panelIndex: best.imageIndex ?? 0,
        bbox: merged || normalizeBbox(best.bbox),
        targetText: mrpLines.map((l) => l.text).join(' '),
      };
    }
  }

  // Case 3: Manufacturing Date
  if (field === 'mfgdate' || rule.includes('6(1)(d)') || rule.includes('date')) {
    const dateLines = lines.filter((l) =>
      /\b(?:mfd|mfg|pkd|packed|manufactur|date\s+of)\b|\b(?:0?[1-9]|1[0-2])\s*[-/.]\s*(?:\d{2}|\d{4})\b/i.test(l.text)
    );
    if (dateLines.length > 0) {
      const best = dateLines[0];
      const merged = mergeBboxes(dateLines.slice(0, 2).map((l) => l.bbox));
      return {
        panelIndex: best.imageIndex ?? 0,
        bbox: merged || normalizeBbox(best.bbox),
        targetText: dateLines.map((l) => l.text).join(' '),
      };
    }
    // If date is completely missing, return panel 0 with missing indicator
    return {
      panelIndex: 0,
      bbox: null,
      isMissing: true,
      targetText: 'Statutory Month & Year of Manufacture',
    };
  }

  // Case 4: Manufacturer / Packer / Importer
  if (field === 'manufacturer' || field === 'packer' || field === 'importer' || rule.includes('6(1)(a)') || rule.includes('6(1)(c)')) {
    const mfrName = declarations?.manufacturer?.name || declarations?.packer?.name || '';
    const mfrLines = lines.filter((l) =>
      /\b(?:mfd\.?\s*by|manufactured\s+by|packed\s+by|imported\s+by|marketed\s+by|consumer\s+products)\b/i.test(l.text) ||
      (mfrName && l.text.toLowerCase().includes(mfrName.slice(0, 15).toLowerCase()))
    );
    if (mfrLines.length > 0) {
      const best = mfrLines[0];
      const merged = mergeBboxes(mfrLines.slice(0, 4).map((l) => l.bbox));
      return {
        panelIndex: best.imageIndex ?? 0,
        bbox: merged || normalizeBbox(best.bbox),
        targetText: mfrLines.map((l) => l.text).slice(0, 2).join(' '),
      };
    }
    return {
      panelIndex: 0,
      bbox: null,
      isMissing: !declarations?.manufacturer?.present,
      targetText: 'Manufacturer / Packer Declaration',
    };
  }

  // Case 5: Consumer Care
  if (field === 'consumercare' || rule.includes('6(1)(h)')) {
    const careLines = lines.filter((l) =>
      /customer\s*care|consumer|helpline|toll[\s-]?free|feedback|@[\w.-]+\.[a-z]{2,}|\b1800[- ]?\d{3}/i.test(l.text)
    );
    if (careLines.length > 0) {
      const best = careLines[0];
      const merged = mergeBboxes(careLines.slice(0, 3).map((l) => l.bbox));
      return {
        panelIndex: best.imageIndex ?? 0,
        bbox: merged || normalizeBbox(best.bbox),
        targetText: careLines.map((l) => l.text).join(' '),
      };
    }
    return {
      panelIndex: 0,
      bbox: null,
      isMissing: true,
      targetText: 'Consumer Care Contact Information',
    };
  }

  // Case 6: Contrast (Rule 9(1)(b))
  if (field === 'contrast' || rule.includes('9(1)(b)')) {
    const contrastFailedLines = lines.filter((l) => l.contrast && l.contrast.contrast_ok === false);
    if (contrastFailedLines.length > 0) {
      const best = contrastFailedLines[0];
      return {
        panelIndex: best.imageIndex ?? 0,
        bbox: normalizeBbox(best.bbox),
        targetText: best.text,
      };
    }
    for (const l of lines) {
      if (l.text.length > 4 && msg.includes(l.text.slice(0, 10).toLowerCase())) {
        return {
          panelIndex: l.imageIndex ?? 0,
          bbox: normalizeBbox(l.bbox),
          targetText: l.text,
        };
      }
    }
  }

  // Case 7: Commodity Name
  if (field === 'commodityname' || rule.includes('6(1)(b)')) {
    const genLines = lines.filter((l) =>
      /generic\s*name|item\s*name|product\s*name/i.test(l.text)
    );
    if (genLines.length > 0) {
      const best = genLines[0];
      return {
        panelIndex: best.imageIndex ?? 0,
        bbox: normalizeBbox(best.bbox),
        targetText: best.text,
      };
    }
  }

  // General Fallback: find any line containing keywords
  const keywords = (field || 'declaration').split(/[\s_-]+/);
  for (const kw of keywords) {
    if (kw.length > 3) {
      const match = lines.find((l) => l.text.toLowerCase().includes(kw));
      if (match) {
        return {
          panelIndex: match.imageIndex ?? 0,
          bbox: normalizeBbox(match.bbox),
          targetText: match.text,
        };
      }
    }
  }

  return {
    panelIndex: 0,
    bbox: null,
    isMissing: true,
    targetText: field || 'Statutory Requirement',
  };
}

/**
 * Annotate a single violation onto the appropriate panel image.
 */
async function annotateSingleViolation({
  violation,
  findingIndex,
  findingId,
  target,
  preprocessedImages,
  productDir,
}) {
  if (!sharp) return null;

  const pIdx = target.panelIndex != null && target.panelIndex < preprocessedImages.length
    ? target.panelIndex
    : 0;
  const sourceImage = preprocessedImages[pIdx] || preprocessedImages[0];

  if (!sourceImage || !fs.existsSync(sourceImage)) {
    logger.warn('violationEvidenceAnnotator', `Source image missing: ${sourceImage}`);
    return null;
  }

  const outFileName = `violation_evidence_${findingIndex + 1}.png`;
  const outputPath = path.join(productDir, outFileName);

  try {
    const metadata = await sharp(sourceImage).metadata();
    const imgW = metadata.width || 1200;
    const imgH = metadata.height || 1600;

    const isCritical = (violation.severity || '').toLowerCase() === 'critical';
    const isMajor = (violation.severity || '').toLowerCase() === 'major';
    const bannerColor = isCritical ? '#DC2626' : isMajor ? '#B91C1C' : '#D97706';
    const severityLabel = (violation.severity || 'MAJOR').toUpperCase();

    const bannerTitle = `EXHIBIT ${findingIndex + 1}: ${violation.rule} — ${severityLabel} INFRACTION`;
    const bannerSubtitle = `${violation.message || ''}`.slice(0, 115);

    let visualElements = '';

    if (target.isClearance && target.bbox && target.exclusionBox) {
      // -------------------------------------------------------------
      // Rule 8(1) Clearance Composite Exhibit
      // -------------------------------------------------------------
      const nq = target.bbox;
      const ex = target.exclusionBox;

      const nqX1 = Math.max(0, Math.min(imgW - 10, nq.x1));
      const nqY1 = Math.max(0, Math.min(imgH - 10, nq.y1));
      const nqX2 = Math.max(nqX1 + 10, Math.min(imgW, nq.x2));
      const nqY2 = Math.max(nqY1 + 10, Math.min(imgH, nq.y2));

      const exX1 = Math.max(0, Math.min(imgW - 10, ex.x1));
      const exY1 = Math.max(0, Math.min(imgH - 10, ex.y1));
      const exX2 = Math.max(exX1 + 10, Math.min(imgW, ex.x2));
      const exY2 = Math.max(exY1 + 10, Math.min(imgH, ex.y2));

      const intrusionElements = (target.intrusions || []).map((intr) => {
        const ib = normalizeBbox(intr.bbox);
        if (!ib) return '';
        const ix1 = Math.max(0, Math.min(imgW - 5, ib.x1));
        const iy1 = Math.max(0, Math.min(imgH - 5, ib.y1));
        const iw = Math.max(10, Math.min(imgW - ix1, ib.x2 - ib.x1));
        const ih = Math.max(10, Math.min(imgH - iy1, ib.y2 - ib.y1));
        const txt = escapeXml(String(intr.text || 'Intruding Printed Text').slice(0, 35));
        const defStr = intr.deficitMm ? `${intr.deficitMm}mm deficit` : 'unlawful overlap';
        const pillY = Math.max(60, iy1 - 20);

        return `
          <rect x="${ix1}" y="${iy1}" width="${iw}" height="${ih}" fill="rgba(220, 38, 38, 0.28)" stroke="#DC2626" stroke-width="3" rx="3" />
          <rect x="${ix1}" y="${pillY}" width="${Math.min(320, iw + 70)}" height="18" fill="#DC2626" rx="3" />
          <text x="${ix1 + 6}" y="${pillY + 13}" font-family="Arial, sans-serif" font-size="11" font-weight="bold" fill="#FFFFFF">
            INTRUSION: "${txt}" (${defStr})
          </text>
        `;
      }).join('\n');

      visualElements = `
        <!-- Spatial Clearance Exclusion Zone (Rule 8(1) proviso) -->
        <rect x="${exX1}" y="${exY1}" width="${exX2 - exX1}" height="${exY2 - exY1}"
              fill="rgba(220, 38, 38, 0.12)" stroke="#DC2626" stroke-width="3" stroke-dasharray="8,5" rx="6" />
        <rect x="${exX1}" y="${Math.max(55, exY1 - 22)}" width="${Math.min(exX2 - exX1, 380)}" height="20" fill="#DC2626" rx="3" />
        <text x="${exX1 + 8}" y="${Math.max(55, exY1 - 22) + 14}" font-family="Arial, sans-serif" font-size="10" font-weight="bold" fill="#FFFFFF">
          Rule 8(1) Required Clear Space (NON-COMPLIANT INTRUSION)
        </text>

        <!-- Net Quantity Declaration Box -->
        <rect x="${nqX1}" y="${nqY1}" width="${nqX2 - nqX1}" height="${nqY2 - nqY1}"
              fill="none" stroke="#22C55E" stroke-width="4" rx="4" />
        <rect x="${nqX1}" y="${Math.max(55, nqY1 - 22)}" width="${Math.max(nqX2 - nqX1, 140)}" height="20" fill="#22C55E" rx="3" />
        <text x="${nqX1 + 6}" y="${Math.max(55, nqY1 - 22) + 14}" font-family="Arial, sans-serif" font-size="11" font-weight="bold" fill="#000000">
          NET QUANTITY DECLARATION
        </text>

        ${intrusionElements}
      `;
    } else if (target.bbox) {
      // -------------------------------------------------------------
      // Specific Text Bounding Box Infraction
      // -------------------------------------------------------------
      const b = target.bbox;
      const pad = 10;
      const x1 = Math.max(0, b.x1 - pad);
      const y1 = Math.max(0, b.y1 - pad);
      const x2 = Math.min(imgW, b.x2 + pad);
      const y2 = Math.min(imgH, b.y2 + pad);
      const w = Math.max(20, x2 - x1);
      const h = Math.max(20, y2 - y1);

      const pillW = Math.min(imgW - x1 - 10, Math.max(240, w + 30));
      const pillY = y1 >= 28 ? y1 - 24 : y2 + 6;
      const pillText = `NON-COMPLIANCE: ${violation.rule}`;

      visualElements = `
        <!-- High visibility red bounding box with translucent tint -->
        <rect x="${x1}" y="${y1}" width="${w}" height="${h}"
              fill="rgba(220, 38, 38, 0.22)" stroke="#DC2626" stroke-width="5" rx="4" />

        <!-- Corner brackets for professional statutory evidence style -->
        <path d="M ${x1} ${y1 + 18} L ${x1} ${y1} L ${x1 + 18} ${y1}" fill="none" stroke="#FFFFFF" stroke-width="3" />
        <path d="M ${x2 - 18} ${y1} L ${x2} ${y1} L ${x2} ${y1 + 18}" fill="none" stroke="#FFFFFF" stroke-width="3" />
        <path d="M ${x1} ${y2 - 18} L ${x1} ${y2} L ${x1 + 18} ${y2}" fill="none" stroke="#FFFFFF" stroke-width="3" />
        <path d="M ${x2 - 18} ${y2} L ${x2} ${y2} L ${x2} ${y2 - 18}" fill="none" stroke="#FFFFFF" stroke-width="3" />

        <!-- Violation Pill Badge -->
        <rect x="${x1}" y="${pillY}" width="${pillW}" height="22" fill="#DC2626" rx="3" stroke="#FFFFFF" stroke-width="1" />
        <text x="${x1 + 8}" y="${pillY + 15}" font-family="Arial, sans-serif" font-size="11" font-weight="bold" fill="#FFFFFF">
          ${escapeXml(pillText)}
        </text>
      `;
    } else {
      // -------------------------------------------------------------
      // Missing Mandatory Declaration (Label-Wide Frame)
      // -------------------------------------------------------------
      const frameX = Math.round(imgW * 0.08);
      const frameY = Math.round(imgH * 0.12);
      const frameW = Math.round(imgW * 0.84);
      const frameH = Math.round(imgH * 0.76);

      const stampW = Math.min(frameW - 40, 560);
      const stampH = 74;
      const stampX = Math.round((imgW - stampW) / 2);
      const stampY = Math.round((imgH - stampH) / 2);

      visualElements = `
        <!-- Scanned Label Verification Boundary -->
        <rect x="${frameX}" y="${frameY}" width="${frameW}" height="${frameH}"
              fill="rgba(220, 38, 38, 0.06)" stroke="#DC2626" stroke-width="4" stroke-dasharray="14,8" rx="8" />

        <!-- Mandatory Declaration Absent Watermark Stamp -->
        <rect x="${stampX}" y="${stampY}" width="${stampW}" height="${stampH}"
              fill="#DC2626" rx="6" stroke="#FFFFFF" stroke-width="2" />
        <text x="${stampX + stampW / 2}" y="${stampY + 28}" font-family="Arial, sans-serif" font-size="15" font-weight="bold" fill="#FFFFFF" text-anchor="middle">
          MANDATORY DECLARATION ABSENT FROM SCANNED LABEL
        </text>
        <text x="${stampX + stampW / 2}" y="${stampY + 52}" font-family="Arial, sans-serif" font-size="12" font-weight="normal" fill="#FEE2E2" text-anchor="middle">
          ${escapeXml(violation.rule)} — ${escapeXml(target.targetText || 'Required Field')} Not Detected
        </text>
      `;
    }

    const bannerW = Math.min(imgW - 40, 880);
    const svgOverlay = `
      <svg width="${imgW}" height="${imgH}" xmlns="http://www.w3.org/2000/svg">
        <!-- Statutory Assessment Header Banner -->
        <rect x="20" y="16" width="${bannerW}" height="56" fill="${bannerColor}" rx="6" stroke="#FFFFFF" stroke-width="1.5" />
        <text x="36" y="38" font-family="Arial, sans-serif" font-size="15" font-weight="bold" fill="#FFFFFF">
          ${escapeXml(bannerTitle)}
        </text>
        <text x="36" y="58" font-family="Arial, sans-serif" font-size="11" fill="#FEF3C7">
          ${escapeXml(bannerSubtitle)}
        </text>

        ${visualElements}
      </svg>
    `;

    await sharp(sourceImage)
      .composite([{ input: Buffer.from(svgOverlay), top: 0, left: 0 }])
      .png()
      .toFile(outputPath);

    logger.info('violationEvidenceAnnotator', `Generated bounding-boxed evidence for Finding ${findingIndex + 1} (${violation.rule}): ${outputPath}`);
    return {
      findingId,
      findingIndex: findingIndex + 1,
      rule: violation.rule,
      field: violation.field,
      severity: violation.severity,
      message: violation.message,
      panelIndex: pIdx,
      evidenceImage: outFileName,
      annotatedImagePath: outputPath,
      sourcePanelImage: path.basename(sourceImage),
      bbox: target.bbox || null,
    };
  } catch (err) {
    logger.error('violationEvidenceAnnotator', `Failed to generate annotated evidence for ${violation.rule}: ${err.message}`);
    return null;
  }
}

/**
 * Main function: generate bounding-box evidence images for all violations.
 */
async function generateAllViolationEvidences({
  violations = [],
  declarations = {},
  ocrResult = {},
  labelMetrics = {},
  preprocessedImages = [],
  productDir,
  productId = '1',
}) {
  if (!violations || violations.length === 0) {
    return [];
  }

  const results = [];

  for (let idx = 0; idx < violations.length; idx++) {
    const v = violations[idx];
    const findingId = `FIND-${productId}-${String(idx + 1).padStart(3, '0')}`;
    const target = findViolationTarget(v, ocrResult, declarations, labelMetrics);

    const evidence = await annotateSingleViolation({
      violation: v,
      findingIndex: idx,
      findingId,
      target,
      preprocessedImages,
      productDir,
    });

    if (evidence) {
      v.findingId = findingId;
      v.evidenceImage = evidence.evidenceImage;
      v.annotatedImagePath = evidence.annotatedImagePath;
      v.panelIndex = evidence.panelIndex;
      v.bbox = evidence.bbox;
      results.push(evidence);
    }
  }

  return results;
}

module.exports = {
  generateAllViolationEvidences,
  findViolationTarget,
  annotateSingleViolation,
};
