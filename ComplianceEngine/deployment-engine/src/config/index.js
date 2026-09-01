/**
 * config/index.js
 * Central configuration. Reads from environment variables (see
 * .env.example) with sane defaults so the engine runs out of the box.
 */

'use strict';

const path = require('path');

const ROOT = path.resolve(__dirname, '..', '..');

module.exports = {
  paths: {
    input: process.env.INPUT_DIR || path.join(ROOT, 'input'),
    output: process.env.OUTPUT_DIR || path.join(ROOT, 'output'),
    temp: process.env.TEMP_DIR || path.join(ROOT, 'temp'),
  },
  providers: {
    // 'mock' works with zero external dependencies / API keys — good for
    // local testing and for CI. Swap to a real provider for production.
    detection: process.env.DETECTION_PROVIDER || 'mock', // mock | yolo
    ocr: process.env.OCR_PROVIDER || 'mock', // mock | tesseract | vision
  },
  report: {
    orgName: process.env.REPORT_ORG_NAME || 'Legal Metrology Enforcement',
  },
};
