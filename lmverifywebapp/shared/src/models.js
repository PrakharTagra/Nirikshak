import mongoose from 'mongoose';
import { randomUUID } from 'node:crypto';
import { ROLES, ACCOUNT_STATUS, REPORT_STATUS, CHANNEL } from './constants.js';

const schemaOptions = {
  timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' },
  toJSON: {
    virtuals: true,
    transform: (_doc, ret) => {
      ret.id = ret._id;
      if (ret.filed_by !== undefined && ret.lmo_id === undefined) ret.lmo_id = ret.filed_by;
      if (ret.decided_by !== undefined && ret.assistant_controller_id === undefined) ret.assistant_controller_id = ret.decided_by;
      if (ret.pdf_url !== undefined && ret.report_pdf_link === undefined) ret.report_pdf_link = ret.pdf_url;
      delete ret.__v;
      return ret;
    },
  },
  toObject: {
    virtuals: true,
    transform: (_doc, ret) => {
      ret.id = ret._id;
      if (ret.filed_by !== undefined && ret.lmo_id === undefined) ret.lmo_id = ret.filed_by;
      if (ret.decided_by !== undefined && ret.assistant_controller_id === undefined) ret.assistant_controller_id = ret.decided_by;
      if (ret.pdf_url !== undefined && ret.report_pdf_link === undefined) ret.report_pdf_link = ret.pdf_url;
      delete ret.__v;
      return ret;
    },
  },
};

const simpleOptions = {
  timestamps: false,
  toJSON: schemaOptions.toJSON,
  toObject: schemaOptions.toObject,
};

// 1. Jurisdiction
const jurisdictionSchema = new mongoose.Schema({
  _id: { type: String, default: () => randomUUID() },
  code: { type: String, required: true, unique: true },
  name: { type: String, required: true },
  created_at: { type: Date, default: Date.now },
}, simpleOptions);

// 2. User
const userSchema = new mongoose.Schema({
  _id: { type: String, default: () => randomUUID() },
  username: { type: String, required: true, unique: true, lowercase: true, trim: true },
  password_hash: { type: String, required: true },
  full_name: { type: String, required: true },
  role: { type: String, required: true, enum: Object.values(ROLES) },
  email: { type: String, default: null },
  phone: { type: String, default: null },
  jurisdiction_id: { type: String, ref: 'Jurisdiction', default: null },
  reports_to: { type: String, ref: 'User', default: null },
  status: { type: String, enum: Object.values(ACCOUNT_STATUS), default: ACCOUNT_STATUS.ACTIVE },
  must_change_password: { type: Boolean, default: true },
  last_login_at: { type: Date, default: null },
  created_by: { type: String, ref: 'User', default: null },
}, schemaOptions);

userSchema.index({ role: 1, jurisdiction_id: 1 });
userSchema.index({ reports_to: 1 });

// 3. Rule
const ruleSchema = new mongoose.Schema({
  _id: { type: String, required: true },
  label: { type: String, required: true },
  rule_ref: { type: String, required: true },
  applies_to: { type: String, enum: ['all', 'edible_only', 'imported_only'], default: 'all' },
  sort_order: { type: Number, required: true },
}, simpleOptions);

// 4. Report
const reportSchema = new mongoose.Schema({
  _id: { type: String, default: () => randomUUID() },
  reference_no: { type: String, required: true, unique: true },
  channel: { type: String, required: true, enum: Object.values(CHANNEL) },
  filed_by: { type: String, ref: 'User', required: true },
  lmo_id: { type: String, ref: 'User' },
  jurisdiction_id: { type: String, ref: 'Jurisdiction', required: true },
  product_name: { type: String, default: null },
  productName: { type: String, default: null },
  brand: { type: String, default: null },
  category: { type: String, default: null },
  is_edible: { type: Boolean, default: false },
  is_imported: { type: Boolean, default: false },
  declared_values: { type: mongoose.Schema.Types.Mixed, default: () => ({}) },
  listing_url: { type: String, default: null },
  pdf_url: { type: String, required: true },
  report_pdf_link: { type: String },
  directPdfUrl: { type: String, default: null },
  cloudinaryUrl: { type: String, default: null },
  reportId: { type: String, default: null },
  productId: { type: String, default: null },
  preprocessedImages: [{ type: String }],
  evidenceImages: [{ type: mongoose.Schema.Types.Mixed }],
  summary: { type: mongoose.Schema.Types.Mixed, default: () => ({}) },
  status: { type: String, enum: Object.values(REPORT_STATUS), default: REPORT_STATUS.PENDING },
  compliance_result: { type: String, default: null },
  complianceResult: { type: String, default: null },
  assessment_status: { type: String, default: null },
  decision_reason: { type: String, default: null },
  decided_by: { type: String, ref: 'User', default: null },
  assistant_controller_id: { type: String, ref: 'User', default: null },
  decided_at: { type: Date, default: null },
  inspected_at: { type: Date, required: true },
  submitted_at: { type: Date, default: Date.now },
}, schemaOptions);

reportSchema.pre('save', function (next) {
  if (this.lmo_id && !this.filed_by) this.filed_by = this.lmo_id;
  if (this.filed_by && !this.lmo_id) this.lmo_id = this.filed_by;

  if (this.assistant_controller_id && !this.decided_by) this.decided_by = this.assistant_controller_id;
  if (this.decided_by && !this.assistant_controller_id) this.assistant_controller_id = this.decided_by;

  if (this.report_pdf_link && !this.pdf_url) this.pdf_url = this.report_pdf_link;
  if (this.pdf_url && !this.report_pdf_link) this.report_pdf_link = this.pdf_url;
  if (this.pdfUrl && !this.pdf_url) this.pdf_url = this.pdfUrl;

  if (this.productName && !this.product_name) this.product_name = this.productName;
  if (this.product_name && !this.productName) this.productName = this.product_name;

  if (this.complianceResult && !this.compliance_result) this.compliance_result = this.complianceResult;
  if (this.compliance_result && !this.complianceResult) this.complianceResult = this.compliance_result;

  if (this.reportId && !this.reference_no) this.reference_no = this.reportId;
  if (this.reference_no && !this.reportId) this.reportId = this.reference_no;

  if (typeof next === 'function') next();
});

reportSchema.index({ jurisdiction_id: 1, status: 1 });
reportSchema.index({ filed_by: 1 });
reportSchema.index({ lmo_id: 1 });
reportSchema.index({ reportId: 1 });
reportSchema.index({ inspected_at: -1 });
reportSchema.index({ submitted_at: -1 });
reportSchema.index({ status: 1 });
reportSchema.index({ channel: 1 });

// 5. AdminAuditLog
const adminAuditLogSchema = new mongoose.Schema({
  _id: { type: String, default: () => randomUUID() },
  actor_id: { type: String, ref: 'User', required: true },
  action: { type: String, required: true },
  target_user_id: { type: String, ref: 'User', default: null },
  details: { type: mongoose.Schema.Types.Mixed, default: () => ({}) },
  created_at: { type: Date, default: Date.now },
}, simpleOptions);

adminAuditLogSchema.index({ actor_id: 1, created_at: -1 });

export const Jurisdiction = mongoose.models.Jurisdiction || mongoose.model('Jurisdiction', jurisdictionSchema);
export const User = mongoose.models.User || mongoose.model('User', userSchema);
export const Rule = mongoose.models.Rule || mongoose.model('Rule', ruleSchema);
export const Report = mongoose.models.Report || mongoose.model('Report', reportSchema);
export const AdminAuditLog = mongoose.models.AdminAuditLog || mongoose.model('AdminAuditLog', adminAuditLogSchema);
