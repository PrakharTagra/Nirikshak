import { Router } from 'express';
import bcrypt from 'bcryptjs';
import { z } from 'zod';

import { badRequest, notFound, conflict, forbidden, AppError, generateTemporaryPassword } from '@lm-verify/shared';
import { User, Jurisdiction, Report, AdminAuditLog, withTransaction } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const accountsRouter = Router();

accountsRouter.use(authenticate, requireRole('CLM'), blockUntilPasswordChanged);

const DESIGNATION = {
  CLM: 'Controller of Legal Metrology',
  AC: 'Assistant Controller',
  DMI: 'Digital Marketplace Inspector',
  LMO: 'Legal Metrology Officer (Field)',
};

const ISSUABLE_ROLES = ['AC', 'DMI', 'LMO'];

const createSchema = z.object({
  full_name: z.string({ error: 'Enter the officer’s name.' }).trim().min(2, 'Enter the officer’s name.'),
  username: z.string({ error: 'Enter a username.' }).trim().toLowerCase()
    .regex(/^[a-z0-9.]{3,40}$/, 'Use lowercase letters, numbers and dots, 3 to 40 characters.'),
  role: z.enum(ISSUABLE_ROLES, { error: 'Choose a designation.' }),
  jurisdiction_id: z.string({ error: 'Choose a jurisdiction.' }).min(1, 'Choose a jurisdiction.'),
  email: z.string().email('Enter a valid email address.').optional().or(z.literal('')),
  phone: z.string().max(20, 'That phone number is too long.').optional().or(z.literal('')),
  password: z.string().min(6, 'Password must be at least 6 characters.').optional().or(z.literal('')),
});

const statusSchema = z.object({
  status: z.enum(['active', 'suspended', 'disabled'], { error: 'Choose a valid account status.' }),
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

const generatePassword = generateTemporaryPassword;

/* GET /api/accounts */
accountsRouter.get('/', async (_req, res) => {
  const [officers, filedCounts, decidedCounts] = await Promise.all([
    User.find({ role: { $ne: 'CLM' } }).populate('jurisdiction_id').sort({ role: 1, full_name: 1 }).lean(),
    Report.aggregate([
      { $group: { _id: '$filed_by', count: { $sum: 1 } } },
    ]),
    Report.aggregate([
      { $match: { decided_by: { $ne: null } } },
      { $group: { _id: '$decided_by', count: { $sum: 1 } } },
    ]),
  ]);

  const filedMap = Object.fromEntries(filedCounts.map((f) => [String(f._id), f.count]));
  const decidedMap = Object.fromEntries(decidedCounts.map((d) => [String(d._id), d.count]));

  const rows = officers.map((u) => ({
    id: u._id,
    username: u.username,
    full_name: u.full_name,
    role: u.role,
    email: u.email,
    phone: u.phone,
    status: u.status,
    must_change_password: u.must_change_password,
    last_login_at: u.last_login_at,
    jurisdiction_id: u.jurisdiction_id?._id || u.jurisdiction_id,
    jurisdiction: u.jurisdiction_id?.name || null,
    filed: filedMap[String(u._id)] || 0,
    decided: decidedMap[String(u._id)] || 0,
    designation: DESIGNATION[u.role],
  }));

  res.json({ officers: rows });
});

/* POST /api/accounts */
accountsRouter.post('/', async (req, res) => {
  const data = parse(createSchema, req.body);

  const taken = await User.findOne({ username: data.username }).lean();
  if (taken) throw conflict('That username is already in use.', { username: 'That username is already in use.' });

  const j = await Jurisdiction.findById(data.jurisdiction_id).lean();
  if (!j) throw badRequest('Check the highlighted fields.', { jurisdiction_id: 'That jurisdiction does not exist.' });

  let reportsTo = req.user.id;
  if (data.role === 'DMI' || data.role === 'LMO') {
    const ac = await User.findOne({
      role: 'AC',
      jurisdiction_id: data.jurisdiction_id,
      status: 'active',
    }).sort({ created_at: 1 }).lean();

    if (ac) {
      reportsTo = ac._id;
    } else {
      // If no AC exists in this jurisdiction yet, assign directly under CLM so provisioning succeeds
      reportsTo = req.user.id;
    }
  }

  const customPasswordProvided = Boolean(data.password && data.password.trim());
  const password = customPasswordProvided ? data.password.trim() : generatePassword();
  const hash = await bcrypt.hash(password, 12);

  const created = await withTransaction(async (session) => {
    const [user] = await User.create([{
      username: data.username,
      password_hash: hash,
      full_name: data.full_name,
      role: data.role,
      email: data.email || null,
      phone: data.phone || null,
      jurisdiction_id: data.jurisdiction_id,
      reports_to: reportsTo,
      created_by: req.user.id,
      must_change_password: !customPasswordProvided,
    }], session ? { session } : {});

    await AdminAuditLog.create([{
      actor_id: req.user.id,
      action: 'account.created',
      target_user_id: user._id,
      details: { role: user.role, username: user.username },
    }], session ? { session } : {});

    return user;
  });

  res.status(201).json({
    officer: {
      id: created._id,
      username: created.username,
      full_name: created.full_name,
      role: created.role,
      email: created.email,
      phone: created.phone,
      jurisdiction_id: created.jurisdiction_id,
      status: created.status,
      must_change_password: created.must_change_password,
      created_at: created.created_at,
      designation: DESIGNATION[created.role],
    },
    temporary_password: password,
  });
});

/* PATCH /api/accounts/:id/status */
accountsRouter.patch('/:id/status', async (req, res) => {
  const { status } = parse(statusSchema, req.body);

  const target = await User.findById(req.params.id);
  if (!target) throw notFound('That account does not exist.');
  if (target.role === 'CLM') throw forbidden('A Controller account cannot be changed from here.');
  if (target.status === status) {
    throw new AppError(409, 'NO_CHANGE', `That account is already ${status}.`);
  }

  const prevStatus = target.status;
  target.status = status;

  await withTransaction(async (session) => {
    await target.save(session ? { session } : {});
    await AdminAuditLog.create([{
      actor_id: req.user.id,
      action: `account.${status}`,
      target_user_id: target._id,
      details: { from: prevStatus, to: status },
    }], session ? { session } : {});
  });

  res.json({
    officer: {
      id: target._id,
      username: target.username,
      full_name: target.full_name,
      role: target.role,
      status: target.status,
      must_change_password: target.must_change_password,
      designation: DESIGNATION[target.role],
    },
  });
});

/* POST /api/accounts/:id/reset-password */
accountsRouter.post('/:id/reset-password', async (req, res) => {
  const target = await User.findById(req.params.id);
  if (!target) throw notFound('That account does not exist.');
  if (target.role === 'CLM') throw forbidden('A Controller password cannot be reset from here.');

  const password = generatePassword();
  const hash = await bcrypt.hash(password, 12);

  target.password_hash = hash;
  target.must_change_password = true;

  await withTransaction(async (session) => {
    await target.save(session ? { session } : {});
    await AdminAuditLog.create([{
      actor_id: req.user.id,
      action: 'password.reset',
      target_user_id: target._id,
      details: {},
    }], session ? { session } : {});
  });

  res.json({
    officer: { id: target._id, username: target.username, full_name: target.full_name },
    temporary_password: password,
  });
});