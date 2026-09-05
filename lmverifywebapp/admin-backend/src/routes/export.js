import { Router } from 'express';
import ExcelJS from 'exceljs';

import { Report, User } from '../config/db.js';
import { authenticate, requireRole, blockUntilPasswordChanged } from '../middleware/auth.js';

export const exportRouter = Router();
exportRouter.use(authenticate, requireRole('CLM'), blockUntilPasswordChanged);

const STATUS_LABEL = { pending: 'Pending', approved: 'Approved', rejected: 'Rejected' };
const CHANNEL_LABEL = { ecommerce: 'E-commerce', field: 'Field' };

function styleHeader(sheet) {
  const row = sheet.getRow(1);
  row.font = { bold: true, color: { argb: 'FFFFFFFF' } };
  row.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FF0B2E6F' } };
  row.alignment = { vertical: 'middle' };
  row.height = 20;
  sheet.views = [{ state: 'frozen', ySplit: 1 }];
}

/* GET /api/export/reports.xlsx */
exportRouter.get('/reports.xlsx', async (_req, res) => {
  const [reports, officers, filedCounts, decidedCounts] = await Promise.all([
    Report.find({})
      .populate('filed_by')
      .populate('decided_by')
      .populate('jurisdiction_id')
      .sort({ inspected_at: -1 })
      .lean(),
    User.find({ role: { $ne: 'CLM' } })
      .populate('jurisdiction_id')
      .sort({ role: 1, full_name: 1 })
      .lean(),
    Report.aggregate([
      { $group: { _id: '$filed_by', count: { $sum: 1 } } },
    ]),
    Report.aggregate([
      { $match: { decided_by: { $ne: null } } },
      { $group: { _id: '$decided_by', count: { $sum: 1 } } },
    ]),
  ]);

  const filedMap = Object.fromEntries(filedCounts.map((f) => [String(f._id), f.count]));
  const decidedMap = Object.fromEntries(decidedCounts.map((d) => [String(d._id), d.count]));

  const wb = new ExcelJS.Workbook();
  wb.creator = 'LM-VERIFY';
  wb.created = new Date();

  /* --- Reports --- */
  const s1 = wb.addWorksheet('Reports');
  s1.columns = [
    { header: 'Reference', key: 'ref', width: 18 },
    { header: 'Channel', key: 'channel', width: 12 },
    { header: 'Officer', key: 'officer', width: 16 },
    { header: 'Designation', key: 'role', width: 12 },
    { header: 'Jurisdiction', key: 'jur', width: 16 },
    { header: 'Edible', key: 'edible', width: 9 },
    { header: 'Imported', key: 'imported', width: 10 },
    { header: 'Date of inspection', key: 'inspected', width: 20 },
    { header: 'Submitted', key: 'submitted', width: 20 },
    { header: 'Status', key: 'status', width: 12 },
    { header: 'Decided by', key: 'decided_by', width: 16 },
    { header: 'Decided on', key: 'decided_at', width: 20 },
    { header: 'Reason for rejection', key: 'reason', width: 52 },
    { header: 'Report PDF', key: 'pdf', width: 56 },
  ];
  for (const r of reports) {
    s1.addRow({
      ref: r.reference_no,
      channel: CHANNEL_LABEL[r.channel] ?? r.channel,
      officer: r.filed_by?.full_name || '',
      role: r.filed_by?.role || '',
      jur: r.jurisdiction_id?.name || '',
      edible: r.is_edible ? 'Yes' : 'No',
      imported: r.is_imported ? 'Yes' : 'No',
      inspected: r.inspected_at,
      submitted: r.submitted_at,
      status: STATUS_LABEL[r.status] ?? r.status,
      decided_by: r.decided_by?.full_name ?? '',
      decided_at: r.decided_at ?? '',
      reason: r.decision_reason ?? '',
      pdf: r.pdf_url,
    });
  }
  for (const key of ['inspected', 'submitted', 'decided_at']) {
    s1.getColumn(key).numFmt = 'dd mmm yyyy hh:mm';
  }
  s1.getColumn('reason').alignment = { wrapText: true, vertical: 'top' };
  styleHeader(s1);
  s1.autoFilter = { from: 'A1', to: { row: 1, column: s1.columns.length } };

  /* --- Officers --- */
  const s2 = wb.addWorksheet('Officers');
  s2.columns = [
    { header: 'Name', key: 'name', width: 18 },
    { header: 'Username', key: 'username', width: 16 },
    { header: 'Designation', key: 'role', width: 12 },
    { header: 'Jurisdiction', key: 'jur', width: 16 },
    { header: 'Account', key: 'status', width: 12 },
    { header: 'Activated', key: 'activated', width: 11 },
    { header: 'Last signed in', key: 'last', width: 20 },
    { header: 'Reports filed', key: 'filed', width: 14 },
    { header: 'Reports decided', key: 'decided', width: 16 },
  ];
  for (const o of officers) {
    s2.addRow({
      name: o.full_name,
      username: o.username,
      role: o.role,
      jur: o.jurisdiction_id?.name ?? '',
      status: o.status,
      activated: o.must_change_password ? 'No' : 'Yes',
      last: o.last_login_at ?? '',
      filed: filedMap[String(o._id)] || 0,
      decided: decidedMap[String(o._id)] || 0,
    });
  }
  s2.getColumn('last').numFmt = 'dd mmm yyyy hh:mm';
  styleHeader(s2);

  const stamp = new Date().toISOString().slice(0, 10);
  res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  res.setHeader('Content-Disposition', `attachment; filename="lm-verify-register-${stamp}.xlsx"`);
  await wb.xlsx.write(res);
  res.end();
});
