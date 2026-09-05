import { Router } from 'express';
import { z } from 'zod';
import { badRequest, forbidden, AppError } from '@lm-verify/shared';
import { Report } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const inspectorReportsRouter = Router();

inspectorReportsRouter.use(authenticate, requireRole('DMI', 'LMO'), blockUntilPasswordChanged);

const submitSchema = z.object({
  channel: z.enum(['field', 'ecommerce'], { error: 'Channel must be field or ecommerce.' }),
  filed_by: z.string({ error: 'filed_by is required.' }).min(1, 'filed_by must be a user id.'),
  jurisdiction_id: z.string({ error: 'jurisdiction_id is required.' }).min(1, 'jurisdiction_id must be an id.'),
  inspected_at: z.coerce.date({ error: 'inspected_at is required, as an ISO timestamp.' }),
  pdf_url: z.string({ error: 'pdf_url is required.' })
    .url('pdf_url must be a URL.')
    .refine((u) => u.startsWith('https://'), 'pdf_url must be an https URL.'),
  brand: z.string().trim().max(200).optional(),
  is_edible: z.boolean().optional(),
  is_imported: z.boolean().optional(),
  listing_url: z.string().url('listing_url must be a URL.').optional(),
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

  if (data.filed_by !== req.user.id) {
    throw forbidden('filed_by does not match the signed-in inspector.');
  }
  if (data.jurisdiction_id !== req.user.jurisdictionId) {
    throw forbidden('jurisdiction_id does not match your own jurisdiction.');
  }

  if (data.inspected_at.getTime() > Date.now() + 5 * 60_000) {
    throw badRequest('Check the highlighted fields.', {
      inspected_at: 'That is in the future. Send when the inspection happened.',
    });
  }

  try {
    const reference_no = await nextReferenceNo();

    const report = await Report.create({
      reference_no,
      channel: data.channel,
      filed_by: data.filed_by,
      jurisdiction_id: data.jurisdiction_id,
      pdf_url: data.pdf_url,
      brand: data.brand ?? null,
      is_edible: data.is_edible ?? false,
      is_imported: data.is_imported ?? false,
      listing_url: data.listing_url ?? null,
      inspected_at: data.inspected_at,
      status: 'pending',
    });

    res.status(201).json({
      report: {
        id: report._id,
        reference_no: report.reference_no,
        status: report.status,
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
