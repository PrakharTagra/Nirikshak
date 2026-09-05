'use strict';

const cloudinary = require('cloudinary').v2;
const fs = require('fs');
const path = require('path');
const logger = require('./logger');

const isConfigured = Boolean(
  process.env.CLOUDINARY_CLOUD_NAME &&
  process.env.CLOUDINARY_API_KEY &&
  process.env.CLOUDINARY_API_SECRET
);

if (isConfigured) {
  cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET,
    secure: true,
  });
  logger.info('cloudinary', `Initialized Cloudinary with cloud_name: ${process.env.CLOUDINARY_CLOUD_NAME}`);
} else {
  logger.warn(
    'cloudinary',
    'Cloudinary environment variables (CLOUDINARY_CLOUD_NAME, CLOUDINARY_API_KEY, CLOUDINARY_API_SECRET) not set. Remote uploads will be skipped.'
  );
}

/**
 * Upload a file to Cloudinary.
 * @param {string} filePath - Absolute or relative path to local file.
 * @param {object} options - Cloudinary upload options (folder, resource_type, etc.)
 * @returns {Promise<string|null>} Secure URL of uploaded resource, or null if skipped/failed.
 */
async function uploadFile(filePath, options = {}) {
  if (!isConfigured) {
    logger.warn('cloudinary', `Skipping Cloudinary upload for ${filePath} (not configured).`);
    return null;
  }

  if (!fs.existsSync(filePath)) {
    logger.error('cloudinary', `File not found for Cloudinary upload: ${filePath}`);
    return null;
  }

  const defaultFolder = options.folder || 'compliance_engine';
  const resourceType = options.resource_type || (filePath.endsWith('.pdf') ? 'raw' : 'image');

  try {
    const filename = path.basename(filePath, path.extname(filePath));
    const result = await cloudinary.uploader.upload(filePath, {
      folder: defaultFolder,
      resource_type: resourceType,
      public_id: `${filename}_${Date.now()}`,
      overwrite: true,
      ...options,
    });

    logger.info('cloudinary', `Uploaded ${filePath} -> ${result.secure_url}`);
    return result.secure_url;
  } catch (err) {
    logger.error('cloudinary', `Upload error for ${filePath}: ${err.message}`, err);
    return null;
  }
}

/**
 * Upload a PDF report to Cloudinary
 */
async function uploadPdf(filePath, folder = 'compliance_reports') {
  return uploadFile(filePath, { folder, resource_type: 'raw' });
}

/**
 * Upload an image (packaging panel photo or evidence crop) to Cloudinary
 */
async function uploadImage(filePath, folder = 'product_images') {
  return uploadFile(filePath, { folder, resource_type: 'image' });
}

module.exports = {
  isConfigured,
  uploadFile,
  uploadPdf,
  uploadImage,
};
