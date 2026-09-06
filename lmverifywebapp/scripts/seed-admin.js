/**
 * Dedicated Admin (CLM Controller) Seed & Reset Script for MongoDB Atlas
 *
 * Usage:
 *   npm run seed:admin
 *   node scripts/seed-admin.js [username] [password] [fullName]
 *
 * Examples:
 *   node scripts/seed-admin.js clm.admin Admin@12345 "Chief Controller"
 *   node scripts/seed-admin.js --reset
 */

import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import dotenv from 'dotenv';
import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';
import { User } from '@lm-verify/shared';

// Load .env
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
  console.error('\n❌ ERROR: MONGODB_URI is not set in your .env file.');
  console.error('Please configure your MongoDB Atlas connection string:');
  console.error('  MONGODB_URI=mongodb+srv://<username>:<password>@<cluster>.mongodb.net/lm_verify?retryWrites=true&w=majority\n');
  process.exit(1);
}

// Parse command line arguments
const args = process.argv.slice(2).filter((a) => !a.startsWith('--'));
const flags = process.argv.slice(2).filter((a) => a.startsWith('--'));
const isResetRequested = flags.includes('--reset') || flags.includes('-r');

const username = (args[0] || process.env.SEED_CLM_USERNAME || 'clm.admin').trim().toLowerCase();
const password = args[1] || process.env.SEED_CLM_PASSWORD || 'Admin@12345';
const fullName = args[2] || process.env.SEED_CLM_NAME || 'Controller of Legal Metrology';

console.log('='.repeat(65));
console.log('  MongoDB Atlas — Administrator (CLM) Provisioning Tool');
console.log('='.repeat(65));

async function run() {
  console.log('\nConnecting to MongoDB Atlas...');
  await mongoose.connect(uri, { serverSelectionTimeoutMS: 8000 });
  console.log(`Connected to database: "${mongoose.connection.name}"`);

  // Check if this username or any CLM already exists
  let existingUser = await User.findOne({ username });
  if (!existingUser) {
    existingUser = await User.findOne({ role: 'CLM' });
  }

  const saltRounds = 12;
  const passwordHash = await bcrypt.hash(password, saltRounds);

  if (existingUser) {
    console.log(`\nExisting administrator found: "${existingUser.username}" (${existingUser.full_name})`);

    // Update the existing administrator account
    existingUser.username = username;
    existingUser.password_hash = passwordHash;
    existingUser.full_name = fullName;
    existingUser.role = 'CLM';
    existingUser.status = 'active';
    existingUser.must_change_password = false; // Allow immediate login
    existingUser.jurisdiction_id = null; // CLM has statewide/national scope
    await existingUser.save();

    console.log('✅ Administrator account updated and password reset successfully!');
  } else {
    // Create new administrator account
    await User.create({
      username,
      password_hash: passwordHash,
      full_name: fullName,
      role: 'CLM',
      jurisdiction_id: null,
      status: 'active',
      must_change_password: false,
    });

    console.log('✅ New administrator account created successfully!');
  }

  console.log('\n' + '-'.repeat(65));
  console.log('  ADMIN CREDENTIALS FOR ATLAS:');
  console.log('-'.repeat(65));
  console.log(`  Portal URL:  http://localhost:5171`);
  console.log(`  Username:    ${username}`);
  console.log(`  Password:    ${password}`);
  console.log(`  Role:        CLM (Controller of Legal Metrology)`);
  console.log(`  Status:      Active`);
  console.log('-'.repeat(65));
  console.log('\nYou can now log in directly to the Admin Portal with these credentials.\n');
}

run()
  .catch((err) => {
    console.error('\n❌ Admin seed failed:', err.message);
    process.exitCode = 1;
  })
  .finally(async () => {
    await mongoose.disconnect();
  });
