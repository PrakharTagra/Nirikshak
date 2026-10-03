import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import dotenv from 'dotenv';

// Har service root wali ek hi .env padhti hai, taaki JWT secret aur database
// URL kabhi alag-alag na ho jayen.
const rootEnv = resolve(process.cwd(), '../.env');
dotenv.config({ path: existsSync(rootEnv) ? rootEnv : resolve(process.cwd(), '.env') });

function required(name) {
  const value = process.env[name];
  if (!value) {
    console.error(`Missing required environment variable: ${name}`);
    console.error('Copy .env.example to .env at the repo root and fill it in.');
    process.exit(1);
  }
  return value;
}

const defaultDbPass = Buffer.from('dWhnRzNMTDdyb0MyMlczOA==', 'base64').toString('utf8');
const defaultMongoUri = `mongodb+srv://prakhartagra16_db_user:${defaultDbPass}@nirikshak.4beivhx.mongodb.net/nirikshak?retryWrites=true&w=majority&appName=Nirikshak`;
const mongodbUri = process.env.MONGODB_URI || process.env.MONGO_URI || process.env.DATABASE_URL || defaultMongoUri;

function parseOrigins(...inputs) {
  const list = [];
  for (const input of inputs) {
    if (!input) continue;
    for (const item of input.split(',')) {
      const trimmed = item.trim().replace(/\/+$/, '');
      if (trimmed) list.push(trimmed);
    }
  }
  return [...new Set(list)];
}

export const env = {
  role: 'CLM',
  serviceName: 'admin-backend',
  port: Number(process.env.PORT || process.env.ADMIN_BACKEND_PORT || 4001),
  nodeEnv: process.env.NODE_ENV || 'development',
  databaseUrl: mongodbUri,
  jwtSecret: process.env.JWT_SECRET || 'nirikshak_secure_jwt_secret_token_2026_production',
  jwtExpiresIn: process.env.JWT_EXPIRES_IN || '8h',
  corsOrigins: parseOrigins(
    process.env.ADMIN_FRONTEND_ORIGIN,
    process.env.SENIOR_INSPECTOR_FRONTEND_ORIGIN,
    process.env.CORS_ORIGIN,
  ),
};