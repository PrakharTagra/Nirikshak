import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import dotenv from 'dotenv';
import mongoose from 'mongoose';

// Load .env from workspace root or current directory
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

console.log('='.repeat(60));
console.log('  MongoDB Atlas Connection Diagnostic Tool');
console.log('='.repeat(60));

if (!uri) {
  console.error('\n❌ ERROR: MONGODB_URI is not set.');
  console.error('\nPlease create or edit your .env file in lmverifywebapp:');
  console.error('  MONGODB_URI=mongodb+srv://<username>:<password>@<cluster>.mongodb.net/lm_verify?retryWrites=true&w=majority\n');
  process.exit(1);
}

// Mask credentials in output
const maskedUri = uri.replace(/\/\/([^:]+):([^@]+)@/, '//$1:****@');
console.log(`\nConnecting to: ${maskedUri}`);

try {
  const conn = await mongoose.connect(uri, {
    serverSelectionTimeoutMS: 5000,
  });

  console.log('✅ Connected successfully to MongoDB Atlas!\n');

  const adminDb = conn.connection.db.admin();
  const pingResult = await adminDb.ping();
  console.log('Ping response:', pingResult);

  const dbName = conn.connection.name;
  console.log(`Target database: ${dbName}`);

  const collections = await conn.connection.db.listCollections().toArray();
  console.log(`Existing collections (${collections.length}):`, collections.map((c) => c.name).join(', ') || '(none)');

  console.log('\n🚀 Atlas connection is healthy and ready for use.\n');
} catch (err) {
  console.error('\n❌ Connection failed:');
  console.error(err.message);
  console.error('\nTips for MongoDB Atlas:');
  console.error(' 1. Check that your IP address is whitelisted in MongoDB Atlas (Network Access -> Add IP Address).');
  console.error(' 2. Verify username and password (Database Access).');
  console.error(' 3. Ensure special characters in password are URL-encoded.');
  process.exitCode = 1;
} finally {
  await mongoose.disconnect();
}
