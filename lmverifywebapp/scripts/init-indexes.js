import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import dotenv from 'dotenv';
import mongoose from 'mongoose';
import { User, Jurisdiction, Report, AdminAuditLog, Rule } from '@lm-verify/shared';

const candidatePaths = [
  resolve(process.cwd(), '.env'),
  resolve(process.cwd(), '../.env'),
  resolve(process.cwd(), 'lmverifywebapp/.env'),
];

for (const p of candidatePaths) {
  if (existsSync(p)) {
    dotenv.config({ path: p });
    break;
  }
}

const uri = process.env.MONGODB_URI || process.env.DATABASE_URL;
if (!uri) {
  console.error('\n❌ ERROR: Neither MONGODB_URI nor DATABASE_URL is set.');
  console.error('Please configure your MongoDB Atlas connection string in .env');
  process.exit(1);
}

try {
  console.log('Connecting to MongoDB Atlas to initialize collection indexes...');
  await mongoose.connect(uri, { serverSelectionTimeoutMS: 8000 });

  console.log('Building MongoDB indexes...');
  await Promise.all([
    User.init(),
    Jurisdiction.init(),
    Report.init(),
    AdminAuditLog.init(),
    Rule.init(),
  ]);

  console.log('✅ All MongoDB indexes created successfully on Atlas collections.');
} catch (err) {
  console.error('❌ Failed to build indexes:', err.message);
  process.exitCode = 1;
} finally {
  await mongoose.disconnect();
}
