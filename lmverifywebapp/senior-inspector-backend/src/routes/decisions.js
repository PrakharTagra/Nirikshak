import { Router } from 'express';
import { z } from 'zod';
import {
  badRequest, notFound, reasonRequired, jurisdictionScopeFor,
  STATUSES_REQUIRING_REASON, AppError,
} from '@lm-verify/shared';
import { Report } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const decisionRouter = Router();
decisionRouter.use(authenticate, requireRole('AC'), blockUntilPasswordChanged);

const DECIDABLE_FROM = 'pending';
const ACTION_VERB = { approved: 'approve', rejected: 'reject' };

const decisionSchema = z.object({
  status: z.enum(['approved', 'rejected'], { error: 'Choose approve or reject.' }),
  reason: z.string().trim().max(2000, 'That reason is too long.').optional(),
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

async function loadScoped(reportId, user) {
  const scope = jurisdictionScopeFor(user);
  const report = await Report.findOne({
    $or: [{ _id: reportId }, { reference_no: reportId }, { reportId }],
    jurisdiction_id: scope.jurisdictionId,
  });
  if (!report) throw notFound('That report does not exist.');
  return report;
}

/* POST /api/reports/:id/decision */
decisionRouter.post('/:id/decision', async (req, res) => {
  const { status, reason } = parse(decisionSchema, req.body);
  const report = await loadScoped(req.params.id, req.user);

  if (STATUSES_REQUIRING_REASON.includes(status) && !reason?.trim()) {
    throw reasonRequired(ACTION_VERB[status]);
  }

  if (report.status !== DECIDABLE_FROM) {
    throw new AppError(
      409, 'ALREADY_DECIDED',
      `${report.reference_no || report.reportId} was already ${report.status}. A decision cannot be changed.`,
      { current_status: report.status },
    );
  }

  const updated = await Report.findOneAndUpdate(
    { _id: report._id, status: 'pending' },
    {
      $set: {
        status,
        decision_reason: reason?.trim() || null,
        decided_by: req.user.id,
        assistant_controller_id: req.user.id,
        decided_at: new Date(),
      },
    },
    { new: true },
  );

  if (!updated) {
    throw new AppError(409, 'ALREADY_DECIDED',
      `${report.reference_no} was decided by someone else a moment ago.`);
  }

  res.json({
    report: {
      id: updated._id,
      reference_no: updated.reference_no,
      status: updated.status,
      decision_reason: updated.decision_reason,
      decided_by: updated.decided_by,
      assistant_controller_id: updated.assistant_controller_id || updated.decided_by,
      decided_at: updated.decided_at,
    },
  });
});
