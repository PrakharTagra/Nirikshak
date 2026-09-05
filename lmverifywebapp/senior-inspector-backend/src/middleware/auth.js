import {
  authenticate as makeAuthenticate,
  requireRole,
  blockUntilPasswordChanged,
} from '@lm-verify/shared';
import { env } from '../config/env.js';

// Shared helpers secret nahi jaante; is service ka secret yahan ek baar bind
// kar dete hain taaki har route ko yaad na rakhna pade.
export const authenticate = makeAuthenticate(env.jwtSecret);
export { requireRole, blockUntilPasswordChanged };