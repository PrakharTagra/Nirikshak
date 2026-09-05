import { Router } from 'express';
import { healthRouter } from './health.js';
import { authRouter, inspectorAuthRouter } from './auth.js';
import { queueRouter } from './queue.js';
import { decisionRouter } from './decisions.js';
import { inspectorReportsRouter } from './inspector-reports.js';

export const router = Router();

router.use('/health', healthRouter);

// Ek hi accounts par do darwaze. AC console ACs ko andar leta hai; crawler aur
// field app DMI aur LMO ko. Koi doosre ka use nahi kar sakta.
router.use('/auth', authRouter);
router.use('/inspector/auth', inspectorAuthRouter);

// The inspector applications file reports and read their own back.
router.use('/inspector/reports', inspectorReportsRouter);

// The Assistant Controller's queue and decisions.
router.use('/reports', queueRouter);
router.use('/reports', decisionRouter);
