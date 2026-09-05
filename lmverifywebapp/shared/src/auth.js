import jwt from 'jsonwebtoken';
import { ROLES } from './constants.js';
import { AppError, unauthorized, forbidden } from './errors.js';

/** Claim shape jispar dono backends sehmat hain. admin-backend ka issue kiya
 *  token senior-inspector-backend verify karta hai aur ulta bhi — isliye ise
 *  badalna dono services ke liye breaking change hai. */
export function signToken({ userId, role, jurisdictionId, mustChangePassword }, secret, expiresIn = '8h') {
  return jwt.sign(
    { sub: userId, role, jurisdiction_id: jurisdictionId ?? null, mcp: !!mustChangePassword },
    secret,
    { expiresIn },
  );
}

export function verifyToken(token, secret) {
  try {
    return jwt.verify(token, secret);
  } catch {
    throw unauthorized('Your session has expired. Sign in again.');
  }
}

export function authenticate(secret) {
  return (req, _res, next) => {
    const [scheme, token] = (req.headers.authorization || '').split(' ');
    if (scheme !== 'Bearer' || !token) return next(unauthorized());
    try {
      const c = verifyToken(token, secret);
      req.user = { id: c.sub, role: c.role, jurisdictionId: c.jurisdiction_id, mustChangePassword: c.mcp };
      next();
    } catch (err) {
      next(err);
    }
  };
}

export function requireRole(...allowed) {
  return (req, _res, next) => {
    if (!req.user) return next(unauthorized());
    if (!allowed.includes(req.user.role)) return next(forbidden());
    next();
  };
}

/** Jab tak officer apna password set nahi karta, change-password ke alawa har
 *  route band. Section 8: forced password change. */
export function blockUntilPasswordChanged(req, _res, next) {
  if (req.user?.mustChangePassword) {
    return next(new AppError(403, 'PASSWORD_CHANGE_REQUIRED', 'Set your own password before continuing.'));
  }
  next();
}

/** Jurisdiction scoping. Ye value SQL layer tak jaani chahiye — UI filter nahi
 *  hai. CLM sab dekhta hai; baaki sab ek jurisdiction mein bandhe hain. */
export function jurisdictionScopeFor(user) {
  if (!user) throw unauthorized();
  if (user.role === ROLES.CLM) return { all: true, jurisdictionId: null };
  if (!user.jurisdictionId) throw forbidden('Your account has no jurisdiction assigned.');
  return { all: false, jurisdictionId: user.jurisdictionId };
}