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

const mongodbUri = process.env.MONGODB_URI || process.env.DATABASE_URL;
if (!mongodbUri) {
  console.error('Missing required environment variable: MONGODB_URI');
  console.error('Configure your MongoDB Atlas connection string in .env:');
  console.error('MONGODB_URI=mongodb+srv://<username>:<password>@<cluster>.mongodb.net/lm_verify?retryWrites=true&w=majority');
  process.exit(1);
}

export const env = {
  role: 'CLM',
  serviceName: 'admin-backend',
  port: Number(process.env.ADMIN_BACKEND_PORT || 4001),
  nodeEnv: process.env.NODE_ENV || 'development',
  databaseUrl: mongodbUri,
  jwtSecret: required('JWT_SECRET'),
  jwtExpiresIn: process.env.JWT_EXPIRES_IN || '8h',
  corsOrigins: [
    process.env.ADMIN_FRONTEND_ORIGIN,
    process.env.SENIOR_INSPECTOR_FRONTEND_ORIGIN,
  ].filter(Boolean),
};