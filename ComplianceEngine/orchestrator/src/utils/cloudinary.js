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
 * Upload base64 encoded image directly to Cloudinary without writing to disk
 */
async function uploadBase64Image(base64Data, filename = 'panel', folder = 'compliance_engine/preprocessed') {
  if (!isConfigured) return null;
  try {
    const dataUri = base64Data.startsWith('data:') ? base64Data : `data:image/png;base64,${base64Data}`;
    const result = await cloudinary.uploader.upload(dataUri, {
      folder,
      resource_type: 'image',
      public_id: `${filename}_${Date.now()}_${Math.random().toString(36).slice(2, 6)}`,
      overwrite: true,
    });
    logger.info('cloudinary', `Uploaded image (${filename}) -> ${result.secure_url}`);
    return result.secure_url;
  } catch (err) {
    logger.error('cloudinary', `Base64 upload error: ${err.message}`, err);
    return null;
  }
}

/**
 * Upload an image (packaging panel photo or evidence crop) to Cloudinary
 */
async function uploadImage(filePath, folder = 'compliance_engine/evidence') {
  return uploadFile(filePath, { folder, resource_type: 'image' });
}

module.exports = {
  isConfigured,
  uploadFile,
  uploadPdf,
  uploadImage,
  uploadBase64Image,
};
