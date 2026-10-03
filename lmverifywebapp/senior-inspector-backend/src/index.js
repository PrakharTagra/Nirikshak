import { createApp } from './app.js';
import { env } from './config/env.js';
import { pool } from './config/db.js';

const server = createApp().listen(env.port, () => {
  console.log(`[${env.serviceName}] ${env.role} API on http://localhost:${env.port}`);
  console.log(`[${env.serviceName}] health: http://localhost:${env.port}/api/health`);
  console.log(`[${env.serviceName}] ping: http://localhost:${env.port}/ping`);

  // Automatic Keep-Alive Self-Pinger (prevents Render free tier from sleeping)
  const keepAliveUrl = process.env.RENDER_EXTERNAL_URL || process.env.KEEP_ALIVE_URL;
  if (keepAliveUrl) {
    const pingTarget = keepAliveUrl.endsWith('/ping') ? keepAliveUrl : `${keepAliveUrl.replace(/\/+$/, '')}/ping`;
    const intervalMinutes = Number(process.env.KEEP_ALIVE_INTERVAL_MINUTES) || 12;
    console.log(`📡 [Keep-Alive] Self-ping active for ${pingTarget} every ${intervalMinutes} minutes`);
    setTimeout(() => {
      const doPing = async () => {
        try {
          const resp = await fetch(pingTarget);
          console.log(`[Keep-Alive] Ping sent to ${pingTarget} -> ${resp.status}`);
        } catch (err) {
          console.warn(`[Keep-Alive] Ping error:`, err.message);
        }
      };
      doPing();
      setInterval(doPing, intervalMinutes * 60 * 1000);
    }, 10000);
  }
});

for (const signal of ['SIGINT', 'SIGTERM']) {
  process.on(signal, () => server.close(() => pool.end().then(() => process.exit(0))));
}