import { Router } from 'express';
import bcrypt from 'bcryptjs';
import rateLimit from 'express-rate-limit';
import { z } from 'zod';

import { signToken, badRequest, unauthorized, forbidden, AppError } from '@lm-verify/shared';
import { User } from '../config/db.js';
import { env } from '../config/env.js';
import { authenticate } from '../middleware/auth.js';

export const authRouter = Router();

const loginLimiter = rateLimit({
  windowMs: 15 * 60_000,
  limit: 10,
  standardHeaders: true,
  legacyHeaders: false,
  message: { error: { code: 'TOO_MANY_ATTEMPTS', message: 'Too many sign-in attempts. Try again in a few minutes.' } },
});

const loginSchema = z.object({
  username: z.string({ error: 'Enter your username.' }).trim().min(1, 'Enter your username.'),
  password: z.string({ error: 'Enter your password.' }).min(1, 'Enter your password.'),
});

const changePasswordSchema = z.object({
  current_password: z.string({ error: 'Enter your current password.' }).min(1, 'Enter your current password.'),
  new_password: z.string({ error: 'Enter a new password.' })
    .min(10, 'Use at least 10 characters.')
    .max(200, 'That password is too long.'),
});

function parse(schema, body) {
  const result = schema.safeParse(body);
  if (!result.success) {
    const details = Object.fromEntries(
      result.error.issues.map((i) => [i.path.join('.') || 'form', i.message]),
    );
    throw badRequest('Check the highlighted fields.', details);
  }
  return result.data;
}

const DESIGNATION = {
  CLM: 'Controller of Legal Metrology',
  AC: 'Assistant Controller',
  DMI: 'Digital Marketplace Inspector',
  LMO: 'Legal Metrology Officer (Field)',
};

function publicUser(user) {
  const jurId = user.jurisdiction_id?._id ?? user.jurisdiction_id ?? null;
  const jurName = user.jurisdiction_id?.name ?? user.jurisdiction_name ?? null;
  return {
    id: user._id || user.id,
    username: user.username,
    full_name: user.full_name,
    role: user.role,
    designation: DESIGNATION[user.role] ?? user.role,
    jurisdiction_id: jurId,
    jurisdiction: jurName,
    must_change_password: user.must_change_password,
    status: user.status,
  };
}

/* POST /api/auth/login */
authRouter.post('/login', loginLimiter, async (req, res) => {
  const { username, password } = parse(loginSchema, req.body);

  const user = await User.findOne({ username: username.toLowerCase() }).populate('jurisdiction_id').lean();

  const hash = user?.password_hash ?? '$2a$10$invalidinvalidinvalidinvalidinvalidinvalidinvalidinvalidi';
  const ok = await bcrypt.compare(password, hash);

  if (!user || !ok) throw unauthorized('That username and password do not match.');

  if (user.status === 'suspended') {
    throw new AppError(403, 'ACCOUNT_SUSPENDED', 'This account is suspended. Contact the Controller.');
  }
  if (user.status === 'disabled') {
    throw new AppError(403, 'ACCOUNT_DISABLED', 'This account has been disabled.');
  }

  if (user.role !== 'CLM') {
    throw forbidden('This console is for the Controller of Legal Metrology.');
  }

  await User.updateOne({ _id: user._id }, { $set: { last_login_at: new Date() } });

  const jurisdictionId = user.jurisdiction_id?._id ?? user.jurisdiction_id ?? null;

  const token = signToken({
    userId: user._id,
    role: user.role,
    jurisdictionId,
    mustChangePassword: user.must_change_password,
  }, env.jwtSecret, env.jwtExpiresIn);

  res.json({ token, user: publicUser(user) });
});

/* GET /api/auth/me */
authRouter.get('/me', authenticate, async (req, res) => {
  const user = await User.findById(req.user.id).populate('jurisdiction_id').lean();
  if (!user) throw unauthorized('This account no longer exists.');
  if (user.status !== 'active') {
    throw new AppError(403, 'ACCOUNT_INACTIVE', 'This account is no longer active.');
  }
  res.json({ user: publicUser(user) });
});

/* POST /api/auth/change-password */
authRouter.post('/change-password', authenticate, async (req, res) => {
  const { current_password, new_password } = parse(changePasswordSchema, req.body);

  const user = await User.findById(req.user.id);
  if (!user) throw unauthorized('This account no longer exists.');

  const ok = await bcrypt.compare(current_password, user.password_hash);
  if (!ok) throw badRequest('Check the highlighted fields.', { current_password: 'That is not your current password.' });

  if (await bcrypt.compare(new_password, user.password_hash)) {
    throw badRequest('Check the highlighted fields.', { new_password: 'Choose a password you have not used here before.' });
  }

  const hash = await bcrypt.hash(new_password, 12);
  user.password_hash = hash;
  user.must_change_password = false;
  await user.save();

  const token = signToken({
    userId: user._id,
    role: user.role,
    jurisdictionId: user.jurisdiction_id,
    mustChangePassword: false,
  }, env.jwtSecret, env.jwtExpiresIn);

  const updatedDoc = await User.findById(user._id).populate('jurisdiction_id').lean();
  res.json({ token, user: publicUser(updatedDoc) });
});