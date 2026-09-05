/**
 * Stage 2 — real preprocessing bridge.
 *
 * Calls the Python OpenCV service from ComplianceEngine/STAGE-2. The Python
 * service also invokes Stage 4 PaddleOCR on the resulting image so no PDP/label
 * detection stage sits between preprocessing and OCR.
 */
'use strict';

const logger = require('../utils/logger');
const config = require('../config');
const { callStage2And4, callStage2And4Batch, savePreprocessedImage } = require('../integrations/stage2Stage4Client');

async function preprocessImage(imagePath) {
  logger.info('stage2_preprocessing', `Calling real Python preprocessing service: ${config.integration.preprocessorUrl}`);
  const result = await callStage2And4(imagePath);
  const preprocessedPath = await savePreprocessedImage(result.image_base64, imagePath);

  return {
    path: preprocessedPath,
    originalPath: imagePath,
    metadata: result.metadata || {},
    // STAGE-2 already allocated a product_<n> folder for this scan under
    // output/STAGE-2/ -- reuse the same number for output/deployment/.
    productId: result.product_id ?? null,
    integrationResult: result,
  };
}

async function preprocessImagesBatch(imagePaths) {
  logger.info('stage2_preprocessing', `Calling concurrent Python batch preprocessing for ${imagePaths.length} image(s)`);
  const batchResult = await callStage2And4Batch(imagePaths);

  const itemsWithPaths = await Promise.all((batchResult.items || []).map(async (item, idx) => {
    const origPath = imagePaths[idx] || item.filename;
    let savedPath = null;
    if (item.image_base64) {
      savedPath = await savePreprocessedImage(item.image_base64, origPath, `panel_${idx + 1}`);
    }
    return {
      ...item,
      path: savedPath,
      originalPath: origPath,
    };
  }));

  return {
    productId: batchResult.product_id ?? null,
    items: itemsWithPaths,
    combinedText: batchResult.combined_text || '',
    combinedRegions: batchResult.combined_regions || [],
    declarations: batchResult.declarations || {},
    integrationResult: batchResult,
  };
}

module.exports = { preprocessImage, preprocessImagesBatch };
