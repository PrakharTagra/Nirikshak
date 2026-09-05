import { Router } from 'express';
import { checkDatabase } from '../config/db.js';
import { env } from '../config/env.js';

export const healthRouter = Router();

healthRouter.get('/', async (_req, res) => {
  const db = await checkDatabase();
  res.status(db.ok ? 200 : 503).json({
    service: env.serviceName,
    role: env.role,
    status: db.ok ? 'ok' : 'degraded',
    database: db,
    time: new Date().toISOString(),
  });
});