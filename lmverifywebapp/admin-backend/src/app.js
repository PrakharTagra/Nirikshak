import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';

import { env } from './config/env.js';
import { connectDB } from './config/db.js';
import { router } from './routes/index.js';
import { errorHandler, notFoundHandler } from './middleware/errorHandler.js';

export function createApp() {
  const app = express();

  app.set('trust proxy', 1); // rate limit asli client gine, proxy nahi
  app.use(helmet());
  app.use(cors({
    origin: (origin, callback) => {
      if (!origin) return callback(null, true);
      const allowed = env.corsOrigins;
      if (allowed.length === 0 || allowed.includes('*')) return callback(null, true);
      if (allowed.includes(origin)) return callback(null, true);
      // Automatically allow Vercel production and preview deployment URLs
      if (origin.endsWith('.vercel.app')) {
        return callback(null, true);
      }
      return callback(new Error(`Origin ${origin} not allowed by CORS`));
    },
    credentials: true,
  }));
  app.use(express.json({ limit: '2mb' }));
  app.use(morgan(env.nodeEnv === 'development' ? 'dev' : 'combined'));

  // Ensure database is connected in serverless environments
  app.use(async (_req, _res, next) => {
    try {
      await connectDB();
    } catch (err) {
      console.warn('MongoDB connection check:', err.message);
    }
    next();
  });

  // Keep-alive ping routes (health checks - unthrottled)
  app.get(['/ping', '/api/ping', '/api/admin/ping', '/api/clm/ping'], (_req, res) => {
    res.status(200).json({
      status: 'ok',
      message: 'pong',
      service: env.serviceName,
      role: env.role,
      uptimeSeconds: Math.floor(process.uptime()),
      timestamp: new Date().toISOString()
    });
  });

  app.get('/', (_req, res) => {
    res.status(200).json({
      status: 'ok',
      service: env.serviceName,
      role: env.role,
      message: 'CLM Admin Backend is operational'
    });
  });

  app.use(rateLimit({ windowMs: 60_000, limit: 300, standardHeaders: true, legacyHeaders: false }));

  // Support direct, prefixed, and subpath rewrites
  app.use('/api/admin', router);
  app.use('/api/clm', router);
  app.use('/admin', router);
  app.use('/api', router);
  app.use('/', router);

  app.use(notFoundHandler);
  app.use(errorHandler);
  return app;
}
