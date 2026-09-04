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

function getMimeType(filePath) {
  const ext = path.extname(filePath).toLowerCase();
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
  return mimeType;
}

async function callStage2And4(imagePath) {
  const data = await fs.readFile(imagePath);
  const mimeType = getMimeType(imagePath);

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

async function callStage2And4Batch(imagePaths) {
  if (!imagePaths || imagePaths.length === 0) {
    throw new Error('No image paths provided for batch processing.');
  }

  const form = new FormData();
  for (const imgPath of imagePaths) {
    const data = await fs.readFile(imgPath);
    const mimeType = getMimeType(imgPath);
    const blob = new Blob([data], { type: mimeType });
    form.append('images', blob, path.basename(imgPath));
  }

  const controller = new AbortController();
  const timeoutMs = config.integration.timeoutMs * Math.max(1, Math.ceil(imagePaths.length * 0.5));
  const timeout = setTimeout(() => controller.abort(), timeoutMs);

  try {
    const response = await fetch(`${config.integration.preprocessorUrl}/preprocess/ocr/batch`, {
      method: 'POST',
      body: form,
      signal: controller.signal,
    });

    if (response.ok) {
      return await response.json();
    }

    // Fallback: If the batch endpoint is not available, execute concurrent requests in parallel
    if (response.status === 404) {
      const singleResults = await Promise.all(imagePaths.map((p) => callStage2And4(p)));
      const combined_regions = [];
      const text_blocks = [];
      singleResults.forEach((res, idx) => {
        const fn = path.basename(imagePaths[idx]);
        text_blocks.push(`--- [Panel/Image ${idx + 1}: ${fn}] ---\n${res.extracted_text || ''}`);
        (res.regions || []).forEach((r) => {
          combined_regions.push({ ...r, image_index: idx, source_image: fn });
        });
      });
      return {
        product_id: singleResults[0]?.product_id ?? null,
        items: singleResults.map((r, i) => ({
          image_index: i,
          filename: path.basename(imagePaths[i]),
          metadata: r.metadata,
          extracted_text: r.extracted_text,
          regions: r.regions,
          image_base64: r.image_base64,
          declarations: r.declarations,
        })),
        combined_text: text_blocks.join('\n\n'),
        combined_regions,
        declarations: singleResults[0]?.declarations || {},
      };
    }

    const errText = await response.text();
    throw new Error(`Batch preprocessing service returned HTTP ${response.status}: ${errText}`);
  } finally {
    clearTimeout(timeout);
  }
}

async function savePreprocessedImage(base64, originalImagePath, suffix = '') {
  const outputDir = config.paths.preprocessed;
  await fs.mkdir(outputDir, { recursive: true });
  const stem = path.basename(originalImagePath, path.extname(originalImagePath));
  const sfx = suffix ? `_${suffix}` : '';
  const outputPath = path.join(outputDir, `${stem}${sfx}_${Date.now()}_preprocessed.png`);
  await fs.writeFile(outputPath, Buffer.from(base64, 'base64'));
  return outputPath;
}

module.exports = { callStage2And4, callStage2And4Batch, savePreprocessedImage, getMimeType };
