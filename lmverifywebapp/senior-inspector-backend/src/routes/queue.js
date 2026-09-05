import { Router } from 'express';
import { notFound, jurisdictionScopeFor } from '@lm-verify/shared';
import { Report, User } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const queueRouter = Router();
queueRouter.use(authenticate, requireRole('AC'), blockUntilPasswordChanged);

const STATUSES = ['pending', 'approved', 'rejected'];
const CHANNELS = ['ecommerce', 'field'];

/* GET /api/reports */
queueRouter.get('/', async (req, res) => {
  const scope = jurisdictionScopeFor(req.user);
  const { status, channel, search } = req.query;

  const filter = { jurisdiction_id: scope.jurisdictionId };

  const wanted = String(status ?? '').split(',').map((s) => s.trim()).filter((s) => STATUSES.includes(s));
  if (wanted.length === 1) filter.status = wanted[0];
  else if (wanted.length > 1) filter.status = { $in: wanted };

  if (CHANNELS.includes(channel)) filter.channel = channel;

  if (search?.trim()) {
    const s = search.trim();
    const matchedOfficers = await User.find(
      { full_name: { $regex: s, $options: 'i' } },
      { _id: 1 },
    ).lean();
    const officerIds = matchedOfficers.map((o) => o._id);

    filter.$or = [
      { reference_no: { $regex: s, $options: 'i' } },
      { filed_by: { $in: officerIds } },
    ];
  }

  const reports = await Report.find(filter)
    .populate('filed_by')
    .populate('decided_by')
    .sort({ submitted_at: -1 })
    .limit(500)
    .lean();

  reports.sort((a, b) => {
    const aPending = a.status === 'pending' ? 0 : 1;
    const bPending = b.status === 'pending' ? 0 : 1;
    if (aPending !== bPending) return aPending - bPending;
    return new Date(b.submitted_at) - new Date(a.submitted_at);
  });

  const rows = reports.map((r) => ({
    id: r._id,
    reference_no: r.reference_no,
    channel: r.channel,
    pdf_url: r.pdf_url,
    report_pdf_link: r.report_pdf_link || r.pdf_url,
    inspected_at: r.inspected_at,
    submitted_at: r.submitted_at,
    status: r.status,
    decided_at: r.decided_at,
    decision_reason: r.decision_reason,
    filed_by: r.filed_by?._id || r.filed_by,
    lmo_id: r.lmo_id || r.filed_by?._id || r.filed_by,
    officer_name: r.filed_by?.full_name || '—',
    officer_role: r.filed_by?.role || '—',
    decided_by: r.decided_by?._id || r.decided_by || null,
    assistant_controller_id: r.assistant_controller_id || r.decided_by?._id || r.decided_by || null,
    decided_by_name: r.decided_by?.full_name || null,
  }));

  res.json({ reports: rows });
});

/* GET /api/reports/:id */
queueRouter.get('/:id', async (req, res) => {
  const scope = jurisdictionScopeFor(req.user);

  const r = await Report.findOne({ _id: req.params.id, jurisdiction_id: scope.jurisdictionId })
    .populate('filed_by')
    .populate('decided_by')
    .populate('jurisdiction_id')
    .lean();

  if (!r) throw notFound('That report does not exist.');

  res.json({
    report: {
      id: r._id,
      reference_no: r.reference_no,
      channel: r.channel,
      pdf_url: r.pdf_url,
      report_pdf_link: r.report_pdf_link || r.pdf_url,
      inspected_at: r.inspected_at,
      submitted_at: r.submitted_at,
      status: r.status,
      decided_at: r.decided_at,
      decision_reason: r.decision_reason,
      filed_by: r.filed_by?._id || r.filed_by,
      lmo_id: r.lmo_id || r.filed_by?._id || r.filed_by,
      officer_name: r.filed_by?.full_name || '—',
      officer_role: r.filed_by?.role || '—',
      decided_by: r.decided_by?._id || r.decided_by || null,
      assistant_controller_id: r.assistant_controller_id || r.decided_by?._id || r.decided_by || null,
      decided_by_name: r.decided_by?.full_name || null,
      jurisdiction: r.jurisdiction_id?.name || null,
      is_edible: r.is_edible,
      is_imported: r.is_imported,
      listing_url: r.listing_url,
    },
  });
});
