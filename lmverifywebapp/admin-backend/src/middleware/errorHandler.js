import { AppError } from '@lm-verify/shared';
import { env } from '../config/env.js';

export function notFoundHandler(req, res) {
  res.status(404).json({
    error: { code: 'NOT_FOUND', message: `No route for ${req.method} ${req.originalUrl}` },
  });
}

// Har service mein ek hi error shape. Frontends error.code par branch karte
// hain, message ke text par kabhi nahi.
export function errorHandler(err, _req, res, _next) {
  if (err instanceof AppError) {
    return res.status(err.status).json({
      error: { code: err.code, message: err.message, details: err.details },
    });
  }
  console.error(err);
  res.status(500).json({
    error: {
      code: 'INTERNAL_ERROR',
      message: 'Something went wrong on our side.',
      ...(env.nodeEnv === 'development' ? { details: err.message } : {}),
    },
  });
}