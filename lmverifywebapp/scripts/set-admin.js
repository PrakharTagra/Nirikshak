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
  console.error('\n❌ ERROR: MONGODB_URI is not set in .env');
  process.exit(1);
}

const args = process.argv.slice(2);
const username = (args[0] || 'prakhar.admin').trim().toLowerCase();
const password = args[1] || 'Prakhar@160206';
const email = args[2] || 'prakhartagra16@gmail.com';
const phone = args[3] || '8595752706';
const fullName = args[4] || 'Prakhar Tagra';

async function updateAdmin() {
  console.log('Connecting to MongoDB Atlas...');
  await mongoose.connect(uri);

  const saltRounds = 12;
  const passwordHash = await bcrypt.hash(password, saltRounds);

  // Find existing CLM user or user with this username
  let user = await User.findOne({ $or: [{ username }, { role: 'CLM' }] });

  if (user) {
    user.username = username;
    user.password_hash = passwordHash;
    user.full_name = fullName;
    user.email = email;
    user.phone = phone;
    user.role = 'CLM';
    user.status = 'active';
    user.must_change_password = false;
    await user.save();
    console.log(`\n✅ Successfully updated existing admin (${user.username})!`);
  } else {
    user = await User.create({
      username,
      password_hash: passwordHash,
      full_name: fullName,
      email,
      phone,
      role: 'CLM',
      status: 'active',
      must_change_password: false,
    });
    console.log(`\n✅ Successfully created new admin (${user.username})!`);
  }

  console.log('----------------------------------------------------');
  console.log(`  Username:   ${user.username}`);
  console.log(`  Email:      ${user.email}`);
  console.log(`  Phone:      ${user.phone}`);
  console.log(`  Full Name:  ${user.full_name}`);
  console.log(`  Role:       ${user.role}`);
  console.log(`  Status:     ${user.status}`);
  console.log('----------------------------------------------------');
  console.log('\nYou can now log in immediately with your new credentials.\n');
}

updateAdmin()
  .catch((err) => {
    console.error('❌ Failed to update admin:', err);
    process.exitCode = 1;
  })
  .finally(async () => {
    await mongoose.disconnect();
  });
