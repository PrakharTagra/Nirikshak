/**
 * netQuantityImageAnnotator.js
 *
 * Annotates the packaging panel image where the Net Quantity declaration is located:
 * 1. Draws a bold GREEN bounding box around the complete Net Quantity declaration.
 * 2. Draws a GREEN dashed bounding box around the Rule 8(1) spatial requirements zone
 *    (clear above/below by >= 1x numeral height, left/right by >= 2x numeral height).
 * 3. Highlights any other printed text lines falling inside the required spatial clearance
 *    boundary with a distinct RED border and deficit measurement.
 * 4. Displays a clear status banner indicating Rule 8(1) compliance status.
 *
 * Saves the annotated image to:
 *   ComplianceEngine/output/product_<n>/net_quantity_bounding_box.png
 */
'use strict';

const fs = require('fs');
const path = require('path');
const logger = require('../utils/logger');

let sharp = null;
try {
  sharp = require('sharp');
} catch (err) {
  logger.warn('netQuantityImageAnnotator', `Sharp not loaded: ${err.message}`);
}

function escapeXml(str) {
  return String(str || '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;');
}

async function annotateNetQuantityImage({
  imagePath,
  outputPath,
  netQuantityBox,
  exclusionBox,
  intrusions = [],
  numeralHeightPx = 20,
  numeralHeightMm = null,
}) {
  if (!imagePath || !fs.existsSync(imagePath)) {
    logger.warn('netQuantityImageAnnotator', `Source image not found for annotation: ${imagePath}`);
    return null;
  }

  if (!netQuantityBox) {
    logger.info('netQuantityImageAnnotator', 'No net quantity bounding box available to annotate.');
    return null;
  }

  if (!sharp) {
    logger.warn('netQuantityImageAnnotator', 'Sharp library unavailable, skipping image annotation.');
    return null;
  }

  try {
    const metadata = await sharp(imagePath).metadata();
    const imgW = metadata.width || 1200;
    const imgH = metadata.height || 1600;

    // 1. Clamp Net Quantity Box coordinates
    const nqX1 = Math.max(0, Math.min(imgW - 10, netQuantityBox.x1));
    const nqY1 = Math.max(0, Math.min(imgH - 10, netQuantityBox.y1));
    const nqX2 = Math.max(nqX1 + 10, Math.min(imgW, netQuantityBox.x2));
    const nqY2 = Math.max(nqY1 + 10, Math.min(imgH, netQuantityBox.y2));
    const nqW = nqX2 - nqX1;
    const nqH = nqY2 - nqY1;

    // 2. Clamp Exclusion Box coordinates
    const exBox = exclusionBox || {
      x1: nqX1 - 2 * numeralHeightPx,
      y1: nqY1 - 1 * numeralHeightPx,
      x2: nqX2 + 2 * numeralHeightPx,
      y2: nqY2 + 1 * numeralHeightPx,
    };
    const exX1 = Math.max(0, Math.min(imgW - 10, exBox.x1));
    const exY1 = Math.max(0, Math.min(imgH - 10, exBox.y1));
    const exX2 = Math.max(exX1 + 10, Math.min(imgW, exBox.x2));
    const exY2 = Math.max(exY1 + 10, Math.min(imgH, exBox.y2));
    const exW = exX2 - exX1;
    const exH = exY2 - exY1;

    const hasIntrusions = intrusions.length > 0;
    const statusColor = hasIntrusions ? '#DC2626' : '#16A34A';
    const statusText = hasIntrusions
      ? `✗ Rule 8(1) Proviso: NON-COMPLIANT (${intrusions.length} intruding line(s) in clear space)`
      : '✓ Rule 8(1) Proviso: COMPLIANT (Surrounding area is free of other printed information)';

    const hPxStr = `${Math.round(numeralHeightPx)}px`;
    const hMmStr = numeralHeightMm ? `${numeralHeightMm}mm` : hPxStr;
    const clearSpaceLabel = `Rule 8(1) Spatial Clear Space (≥${hMmStr} top/bottom, ≥${numeralHeightMm ? +(2 * numeralHeightMm).toFixed(1) + 'mm' : 2 * Math.round(numeralHeightPx) + 'px'} sides)`;

    // 3. Build Intrusion SVG elements
    const intrusionSvgElements = intrusions
      .map((item) => {
        if (!item.bbox) return '';
        let b = item.bbox;
        if (Array.isArray(b) && b.length > 0 && Array.isArray(b[0])) {
          const xs = b.map((p) => p[0]);
          const ys = b.map((p) => p[1]);
          b = { x1: Math.min(...xs), y1: Math.min(...ys), x2: Math.max(...xs), y2: Math.max(...ys) };
        }
        const ix1 = Math.max(0, Math.min(imgW - 5, b.x1));
        const iy1 = Math.max(0, Math.min(imgH - 5, b.y1));
        const ix2 = Math.max(ix1 + 5, Math.min(imgW, b.x2));
        const iy2 = Math.max(iy1 + 5, Math.min(imgH, b.y2));
        const iw = ix2 - ix1;
        const ih = iy2 - iy1;

        const pillY = Math.max(5, iy1 - 20);
        const itemTxt = escapeXml(String(item.text || 'Printed Info').slice(0, 35));
        const deficitStr = item.deficitMm ? `${item.deficitMm}mm deficit` : item.deficitPx ? `${item.deficitPx}px deficit` : 'overlaps';

        return `
          <!-- Intruding text boundary -->
          <rect x="${ix1}" y="${iy1}" width="${iw}" height="${ih}"
                fill="rgba(239, 68, 68, 0.28)" stroke="#EF4444" stroke-width="3" rx="3" />
          <rect x="${ix1}" y="${pillY}" width="${Math.min(320, iw + 80)}" height="18" fill="#DC2626" rx="3" />
          <text x="${ix1 + 6}" y="${pillY + 14}" font-family="Arial, sans-serif" font-size="12" font-weight="bold" fill="#FFFFFF">
            INTRUSION: "${itemTxt}" (${deficitStr})
          </text>
        `;
      })
      .join('\n');

    // 4. Construct SVG overlay
    const svgOverlay = `
    <svg width="${imgW}" height="${imgH}" xmlns="http://www.w3.org/2000/svg">
      <!-- Status Banner in top-left corner -->
      <rect x="20" y="20" width="${Math.min(imgW - 40, 780)}" height="44" fill="${statusColor}" rx="6" />
      <text x="36" y="48" font-family="Arial, sans-serif" font-size="17" font-weight="bold" fill="#FFFFFF">
        ${escapeXml(statusText)}
      </text>

      <!-- Spatial Clearance Exclusion Zone (Rule 8(1) proviso) -->
      <rect x="${exX1}" y="${exY1}" width="${exW}" height="${exH}"
            fill="rgba(34, 197, 94, 0.12)" stroke="#22C55E" stroke-width="4" stroke-dasharray="12,6" rx="8" />

      <!-- Spatial Clearance Label Pill -->
      <rect x="${exX1}" y="${Math.max(5, exY1 - 28)}" width="${Math.min(exW, 490)}" height="26" fill="#15803D" rx="4" />
      <text x="${exX1 + 10}" y="${Math.max(5, exY1 - 28) + 18}" font-family="Arial, sans-serif" font-size="14" font-weight="bold" fill="#FFFFFF">
        ${escapeXml(clearSpaceLabel)}
      </text>

      <!-- Bold Solid Green Bounding Box around Net Quantity Declaration -->
      <rect x="${nqX1}" y="${nqY1}" width="${nqW}" height="${nqH}"
            fill="none" stroke="#00FF00" stroke-width="5" rx="5" />

      <!-- Net Quantity Header Pill -->
      <rect x="${nqX1}" y="${Math.max(5, nqY1 - 28)}" width="240" height="26" fill="#00FF00" rx="4" />
      <text x="${nqX1 + 10}" y="${Math.max(5, nqY1 - 28) + 18}" font-family="Arial, sans-serif" font-size="15" font-weight="bold" fill="#000000">
        NET QUANTITY DECLARATION
      </text>

      ${intrusionSvgElements}
    </svg>
    `;

    await sharp(imagePath)
      .composite([{ input: Buffer.from(svgOverlay), top: 0, left: 0 }])
      .png()
      .toFile(outputPath);

    logger.info('netQuantityImageAnnotator', `Successfully generated annotated green bounding box image: ${outputPath}`);
    return outputPath;
  } catch (err) {
    logger.error('netQuantityImageAnnotator', `Failed to generate annotated net quantity image: ${err.message}`);
    return null;
  }
}

module.exports = {
  annotateNetQuantityImage,
};
