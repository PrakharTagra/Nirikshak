'use strict';

const mongoose = require('mongoose');

const ViolationSchema = new mongoose.Schema(
  {
    rule: { type: String, required: true },
    severity: { type: String, enum: ['critical', 'major', 'minor'], default: 'major' },
    message: { type: String, required: true },
    statutoryRef: { type: String, default: null },
    evidenceUrl: { type: String, default: null },
    panelName: { type: String, default: null },
  },
  { _id: false }
);

const InspectionSchema = new mongoose.Schema(
  {
    productId: { type: String, required: true, index: true },
    productName: { type: String, default: 'Unlabeled Package' },
    packageDimensions: { type: String, default: null },
    isEcommerce: { type: Boolean, default: false },
    sourceImageUrls: [{ type: String }],
    reportPdfUrl: { type: String, required: true },
    annotatedNetQuantityUrl: { type: String, default: null },
    status: {
      type: String,
      enum: ['COMPLIANT', 'NON-COMPLIANT', 'EXEMPT'],
      required: true,
      index: true,
    },
    summary: {
      applicable: { type: Boolean, default: true },
      compliant: { type: Boolean, default: false },
      totalViolations: { type: Number, default: 0 },
      criticalViolations: { type: Number, default: 0 },
      majorViolations: { type: Number, default: 0 },
      minorViolations: { type: Number, default: 0 },
      commodityName: { type: String, default: null },
      brandName: { type: String, default: null },
      declaredMrp: { type: String, default: null },
      declaredNetQuantity: { type: String, default: null },
    },
    violations: [ViolationSchema],
    declarations: { type: mongoose.Schema.Types.Mixed, default: {} },
    labelMetrics: { type: mongoose.Schema.Types.Mixed, default: {} },
    rawReportData: { type: mongoose.Schema.Types.Mixed, default: {} },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model('Inspection', InspectionSchema);
