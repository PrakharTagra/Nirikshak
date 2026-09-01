/**
 * pipeline/stage1_preprocess.js
 * Preprocessing: orientation, cropping, contrast/denoise.
 *
 * This reads real dimensions from the file (no dependency), and exposes
 * the hook points a production build should fill in with `sharp` or
 * OpenCV (deskew, denoise, contrast normalization, glare removal) as
 * described in the execution plan. Swapping in real image ops means
 * editing ONLY this file — every later stage just consumes
 * `{ path, width, height }`.
 */

'use strict';

const { readImageDimensions } = require('../utils/fileHelpers');
const logger = require('../utils/logger');

async function preprocessImage(imagePath) {
  logger.info('stage1_preprocess', `Reading ${imagePath}`);
  const { width, height, format } = readImageDimensions(imagePath);

  if (!width || !height) {
    throw new Error(`Could not determine dimensions for ${imagePath} — unsupported/corrupt image.`);
  }

  // --- Real-deployment hook -------------------------------------------
  // const sharp = require('sharp');
  // const processed = await sharp(imagePath)
  //   .rotate()                 // auto-orient via EXIF
  //   .normalize()               // contrast normalization
  //   .median(3)                 // light denoise
  //   .toFile(tempOutputPath);
  // ----------------------------------------------------------------------

  return {
    path: imagePath,
    width,
    height,
    format,
    preprocessed: false, // flip to true once real ops above are wired in
  };
}

module.exports = { preprocessImage };