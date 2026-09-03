/**
 * Stage 2 — real preprocessing bridge.
 *
 * Calls the Python OpenCV service from ComplianceEngine/STAGE-2. The Python
 * service also invokes Stage 4 RapidOCR on the resulting image so no PDP/label
 * detection stage sits between preprocessing and OCR.
 */
'use strict';

const logger = require('../utils/logger');
const config = require('../config');
const { callStage2And4, savePreprocessedImage } = require('../integrations/stage2Stage4Client');

async function preprocessImage(imagePath) {
  logger.info('stage2_preprocessing', `Calling real Python preprocessing service: ${config.integration.preprocessorUrl}`);
  const result = await callStage2And4(imagePath);
  const preprocessedPath = await savePreprocessedImage(result.image_base64, imagePath);

  return {
    path: preprocessedPath,
    originalPath: imagePath,
    metadata: result.metadata || {},
    integrationResult: result,
  };
}

module.exports = { preprocessImage };
