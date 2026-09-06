'use strict';

const mongoose = require('mongoose');

/**
 * Report Schema:
 * Stores ONLY the statutory assessment results and Cloudinary CDN URLs for
 * preprocessed panel images, annotated violation evidence crops, and the final PDF report.
 * Zero files are stored on backend server disk.
 */
const ReportSchema = new mongoose.Schema(
  {
    reportId: { type: String, required: true, unique: true, index: true },
    reference_no: { type: String, default: null }, // Backwards compatibility with legacy queries
    productId: { type: String, default: null, index: true },
    productName: { type: String, default: 'Packaged Commodity' },
    status: { type: String, default: null }, // COMPLIANT, NON-COMPLIANT, or EXEMPT
    pdfUrl: { type: String, required: true },
    cloudinaryUrl: { type: String, default: null },
    directPdfUrl: { type: String, default: null },
    preprocessedImages: [{ type: String }],
    evidenceImages: [
      {
        findingId: String,
        rule: String,
        field: String,
        severity: String,
        message: String,
        evidenceUrl: String,
      },
    ],
    summary: { type: Object, default: {} },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model('Report', ReportSchema);
