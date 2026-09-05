import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { getReport, STATUS_LABEL, CHANNEL_LABEL } from '../lib/adminApi.js';
import { StatusBadge, PdfLink, Panel, Loading, formatDate, formatDateTime, Breadcrumb } from '../components/ui.jsx';

function Field({ label, children }) {
  return (
    <div className="flex flex-col sm:flex-row sm:justify-between gap-2 sm:gap-4 px-5 py-3 text-sm border-b border-slate-100 last:border-0 hover:bg-slate-50 transition-colors">
      <dt className="shrink-0 text-slate-600 font-medium">{label}</dt>
      <dd className="sm:text-right text-slate-900 font-semibold">{children}</dd>
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
        <Breadcrumb items={[{ label: 'Inspection Records', to: '/reports' }, { label: 'Error' }]} />
        <div className="border-l-4 border-amber-500 bg-amber-50 px-5 py-4 text-sm text-amber-900 font-medium shadow-sm">
          {error}
        </div>
      </div>
    );
  }
  if (!report) return <Loading label="Retrieving report details" />;

  return (
    <div className="space-y-6">
      <Breadcrumb items={[
        { label: 'Inspection Records', to: '/reports' }, 
        { label: report.reference_no }
      ]} />
      
      <div className="border-b border-slate-300 pb-4">
        <div className="flex flex-wrap items-center gap-4">
          <h1 className="font-mono text-2xl font-bold text-govt-navy tracking-tight">{report.reference_no}</h1>
          <StatusBadge status={report.status} />
        </div>
        <p className="mt-2 text-sm font-medium text-slate-700 bg-slate-100 inline-block px-3 py-1.5 rounded border border-slate-200">
          Filed by <span className="font-bold text-slate-900">{report.officer_name}</span> ({report.officer_role}) · {CHANNEL_LABEL[report.channel]} Channel
        </p>
      </div>

      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 border border-govt-navy bg-[#f0f4ff] px-6 py-5 rounded shadow-sm">
        <div>
          <h2 className="text-base font-bold text-govt-navy flex items-center gap-2">
            <span>📄</span> Official Inspection Report Document
          </h2>
          <p className="mt-1 text-sm text-slate-700 font-medium">
            This signed PDF document contains the complete details of the package declarations checked during inspection.
          </p>
        </div>
        <PdfLink url={report.pdf_url} label="Open Official PDF" />
      </div>

      <div className="grid items-start gap-6 lg:grid-cols-2">
        <Panel title="Inspection Details">
          <dl className="divide-y divide-slate-100">
            <Field label="Filing Channel">{CHANNEL_LABEL[report.channel]}</Field>
            <Field label="Filed By Officer">{report.officer_name} ({report.officer_role})</Field>
            <Field label="Jurisdiction Office">{report.jurisdiction}</Field>
            <Field label="Date of Inspection">{formatDate(report.inspected_at)}</Field>
            <Field label="System Submission Date">{formatDateTime(report.submitted_at)}</Field>
            <Field label="Commodity Type">{report.is_edible ? 'Edible / Food Item' : 'Non-Edible Item'}</Field>
            <Field label="Origin">{report.is_imported ? 'Imported Commodity' : 'Domestic Commodity'}</Field>
          </dl>
        </Panel>

        <Panel title="Controller Decision Outcome" note="Decision taken by the Assistant Controller for this jurisdiction">
          {report.status === 'pending' ? (
            <div className="px-6 py-10 text-center flex flex-col items-center">
              <span className="text-4xl opacity-50 mb-3">◷</span>
              <p className="text-sm font-semibold text-amber-700 bg-amber-50 px-4 py-2 rounded-full border border-amber-200">
                Awaiting Assistant Controller Decision
              </p>
              <p className="mt-2 text-xs text-slate-500">
                This report is currently in the queue for review.
              </p>
            </div>
          ) : (
            <div className="space-y-4 px-5 py-5 text-sm">
              <div className="flex items-start gap-3 bg-slate-50 p-4 rounded border border-slate-200">
                <span className="text-xl">{report.status === 'approved' ? '✅' : '❌'}</span>
                <div>
                  <p className="font-semibold text-slate-900 text-base">
                    {STATUS_LABEL[report.status]}
                  </p>
                  <p className="text-slate-600 mt-0.5">
                    Decided on <span className="font-medium text-slate-800">{formatDateTime(report.decided_at)}</span>
                    {report.decided_by_name ? ` by ${report.decided_by_name}` : ''}.
                  </p>
                </div>
              </div>
              
              {report.decision_reason && (
                <div className="mt-4">
                  <p className="text-xs font-bold uppercase tracking-wider text-govt-dark mb-2">Official Reason Recorded</p>
                  <p className="border-l-4 border-govt-maroon bg-[#faf0f0] px-4 py-3 text-slate-800 font-medium shadow-inner rounded-r">
                    "{report.decision_reason}"
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
