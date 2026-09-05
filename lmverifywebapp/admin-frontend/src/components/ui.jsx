import { STATUS_LABEL } from '../lib/adminApi.js';
import { Link } from 'react-router-dom';

const STATUS_STYLE = {
  pending: 'bg-amber-50 text-amber-900 border-amber-300',
  approved: 'bg-emerald-50 text-emerald-800 border-emerald-300',
  rejected: 'bg-red-50 text-red-800 border-red-300',
};

const STATUS_ICON = {
  pending: '◷',
  approved: '✓',
  rejected: '✗',
};

export function StatusBadge({ status }) {
  return (
    <span className={`inline-flex items-center gap-1.5 whitespace-nowrap rounded-sm px-2 py-0.5 text-xs font-semibold border ${STATUS_STYLE[status] ?? STATUS_STYLE.pending}`}>
      <span>{STATUS_ICON[status]}</span>
      {STATUS_LABEL[status] ?? status}
    </span>
  );
}

export function PdfLink({ url, label = 'Open report PDF' }) {
  if (!url) return <span className="text-xs text-slate-400">No PDF</span>;
  return (
    <a
      href={url}
      target="_blank"
      rel="noreferrer"
      className="inline-flex items-center gap-2 rounded bg-white border border-govt-navy px-3 py-1.5 text-xs font-semibold text-govt-navy hover:bg-govt-navy hover:text-white transition-colors focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy shadow-sm"
    >
      <span>📄</span>
      {label}
      <span aria-hidden="true">↗</span>
    </a>
  );
}

export function Panel({ title, note, children, action }) {
  return (
    <section className="border border-slate-300 bg-white border-t-[3px] border-t-govt-navy shadow-sm">
      <header className="flex items-baseline justify-between gap-4 border-b border-slate-200 bg-[#f7f7f0] px-4 py-3">
        <div>
          <h2 className="text-sm font-semibold text-govt-dark">{title}</h2>
          {note && <p className="mt-0.5 text-xs text-slate-600">{note}</p>}
        </div>
        {action && <div className="text-sm font-medium">{action}</div>}
      </header>
      {children}
    </section>
  );
}

export function EmptyState({ message, hint }) {
  return (
    <div className="px-4 py-16 text-center flex flex-col items-center">
      <div className="text-4xl opacity-20 mb-3">📁</div>
      <p className="text-sm font-medium text-slate-700">{message}</p>
      {hint && <p className="mt-1 text-xs text-slate-500">{hint}</p>}
    </div>
  );
}

export function Loading({ label = 'Loading' }) {
  return (
    <div className="px-4 py-16 flex flex-col items-center justify-center gap-3 text-sm text-slate-600" role="status">
      <div className="w-6 h-6 border-2 border-slate-200 border-t-govt-navy rounded-full animate-spin"></div>
      {label}…
    </div>
  );
}

export function Breadcrumb({ items = [] }) {
  if (!items || items.length === 0) return null;
  
  return (
    <nav aria-label="Breadcrumb" className="mb-6">
      <ol className="flex flex-wrap items-center gap-2 text-xs text-slate-500">
        <li>
          <Link to="/" className="hover:text-govt-navy hover:underline">Home</Link>
        </li>
        {items.map((item, index) => (
          <li key={index} className="flex items-center gap-2">
            <span aria-hidden="true" className="text-slate-400">/</span>
            {item.to ? (
              <Link to={item.to} className="hover:text-govt-navy hover:underline">
                {item.label}
              </Link>
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