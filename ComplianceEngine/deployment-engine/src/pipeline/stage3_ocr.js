/**
 * pipeline/stage3_ocr.js
 * Runs text extraction over the detected PDP region. Delegates to a
 * swappable provider (config.providers.ocr).
 */

'use strict';

const config = require('../config');
const logger = require('../utils/logger');

const providers = {
  mock: require('../providers/ocr/mockOcrProvider'),
  tesseract: require('../providers/ocr/tesseractOcrProvider'),
  // vision: require('../providers/ocr/visionOcrProvider'), // add for production (Google Cloud Vision)
};

async function extractText(preprocessed, detection) {
  const provider = providers[config.providers.ocr] || providers.mock;
  logger.info('stage3_ocr', `Using provider: ${config.providers.ocr}`);
  const result = await provider.runOcr(preprocessed, detection);
  return result;
}

module.exports = { extractText };
