import React from "react";
import ComplianceBadge from "./ComplianceBadge.jsx";
import StatusBadge from "./StatusBadge.jsx";

const FORMAT_STATUS_STYLES = {
  pass: "bg-emerald-50 text-emerald-700 ring-emerald-200",
  fail: "bg-red-50 text-red-700 ring-red-200",
  unknown: "bg-slate-100 text-slate-500 ring-slate-200",
  not_applicable: "bg-slate-100 text-slate-500 ring-slate-200",
};

const FORMAT_STATUS_LABELS = {
  pass: "Pass",
  fail: "Fail",
  unknown: "Can't verify from text",
  not_applicable: "N/A",
};

// Renders the structured output of POST /api/compliance (see
// local-scraper/routes/compliance.js + utils/llmCompliance.js) — the
// single-pass "whole raw text → LLM → structured JSON" extraction against
// the Legal Metrology Rule 6 checklist. Not a mock: every field here comes
// straight from the model's tool-use response, enriched with the static
// checklist metadata (label/rule citation) from legalMetrologyChecklist.js.
export default function ComplianceReport({ report }) {
  if (!report) return null;

  const { scope, declarations = [], formatChecks = [], overallStatus, summary } = report;
  const foundCount = declarations.filter((d) => d.status === "present").length;
  const applicableCount = declarations.filter((d) => d.status !== "not_applicable").length;

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-center justify-between gap-3 rounded-lg border border-slate-200 bg-white p-4">
        <div>
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
            Overall status
          </p>
          <div className="mt-1">
            <ComplianceBadge status={overallStatus} />
          </div>
        </div>
        <div className="text-right">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
            Declarations found
          </p>
          <p className="mt-1 text-sm font-semibold text-slate-800">
            {foundCount} / {applicableCount || declarations.length}
          </p>
        </div>
      </div>

      {summary && (
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Summary</p>
          <p className="mt-1 text-sm text-slate-700">{summary}</p>
        </div>
      )}

      {scope?.excluded && (
        <div className="rounded-md bg-slate-50 px-4 py-3 text-sm text-slate-600 ring-1 ring-inset ring-slate-200">
          <p className="font-medium text-slate-700">Out of scope</p>
          <p className="mt-0.5">
            {scope.exclusionGate?.label || scope.exclusionReason || "Excluded by a scope gate."}
            {scope.notes ? ` — ${scope.notes}` : ""}
          </p>
        </div>
      )}
      {scope?.partialExemption && !scope?.excluded && (
        <div className="rounded-md bg-amber-50 px-4 py-3 text-sm text-amber-700 ring-1 ring-inset ring-amber-200">
          Net quantity is 10–20 g/ml — only MRP and net quantity are required; the rest of the
          checklist is marked not applicable.
        </div>
      )}

      <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
        <p className="border-b border-slate-100 px-4 py-2 text-xs font-medium uppercase tracking-wide text-slate-400">
          Rule 6 — mandatory declarations
        </p>
        <table className="w-full text-left text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-400">
            <tr>
              <th className="px-4 py-2 font-medium">#</th>
              <th className="px-4 py-2 font-medium">Required declaration</th>
              <th className="px-4 py-2 font-medium">Extracted value</th>
              <th className="px-4 py-2 font-medium">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {declarations.map((d) => (
              <tr key={d.id ?? d.key}>
                <td className="px-4 py-3 text-slate-400">{d.id}</td>
                <td className="px-4 py-3 text-slate-700">
                  {d.label}
                  <span className="ml-1.5 text-xs text-slate-400">{d.rule}</span>
                  {d.issues?.length > 0 && (
                    <ul className="mt-1 list-disc pl-4 text-xs text-amber-600">
                      {d.issues.map((issue, i) => (
                        <li key={i}>{issue}</li>
                      ))}
                    </ul>
                  )}
                </td>
                <td className="px-4 py-3 text-slate-600">{d.value ?? "—"}</td>
                <td className="px-4 py-3">
                  {d.status === "not_applicable" ? (
                    <span className="rounded-full bg-slate-100 px-2 py-0.5 text-xs font-medium text-slate-500 ring-1 ring-inset ring-slate-200">
                      N/A
                    </span>
                  ) : (
                    <StatusBadge found={d.status === "present"} />
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
        <p className="border-b border-slate-100 px-4 py-2 text-xs font-medium uppercase tracking-wide text-slate-400">
          Format &amp; presentation rules
        </p>
        <table className="w-full text-left text-sm">
          <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-400">
            <tr>
              <th className="px-4 py-2 font-medium">Rule</th>
              <th className="px-4 py-2 font-medium">Details</th>
              <th className="px-4 py-2 font-medium">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {formatChecks.map((f) => (
              <tr key={f.key}>
                <td className="px-4 py-3 text-slate-700">
                  {f.label}
                  <span className="ml-1.5 text-xs text-slate-400">{f.rule}</span>
                </td>
                <td className="px-4 py-3 text-slate-600">{f.details || "—"}</td>
                <td className="px-4 py-3">
                  <span
                    className={`rounded-full px-2 py-0.5 text-xs font-medium ring-1 ring-inset ${
                      FORMAT_STATUS_STYLES[f.status] || FORMAT_STATUS_STYLES.unknown
                    }`}
                  >
                    {FORMAT_STATUS_LABELS[f.status] || f.status}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
