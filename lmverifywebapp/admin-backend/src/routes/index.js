import { Router } from 'express';
import { healthRouter } from './health.js';
import { authRouter } from './auth.js';
import { accountsRouter } from './accounts.js';
import { referenceRouter } from './reference.js';
import { reportsRouter, dashboardRouter } from './reports.js';
import { exportRouter } from './export.js';

export const router = Router();

router.use('/health', healthRouter);
router.use('/auth', authRouter);
router.use('/accounts', accountsRouter);
router.use('/reports', reportsRouter);
router.use('/dashboard', dashboardRouter);
router.use('/export', exportRouter);
router.use('/', referenceRouter);   // /jurisdictions, /audit-log