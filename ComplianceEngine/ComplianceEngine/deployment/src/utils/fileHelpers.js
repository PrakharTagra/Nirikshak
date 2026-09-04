/**
 * utils/fileHelpers.js
 * Filesystem helpers + a tiny dependency-free PNG/JPEG dimension reader
 * (avoids pulling in `sharp`/`image-size` just to read width/height).
 */

'use strict';

const fs = require('fs');
const path = require('path');

const IMAGE_EXTENSIONS = new Set(['.jpg', '.jpeg', '.png', '.webp']);

function ensureDirs(...dirs) {
  dirs.forEach((dir) => {
    if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
  });
}

function listImageFiles(dir) {
  if (!fs.existsSync(dir)) return [];
  return fs
    .readdirSync(dir)
    .filter((f) => IMAGE_EXTENSIONS.has(path.extname(f).toLowerCase()))
    .map((f) => path.join(dir, f));
}

/**
 * Reads width/height from PNG or JPEG headers without any dependency.
 * Falls back to a sensible default (typical phone-photo aspect) if the
 * format isn't recognized — real deployments should replace this with
 * `sharp(...).metadata()` for full format coverage & EXIF handling.
 */
function readImageDimensions(filePath) {
  const buf = fs.readFileSync(filePath);

  // PNG: signature (8 bytes) + IHDR chunk holds width/height as big-endian uint32
  const isPng =
    buf.length > 24 &&
    buf[0] === 0x89 && buf[1] === 0x50 && buf[2] === 0x4e && buf[3] === 0x47;
  if (isPng) {
    const width = buf.readUInt32BE(16);
    const height = buf.readUInt32BE(20);
    return { width, height, format: 'png' };
  }

  // JPEG: scan markers for SOF0/SOF2 (0xFFC0 / 0xFFC2) which carry height/width
  const isJpeg = buf.length > 4 && buf[0] === 0xff && buf[1] === 0xd8;
  if (isJpeg) {
    let offset = 2;
    while (offset < buf.length - 9) {
      if (buf[offset] !== 0xff) {
        offset++;
        continue;
      }
      const marker = buf[offset + 1];
      const isSOF =
        (marker >= 0xc0 && marker <= 0xcf) && marker !== 0xc4 && marker !== 0xc8 && marker !== 0xcc;
      if (isSOF) {
        const height = buf.readUInt16BE(offset + 5);
        const width = buf.readUInt16BE(offset + 7);
        return { width, height, format: 'jpeg' };
      }
      const segmentLength = buf.readUInt16BE(offset + 2);
      offset += 2 + segmentLength;
    }
  }

  return { width: 1200, height: 1600, format: 'unknown-default' };
}

function reportFileName(baseName) {
  const safe = baseName.replace(/[^a-z0-9_\-]/gi, '_');
  const ts = new Date().toISOString().replace(/[:.]/g, '-');
  return `${safe}_report_${ts}.pdf`;
}

module.exports = { ensureDirs, listImageFiles, readImageDimensions, reportFileName };
