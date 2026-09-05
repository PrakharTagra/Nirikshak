import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import dotenv from 'dotenv';
import mongoose from 'mongoose';
import { User, Jurisdiction, Report, AdminAuditLog, Rule } from '@lm-verify/shared';

const rootEnv = resolve(process.cwd(), '../.env');
dotenv.config({ path: existsSync(rootEnv) ? rootEnv : resolve(process.cwd(), '.env') });

const uri = process.env.MONGODB_URI || process.env.DATABASE_URL;
if (!uri) {
  console.error('Neither MONGODB_URI nor DATABASE_URL is set in .env');
  process.exit(1);
}

await mongoose.connect(uri);
console.log('Building MongoDB indexes...');
await Promise.all([
  User.init(),
  Jurisdiction.init(),
  Report.init(),
  AdminAuditLog.init(),
  Rule.init(),
]);
console.log('MongoDB indexes created successfully.');
await mongoose.disconnect();
