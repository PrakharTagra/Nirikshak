#!/usr/bin/env node
/**
 * Lightweight GitHub Webhook Listener for Auto-Deployment
 * Zero external dependencies (uses native node:http, node:crypto, node:child_process).
 */

import http from 'node:http';
import crypto from 'node:crypto';
import { spawn } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';
import { existsSync, readFileSync } from 'node:fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Load .env if present
const envPath = resolve(__dirname, '../.env');
if (existsSync(envPath)) {
  const content = readFileSync(envPath, 'utf8');
  for (const line of content.split('\n')) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const idx = trimmed.indexOf('=');
    if (idx > 0) {
      const key = trimmed.slice(0, idx).trim();
      const val = trimmed.slice(idx + 1).trim();
      if (!process.env[key]) process.env[key] = val;
    }
  }
}

const PORT = Number(process.env.WEBHOOK_PORT || 4005);
const SECRET = process.env.WEBHOOK_SECRET || '';
const BRANCH = process.env.DEPLOY_BRANCH || 'refs/heads/main';
const SCRIPT_PATH = resolve(__dirname, 'pull-and-restart.sh');

let isDeploying = false;

function verifySignature(body, signatureHeader) {
  if (!SECRET) return true; // If no secret configured, allow (not recommended for prod)
  if (!signatureHeader) return false;

  const hmac = crypto.createHmac('sha256', SECRET);
  const digest = 'sha256=' + hmac.update(body).digest('hex');

  const sigBuffer = Buffer.from(signatureHeader, 'utf8');
  const digestBuffer = Buffer.from(digest, 'utf8');

  if (sigBuffer.length !== digestBuffer.length) return false;
  return crypto.timingSafeEqual(sigBuffer, digestBuffer);
}

function runDeploy() {
  if (isDeploying) {
    console.log('[Webhook] Deployment already in progress. Skipping duplicate run.');
    return;
  }

  isDeploying = true;
  console.log('[Webhook] Triggering automated deployment...');

  const proc = spawn('bash', [SCRIPT_PATH], { stdio: 'inherit' });

  proc.on('close', (code) => {
    isDeploying = false;
    if (code === 0) {
      console.log('[Webhook] Deployment finished successfully!');
    } else {
      console.error(`[Webhook] Deployment failed with exit code ${code}`);
    }
  });

  proc.on('error', (err) => {
    isDeploying = false;
    console.error('[Webhook] Failed to execute deployment script:', err);
  });
}

const server = http.createServer((req, res) => {
  if (req.method === 'GET' && req.url === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    return res.end(JSON.stringify({ status: 'ok', service: 'github-webhook-listener' }));
  }

  if (req.method !== 'POST' || (req.url !== '/' && req.url !== '/deploy-webhook')) {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    return res.end('Not Found');
  }

  const signature = req.headers['x-hub-signature-256'];
  const event = req.headers['x-github-event'];

  let body = '';
  req.on('data', (chunk) => {
    body += chunk;
  });

  req.on('end', () => {
    if (!verifySignature(body, signature)) {
      console.warn('[Webhook] Invalid signature received.');
      res.writeHead(401, { 'Content-Type': 'text/plain' });
      return res.end('Invalid signature');
    }

    if (event === 'ping') {
      console.log('[Webhook] GitHub ping event received. Webhook is connected!');
      res.writeHead(200, { 'Content-Type': 'application/json' });
      return res.end(JSON.stringify({ message: 'Pong! Webhook is verified.' }));
    }

    if (event === 'push') {
      try {
        const payload = JSON.parse(body);
        const ref = payload.ref;
        console.log(`[Webhook] Push event received for ref: ${ref}`);

        if (ref === BRANCH) {
          res.writeHead(200, { 'Content-Type': 'application/json' });
          res.end(JSON.stringify({ message: 'Deployment triggered' }));
          runDeploy();
          return;
        } else {
          console.log(`[Webhook] Ignored push to branch ${ref} (configured for ${BRANCH})`);
          res.writeHead(200, { 'Content-Type': 'application/json' });
          return res.end(JSON.stringify({ message: `Ignored branch: ${ref}` }));
        }
      } catch (err) {
        console.error('[Webhook] Error parsing JSON payload:', err);
        res.writeHead(400, { 'Content-Type': 'text/plain' });
        return res.end('Bad Request');
      }
    }

    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Event ignored');
  });
});

server.listen(PORT, '127.0.0.1', () => {
  console.log(`[Webhook] GitHub Webhook Listener running on http://127.0.0.1:${PORT}`);
});
