import { Link } from 'react-router-dom';
import { STATUS_LABEL } from '../lib/acApi.js';

const STATUS_STYLE = {
  pending: 'bg-amber-50 text-amber-900 border-amber-300',
  approved: 'bg-emerald-50 text-emerald-800 border-emerald-300',
  rejected: 'bg-red-50 text-red-800 border-red-300',
};

const STATUS_ICONS = {
  pending: '⏱',
  approved: '✓',
  rejected: '✕',
};

export function StatusBadge({ status }) {
  const icon = STATUS_ICONS[status] || '•';
  const label = STATUS_LABEL[status] ?? status;
  const style = STATUS_STYLE[status] ?? STATUS_STYLE.pending;

  return (
    <span className={`inline-flex items-center gap-1.5 whitespace-nowrap rounded px-2.5 py-0.5 text-xs font-semibold border shadow-2xs ${style}`}>
      <span className="text-[11px] font-bold opacity-80">{icon}</span>
      <span>{label}</span>
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
    <span className={`inline-flex items-center gap-1.5 whitespace-nowrap rounded px-2.5 py-0.5 text-xs font-semibold border shadow-2xs ${style}`}>
      <span className="font-bold">{isNonCompliant ? '⚠' : isCompliant ? '✓' : '•'}</span>
      <span>{label}</span>
    </span>
  );
}

export function PdfLink({ url, label = 'Open PDF' }) {
  if (!url) return <span className="text-xs text-slate-400 italic">No PDF</span>;
  return (
    <a
      href={url}
      target="_blank"
      rel="noreferrer"
      className="inline-flex items-center gap-1.5 rounded border border-govt-navy/80 bg-white px-3 py-1 text-xs font-semibold text-govt-navy hover:bg-govt-navy hover:text-white transition-all shadow-2xs focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy"
    >
      <svg className="w-3.5 h-3.5 fill-current" viewBox="0 0 20 20">
        <path d="M4 2a2 2 0 00-2 2v12a2 2 0 002 2h12a2 2 0 002-2V8l-6-6H4zm5 1.5V8h4.5L9 3.5zM4 4h4v5h5v7H4V4z"/>
      </svg>
      <span>{label}</span>
      <span aria-hidden="true" className="text-[10px] opacity-70">↗</span>
    </a>
  );
}

export function Panel({ title, note, children, action }) {
  return (
    <section className="border border-slate-300 bg-white border-t-[3px] border-t-govt-navy shadow-xs rounded-xs overflow-hidden">
      <header className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-200 bg-[#f8f9fa] px-4 py-3">
        <div>
          <h2 className="text-sm font-bold text-slate-900 tracking-wide uppercase">{title}</h2>
          {note && <p className="mt-0.5 text-xs text-slate-600 font-medium">{note}</p>}
        </div>
        {action && <div className="text-sm font-medium">{action}</div>}
      </header>
      {children}
    </section>
  );
}

export function EmptyState({ message, hint }) {
  return (
    <div className="px-4 py-14 text-center flex flex-col items-center">
      <div className="w-12 h-12 rounded-full bg-slate-100 flex items-center justify-center text-slate-400 mb-3 border border-slate-200">
        <svg className="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
        </svg>
      </div>
      <p className="text-sm font-semibold text-slate-700">{message}</p>
      {hint && <p className="mt-1 text-xs text-slate-500 max-w-sm">{hint}</p>}
    </div>
  );
}

export function Loading({ label = 'Loading queue' }) {
  return (
    <div className="px-4 py-16 text-center flex flex-col items-center justify-center gap-3" role="status">
      <div className="w-8 h-8 border-3 border-slate-200 border-t-govt-navy border-r-saffron rounded-full animate-spin"></div>
      <span className="text-xs font-semibold text-slate-600 tracking-wide">{label}…</span>
    </div>
  );
}

export function Breadcrumb({ items }) {
  if (!items || items.length === 0) return null;
  return (
    <nav aria-label="Breadcrumb" className="mb-4">
      <ol className="flex flex-wrap items-center gap-1.5 text-xs text-slate-500">
        <li>
          <Link to="/" className="inline-flex items-center gap-1 hover:text-govt-navy font-medium transition-colors">
            <span>🏛️</span>
            <span>Home</span>
          </Link>
        </li>
        {items.map((item, idx) => (
          <li key={idx} className="flex items-center gap-1.5">
            <span aria-hidden="true" className="text-slate-400 text-[10px]">›</span>
            {item.to ? (
              <Link to={item.to} className="hover:text-govt-navy font-medium transition-colors">{item.label}</Link>
            ) : (
              <span className="text-slate-900 font-bold">{item.label}</span>
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
