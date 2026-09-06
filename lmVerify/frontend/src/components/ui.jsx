import React from "react";
import { Link } from "react-router-dom";

const STATUS_STYLE = {
  compliant: "bg-emerald-100 text-emerald-900 border-emerald-300",
  non_compliant: "bg-red-100 text-red-900 border-red-300",
  partial: "bg-amber-100 text-amber-900 border-amber-300",
  exempt: "bg-blue-100 text-blue-900 border-blue-300",
  pending: "bg-amber-100 text-amber-900 border-amber-300",
};

const STATUS_LABEL = {
  compliant: "COMPLIANT",
  non_compliant: "NON-COMPLIANT",
  partial: "PARTIALLY COMPLIANT",
  exempt: "EXEMPT",
  pending: "PENDING DECISION",
};

const STATUS_ICONS = {
  compliant: "✓",
  non_compliant: "✗",
  partial: "⚠",
  exempt: "ℹ",
  pending: "◷",
};

export function StatusBadge({ status }) {
  const normalized = status?.toLowerCase().replace(/ /g, "_") || "pending";
  return (
    <span
      className={`inline-flex items-center gap-1 whitespace-nowrap rounded-sm px-2.5 py-0.5 text-xs font-bold border ${
        STATUS_STYLE[normalized] || STATUS_STYLE.pending
      }`}
    >
      <span>{STATUS_ICONS[normalized] || ""}</span>
      <span>{STATUS_LABEL[normalized] || status}</span>
    </span>
  );
}

export function Panel({ title, note, children, action, className = "" }) {
  return (
    <section className={`border-t-[3px] border-t-govt-navy border-x border-b border-slate-200 bg-white shadow-sm rounded-sm ${className}`}>
      <header className="flex items-center justify-between gap-4 border-b border-slate-200 bg-[#f8f9fc] px-4 py-3">
        <div>
          <h2 className="text-sm font-bold text-govt-dark tracking-wide">{title}</h2>
          {note && <p className="mt-0.5 text-xs text-slate-600 font-medium">{note}</p>}
        </div>
        {action && <div>{action}</div>}
      </header>
      {children}
    </section>
  );
}

export function EmptyState({ message, hint }) {
  return (
    <div className="px-4 py-16 text-center">
      <div className="mx-auto h-12 w-12 text-slate-300 mb-3 flex items-center justify-center">
        <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="1.5" className="h-8 w-8">
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
          />
        </svg>
      </div>
      <p className="text-sm font-semibold text-slate-700">{message}</p>
      {hint && <p className="mt-1 text-xs text-slate-500">{hint}</p>}
    </div>
  );
}

export function Loading({ label = "Processing" }) {
  return (
    <div className="px-4 py-16 text-center flex flex-col items-center justify-center gap-3" role="status">
      <div className="h-7 w-7 animate-spin rounded-full border-3 border-slate-200 border-t-govt-navy" />
      <span className="text-sm font-semibold text-slate-700">{label}…</span>
    </div>
  );
}

export function Breadcrumb({ items }) {
  return (
    <nav aria-label="Breadcrumb" className="mb-4">
      <ol className="flex flex-wrap items-center gap-2 text-xs text-slate-600 font-medium">
        <li>
          <Link to="/" className="hover:text-govt-navy hover:underline">
            Dashboard
          </Link>
        </li>
        {items.map((item, idx) => (
          <li key={idx} className="flex items-center gap-2">
            <span className="text-slate-400">/</span>
            {item.to ? (
              <Link to={item.to} className="hover:text-govt-navy hover:underline">
                {item.label}
              </Link>
            ) : (
              <span className="text-slate-900 font-bold">{item.label}</span>
            )}
          </li>
        ))}
      </ol>
    </nav>
  );
}

export function PdfButton({ onClick, loading, label = "Download Official PDF Report" }) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={loading}
      className="inline-flex items-center gap-2 rounded-sm bg-govt-navy px-4 py-2 text-xs font-bold uppercase tracking-wider text-white shadow hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-60 transition-colors"
    >
      <span aria-hidden="true" className="text-sm">📄</span>
      <span>{loading ? "Generating PDF…" : label}</span>
      <span aria-hidden="true">⬇</span>
    </button>
  );
}
