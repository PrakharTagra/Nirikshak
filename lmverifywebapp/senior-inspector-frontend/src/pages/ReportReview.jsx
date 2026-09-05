import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import {
  getReport, decide, DECIDABLE, REASON_REQUIRED, ACTION_LABEL,
  STATUS_LABEL, CHANNEL_LABEL,
} from '../lib/acApi.js';
import { StatusBadge, PdfLink, Panel, Loading, formatDate, formatDateTime } from '../components/ui.jsx';

const ACTION_STYLE = {
  approved: 'bg-emerald-700 hover:bg-emerald-800',
  rejected: 'bg-red-700 hover:bg-red-800',
};

function Field({ label, children }) {
  return (
    <div className="flex justify-between gap-4 px-4 py-2 text-sm">
      <dt className="shrink-0 text-slate-600">{label}</dt>
      <dd className="text-right text-slate-900">{children}</dd>
    </div>
  );
}

function DecisionPanel({ report, onDecided }) {
  const [action, setAction] = useState(null);
  const [reason, setReason] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState(null);

  // A decided report is finished. Showing buttons that the server would refuse
  // teaches the officer the wrong thing about the system.
  if (report.status !== DECIDABLE) {
    return (
      <Panel title="Decision">
        <div className="space-y-2 px-4 py-4 text-sm">
          <p className="text-slate-900">
            This report was {STATUS_LABEL[report.status].toLowerCase()} on{' '}
            {formatDateTime(report.decided_at)}
            {report.decided_by_name ? ` by ${report.decided_by_name}` : ''}.
          </p>
          {report.decision_reason && (
            <p className="border-l-4 border-red-300 bg-red-50 px-3 py-2 text-slate-800">
              {report.decision_reason}
            </p>
          )}
          <p className="text-xs text-slate-500">A decision is final and cannot be changed.</p>
        </div>
      </Panel>
    );
  }

  const needsReason = action && REASON_REQUIRED.includes(action);

  async function submit() {
    if (needsReason && !reason.trim()) {
      setError('A written reason is required to reject a report.');
      return;
    }
    setBusy(true);
    setError(null);
    try {
      await decide(report.id, action, reason.trim() || undefined);
      setAction(null);
      setReason('');
      await onDecided();
    } catch (e) {
      setError(e.message);
    } finally {
      setBusy(false);
    }
  }

  return (
    <Panel title="Decision" note="Read the PDF before deciding. This cannot be undone.">
      <div className="p-4">
        <div className="flex flex-wrap gap-2">
          {['approved', 'rejected'].map((s) => (
            <button
              key={s}
              onClick={() => { setAction(action === s ? null : s); setError(null); }}
              className={`rounded-sm px-4 py-2 text-sm font-medium text-white transition ${ACTION_STYLE[s]} ${
                action === s ? 'ring-2 ring-slate-900 ring-offset-1' : ''
              }`}
            >
              {ACTION_LABEL[s]}
            </button>
          ))}
        </div>

        {action && (
          <div className="mt-4">
            <label htmlFor="reason" className="block text-sm text-slate-700">
              Reason {needsReason
                ? <span className="text-red-700">(required)</span>
                : <span className="text-slate-500">(not required to approve)</span>}
            </label>
            <textarea
              id="reason"
              rows={3}
              value={reason}
              onChange={(e) => { setReason(e.target.value); setError(null); }}
              placeholder={needsReason ? 'Why is this package being refused?' : ''}
              disabled={!needsReason}
              className="mt-1 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm focus:border-[#0b2e6f] focus:outline-none focus:ring-1 focus:ring-[#0b2e6f] disabled:bg-slate-50 disabled:text-slate-400"
            />
            {needsReason && (
              <p className="mt-1 text-xs text-slate-500">
                This is recorded against the report and cannot be edited afterwards.
              </p>
            )}

            {error && (
              <p role="alert" className="mt-2 border border-red-300 bg-red-50 px-3 py-2 text-sm text-red-800">
                {error}
              </p>
            )}

            <button
              onClick={submit}
              disabled={busy}
              className="mt-3 rounded-sm bg-[#0b2e6f] px-4 py-2 text-sm font-medium text-white hover:bg-[#092551] disabled:opacity-60"
            >
              {busy ? 'Recording…' : `Confirm: ${ACTION_LABEL[action]}`}
            </button>
          </div>
        )}
      </div>
    </Panel>
  );
}

export default function ReportReview() {
  const { id } = useParams();
  const [report, setReport] = useState(null);
  const [error, setError] = useState(null);

  const load = () => getReport(id).then(setReport).catch((e) => setError(e.message));
  useEffect(() => { setReport(null); setError(null); load(); }, [id]);

  if (error) {
    return (
      <div className="space-y-4">
        <Link to="/" className="text-sm text-[#0b2e6f] underline-offset-2 hover:underline">← Back to queue</Link>
        <p className="border border-amber-300 bg-amber-50 px-4 py-3 text-sm text-amber-900">{error}</p>
      </div>
    );
  }
  if (!report) return <Loading label="Loading report" />;

  return (
    <div className="space-y-5">
      <div>
        <Link to="/" className="text-sm text-[#0b2e6f] underline-offset-2 hover:underline">← Back to queue</Link>
        <div className="mt-2 flex flex-wrap items-center gap-3">
          <h1 className="font-mono text-lg font-semibold text-slate-900">{report.reference_no}</h1>
          <StatusBadge status={report.status} />
        </div>
        <p className="mt-1 text-sm text-slate-600">
          Filed by {report.officer_name} ({report.officer_role}) · {CHANNEL_LABEL[report.channel]}
        </p>
      </div>

      {/* The PDF is what the officer actually reviews, so it sits above
          everything else rather than at the end of a list of fields. */}
      <div className="flex flex-wrap items-center justify-between gap-4 border border-slate-200 bg-white px-4 py-4">
        <div>
          <p className="text-sm font-semibold text-slate-900">Inspection report</p>
          <p className="mt-0.5 text-xs text-slate-600">
            The PDF carries every declaration checked on this package.
          </p>
        </div>
        <PdfLink url={report.pdf_url} />
      </div>

      <div className="grid gap-5 lg:grid-cols-3">
        <Panel title="Inspection">
          <dl className="divide-y divide-slate-100">
            <Field label="Channel">{CHANNEL_LABEL[report.channel]}</Field>
            <Field label="Filed by">{report.officer_name} ({report.officer_role})</Field>
            <Field label="Jurisdiction">{report.jurisdiction}</Field>
            {/* Inspection aur submission alag hain jaan boojh kar — field app
                offline chalti hai aur baad mein sync karti hai. */}
            <Field label="Inspected on">{formatDate(report.inspected_at)}</Field>
            <Field label="Submitted">{formatDateTime(report.submitted_at)}</Field>
            <Field label="Edible">{report.is_edible ? 'Yes' : 'No'}</Field>
            <Field label="Imported">{report.is_imported ? 'Yes' : 'No'}</Field>
            {report.listing_url && (
              <Field label="Listing">
                <a href={report.listing_url} target="_blank" rel="noreferrer"
                  className="text-[#0b2e6f] underline-offset-2 hover:underline">Open</a>
              </Field>
            )}
          </dl>
        </Panel>

        <div className="lg:col-span-2">
          <DecisionPanel report={report} onDecided={load} />
        </div>
      </div>
    </div>
  );
}
