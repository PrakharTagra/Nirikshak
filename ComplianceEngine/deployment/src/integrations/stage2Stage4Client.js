/**
 * Bridge to the real Python Stage 2 + Stage 4 services.
 *
 * Stage 3 (PDP detection) has intentionally been removed from the deployment
 * pipeline. The Python service receives the original image, runs the real
 * OpenCV preprocessing, then runs RapidOCR directly on the preprocessed image.
 *
 * Expected endpoint:
 *   POST ${PREPROCESSOR_URL}/preprocess/ocr
 *   multipart field: image
 *
 * The endpoint should return:
 *   metadata, image_base64, ocr, extracted_text, declarations
 */
'use strict';

const fs = require('fs/promises');
const path = require('path');
const config = require('../config');

async function callStage2And4(imagePath) {
  const data = await fs.readFile(imagePath);
  const ext = path.extname(imagePath).toLowerCase();

const mimeTypes = {
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.png': 'image/png',
  '.webp': 'image/webp',
};

const mimeType = mimeTypes[ext];

if (!mimeType) {
  throw new Error(`Unsupported image format: ${ext}`);
}

const blob = new Blob([data], { type: mimeType });
  const form = new FormData();
  form.append('image', blob, path.basename(imagePath));

  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), config.integration.timeoutMs);

  try {
    const response = await fetch(`${config.integration.preprocessorUrl}/preprocess/ocr`, {
      method: 'POST',
      body: form,
      signal: controller.signal,
    });

    const bodyText = await response.text();
    let body;
    try { body = JSON.parse(bodyText); } catch { body = { detail: bodyText }; }

    if (!response.ok) {
      throw new Error(`Stage 2/4 service returned HTTP ${response.status}: ${body.detail || bodyText}`);
    }

    if (!body.ocr) {
      throw new Error('Stage 2/4 service response does not contain OCR output.');
    }
    if (!body.image_base64) {
      throw new Error('Stage 2/4 service response does not contain image_base64. Update STAGE-2/app/main.py to the current integration contract.');
    }

    return body;
  } finally {
    clearTimeout(timeout);
  }
}

async function savePreprocessedImage(base64, originalImagePath) {
  const outputDir = config.paths.preprocessed;
  await fs.mkdir(outputDir, { recursive: true });
  const stem = path.basename(originalImagePath, path.extname(originalImagePath));
  const outputPath = path.join(outputDir, `${stem}_${Date.now()}_preprocessed.png`);
  await fs.writeFile(outputPath, Buffer.from(base64, 'base64'));
  return outputPath;
}

module.exports = { callStage2And4, savePreprocessedImage };
