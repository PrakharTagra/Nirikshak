import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { getReport, STATUS_LABEL, CHANNEL_LABEL } from '../lib/adminApi.js';
import { StatusBadge, PdfLink, Panel, Loading, formatDate, formatDateTime } from '../components/ui.jsx';

function Field({ label, children }) {
  return (
    <div className="flex justify-between gap-4 px-4 py-2 text-sm">
      <dt className="shrink-0 text-slate-600">{label}</dt>
      <dd className="text-right text-slate-900">{children}</dd>
    </div>
  );
}

export default function ReportDetail() {
  const { id } = useParams();
  const [report, setReport] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    setReport(null);
    setError(null);
    getReport(id).then(setReport).catch((e) => setError(e.message));
  }, [id]);

  if (error) {
    return (
      <div className="space-y-4">
        <Link to="/reports" className="text-sm text-[#0b2e6f] underline-offset-2 hover:underline">
          ← Back to records
        </Link>
        <p className="border border-amber-300 bg-amber-50 px-4 py-3 text-sm text-amber-900">{error}</p>
      </div>
    );
  }
  if (!report) return <Loading label="Loading report" />;

  return (
    <div className="space-y-5">
      <div>
        <Link to="/reports" className="text-sm text-[#0b2e6f] underline-offset-2 hover:underline">
          ← Back to records
        </Link>
        <div className="mt-2 flex flex-wrap items-center gap-3">
          <h1 className="font-mono text-lg font-semibold text-slate-900">{report.reference_no}</h1>
          <StatusBadge status={report.status} />
        </div>
        <p className="mt-1 text-sm text-slate-600">
          Filed by {report.officer_name} ({report.officer_role}) · {CHANNEL_LABEL[report.channel]}
        </p>
      </div>

      <div className="flex flex-wrap items-center justify-between gap-4 border border-slate-200 bg-white px-4 py-4">
        <div>
          <p className="text-sm font-semibold text-slate-900">Inspection report</p>
          <p className="mt-0.5 text-xs text-slate-600">
            The PDF carries every declaration checked on this package.
          </p>
        </div>
        <PdfLink url={report.pdf_url} />
      </div>

      <div className="grid items-start gap-5 lg:grid-cols-2">
        <Panel title="Inspection">
          <dl className="divide-y divide-slate-100">
            <Field label="Channel">{CHANNEL_LABEL[report.channel]}</Field>
            <Field label="Filed by">{report.officer_name} ({report.officer_role})</Field>
            <Field label="Jurisdiction">{report.jurisdiction}</Field>
            {/* Inspection aur submission alag dates hain jaan boojh kar — field
                app offline chalti hai aur baad mein sync karti hai. */}
            <Field label="Inspected on">{formatDate(report.inspected_at)}</Field>
            <Field label="Submitted">{formatDateTime(report.submitted_at)}</Field>
            <Field label="Edible">{report.is_edible ? 'Yes' : 'No'}</Field>
            <Field label="Imported">{report.is_imported ? 'Yes' : 'No'}</Field>
          </dl>
        </Panel>

        <Panel title="Outcome" note="Decided by the Assistant Controller for this jurisdiction">
          {report.status === 'pending' ? (
            <p className="px-4 py-6 text-sm text-slate-600">
              This report is still waiting on a decision.
            </p>
          ) : (
            <div className="space-y-3 px-4 py-4 text-sm">
              <p className="text-slate-900">
                {STATUS_LABEL[report.status]} on {formatDateTime(report.decided_at)}
                {report.decided_by_name ? ` by ${report.decided_by_name}` : ''}.
              </p>
              {report.decision_reason && (
                <div>
                  <p className="text-xs text-slate-600">Reason recorded</p>
                  <p className="mt-1 border-l-4 border-red-300 bg-red-50 px-3 py-2 text-slate-800">
                    {report.decision_reason}
                  </p>
                </div>
              )}
            </div>
          )}
        </Panel>
      </div>
    </div>
  );
}
