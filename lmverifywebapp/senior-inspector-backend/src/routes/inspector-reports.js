import { Router } from 'express';
import { z } from 'zod';
import { badRequest, notFound, forbidden, AppError } from '@lm-verify/shared';
import { Report } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const inspectorReportsRouter = Router();

inspectorReportsRouter.use(authenticate, requireRole('DMI', 'LMO'), blockUntilPasswordChanged);

const submitSchema = z.object({
  channel: z.enum(['field', 'ecommerce']).default('ecommerce'),
  filed_by: z.string().optional(),
  jurisdiction_id: z.string().optional(),
  inspected_at: z.coerce.date().optional(),
  pdf_url: z.string().optional(),
  product_name: z.string().optional(),
  productName: z.string().optional(),
  brand: z.string().trim().max(200).optional(),
  category: z.string().optional(),
  is_edible: z.boolean().optional(),
  is_imported: z.boolean().optional(),
  listing_url: z.string().optional(),
  declared_values: z.any().optional(),
  compliance_result: z.string().optional(),
  complianceResult: z.string().optional(),
  summary: z.any().optional(),
  evidenceImages: z.any().optional(),
});

function parse(schema, body) {
  const result = schema.safeParse(body);
  if (!result.success) {
    throw badRequest('Check the highlighted fields.', Object.fromEntries(
      result.error.issues.map((i) => [i.path.join('.') || 'form', i.message]),
    ));
  }
  return result.data;
}

async function nextReferenceNo() {
  const year = new Date().getFullYear();
  const prefix = `LMV/${year}/`;
  const regex = new RegExp(`^${prefix}(\\d+)`);
  const latest = await Report.find({ reference_no: { $regex: regex } }, { reference_no: 1 })
    .sort({ reference_no: -1 })
    .limit(20)
    .lean();

  let maxNum = 0;
  for (const r of latest) {
    const match = r.reference_no.match(/^LMV\/\d{4}\/(\d+)/);
    if (match) {
      const num = parseInt(match[1], 10);
      if (num > maxNum) maxNum = num;
    }
  }
  return `LMV/${year}/${String(maxNum + 1).padStart(4, '0')}`;
}

/* POST /api/inspector/reports */
inspectorReportsRouter.post('/', async (req, res) => {
  const data = parse(submitSchema, req.body);

  const filedBy = req.user.id;
  const jurisdictionId = req.user.jurisdictionId || data.jurisdiction_id;
  if (!jurisdictionId) {
    throw badRequest('Jurisdiction is required.');
  }

  const inspectedAt = data.inspected_at || new Date();
  if (inspectedAt.getTime() > Date.now() + 5 * 60_000) {
    throw badRequest('Check the highlighted fields.', {
      inspected_at: 'That is in the future. Send when the inspection happened.',
    });
  }

  const pdfUrl = data.pdf_url && data.pdf_url.startsWith('http')
    ? data.pdf_url
    : `https://nirikshakscraper.duckdns.org/reports/dmi-${Date.now()}`;

  try {
    const reference_no = await nextReferenceNo();
    const prodName = data.product_name || data.productName || null;
    const compResult = data.compliance_result || data.complianceResult || null;

    const report = await Report.create({
      reference_no,
      channel: data.channel || 'ecommerce',
      filed_by: filedBy,
      lmo_id: filedBy,
      jurisdiction_id: jurisdictionId,
      product_name: prodName,
      productName: prodName,
      brand: data.brand ?? null,
      category: data.category ?? null,
      is_edible: data.is_edible ?? false,
      is_imported: data.is_imported ?? false,
      listing_url: data.listing_url ?? null,
      declared_values: data.declared_values || {},
      compliance_result: compResult,
      complianceResult: compResult,
      summary: data.summary || {},
      evidenceImages: data.evidenceImages || [],
      pdf_url: pdfUrl,
      report_pdf_link: pdfUrl,
      inspected_at: inspectedAt,
      status: 'pending',
    });

    res.status(201).json({
      report: {
        id: report._id,
        reference_no: report.reference_no,
        status: report.status,
        channel: report.channel,
        product_name: report.product_name,
        brand: report.brand,
        listing_url: report.listing_url,
        compliance_result: report.compliance_result,
        summary: report.summary,
        declared_values: report.declared_values,
        pdf_url: report.pdf_url,
        report_pdf_link: report.report_pdf_link || report.pdf_url,
        filed_by: report.filed_by,
        lmo_id: report.lmo_id || report.filed_by,
        assistant_controller_id: report.assistant_controller_id || report.decided_by || null,
        inspected_at: report.inspected_at,
        submitted_at: report.submitted_at,
      },
    });
  } catch (err) {
    if (err?.code === 11000) {
      throw new AppError(409, 'CONFLICT', 'That report could not be filed. Try again.');
    }
    throw err;
  }
});

/* GET /api/inspector/reports */
inspectorReportsRouter.get('/', async (req, res) => {
  const reports = await Report.find({ filed_by: req.user.id })
    .populate('decided_by')
    .sort({ submitted_at: -1 })
    .limit(500)
    .lean();

  const rows = reports.map((r) => ({
    id: r._id,
    reference_no: r.reference_no,
    channel: r.channel,
    status: r.status,
    product_name: r.product_name || r.productName || null,
    brand: r.brand || null,
    listing_url: r.listing_url || null,
    compliance_result: r.compliance_result || r.complianceResult || null,
    summary: r.summary || {},
    declared_values: r.declared_values || {},
    pdf_url: r.pdf_url,
    report_pdf_link: r.report_pdf_link || r.pdf_url,
    filed_by: r.filed_by?._id || r.filed_by,
    lmo_id: r.lmo_id || r.filed_by?._id || r.filed_by,
    decided_by: r.decided_by?._id || r.decided_by || null,
    assistant_controller_id: r.assistant_controller_id || r.decided_by?._id || r.decided_by || null,
    inspected_at: r.inspected_at,
    submitted_at: r.submitted_at,
    decided_at: r.decided_at,
    decision_reason: r.decision_reason,
    decided_by_name: r.decided_by?.full_name || null,
  }));

  res.json({ reports: rows });
});

/* GET /api/inspector/reports/:id */
inspectorReportsRouter.get('/:id', async (req, res) => {
  const r = await Report.findOne({ _id: req.params.id, filed_by: req.user.id })
    .populate('decided_by')
    .populate('jurisdiction_id')
    .lean();

  if (!r) {
    throw notFound('Statutory inspection report not found.');
  }

  res.json({
    report: {
      id: r._id,
      reference_no: r.reference_no,
      channel: r.channel,
      status: r.status,
      product_name: r.product_name || r.productName || null,
      brand: r.brand || null,
      category: r.category || null,
      listing_url: r.listing_url || null,
      is_edible: r.is_edible || false,
      is_imported: r.is_imported || false,
      compliance_result: r.compliance_result || r.complianceResult || null,
      summary: r.summary || {},
      declared_values: r.declared_values || {},
      evidenceImages: r.evidenceImages || [],
      pdf_url: r.pdf_url,
      report_pdf_link: r.report_pdf_link || r.pdf_url,
      filed_by: r.filed_by?._id || r.filed_by,
      jurisdiction: r.jurisdiction_id?.name || null,
      decided_by: r.decided_by?._id || r.decided_by || null,
      assistant_controller_id: r.assistant_controller_id || r.decided_by?._id || r.decided_by || null,
      inspected_at: r.inspected_at,
      submitted_at: r.submitted_at,
      decided_at: r.decided_at,
      decision_reason: r.decision_reason,
      decided_by_name: r.decided_by?.full_name || null,
    },
  });
});
