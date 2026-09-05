/**
 * Simplify to PDF-carried reports.
 *
 * The processing service now produces a single PDF and posts a report that
 * points at it. Per-rule findings, separate evidence rows and the decision
 * trail all go away; the PDF carries the inspection detail and the report row
 * carries the outcome.
 *
 * Written to run on a database that already holds data.
 *
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 */
export const up = (pgm) => {
  /* ---------- 1. new columns first ---------- */
  // Added before anything is dropped, so the existing decision reasons can be
  // carried across instead of being lost with the history table.
  pgm.addColumn('reports', {
    pdf_url: { type: 'text' },
    decision_reason: { type: 'text' },
  });

  /* ---------- 2. carry the reasons off the history table ---------- */
  // Every rejected report already has a reason recorded against it. Dropping
  // the history without moving these first would leave rows that the new check
  // constraint refuses, and would silently discard why a package was refused.
  pgm.sql(`
    UPDATE reports r
       SET decision_reason = h.reason
      FROM (
        SELECT DISTINCT ON (report_id) report_id, reason
          FROM report_status_history
         WHERE reason IS NOT NULL AND length(btrim(reason)) > 0
         ORDER BY report_id, created_at DESC
      ) h
     WHERE h.report_id = r.id
       AND r.decision_reason IS NULL;
  `);

  /* ---------- 3. move rows off the statuses being retired ---------- */
  // An on-hold or overruled report was undecided in substance, so it goes back
  // to pending rather than being forced into an outcome.
  pgm.sql(`
    UPDATE reports
       SET status = 'pending', decided_by = NULL, decided_at = NULL
     WHERE status IN ('on_hold', 'overruled');
  `);

  // Anything still rejected without a reason predates the requirement. It is
  // marked rather than deleted, so the gap is visible instead of invented.
  pgm.sql(`
    UPDATE reports
       SET decision_reason = 'Reason not recorded before this requirement existed.'
     WHERE status = 'rejected'
       AND (decision_reason IS NULL OR length(btrim(decision_reason)) = 0);
  `);

  /* ---------- 4. drop the tables that no longer receive data ---------- */
  // report_status_history carries an append-only trigger; dropping the table
  // drops its triggers with it.
  pgm.dropTable('report_status_history');
  pgm.dropTable('report_findings');
  pgm.dropTable('report_evidence');

  /* ---------- 5. backfill and lock down pdf_url ---------- */
  // Existing rows predate the PDF flow and have nowhere to point. They get an
  // explicit placeholder rather than being deleted, so the column can be
  // NOT NULL from here on without discarding history.
  pgm.sql(`
    UPDATE reports
       SET pdf_url = 'https://example.invalid/pre-migration/' || reference_no || '.pdf'
     WHERE pdf_url IS NULL;
  `);
  pgm.alterColumn('reports', 'pdf_url', { notNull: true });

  // The PDF now carries the product identity; the column stays for older rows.
  pgm.alterColumn('reports', 'product_name', { notNull: false });

  /* ---------- 6. rebuild the status enum with three values ---------- */
  // Postgres cannot remove a value from an enum, so the type is replaced.
  // Safe here because report_status_history was the only other user and it is
  // already gone.
  pgm.sql(`
    ALTER TABLE reports ALTER COLUMN status DROP DEFAULT;
    CREATE TYPE report_status_new AS ENUM ('pending', 'approved', 'rejected');
    ALTER TABLE reports
      ALTER COLUMN status TYPE report_status_new
      USING status::text::report_status_new;
    DROP TYPE report_status;
    ALTER TYPE report_status_new RENAME TO report_status;
    ALTER TABLE reports ALTER COLUMN status SET DEFAULT 'pending';
  `);

  /* ---------- 7. a rejection must carry a reason ---------- */
  // Enforced here as well as in the API, so no code path can record a refusal
  // without saying why — including a direct SQL insert.
  pgm.addConstraint('reports', 'reports_rejection_needs_reason', {
    check: `
      status <> 'rejected'
      OR (decision_reason IS NOT NULL AND length(btrim(decision_reason)) > 0)
    `,
  });

  pgm.createIndex('reports', 'status');
};

/**
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 */
export const down = (pgm) => {
  pgm.dropConstraint('reports', 'reports_rejection_needs_reason');
  pgm.dropIndex('reports', 'status');

  pgm.sql(`
    ALTER TABLE reports ALTER COLUMN status DROP DEFAULT;
    CREATE TYPE report_status_old AS ENUM ('pending', 'approved', 'rejected', 'on_hold', 'overruled');
    ALTER TABLE reports
      ALTER COLUMN status TYPE report_status_old
      USING status::text::report_status_old;
    DROP TYPE report_status;
    ALTER TYPE report_status_old RENAME TO report_status;
    ALTER TABLE reports ALTER COLUMN status SET DEFAULT 'pending';
  `);

  pgm.dropColumn('reports', ['pdf_url', 'decision_reason']);
  // product_name is left nullable: rows written under the new flow have none,
  // so restoring NOT NULL would fail.

  pgm.createTable('report_evidence', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    report_id: { type: 'uuid', notNull: true, references: 'reports', onDelete: 'CASCADE' },
    kind: { type: 'text', notNull: true },
    file_url: { type: 'text', notNull: true },
    caption: { type: 'text' },
    captured_at: { type: 'timestamptz' },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });

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

  pgm.createTable('report_status_history', {
    id: { type: 'uuid', primaryKey: true, default: pgm.func('gen_random_uuid()') },
    report_id: { type: 'uuid', notNull: true, references: 'reports', onDelete: 'RESTRICT' },
    from_status: { type: 'report_status' },
    to_status: { type: 'report_status', notNull: true },
    changed_by: { type: 'uuid', notNull: true, references: 'users', onDelete: 'RESTRICT' },
    reason: { type: 'text' },
    created_at: { type: 'timestamptz', notNull: true, default: pgm.func('now()') },
  });
  for (const op of ['UPDATE', 'DELETE']) {
    pgm.createTrigger('report_status_history', `report_status_history_no_${op.toLowerCase()}`, {
      when: 'BEFORE', operation: op, level: 'ROW', function: 'refuse_mutation',
    });
  }
};
