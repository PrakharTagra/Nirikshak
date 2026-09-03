/**
 * simplePdfWriter.js
 * A minimal, dependency-free PDF generator (PDF 1.4, Helvetica base font,
 * text-only, auto-paginated). No native bindings, no npm dependencies —
 * this keeps the deployment engine installable anywhere Node.js runs,
 * with no build toolchain needed for the report stage.
 *
 * For a richer PDF (logos, embedded evidence photos, custom fonts),
 * swap this module for `pdfkit` — the call site in stage7_report.js
 * is isolated so that swap touches only one file.
 */

'use strict';

const PAGE_WIDTH = 612; // US Letter, points
const PAGE_HEIGHT = 792;
const MARGIN = 50;
const LINE_HEIGHT = 14;
const FONT_REGULAR_SIZE = 10;
const FONT_HEADING_SIZE = 14;
const FONT_SUBHEADING_SIZE = 11;

// PDF's base-14 fonts (Helvetica) only support WinAnsiEncoding — safely
// transliterate common Unicode punctuation/currency so text never
// silently corrupts into stray control characters.
const CHAR_MAP = {
  '\u2014': '-', // em dash —
  '\u2013': '-', // en dash –
  '\u2018': "'", '\u2019': "'", // curly single quotes
  '\u201c': '"', '\u201d': '"', // curly double quotes
  '\u2026': '...', // ellipsis
  '\u20b9': 'Rs.', // rupee sign ₹
  '\u00a0': ' ', // non-breaking space
};

function sanitizeForPdf(str) {
  let out = String(str);
  Object.keys(CHAR_MAP).forEach((k) => {
    out = out.split(k).join(CHAR_MAP[k]);
  });
  // Anything else outside printable Latin-1 (0x20-0xFF minus DEL) becomes '?'
  // rather than silently wrapping into an unrelated control byte.
  out = out.replace(/[^\x20-\x7e\xa0-\xff]/g, '?');
  return out;
}

function escapePdfText(str) {
  const clean = sanitizeForPdf(str);
  return clean.replace(/\\/g, '\\\\').replace(/\(/g, '\\(').replace(/\)/g, '\\)');
}

// Very small word-wrap: Helvetica average char width approximation per pt size.
function wrapLine(text, size, maxWidthPt) {
  const avgCharWidth = size * 0.5;
  const maxChars = Math.max(10, Math.floor(maxWidthPt / avgCharWidth));
  const words = String(text).split(/\s+/);
  const lines = [];
  let current = '';
  words.forEach((word) => {
    const candidate = current ? `${current} ${word}` : word;
    if (candidate.length > maxChars && current) {
      lines.push(current);
      current = word;
    } else {
      current = candidate;
    }
  });
  if (current) lines.push(current);
  return lines.length ? lines : [''];
}

/**
 * blocks: array of { text, size, bold, gapBefore }
 *   text may contain '\n' for hard line breaks; long lines auto-wrap.
 */
function buildPages(blocks) {
  const usableWidth = PAGE_WIDTH - MARGIN * 2;
  const pages = [[]];
  let y = PAGE_HEIGHT - MARGIN;

  const pushLine = (text, size, bold) => {
    if (y < MARGIN + LINE_HEIGHT) {
      pages.push([]);
      y = PAGE_HEIGHT - MARGIN;
    }
    pages[pages.length - 1].push({ text, size, bold, y });
    y -= size <= FONT_REGULAR_SIZE ? LINE_HEIGHT : LINE_HEIGHT + (size - FONT_REGULAR_SIZE);
  };

  blocks.forEach((block) => {
    if (block.gapBefore) y -= block.gapBefore;
    const size = block.size || FONT_REGULAR_SIZE;
    const hardLines = String(block.text).split('\n');
    hardLines.forEach((hardLine) => {
      const wrapped = wrapLine(hardLine, size, usableWidth);
      wrapped.forEach((w) => pushLine(w, size, !!block.bold));
    });
  });

  return pages;
}

function buildContentStream(pageLines) {
  let ops = [];
  pageLines.forEach((line) => {
    const font = line.bold ? '/F2' : '/F1';
    ops.push('BT');
    ops.push(`${font} ${line.size} Tf`);
    ops.push(`${MARGIN} ${line.y} Td`);
    ops.push(`(${escapePdfText(line.text)}) Tj`);
    ops.push('ET');
  });
  return ops.join('\n');
}

function generatePdfBuffer(blocks) {
  const pages = buildPages(blocks);
  const objects = [];
  let objIndex = 1;

  const fontRegularObj = objIndex++;
  const fontBoldObj = objIndex++;
  const pagesObj = objIndex++;
  const catalogObj = objIndex++;

  const pageObjRefs = [];
  const contentObjRefs = [];
  const pageObjIds = [];
  const contentObjIds = [];

  pages.forEach(() => {
    pageObjIds.push(objIndex++);
    contentObjIds.push(objIndex++);
  });

  objects[fontRegularObj] = `<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>`;
  objects[fontBoldObj] = `<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica-Bold >>`;

  pages.forEach((pageLines, idx) => {
    const contentStream = buildContentStream(pageLines);
    const contentObjId = contentObjIds[idx];
    objects[contentObjId] = { stream: contentStream };

    const pageObjId = pageObjIds[idx];
    objects[pageObjId] = `<< /Type /Page /Parent ${pagesObj} 0 R /MediaBox [0 0 ${PAGE_WIDTH} ${PAGE_HEIGHT}] /Resources << /Font << /F1 ${fontRegularObj} 0 R /F2 ${fontBoldObj} 0 R >> >> /Contents ${contentObjId} 0 R >>`;
  });

  objects[pagesObj] = `<< /Type /Pages /Kids [${pageObjIds.map((id) => `${id} 0 R`).join(' ')}] /Count ${pageObjIds.length} >>`;
  objects[catalogObj] = `<< /Type /Catalog /Pages ${pagesObj} 0 R >>`;

  // Serialize
  const chunks = [];
  const offsets = [];
  let cursor = 0;

  const push = (str) => {
    const buf = Buffer.from(str, 'latin1');
    chunks.push(buf);
    cursor += buf.length;
  };

  push('%PDF-1.4\n');

  const totalObjects = objIndex - 1;
  for (let id = 1; id <= totalObjects; id++) {
    offsets[id] = cursor;
    const body = objects[id];
    if (body == null) {
      push(`${id} 0 obj\n<< >>\nendobj\n`);
      continue;
    }
    if (typeof body === 'string') {
      push(`${id} 0 obj\n${body}\nendobj\n`);
    } else if (body.stream != null) {
      const streamBuf = Buffer.from(body.stream, 'latin1');
      push(`${id} 0 obj\n<< /Length ${streamBuf.length} >>\nstream\n`);
      chunks.push(streamBuf);
      cursor += streamBuf.length;
      push('\nendstream\nendobj\n');
    }
  }

  const xrefStart = cursor;
  let xref = `xref\n0 ${totalObjects + 1}\n0000000000 65535 f \n`;
  for (let id = 1; id <= totalObjects; id++) {
    xref += `${String(offsets[id]).padStart(10, '0')} 00000 n \n`;
  }
  push(xref);
  push(`trailer\n<< /Size ${totalObjects + 1} /Root ${catalogObj} 0 R >>\nstartxref\n${xrefStart}\n%%EOF`);

  return Buffer.concat(chunks);
}

module.exports = {
  generatePdfBuffer,
  FONT_HEADING_SIZE,
  FONT_SUBHEADING_SIZE,
  FONT_REGULAR_SIZE,
};
