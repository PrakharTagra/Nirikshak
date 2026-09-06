import { Link } from 'react-router-dom';
import { STATUS_LABEL } from '../lib/acApi.js';

const STATUS_STYLE = {
  pending: 'bg-amber-100 text-amber-900 border-amber-300',
  approved: 'bg-emerald-100 text-emerald-900 border-emerald-300',
  rejected: 'bg-red-100 text-red-900 border-red-300',
};

const STATUS_ICONS = {
  pending: '◷',
  approved: '✓',
  rejected: '✗',
};

export function StatusBadge({ status }) {
  return (
    <span className={`inline-flex items-center gap-1 whitespace-nowrap rounded-sm px-2 py-0.5 text-xs font-semibold border ${STATUS_STYLE[status] ?? STATUS_STYLE.pending}`}>
      <span>{STATUS_ICONS[status] || ''}</span>
      <span>{STATUS_LABEL[status] ?? status}</span>
    </span>
  );
}

export function ComplianceBadge({ result }) {
  if (!result) return <span className="text-xs text-slate-400">—</span>;
  const isNonCompliant = result === 'NON_COMPLIANT';
  const isCompliant = result === 'COMPLIANT';
  const style = isNonCompliant
    ? 'bg-rose-50 text-rose-800 border-rose-300'
    : isCompliant
      ? 'bg-emerald-50 text-emerald-800 border-emerald-300'
      : 'bg-slate-100 text-slate-700 border-slate-300';

  const label = isNonCompliant ? 'Non-Compliant' : isCompliant ? 'Compliant' : result;

  return (
    <span className={`inline-flex items-center gap-1 whitespace-nowrap rounded-sm px-2 py-0.5 text-xs font-semibold border ${style}`}>
      <span className="font-bold">{isNonCompliant ? '⚠' : isCompliant ? '✓' : '•'}</span>
      <span>{label}</span>
    </span>
  );
}

export function PdfLink({ url, label = 'Open PDF' }) {
  if (!url) return <span className="text-xs text-slate-400">No PDF</span>;
  return (
    <a
      href={url}
      target="_blank"
      rel="noreferrer"
      className="inline-flex items-center gap-2 rounded-sm border border-govt-navy bg-white px-3 py-1.5 text-xs font-medium text-govt-navy shadow-sm hover:bg-govt-light-blue focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy"
    >
      <span aria-hidden="true" className="text-base">📄</span>
      {label}
      <span aria-hidden="true">↗</span>
    </a>
  );
}

export function Panel({ title, note, children, action }) {
  return (
    <section className="border-t-[3px] border-t-govt-navy border-x border-b border-slate-200 bg-white shadow-sm">
      <header className="flex items-baseline justify-between gap-4 border-b border-slate-200 bg-govt-cream px-4 py-3">
        <div>
          <h2 className="text-sm font-semibold text-slate-900 uppercase tracking-wide">{title}</h2>
          {note && <p className="mt-0.5 text-xs text-slate-600">{note}</p>}
        </div>
        {action}
      </header>
      {children}
    </section>
  );
}

export function EmptyState({ message, hint }) {
  return (
    <div className="px-4 py-16 text-center">
      <div className="mx-auto h-12 w-12 text-slate-300 mb-3 flex items-center justify-center">
        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="1">
          <path strokeLinecap="round" strokeLinejoin="round" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
        </svg>
      </div>
      <p className="text-sm font-medium text-slate-700">{message}</p>
      {hint && <p className="mt-1 text-xs text-slate-500">{hint}</p>}
    </div>
  );
}

export function Loading({ label = 'Loading' }) {
  return (
    <div className="px-4 py-16 text-center flex flex-col items-center justify-center gap-3" role="status">
      <div className="h-6 w-6 animate-spin rounded-full border-2 border-slate-200 border-t-govt-navy"></div>
      <span className="text-sm font-medium text-slate-500">{label}…</span>
    </div>
  );
}

export function Breadcrumb({ items }) {
  return (
    <nav aria-label="Breadcrumb" className="mb-4">
      <ol className="flex flex-wrap items-center gap-2 text-xs text-slate-600">
        <li>
          <Link to="/" className="hover:text-govt-navy hover:underline">Home</Link>
        </li>
        {items.map((item, idx) => (
          <li key={idx} className="flex items-center gap-2">
            <span className="text-slate-400">/</span>
            {item.to ? (
              <Link to={item.to} className="hover:text-govt-navy hover:underline">{item.label}</Link>
            ) : (
              <span className="text-slate-900 font-medium">{item.label}</span>
            )}
          </li>
        ))}
      </ol>
    </nav>
  );
}

export function formatDate(iso) {
  if (!iso) return '—';
  return new Date(iso).toLocaleDateString('en-IN', {
    day: '2-digit', month: 'short', year: 'numeric',
  });
}

export function formatDateTime(iso) {
  if (!iso) return '—';
  return new Date(iso).toLocaleString('en-IN', {
    day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit',
  });
}
