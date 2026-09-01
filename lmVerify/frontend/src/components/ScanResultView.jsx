import React, { useState } from "react";
import StatusBadge from "./StatusBadge.jsx";

// Shared tabbed view for a single scan's data — used right after a new scan
// completes (temporary view) and when opening a saved scan from history.
export default function ScanResultView({ data }) {
  const [tab, setTab] = useState("fields");
  const foundCount = data.extractedFields.filter((f) => f.found).length;
  const totalCount = data.extractedFields.length;

  return (
    <div className="space-y-6">
      <div className="grid grid-cols-1 gap-3 sm:grid-cols-4">
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Platform</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">{data.platform}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Declarations found</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">{foundCount} / {totalCount}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Images captured</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">{data.images.length}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Scanned</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">
            {new Date(data.scannedAt).toLocaleString()}
          </p>
        </div>
      </div>

      <div className="rounded-lg border border-slate-200 bg-white p-4">
        <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Listing title</p>
        <p className="mt-1 text-sm text-slate-800">{data.title}</p>
        <p className="mt-1 truncate text-xs text-slate-400">{data.url}</p>
      </div>

      <div className="border-b border-slate-200">
        <nav className="-mb-px flex gap-6">
          {[
            { key: "fields", label: "Detected declarations" },
            { key: "images", label: "Scraped images" },
            { key: "raw", label: "Raw text" },
          ].map((t) => (
            <button
              key={t.key}
              type="button"
              onClick={() => setTab(t.key)}
              className={`border-b-2 px-1 py-2 text-sm font-medium ${
                tab === t.key
                  ? "border-slate-900 text-slate-900"
                  : "border-transparent text-slate-400 hover:text-slate-600"
              }`}
            >
              {t.label}
            </button>
          ))}
        </nav>
      </div>

      {tab === "fields" && (
        <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
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
              {data.extractedFields.map((f) => (
                <tr key={f.id}>
                  <td className="px-4 py-3 text-slate-400">{f.id}</td>
                  <td className="px-4 py-3 text-slate-700">{f.label}</td>
                  <td className="px-4 py-3 text-slate-600">{f.value ?? "—"}</td>
                  <td className="px-4 py-3">
                    <StatusBadge found={f.found} />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}

      {tab === "images" && (
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-4">
          {data.images.map((src, i) => (
            <div key={i} className="overflow-hidden rounded-lg border border-slate-200 bg-white">
              <img src={src} alt={`Scraped listing image ${i + 1}`} className="h-40 w-full object-cover" />
              <p className="px-2 py-1.5 text-xs text-slate-400">image_{i + 1}.jpg</p>
            </div>
          ))}
        </div>
      )}

      {tab === "raw" && (
        <div className="rounded-lg border border-slate-200 bg-slate-900 p-4">
          <pre className="whitespace-pre-wrap font-mono text-xs leading-relaxed text-slate-200">
            {data.rawText.join("\n")}
          </pre>
        </div>
      )}
    </div>
  );
}
