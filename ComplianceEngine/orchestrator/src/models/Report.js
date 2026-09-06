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
    _id: { type: String },
    reportId: { type: String, required: true, unique: true, index: true },
    reference_no: { type: String, required: true, unique: true, index: true },
    productId: { type: String, default: null, index: true },
    product_name: { type: String, default: 'Packaged Commodity' },
    productName: { type: String, default: 'Packaged Commodity' },
    channel: { type: String, default: 'field', enum: ['field', 'ecommerce'] },
    filed_by: { type: String, ref: 'User', default: null, index: true },
    lmo_id: { type: String, ref: 'User', default: null, index: true },
    jurisdiction_id: { type: String, ref: 'Jurisdiction', default: null, index: true },
    status: {
      type: String,
      default: 'pending',
      enum: ['pending', 'approved', 'rejected'],
      index: true,
    },
    compliance_result: { type: String, default: null },
    complianceResult: { type: String, default: null },
    assessmentStatus: { type: String, default: null },
    pdf_url: { type: String, required: true },
    pdfUrl: { type: String, required: true },
    report_pdf_link: { type: String },
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
    decision_reason: { type: String, default: null },
    decided_by: { type: String, ref: 'User', default: null },
    assistant_controller_id: { type: String, ref: 'User', default: null },
    decided_at: { type: Date, default: null },
    inspected_at: { type: Date, default: Date.now },
    submitted_at: { type: Date, default: Date.now },
  },
  {
    timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' },
  }
);

ReportSchema.pre('save', function (next) {
  if (!this._id) this._id = this.reportId || this.reference_no;
  if (!this.reference_no && this.reportId) this.reference_no = this.reportId;
  if (!this.reportId && this.reference_no) this.reportId = this.reference_no;
  if (!this.lmo_id && this.filed_by) this.lmo_id = this.filed_by;
  if (!this.filed_by && this.lmo_id) this.filed_by = this.lmo_id;
  if (!this.pdf_url && this.pdfUrl) this.pdf_url = this.pdfUrl;
  if (!this.pdfUrl && this.pdf_url) this.pdfUrl = this.pdf_url;
  if (!this.report_pdf_link && this.pdf_url) this.report_pdf_link = this.pdf_url;
  if (!this.product_name && this.productName) this.product_name = this.productName;
  if (!this.productName && this.product_name) this.productName = this.product_name;
  if (!this.compliance_result && this.complianceResult) this.compliance_result = this.complianceResult;
  if (!this.complianceResult && this.compliance_result) this.complianceResult = this.compliance_result;
  if (typeof next === 'function') next();
});

module.exports = mongoose.model('Report', ReportSchema);
