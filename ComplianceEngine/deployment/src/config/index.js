/**
 * config/index.js
 * Central configuration. Reads from environment variables (see
 * .env.example) with sane defaults so the engine runs out of the box.
 */

const fs = require('fs');
const path = require('path');
const dotenv = require('dotenv');

const ROOT = path.resolve(__dirname, '..', '..');

// Multi-path dotenv resolution so env vars load regardless of execution directory
const candidateEnvPaths = [
  path.join(ROOT, '.env'),
  path.resolve(ROOT, '..', '.env'),
  path.resolve(ROOT, '..', '..', '.env'),
  path.resolve(process.cwd(), '.env'),
  path.resolve(process.cwd(), 'ComplianceEngine', 'deployment', '.env'),
  path.resolve(process.cwd(), 'deployment', '.env'),
];

for (const envPath of candidateEnvPaths) {
  if (fs.existsSync(envPath)) {
    dotenv.config({ path: envPath, override: false });
  }
}

// Single flat output root shared with the STAGE-2 (Python) service:
// ComplianceEngine/output/product_<n>/ -- no per-service subfolders.
const OUTPUT_ROOT = process.env.SHARED_OUTPUT_DIR || path.join(ROOT, '..', 'output');

module.exports = {
  paths: {
    input: process.env.INPUT_DIR || path.join(ROOT, 'input'),
    outputRoot: OUTPUT_ROOT,
    output: process.env.OUTPUT_DIR || OUTPUT_ROOT,
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
    minContrastRatio: process.env.MIN_CONTRAST_RATIO ? Number(process.env.MIN_CONTRAST_RATIO) : 2.5,
  },
  groq: {
    model: process.env.GROQ_MODEL || 'openai/gpt-oss-20b',
    fallbackToRegex: process.env.GROQ_FALLBACK_TO_REGEX !== 'false',
  },
  report: {
    orgName: process.env.REPORT_ORG_NAME || 'Legal Metrology Enforcement',
  },
};
