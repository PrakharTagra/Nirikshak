/**
 * pipeline/stage2_labelDetection.js
 * Locates the Principal Display Panel and establishes the pixel-to-mm
 * calibration scale needed later for font-height compliance (Rule 7).
 * Delegates to a swappable provider (config.providers.detection).
 */

'use strict';

const config = require('../config');
const logger = require('../utils/logger');

const providers = {
  mock: require('../providers/detection/mockDetectionProvider'),
  // yolo: require('../providers/detection/yoloDetectionProvider'), // add for production
};

async function detectLabel(preprocessed) {
  const provider = providers[config.providers.detection] || providers.mock;
  logger.info('stage2_labelDetection', `Using provider: ${config.providers.detection}`);
  const result = await provider.detect(preprocessed);
  return result;
}

module.exports = { detectLabel };