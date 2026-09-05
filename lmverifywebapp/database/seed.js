/**
 * Bootstrap. Jurisdictions, Rules aur pehla Controller account banata hai.
 *
 * Public signup nahi hai, aur CLM baaki har account banata hai — to pehla CLM
 * API se ban hi nahi sakta. Woh yahan se banta hai, terminal se, jiske paas
 * database access hai.
 *
 * Run:  npm run seed
 *
 * Do baar chalane par bhi safe: maujooda Controller ko overwrite nahi karega.
 */
import { existsSync } from 'node:fs';
import { resolve } from 'node:path';
import { randomBytes } from 'node:crypto';
import dotenv from 'dotenv';
import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';
import { Jurisdiction, User, Rule } from '@lm-verify/shared';

const rootEnv = resolve(process.cwd(), '../.env');
dotenv.config({ path: existsSync(rootEnv) ? rootEnv : resolve(process.cwd(), '.env') });

const uri = process.env.MONGODB_URI || process.env.DATABASE_URL;
if (!uri) {
  console.error('Neither MONGODB_URI nor DATABASE_URL is set in .env');
  process.exit(1);
}

const JURISDICTIONS = [
  { code: 'DL-N', name: 'Delhi North' },
  { code: 'DL-S', name: 'Delhi South' },
  { code: 'UP-GZB', name: 'Ghaziabad' },
];

const RULES = [
  { _id: 'MANUFACTURER_DETAILS', label: 'Name and address of manufacturer / packer / importer', rule_ref: 'LMPC 2011 r.6(1)(a)', applies_to: 'all', sort_order: 1 },
  { _id: 'COMMODITY_NAME',       label: 'Common or generic name of the commodity',               'rule_ref': 'LMPC 2011 r.6(1)(b)', applies_to: 'all', sort_order: 2 },
  { _id: 'NET_QUANTITY',         label: 'Net quantity in standard units',                        'rule_ref': 'LMPC 2011 r.6(1)(c)', applies_to: 'all', sort_order: 3 },
  { _id: 'MANUFACTURE_DATE',     label: 'Month and year of manufacture / packing / import',      'rule_ref': 'LMPC 2011 r.6(1)(d)', applies_to: 'all', sort_order: 4 },
  { _id: 'RETAIL_SALE_PRICE',    label: 'Retail sale price, MRP inclusive of all taxes',         'rule_ref': 'LMPC 2011 r.6(1)(e)', applies_to: 'all', sort_order: 5 },
  { _id: 'CONSUMER_CARE',        label: 'Consumer care name, address, phone, email',             'rule_ref': 'LMPC 2011 r.6(1)(f)', applies_to: 'all', sort_order: 6 },
  { _id: 'COUNTRY_OF_ORIGIN',    label: 'Country of origin',                                     'rule_ref': 'LMPC 2011 r.6',       applies_to: 'imported_only', sort_order: 7 },
  { _id: 'BEST_BEFORE',          label: 'Best before / use by date',                             'rule_ref': 'LMPC 2011 r.6',       applies_to: 'edible_only', sort_order: 8 },
  { _id: 'BATCH_NUMBER',         label: 'Batch / lot / code number',                             'rule_ref': 'LMPC 2011 r.6',       applies_to: 'all', sort_order: 9 },
  { _id: 'LEGIBILITY_CONTRAST',  label: 'Legible and printed in a contrasting colour',           'rule_ref': 'LMPC 2011 r.8',       applies_to: 'all', sort_order: 10 },
  { _id: 'MIN_CHARACTER_HEIGHT', label: 'Numerals and letters meet minimum height',              'rule_ref': 'LMPC 2011 r.9',       applies_to: 'all', sort_order: 11 },
  { _id: 'UNIT_SYMBOLS',         label: 'Correct unit symbols used for net quantity',            'rule_ref': 'LMPC 2011 r.10',      applies_to: 'all', sort_order: 12 },
];

const CLM_USERNAME = process.env.SEED_CLM_USERNAME || 'clm.admin';
const CLM_NAME = process.env.SEED_CLM_NAME || 'Controller (Seed Account)';

const ALPHABET = 'abcdefghjkmnpqrstuvwxyzACDEFGHJKLMNPQRTUVWXY346789';

function generatePassword(length = 12) {
  const bytes = randomBytes(length * 2);
  const limit = 256 - (256 % ALPHABET.length);
  let out = '';
  for (let i = 0; out.length < length; i += 1) {
    if (bytes[i] < limit) out += ALPHABET[bytes[i] % ALPHABET.length];
  }
  return out.replace(/(.{4})(?=.)/g, '$1-');
}

async function main() {
  await mongoose.connect(uri);

  for (const j of JURISDICTIONS) {
    await Jurisdiction.updateOne(
      { code: j.code },
      { $setOnInsert: { code: j.code, name: j.name } },
      { upsert: true },
    );
  }
  const js = await Jurisdiction.find({}, { code: 1 }).sort({ code: 1 }).lean();
  console.log(`Jurisdictions ready: ${js.map((j) => j.code).join(', ')}`);

  for (const r of RULES) {
    await Rule.updateOne(
      { _id: r._id },
      { $set: r },
      { upsert: true },
    );
  }
  console.log(`Rules ready: ${RULES.length} rules.`);

  const existing = await User.findOne({ role: 'CLM' }).lean();
  if (existing) {
    console.log(`\nA Controller already exists: ${existing.username}`);
    console.log('Nothing else to do. Delete that document first if you need to start over.');
    return;
  }

  const password = process.env.SEED_CLM_PASSWORD || generatePassword();
  const hash = await bcrypt.hash(password, 12);

  await User.create({
    username: CLM_USERNAME,
    password_hash: hash,
    full_name: CLM_NAME,
    role: 'CLM',
    jurisdiction_id: null,
    must_change_password: true,
  });

  console.log('\n  Controller account created.');
  console.log(`  Username:  ${CLM_USERNAME}`);
  console.log(`  Password:  ${password}`);
  console.log('\n  This password is shown once and is not stored anywhere in readable form.');
  console.log('  You will be asked to replace it on first sign-in.\n');
}

main()
  .catch((err) => { console.error('\nSeed failed:', err.message); process.exitCode = 1; })
  .finally(() => mongoose.disconnect());