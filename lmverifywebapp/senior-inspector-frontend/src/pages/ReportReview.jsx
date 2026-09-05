import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import {
  getReport, decide, DECIDABLE, REASON_REQUIRED, ACTION_LABEL,
  STATUS_LABEL, CHANNEL_LABEL,
} from '../lib/acApi.js';
import { StatusBadge, PdfLink, Panel, Loading, formatDate, formatDateTime, Breadcrumb } from '../components/ui.jsx';

const ACTION_STYLE = {
  approved: 'bg-emerald-700 hover:bg-emerald-800 focus-visible:outline-emerald-700',
  rejected: 'bg-govt-maroon hover:bg-red-900 focus-visible:outline-govt-maroon',
};

function Field({ label, children }) {
  return (
    <div className="flex flex-col sm:flex-row justify-between gap-2 px-4 py-3 text-sm hover:bg-slate-50">
      <dt className="shrink-0 font-medium text-slate-600">{label}</dt>
      <dd className="sm:text-right font-semibold text-slate-900">{children}</dd>
    </div>
  );
}

function DecisionPanel({ report, onDecided }) {
  const [action, setAction] = useState(null);
  const [reason, setReason] = useState('');
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState(null);

  if (report.status !== DECIDABLE) {
    return (
      <Panel title="Official Decision">
        <div className="space-y-3 px-5 py-5 text-sm bg-slate-50">
          <div className="flex items-center gap-2">
            <span className="font-medium text-slate-700">Final Status:</span>
            <StatusBadge status={report.status} />
          </div>
          <p className="text-slate-900 border-b border-slate-200 pb-3">
            Recorded on <span className="font-semibold">{formatDateTime(report.decided_at)}</span>
            {report.decided_by_name ? ` by ` : ''}
            {report.decided_by_name && <span className="font-semibold">{report.decided_by_name}</span>}
          </p>
          {report.decision_reason && (
            <div className="mt-3">
              <p className="text-xs font-bold uppercase tracking-wider text-slate-500 mb-1">Remarks / Reason</p>
              <p className="border-l-4 border-slate-400 bg-white px-4 py-3 text-slate-800 shadow-sm italic">
                "{report.decision_reason}"
              </p>
            </div>
          )}
          <p className="text-xs font-semibold text-slate-500 mt-2">A decision is final and cannot be modified.</p>
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
    <Panel title="Record Decision" note="Review the inspection PDF thoroughly before deciding. This action is irreversible.">
      <div className="p-5">
        <p className="text-sm font-semibold mb-3 text-slate-800">Select an action:</p>
        <div className="flex flex-wrap gap-3">
          {['approved', 'rejected'].map((s) => (
            <button
              key={s}
              onClick={() => { setAction(action === s ? null : s); setError(null); }}
              className={`rounded-sm px-6 py-2.5 text-sm font-semibold tracking-wide text-white transition-all shadow-sm focus-visible:outline-2 focus-visible:outline-offset-2 ${ACTION_STYLE[s]} ${
                action === s ? 'ring-4 ring-slate-300 scale-105' : 'opacity-90 hover:opacity-100'
              }`}
            >
              {ACTION_LABEL[s].toUpperCase()}
            </button>
          ))}
        </div>

        {action && (
          <div className="mt-6 border-t border-slate-200 pt-5 animate-in fade-in slide-in-from-top-2">
            <label htmlFor="reason" className="block text-sm font-semibold text-slate-800 mb-2">
              Remarks / Reason {needsReason
                ? <span className="text-govt-maroon">(Required for rejection)</span>
                : <span className="text-slate-500 font-normal">(Optional for approval)</span>}
            </label>
            <textarea
              id="reason"
              rows={4}
              value={reason}
              onChange={(e) => { setReason(e.target.value); setError(null); }}
              placeholder={needsReason ? 'Specify the legal or procedural grounds for refusal...' : 'Any optional remarks...'}
              disabled={!needsReason && false}
              className="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-sm focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-inner"
            />
            {needsReason && (
              <p className="mt-1.5 text-xs font-medium text-slate-500">
                These remarks will be permanently recorded against this report.
              </p>
            )}

            {error && (
              <p role="alert" className="mt-3 border-l-4 border-red-500 bg-red-50 px-4 py-3 text-sm font-medium text-red-900 shadow-sm">
                {error}
              </p>
            )}

            <button
              onClick={submit}
              disabled={busy}
              className="mt-5 w-full sm:w-auto min-w-[200px] rounded-sm bg-govt-navy px-6 py-2.5 text-sm font-bold tracking-wide text-white shadow-md hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-60 transition-colors"
            >
              {busy ? 'Recording Decision…' : `CONFIRM ${ACTION_LABEL[action].toUpperCase()}`}
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
        <Breadcrumb items={[{label: 'Error'}]} />
        <p className="border-l-4 border-amber-500 bg-amber-50 px-5 py-4 text-sm font-medium text-amber-900 shadow-sm">{error}</p>
      </div>
    );
  }
  if (!report) return <Loading label="Retrieving official report" />;

  return (
    <div className="space-y-6">
      <Breadcrumb items={[{to: '/', label: 'Queue'}, {label: report.reference_no}]} />

      <div className="pb-4 border-b-2 border-slate-200">
        <div className="flex flex-wrap items-center gap-4">
          <h1 className="font-mono text-2xl font-bold text-govt-navy">{report.reference_no}</h1>
          <StatusBadge status={report.status} />
        </div>
        <p className="mt-2 text-sm font-medium text-slate-600">
          Filed by <span className="text-slate-900 font-semibold">{report.officer_name}</span> ({report.officer_role}) via {CHANNEL_LABEL[report.channel]}
        </p>
      </div>

      <div className="flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4 border border-slate-300 bg-white p-5 rounded-sm shadow-sm border-l-4 border-l-govt-navy">
        <div>
          <h2 className="text-base font-bold text-slate-900">Official Inspection Document</h2>
          <p className="mt-1 text-sm text-slate-600">
            Contains all verified declarations and photographic evidence.
          </p>
        </div>
        <PdfLink url={report.pdf_url} label="View Full Report PDF" />
      </div>

      <div className="grid gap-6 lg:grid-cols-3">
        <Panel title="Report Metadata">
          <dl className="divide-y divide-slate-200 bg-white">
            <Field label="Channel">
              <span className="bg-slate-100 text-slate-800 px-2 py-0.5 rounded text-xs font-bold border border-slate-200">
                {CHANNEL_LABEL[report.channel]}
              </span>
            </Field>
            <Field label="Filed By">{report.officer_name} <br/><span className="text-xs font-normal text-slate-500">{report.officer_role}</span></Field>
            <Field label="Jurisdiction">{report.jurisdiction}</Field>
            <Field label="Inspection Date">{formatDate(report.inspected_at)}</Field>
            <Field label="Submission Time">{formatDateTime(report.submitted_at)}</Field>
            <Field label="Commodity Type">
              {report.is_edible ? 'Edible' : 'Non-Edible'}
              <span className="mx-2 text-slate-300">|</span>
              {report.is_imported ? 'Imported' : 'Domestic'}
            </Field>
            {report.listing_url && (
              <Field label="Product Listing">
                <a href={report.listing_url} target="_blank" rel="noreferrer"
                  className="inline-flex items-center gap-1 font-semibold text-govt-navy underline-offset-2 hover:underline">
                  Open Link <span aria-hidden="true" className="text-xs">↗</span>
                </a>
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
