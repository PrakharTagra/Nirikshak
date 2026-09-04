/**
 * test/generateSampleImages.js
 * Creates tiny but structurally valid PNG files as pipeline test
 * fixtures, using only Node's built-in `zlib` — no image library
 * needed. The pixel content is irrelevant to this demo (the mock
 * OCR/detection providers key off the filename, not pixel data);
 * this just gives Stage 1 a real image file to read dimensions from.
 */

'use strict';

const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

function crc32(buf) {
  let crc = 0xffffffff;
  for (let i = 0; i < buf.length; i++) {
    crc ^= buf[i];
    for (let j = 0; j < 8; j++) {
      crc = crc & 1 ? (crc >>> 1) ^ 0xedb88320 : crc >>> 1;
    }
  }
  return (crc ^ 0xffffffff) >>> 0;
}

function chunk(type, data) {
  const typeBuf = Buffer.from(type, 'ascii');
  const lenBuf = Buffer.alloc(4);
  lenBuf.writeUInt32BE(data.length, 0);
  const crcBuf = Buffer.alloc(4);
  crcBuf.writeUInt32BE(crc32(Buffer.concat([typeBuf, data])), 0);
  return Buffer.concat([lenBuf, typeBuf, data, crcBuf]);
}

function makeSolidColorPng(width, height, [r, g, b]) {
  const signature = Buffer.from([0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]);

  const ihdrData = Buffer.alloc(13);
  ihdrData.writeUInt32BE(width, 0);
  ihdrData.writeUInt32BE(height, 4);
  ihdrData[8] = 8; // bit depth
  ihdrData[9] = 2; // color type: RGB
  ihdrData[10] = 0; // compression
  ihdrData[11] = 0; // filter
  ihdrData[12] = 0; // interlace
  const ihdr = chunk('IHDR', ihdrData);

  const rowLen = 1 + width * 3; // filter byte + RGB per pixel
  const raw = Buffer.alloc(rowLen * height);
  for (let y = 0; y < height; y++) {
    const rowStart = y * rowLen;
    raw[rowStart] = 0; // filter type: None
    for (let x = 0; x < width; x++) {
      const px = rowStart + 1 + x * 3;
      raw[px] = r;
      raw[px + 1] = g;
      raw[px + 2] = b;
    }
  }
  const idat = chunk('IDAT', zlib.deflateSync(raw));
  const iend = chunk('IEND', Buffer.alloc(0));

  return Buffer.concat([signature, ihdr, idat, iend]);
}

function main() {
  const inputDir = path.resolve(__dirname, '..', 'input');
  if (!fs.existsSync(inputDir)) fs.mkdirSync(inputDir, { recursive: true });

  const fixtures = [
    { name: 'sample_salt_compliant.png', color: [230, 230, 230] },
    { name: 'sample_biscuit_noncompliant.png', color: [200, 160, 90] },
  ];

  fixtures.forEach(({ name, color }) => {
    const buf = makeSolidColorPng(600, 800, color);
    fs.writeFileSync(path.join(inputDir, name), buf);
    console.log(`Created ${path.join(inputDir, name)} (${buf.length} bytes)`);
  });
}

main();
