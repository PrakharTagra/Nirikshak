import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import rateLimit from 'express-rate-limit';

import { env } from './config/env.js';
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
      if (allowed.some((o) => o.includes('.vercel.app')) && origin.endsWith('.vercel.app')) {
        return callback(null, true);
      }
      return callback(new Error(`Origin ${origin} not allowed by CORS`));
    },
    credentials: true,
  }));
  app.use(express.json({ limit: '2mb' }));
  app.use(morgan(env.nodeEnv === 'development' ? 'dev' : 'combined'));
  app.use(rateLimit({ windowMs: 60_000, limit: 300, standardHeaders: true, legacyHeaders: false }));

  app.use('/api', router);

  app.use(notFoundHandler);
  app.use(errorHandler);
  return app;
}