import { createApp } from './app.js';
import { env } from './config/env.js';
import { pool } from './config/db.js';

const server = createApp().listen(env.port, () => {
  console.log(`[${env.serviceName}] ${env.role} API on http://localhost:${env.port}`);
  console.log(`[${env.serviceName}] health: http://localhost:${env.port}/api/health`);
});

for (const signal of ['SIGINT', 'SIGTERM']) {
  process.on(signal, () => server.close(() => pool.end().then(() => process.exit(0))));
}