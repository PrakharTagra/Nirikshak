/**
 * Core schema for LM-VERIFY.
 * One database, owned by admin-backend (CLM) and senior-inspector-backend (AC).
 * DMI and LMO run separately and submit finished reports over HTTP.
 *
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 */
export const up = (pgm) => {
  pgm.createExtension('citext', { ifNotExists: true });

  pgm.createType('user_role', ['CLM', 'AC', 'DMI', 'LMO']);
  pgm.createType('account_status', ['active', 'suspended', 'disabled']);
  pgm.createType('report_channel', ['ecommerce', 'field']);
  pgm.createType('report_status', ['pending', 'approved', 'rejected', 'on_hold', 'overruled']);
  pgm.createType('finding_verdict', ['pass', 'fail', 'not_applicable', 'undetermined']);

  pgm.createTable('jurisdictions', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    code: { type: 'text', notNull: true, unique: true },
    name: { type: 'text', notNull: true },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });

  pgm.createTable('users', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    username: { type: 'citext', notNull: true, unique: true },
    password_hash: { type: 'text', notNull: true },
    full_name: { type: 'text', notNull: true },
    role: { type: 'user_role', notNull: true },
    email: { type: 'text' },
    phone: { type: 'text' },
    jurisdiction_id: { type: 'uuid', references: 'jurisdictions', onDelete: 'RESTRICT' },
    reports_to: { type: 'uuid', references: 'users', onDelete: 'SET NULL' },
    status: { type: 'account_status', notNull: true, default: 'active' },
    must_change_password: { type: 'boolean', notNull: true, default: true },
    last_login_at: { type: 'timestamptz' },
    created_by: { type: 'uuid', references: 'users', onDelete: 'SET NULL' },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
    updated_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });

  // Har role except CLM ek jurisdiction mein kaam karta hai. Bina iske ek AC
  // null jurisdiction ke saath ban jata aur chupchap kuch bhi na dekh pata.
  pgm.addConstraint('users', 'users_jurisdiction_required', {
    check: `(role = 'CLM' AND jurisdiction_id IS NULL) OR (role <> 'CLM' AND jurisdiction_id IS NOT NULL)`,
  });
  pgm.createIndex('users', ['role', 'jurisdiction_id']);
  pgm.createIndex('users', 'reports_to');

  // IDs aur applicability only. Thresholds compliance engine ka kaam hai.
  pgm.createTable('rules', {
    id: { type: 'text', primaryKey: true },
    label: { type: 'text', notNull: true },
    rule_ref: { type: 'text', notNull: true },
    applies_to: { type: 'text', notNull: true, default: 'all' },
    sort_order: { type: 'integer', notNull: true },
  });
  pgm.addConstraint('rules', 'rules_applies_to_valid', {
    check: `applies_to IN ('all', 'edible_only', 'imported_only')`,
  });

  pgm.createTable('reports', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    reference_no: { type: 'text', notNull: true, unique: true },
    channel: { type: 'report_channel', notNull: true },
    filed_by: { type: 'uuid', notNull: true, references: 'users', onDelete: 'RESTRICT' },
    jurisdiction_id: { type: 'uuid', notNull: true, references: 'jurisdictions', onDelete: 'RESTRICT' },
    product_name: { type: 'text', notNull: true },
    brand: { type: 'text' },
    category: { type: 'text' },
    is_edible: { type: 'boolean', notNull: true, default: false },
    is_imported: { type: 'boolean', notNull: true, default: false },
    declared_values: { type: 'jsonb', notNull: true, default: '{}' },
    listing_url: { type: 'text' },
    status: { type: 'report_status', notNull: true, default: 'pending' },
    decided_by: { type: 'uuid', references: 'users', onDelete: 'SET NULL' },
    decided_at: { type: 'timestamptz' },
    // Jab officer ne actually inspect kiya - yeh row banne ka time nahi hai.
    // Field app offline chalta hai, to yeh dono din-din door ho sakte hain.
    inspected_at: { type: 'timestamptz', notNull: true },
    submitted_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
    updated_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });
  pgm.createIndex('reports', ['jurisdiction_id', 'status']);
  pgm.createIndex('reports', 'filed_by');
  pgm.createIndex('reports', 'inspected_at');
  pgm.createIndex('reports', 'channel');

  pgm.createTable('report_evidence', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    report_id: { type: 'uuid', notNull: true, references: 'reports', onDelete: 'CASCADE' },
    kind: { type: 'text', notNull: true },
    file_url: { type: 'text', notNull: true },
    caption: { type: 'text' },
    captured_at: { type: 'timestamptz' },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });
  pgm.addConstraint('report_evidence', 'evidence_kind_valid', {
    check: `kind IN ('photograph', 'screenshot')`,
  });
  pgm.createIndex('report_evidence', 'report_id');

  // Har rule ki apni row, kabhi ek overall pass/fail nahi. Isi se AC ek
  // finding override kar pata hai aur CLM "most violated rules" gin pata hai.
  pgm.createTable('report_findings', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    report_id: { type: 'uuid', notNull: true, references: 'reports', onDelete: 'CASCADE' },
    rule_id: { type: 'text', notNull: true, references: 'rules', onDelete: 'RESTRICT' },
    machine_verdict: { type: 'finding_verdict', notNull: true, default: 'undetermined' },
    machine_note: { type: 'text' },
    inspector_verdict: { type: 'finding_verdict' },
    inspector_note: { type: 'text' },
    ac_verdict: { type: 'finding_verdict' },
    ac_note: { type: 'text' },
    ac_overridden_by: { type: 'uuid', references: 'users', onDelete: 'SET NULL' },
    ac_overridden_at: { type: 'timestamptz' },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
    updated_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });
  pgm.addConstraint('report_findings', 'findings_one_per_rule', { unique: ['report_id', 'rule_id'] });
  pgm.addConstraint('report_findings', 'findings_override_needs_note', {
    check: `ac_verdict IS NULL OR (ac_note IS NOT NULL AND length(btrim(ac_note)) > 0)`,
  });
  pgm.createIndex('report_findings', 'rule_id');

  pgm.createTable('report_status_history', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    report_id: { type: 'uuid', notNull: true, references: 'reports', onDelete: 'RESTRICT' },
    from_status: { type: 'report_status' },
    to_status: { type: 'report_status', notNull: true },
    changed_by: { type: 'uuid', notNull: true, references: 'users', onDelete: 'RESTRICT' },
    reason: { type: 'text' },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });
  pgm.addConstraint('report_status_history', 'history_reason_required', {
    check: `
      to_status NOT IN ('rejected', 'on_hold', 'overruled')
      OR (reason IS NOT NULL AND length(btrim(reason)) > 0)
    `,
  });
  pgm.createIndex('report_status_history', ['report_id', 'created_at']);

  pgm.createTable('admin_audit_log', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    actor_id: { type: 'uuid', notNull: true, references: 'users', onDelete: 'RESTRICT' },
    action: { type: 'text', notNull: true },
    target_user_id: { type: 'uuid', references: 'users', onDelete: 'SET NULL' },
    details: { type: 'jsonb', notNull: true, default: '{}' },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });
  pgm.createIndex('admin_audit_log', ['actor_id', 'created_at']);

  // Trigger, REVOKE nahi. Table owner aur superuser REVOKE bypass kar dete
  // hain; trigger ko nahi kar sakte.
  pgm.createFunction('refuse_mutation', [], { returns: 'trigger', language: 'plpgsql', replace: true }, `
    BEGIN
      RAISE EXCEPTION '% is append-only. % is not permitted on this table.',
        TG_TABLE_NAME, TG_OP USING ERRCODE = 'restrict_violation';
    END;
  `);
  for (const table of ['report_status_history', 'admin_audit_log']) {
    pgm.createTrigger(table, `${table}_no_update`, {
      when: 'BEFORE', operation: 'UPDATE', level: 'ROW', function: 'refuse_mutation',
    });
    pgm.createTrigger(table, `${table}_no_delete`, {
      when: 'BEFORE', operation: 'DELETE', level: 'ROW', function: 'refuse_mutation',
    });
  }

  pgm.createFunction('touch_updated_at', [], { returns: 'trigger', language: 'plpgsql', replace: true }, `
    BEGIN
      NEW.updated_at = now();
      RETURN NEW;
    END;
  `);
  for (const table of ['users', 'reports', 'report_findings']) {
    pgm.createTrigger(table, `${table}_touch_updated_at`, {
      when: 'BEFORE', operation: 'UPDATE', level: 'ROW', function: 'touch_updated_at',
    });
  }

  pgm.sql(`
    INSERT INTO rules (id, label, rule_ref, applies_to, sort_order) VALUES
      ('MANUFACTURER_DETAILS', 'Name and address of manufacturer / packer / importer', 'LMPC 2011 r.6(1)(a)', 'all', 1),
      ('COMMODITY_NAME',       'Common or generic name of the commodity',               'LMPC 2011 r.6(1)(b)', 'all', 2),
      ('NET_QUANTITY',         'Net quantity in standard units',                        'LMPC 2011 r.6(1)(c)', 'all', 3),
      ('MANUFACTURE_DATE',     'Month and year of manufacture / packing / import',      'LMPC 2011 r.6(1)(d)', 'all', 4),
      ('RETAIL_SALE_PRICE',    'Retail sale price, MRP inclusive of all taxes',         'LMPC 2011 r.6(1)(e)', 'all', 5),
      ('CONSUMER_CARE',        'Consumer care name, address, phone, email',             'LMPC 2011 r.6(1)(f)', 'all', 6),
      ('COUNTRY_OF_ORIGIN',    'Country of origin',                                     'LMPC 2011 r.6',       'imported_only', 7),
      ('BEST_BEFORE',          'Best before / use by date',                             'LMPC 2011 r.6',       'edible_only', 8),
      ('BATCH_NUMBER',         'Batch / lot / code number',                             'LMPC 2011 r.6',       'all', 9),
      ('LEGIBILITY_CONTRAST',  'Legible and printed in a contrasting colour',           'LMPC 2011 r.8',       'all', 10),
      ('MIN_CHARACTER_HEIGHT', 'Numerals and letters meet minimum height',              'LMPC 2011 r.9',       'all', 11),
      ('UNIT_SYMBOLS',         'Correct unit symbols used for net quantity',            'LMPC 2011 r.10',      'all', 12);
  `);
};

/**
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 */
export const down = (pgm) => {
  pgm.dropTable('admin_audit_log');
  pgm.dropTable('report_status_history');
  pgm.dropTable('report_findings');
  pgm.dropTable('report_evidence');
  pgm.dropTable('reports');
  pgm.dropTable('rules');
  pgm.dropTable('users');
  pgm.dropTable('jurisdictions');
  pgm.dropFunction('refuse_mutation', []);
  pgm.dropFunction('touch_updated_at', []);
  pgm.dropType('finding_verdict');
  pgm.dropType('report_status');
  pgm.dropType('report_channel');
  pgm.dropType('account_status');
  pgm.dropType('user_role');
};