/**
 * MongoDB Atlas Demo Seed.
 * Seeds realistic officer accounts (AC, DMI, LMO) and test inspection reports.
 *
 * Usage: npm run seed:demo (or npm run db:demo)
 */
import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import dotenv from 'dotenv';
import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';
import { Jurisdiction, User, Report } from '@lm-verify/shared';

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
  console.error('\n❌ ERROR: Neither MONGODB_URI nor DATABASE_URL is set in .env');
  console.error('Please configure your MongoDB Atlas connection string.');
  process.exit(1);
}

const OFFICERS = [
  { username: 'ac.verma',  name: 'S. Verma', role: 'AC',  jur: 'DL-N' },
  { username: 'ac.iyer',   name: 'M. Iyer',  role: 'AC',  jur: 'DL-S' },
  { username: 'dmi.khan',  name: 'A. Khan',  role: 'DMI', jur: 'DL-N' },
  { username: 'dmi.bose',  name: 'R. Bose',  role: 'DMI', jur: 'DL-S' },
  { username: 'lmo.rao',   name: 'P. Rao',   role: 'LMO', jur: 'DL-N' },
  { username: 'lmo.nair',  name: 'K. Nair',  role: 'LMO', jur: 'UP-GZB' },
];

const REJECTION = 'Mandatory declaration absent from the principal display panel.';

const REPORTS = [
  { ref: 'LMV/2026/0041', ch: 'ecommerce', by: 'dmi.khan', brand: 'NutriPick',   days: 2,  status: 'pending' },
  { ref: 'LMV/2026/0040', ch: 'field',     by: 'lmo.rao',  brand: 'Surya',       days: 3,  status: 'approved' },
  { ref: 'LMV/2026/0039', ch: 'ecommerce', by: 'dmi.khan', brand: 'Annapurna',   days: 4,  status: 'rejected', reason: REJECTION },
  { ref: 'LMV/2026/0038', ch: 'field',     by: 'lmo.rao',  brand: 'Gramin',      days: 5,  status: 'rejected', reason: 'Net quantity declared in a non-standard unit.' },
  { ref: 'LMV/2026/0037', ch: 'ecommerce', by: 'dmi.bose', brand: 'Casa Verde',  days: 6,  status: 'pending' },
  { ref: 'LMV/2026/0036', ch: 'field',     by: 'lmo.rao',  brand: 'Doon Valley', days: 7,  status: 'approved' },
  { ref: 'LMV/2026/0035', ch: 'ecommerce', by: 'dmi.khan', brand: 'Hilltop',     days: 8,  status: 'rejected', reason: REJECTION },
  { ref: 'LMV/2026/0034', ch: 'field',     by: 'lmo.rao',  brand: 'Amrit',       days: 9,  status: 'pending' },
  { ref: 'LMV/2026/0033', ch: 'ecommerce', by: 'dmi.bose', brand: 'NutriPick',   days: 10, status: 'approved' },
  { ref: 'LMV/2026/0032', ch: 'field',     by: 'lmo.rao',  brand: 'Spice Root',  days: 11, status: 'pending' },
];

const DECIDER = { 'DL-N': 'ac.verma', 'DL-S': 'ac.iyer', 'UP-GZB': 'ac.verma' };
const daysAgo = (n) => new Date(Date.now() - n * 86_400_000);

async function main() {
  console.log('Connecting to MongoDB Atlas...');
  await mongoose.connect(uri, { serverSelectionTimeoutMS: 8000 });
  console.log('Connected to Atlas.');

  const clm = await User.findOne({ role: 'CLM' }).lean();
  if (!clm) {
    console.error('\n❌ No Controller account found. Run "npm run seed" first to create the base records.');
    process.exit(1);
  }
  const clmId = clm._id;

  const jrows = await Jurisdiction.find({}).lean();
  const jur = Object.fromEntries(jrows.map((j) => [j.code, j._id]));

  const demoPassword = process.env.DEMO_OFFICER_PASSWORD || 'Demo@12345';
  const hash = await bcrypt.hash(demoPassword, 12);
  const ids = {};

  console.log('\nSeeding Demo Officers...');
  for (const o of OFFICERS) {
    let user = await User.findOne({ username: o.username });
    if (!user) {
      user = await User.create({
        username: o.username,
        password_hash: hash,
        full_name: o.name,
        role: o.role,
        jurisdiction_id: jur[o.jur],
        created_by: clmId,
        must_change_password: false,
      });
    } else {
      user.full_name = o.name;
      user.password_hash = hash;
      user.jurisdiction_id = jur[o.jur];
      await user.save();
    }
    ids[o.username] = user._id;
  }

  // Pre-configure specific test account states
  await User.updateOne({ username: 'lmo.nair' }, { $set: { must_change_password: true } });
  await User.updateOne({ username: 'dmi.bose' }, { $set: { status: 'suspended' } });

  console.log('Seeding Demo Inspection Reports...');
  for (const r of REPORTS) {
    const officer = OFFICERS.find((o) => o.username === r.by);
    const decided = r.status !== 'pending';
    const deciderId = ids[DECIDER[officer.jur]];

    await Report.updateOne(
      { reference_no: r.ref },
      {
        $setOnInsert: {
          reference_no: r.ref,
          channel: r.ch,
          filed_by: ids[r.by],
          lmo_id: ids[r.by],
          jurisdiction_id: jur[officer.jur],
          brand: r.brand,
          is_edible: true,
          pdf_url: `https://res.cloudinary.com/lm-verify-demo/${r.ref.replace(/\//g, '-')}.pdf`,
          report_pdf_link: `https://res.cloudinary.com/lm-verify-demo/${r.ref.replace(/\//g, '-')}.pdf`,
          inspected_at: daysAgo(r.days),
          status: r.status,
          decision_reason: r.reason ?? null,
          decided_by: decided ? deciderId : null,
          assistant_controller_id: decided ? deciderId : null,
          decided_at: decided ? daysAgo(r.days - 1) : null,
        },
      },
      { upsert: true },
    );
  }

  const c = await Report.countDocuments();
  console.log(`\n✅ ${OFFICERS.length} demo officers and ${c} sample reports ready in MongoDB Atlas.`);
  console.log(`   Sign in to demo accounts with: ${demoPassword}`);
  console.log('   (Note: K. Nair requires initial password change; R. Bose is suspended for testing.)\n');
}

main()
  .catch((e) => {
    console.error('\n❌ Demo seed failed:', e.message);
    process.exitCode = 1;
  })
  .finally(() => mongoose.disconnect());
