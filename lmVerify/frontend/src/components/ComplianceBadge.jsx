import React from "react";

const STYLES = {
  compliant: "bg-emerald-50 text-emerald-700 ring-emerald-200",
  partial: "bg-amber-50 text-amber-700 ring-amber-200",
  non_compliant: "bg-red-50 text-red-700 ring-red-200",
  exempt: "bg-slate-100 text-slate-600 ring-slate-200",
};

const LABELS = {
  compliant: "Fully compliant",
  partial: "Partially compliant",
  non_compliant: "Non-compliant",
  exempt: "Out of scope / exempt",
};

export default function ComplianceBadge({ status }) {
  const cls = STYLES[status] || STYLES.partial;
  const label = LABELS[status] || "Unknown";
  return (
    <span className={`inline-flex items-center gap-1 rounded-full px-2.5 py-0.5 text-xs font-medium ring-1 ring-inset ${cls}`}>
      {label}
    </span>
  );
}
