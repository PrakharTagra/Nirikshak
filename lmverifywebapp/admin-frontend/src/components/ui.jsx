import { STATUS_LABEL } from '../lib/adminApi.js';

// Status colours kaam ki cheez hain, sajawat nahi: pending amber hai kyunki
// woh kisi ke kaam ka intezaar kar rahi hai, aur rejected laal — dono ko ek
// nazar mein alag dikhna chahiye.
const STATUS_STYLE = {
  pending: 'bg-amber-50 text-amber-900 ring-amber-300',
  approved: 'bg-emerald-50 text-emerald-800 ring-emerald-300',
  rejected: 'bg-red-50 text-red-800 ring-red-300',
};

export function StatusBadge({ status }) {
  return (
    <span className={`inline-flex whitespace-nowrap rounded-sm px-2 py-0.5 text-xs font-medium ring-1 ring-inset ${STATUS_STYLE[status] ?? STATUS_STYLE.pending}`}>
      {STATUS_LABEL[status] ?? status}
    </span>
  );
}

/** The PDF is the whole inspection. It is a button, not a footnote. */
export function PdfLink({ url, label = 'Open report PDF' }) {
  if (!url) return <span className="text-xs text-slate-400">No PDF</span>;
  return (
    <a
      href={url}
      target="_blank"
      rel="noreferrer"
      className="inline-flex items-center gap-1.5 rounded-sm border border-[#0b2e6f] px-3 py-1.5 text-xs font-medium text-[#0b2e6f] hover:bg-[#0b2e6f] hover:text-white focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#0b2e6f]"
    >
      {label}
      <span aria-hidden="true">↗</span>
    </a>
  );
}

export function Panel({ title, note, children, action }) {
  return (
    <section className="border border-slate-200 bg-white">
      <header className="flex items-baseline justify-between gap-4 border-b border-slate-200 px-4 py-3">
        <div>
          <h2 className="text-sm font-semibold text-slate-900">{title}</h2>
          {note && <p className="mt-0.5 text-xs text-slate-500">{note}</p>}
        </div>
        {action}
      </header>
      {children}
    </section>
  );
}

export function EmptyState({ message, hint }) {
  return (
    <div className="px-4 py-12 text-center">
      <p className="text-sm text-slate-700">{message}</p>
      {hint && <p className="mt-1 text-xs text-slate-500">{hint}</p>}
    </div>
  );
}

export function Loading({ label = 'Loading' }) {
  return (
    <div className="px-4 py-12 text-center text-sm text-slate-500" role="status">
      {label}…
    </div>
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