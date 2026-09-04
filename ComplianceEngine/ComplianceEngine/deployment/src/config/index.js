/**
 * config/index.js
 * Central configuration. Reads from environment variables (see
 * .env.example) with sane defaults so the engine runs out of the box.
 */

'use strict';

const path = require('path');

const ROOT = path.resolve(__dirname, '..', '..');

// Single output root shared with the STAGE-2 (Python) and STAGE-4 services:
// ComplianceEngine/output/<STAGE-2|STAGE-4|deployment>/product_<n>/
const OUTPUT_ROOT = process.env.SHARED_OUTPUT_DIR || path.join(ROOT, '..', 'output');

module.exports = {
  paths: {
    input: process.env.INPUT_DIR || path.join(ROOT, 'input'),
    outputRoot: OUTPUT_ROOT,
    output: process.env.OUTPUT_DIR || path.join(OUTPUT_ROOT, 'deployment'),
    temp: process.env.TEMP_DIR || path.join(ROOT, 'temp'),
    preprocessed: process.env.PREPROCESSED_DIR || path.join(ROOT, 'temp', 'preprocessed'),
  },
  providers: {
    extraction: process.env.EXTRACTION_PROVIDER || 'groq',
  },
  integration: {
    preprocessorUrl: process.env.PREPROCESSOR_URL || 'http://127.0.0.1:8000',
    timeoutMs: Number(process.env.PREPROCESSOR_TIMEOUT_MS || 120000),
  },
  fontAnalysis: {
    pixelsPerMm: process.env.PIXELS_PER_MM ? Number(process.env.PIXELS_PER_MM) : null,
  },
  groq: {
    model: process.env.GROQ_MODEL || 'openai/gpt-oss-20b',
    fallbackToRegex: process.env.GROQ_FALLBACK_TO_REGEX !== 'false',
  },
  report: {
    orgName: process.env.REPORT_ORG_NAME || 'Legal Metrology Enforcement',
  },
};
