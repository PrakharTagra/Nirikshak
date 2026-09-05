import { Router } from 'express';
import { Jurisdiction, AdminAuditLog } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const referenceRouter = Router();
referenceRouter.use(authenticate, requireRole('CLM'), blockUntilPasswordChanged);

/* GET /api/jurisdictions */
referenceRouter.get('/jurisdictions', async (_req, res) => {
  const rows = await Jurisdiction.find({}).sort({ name: 1 }).lean();
  res.json({
    jurisdictions: rows.map((j) => ({
      id: j._id,
      code: j.code,
      name: j.name,
    })),
  });
});

/* GET /api/audit-log */
referenceRouter.get('/audit-log', async (req, res) => {
  const limit = Math.min(Number(req.query.limit) || 100, 500);
  const rows = await AdminAuditLog.find({})
    .populate('actor_id')
    .populate('target_user_id')
    .sort({ created_at: -1 })
    .limit(limit)
    .lean();

  res.json({
    entries: rows.map((r) => ({
      id: r._id,
      action: r.action,
      actor: r.actor_id?.full_name || '—',
      target: r.target_user_id ? `${r.target_user_id.full_name} (${r.target_user_id.role})` : '—',
      details: r.details,
      created_at: r.created_at,
    })),
  });
});