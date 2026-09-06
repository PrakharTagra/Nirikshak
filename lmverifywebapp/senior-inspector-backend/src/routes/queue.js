import { Router } from 'express';
import { notFound, jurisdictionScopeFor } from '@lm-verify/shared';
import { Report, User } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const queueRouter = Router();
queueRouter.use(authenticate, requireRole('AC'), blockUntilPasswordChanged);

const STATUSES = ['pending', 'approved', 'rejected'];
const CHANNELS = ['ecommerce', 'field'];

/* GET /api/reports/lmos - List all LMOs in the AC's jurisdiction with their pending report counts */
queueRouter.get('/lmos', async (req, res) => {
  const scope = jurisdictionScopeFor(req.user);

  // 1. Fetch all active field officers (LMO / DMI) registered in this jurisdiction
  const lmos = await User.find({
    jurisdiction_id: scope.jurisdictionId,
    role: { $in: ['LMO', 'DMI'] },
    status: { $ne: 'disabled' },
  })
    .select('_id full_name username phone email role status')
    .sort({ full_name: 1 })
    .lean();

  // 2. Aggregate reports counts grouped by submitting officer (filed_by)
  const stats = await Report.aggregate([
    { $match: { jurisdiction_id: scope.jurisdictionId } },
    {
      $group: {
        _id: '$filed_by',
        total: { $sum: 1 },
        pending: { $sum: { $cond: [{ $eq: ['$status', 'pending'] }, 1, 0] } },
        approved: { $sum: { $cond: [{ $eq: ['$status', 'approved'] }, 1, 0] } },
        rejected: { $sum: { $cond: [{ $eq: ['$status', 'rejected'] }, 1, 0] } },
        latest_submitted: { $max: '$submitted_at' },
      },
    },
  ]);

  const statMap = new Map();
  for (const s of stats) {
    if (s._id) statMap.set(String(s._id), s);
  }

  let totalJurisdictionPending = 0;
  let totalJurisdictionReports = 0;

  const officers = lmos.map((o) => {
    const s = statMap.get(String(o._id)) || {
      total: 0,
      pending: 0,
      approved: 0,
      rejected: 0,
      latest_submitted: null,
    };
    totalJurisdictionPending += s.pending;
    totalJurisdictionReports += s.total;

    return {
      id: o._id,
      full_name: o.full_name,
      username: o.username,
      role: o.role,
      phone: o.phone,
      email: o.email,
      status: o.status,
      pending_count: s.pending,
      total_count: s.total,
      approved_count: s.approved,
      rejected_count: s.rejected,
      latest_submitted: s.latest_submitted,
    };
  });

  // Also count any pending reports whose filed_by might not match an existing user record
  const unassignedCounts = await Report.countDocuments({
    jurisdiction_id: scope.jurisdictionId,
    status: 'pending',
  });

  res.json({
    officers,
    summary: {
      total_lmos: officers.length,
      total_pending: unassignedCounts, // Entire outside pending queue for the region
      total_reports: totalJurisdictionReports,
    },
  });
});

/* GET /api/reports */
queueRouter.get('/', async (req, res) => {
  const scope = jurisdictionScopeFor(req.user);
  const { status, channel, search, officer_id } = req.query;

  const filter = { jurisdiction_id: scope.jurisdictionId };

  const wanted = String(status ?? '').split(',').map((s) => s.trim()).filter((s) => STATUSES.includes(s));
  if (wanted.length === 1) filter.status = wanted[0];
  else if (wanted.length > 1) filter.status = { $in: wanted };

  if (CHANNELS.includes(channel)) filter.channel = channel;

  if (officer_id && officer_id !== 'all') {
    filter.$or = [
      { filed_by: officer_id },
      { lmo_id: officer_id },
    ];
  }

  if (search?.trim()) {
    const s = search.trim();
    const matchedOfficers = await User.find(
      { full_name: { $regex: s, $options: 'i' } },
      { _id: 1 },
    ).lean();
    const officerIds = matchedOfficers.map((o) => o._id);

    const searchConditions = [
      { reference_no: { $regex: s, $options: 'i' } },
      { reportId: { $regex: s, $options: 'i' } },
      { product_name: { $regex: s, $options: 'i' } },
      { productName: { $regex: s, $options: 'i' } },
      { filed_by: { $in: officerIds } },
    ];

    if (filter.$or) {
      filter.$and = [{ $or: filter.$or }, { $or: searchConditions }];
      delete filter.$or;
    } else {
      filter.$or = searchConditions;
    }
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
    return new Date(b.submitted_at || b.created_at || 0) - new Date(a.submitted_at || a.created_at || 0);
  });

  const rows = reports.map((r) => ({
    id: r._id,
    reference_no: r.reference_no || r.reportId || String(r._id),
    reportId: r.reportId || r.reference_no,
    product_name: r.product_name || r.productName || 'Packaged Commodity',
    compliance_result: r.compliance_result || r.complianceResult || r.assessmentStatus || null,
    channel: r.channel || 'field',
    pdf_url: r.pdf_url || r.pdfUrl || r.report_pdf_link || r.cloudinaryUrl,
    report_pdf_link: r.report_pdf_link || r.pdf_url || r.pdfUrl || r.cloudinaryUrl,
    inspected_at: r.inspected_at || r.submitted_at || r.created_at,
    submitted_at: r.submitted_at || r.created_at,
    status: r.status,
    decided_at: r.decided_at,
    decision_reason: r.decision_reason,
    filed_by: r.filed_by?._id || r.filed_by || r.lmo_id,
    lmo_id: r.lmo_id || r.filed_by?._id || r.filed_by,
    officer_name: r.filed_by?.full_name || '—',
    officer_role: r.filed_by?.role || 'LMO',
    decided_by: r.decided_by?._id || r.decided_by || null,
    assistant_controller_id: r.assistant_controller_id || r.decided_by?._id || r.decided_by || null,
    decided_by_name: r.decided_by?.full_name || null,
  }));

  res.json({ reports: rows });
});

/* GET /api/reports/:id */
queueRouter.get('/:id', async (req, res) => {
  const scope = jurisdictionScopeFor(req.user);

  const r = await Report.findOne({
    $or: [{ _id: req.params.id }, { reference_no: req.params.id }, { reportId: req.params.id }],
    jurisdiction_id: scope.jurisdictionId,
  })
    .populate('filed_by')
    .populate('decided_by')
    .populate('jurisdiction_id')
    .lean();

  if (!r) throw notFound('That report does not exist.');

  res.json({
    report: {
      id: r._id,
      reference_no: r.reference_no || r.reportId || String(r._id),
      reportId: r.reportId || r.reference_no,
      product_name: r.product_name || r.productName || 'Packaged Commodity',
      compliance_result: r.compliance_result || r.complianceResult || r.assessmentStatus || null,
      channel: r.channel || 'field',
      pdf_url: r.pdf_url || r.pdfUrl || r.report_pdf_link || r.cloudinaryUrl,
      report_pdf_link: r.report_pdf_link || r.pdf_url || r.pdfUrl || r.cloudinaryUrl,
      inspected_at: r.inspected_at || r.submitted_at,
      submitted_at: r.submitted_at,
      status: r.status,
      decided_at: r.decided_at,
      decision_reason: r.decision_reason,
      filed_by: r.filed_by?._id || r.filed_by || r.lmo_id,
      lmo_id: r.lmo_id || r.filed_by?._id || r.filed_by,
      officer_name: r.filed_by?.full_name || '—',
      officer_role: r.filed_by?.role || 'LMO',
      decided_by: r.decided_by?._id || r.decided_by || null,
      assistant_controller_id: r.assistant_controller_id || r.decided_by?._id || r.decided_by || null,
      decided_by_name: r.decided_by?.full_name || null,
      jurisdiction: r.jurisdiction_id?.name || null,
      is_edible: r.is_edible,
      is_imported: r.is_imported,
      listing_url: r.listing_url,
      preprocessedImages: r.preprocessedImages || [],
      evidenceImages: r.evidenceImages || [],
      cloudinaryUrl: r.cloudinaryUrl || null,
      directPdfUrl: r.directPdfUrl || null,
    },
  });
});
