import { Router } from 'express';
import { notFound } from '@lm-verify/shared';
import { Report, User } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const reportsRouter = Router();
export const dashboardRouter = Router();

reportsRouter.use(authenticate, requireRole('CLM'), blockUntilPasswordChanged);
dashboardRouter.use(authenticate, requireRole('CLM'), blockUntilPasswordChanged);

const STATUSES = ['pending', 'approved', 'rejected'];
const CHANNELS = ['ecommerce', 'field'];

/* GET /api/reports?status=&channel=&officerId=&search= */
reportsRouter.get('/', async (req, res) => {
  const { status, channel, officerId, search } = req.query;

  const query = {};

  if (STATUSES.includes(status)) query.status = status;
  if (CHANNELS.includes(channel)) query.channel = channel;
  if (officerId && officerId !== 'all') query.filed_by = officerId;

  if (search?.trim()) {
    const s = search.trim();
    const matchedOfficers = await User.find(
      { full_name: { $regex: s, $options: 'i' } },
      { _id: 1 },
    ).lean();
    const officerIds = matchedOfficers.map((o) => o._id);

    query.$or = [
      { reference_no: { $regex: s, $options: 'i' } },
      { filed_by: { $in: officerIds } },
    ];
  }

  const reports = await Report.find(query)
    .populate('filed_by')
    .populate('decided_by')
    .populate('jurisdiction_id')
    .sort({ inspected_at: -1 })
    .limit(500)
    .lean();

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
    product_name: r.product_name || r.productName || null,
    brand: r.brand || null,
    category: r.category || null,
    listing_url: r.listing_url || null,
    compliance_result: r.compliance_result || r.complianceResult || null,
    summary: r.summary || {},
    declared_values: r.declared_values || {},
    decided_by: r.decided_by?._id || r.decided_by || null,
    assistant_controller_id: r.assistant_controller_id || r.decided_by?._id || r.decided_by || null,
    decided_by_name: r.decided_by?.full_name || null,
    jurisdiction: r.jurisdiction_id?.name || null,
  }));

  res.json({ reports: rows });
});

/* GET /api/reports/:id */
reportsRouter.get('/:id', async (req, res) => {
  const r = await Report.findById(req.params.id)
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
      jurisdiction_code: r.jurisdiction_id?.code || null,
      product_name: r.product_name || r.productName || null,
      brand: r.brand || null,
      category: r.category || null,
      compliance_result: r.compliance_result || r.complianceResult || null,
      summary: r.summary || {},
      declared_values: r.declared_values || {},
      evidenceImages: r.evidenceImages || [],
      is_edible: r.is_edible,
      is_imported: r.is_imported,
      listing_url: r.listing_url,
    },
  });
});

/* GET /api/dashboard */
dashboardRouter.get('/', async (_req, res) => {
  const [statusCounts, channelCounts, inspectors, controllers, pendingSetup] = await Promise.all([
    Report.aggregate([
      { $group: { _id: '$status', n: { $sum: 1 } } },
    ]),
    Report.aggregate([
      { $group: { _id: '$channel', n: { $sum: 1 } } },
    ]),
    User.find({ role: { $in: ['DMI', 'LMO'] } }).sort({ full_name: 1 }).lean(),
    User.find({ role: 'AC' }).sort({ full_name: 1 }).lean(),
    User.countDocuments({ must_change_password: true, role: { $ne: 'CLM' } }),
  ]);

  const filedCounts = await Report.aggregate([
    { $group: { _id: '$filed_by', count: { $sum: 1 } } },
  ]);
  const filedMap = Object.fromEntries(filedCounts.map((f) => [String(f._id), f.count]));

  const decidedStats = await Report.aggregate([
    { $match: { decided_by: { $ne: null } } },
    {
      $group: {
        _id: '$decided_by',
        n: { $sum: 1 },
        rejected: {
          $sum: { $cond: [{ $eq: ['$status', 'rejected'] }, 1, 0] },
        },
      },
    },
  ]);
  const decidedMap = Object.fromEntries(decidedStats.map((d) => [String(d._id), d]));

  const byStatus = Object.fromEntries(STATUSES.map((s) => [s, 0]));
  for (const r of statusCounts) {
    if (byStatus[r._id] !== undefined) byStatus[r._id] = r.n;
  }

  const byChannel = { ecommerce: 0, field: 0 };
  for (const r of channelCounts) {
    if (byChannel[r._id] !== undefined) byChannel[r._id] = r.n;
  }

  const total = Object.values(byStatus).reduce((a, b) => a + b, 0);

  res.json({
    total,
    byStatus,
    byChannel,
    inspectors: inspectors.map((u) => ({
      id: u._id,
      full_name: u.full_name,
      role: u.role,
      filed: filedMap[String(u._id)] || 0,
    })),
    controllers: controllers.map((u) => ({
      id: u._id,
      full_name: u.full_name,
      decided: decidedMap[String(u._id)]?.n || 0,
      rejected: decidedMap[String(u._id)]?.rejected || 0,
    })),
    awaitingDecision: byStatus.pending,
    pendingAccountSetup: pendingSetup,
  });
});
