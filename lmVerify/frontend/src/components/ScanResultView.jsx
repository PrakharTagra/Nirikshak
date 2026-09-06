import React, { useState } from "react";
import { Panel } from "./ui.jsx";

export default function ScanResultView({ data }) {
  const [tab, setTab] = useState("fields");
  const extractedFields = data?.extractedFields || [
    { id: 1, label: "Manufacturer Details", value: data?.declarations?.manufacturer?.name, found: !!data?.declarations?.manufacturer?.present },
    { id: 2, label: "Generic Commodity Name", value: data?.declarations?.commodityName?.value, found: !!data?.declarations?.commodityName?.present },
    { id: 3, label: "Net Quantity & Standard Unit", value: data?.declarations?.netQuantity?.value ? `${data.declarations.netQuantity.value} ${data.declarations.netQuantity.unit || ""}` : null, found: !!data?.declarations?.netQuantity?.present },
    { id: 4, label: "Retail Sale Price (MRP)", value: data?.declarations?.mrp?.value ? `₹ ${data.declarations.mrp.value}` : null, found: !!data?.declarations?.mrp?.present },
    { id: 5, label: "Month & Year of Manufacture", value: data?.declarations?.mfgDate?.value, found: !!data?.declarations?.mfgDate?.present },
    { id: 6, label: "Consumer Grievance Particulars", value: data?.declarations?.consumerCare?.telephone || data?.declarations?.consumerCare?.email, found: !!data?.declarations?.consumerCare?.present },
    { id: 7, label: "Country of Origin", value: data?.declarations?.commodityClassification?.countryOfOrigin, found: !!data?.declarations?.commodityClassification?.countryOfOrigin },
  ];
  const foundCount = extractedFields.filter((f) => f.found).length;
  const totalCount = extractedFields.length;

  return (
    <div className="space-y-6">
      {/* Top summary cards */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-4">
        <div className="border-t-4 border-t-govt-navy bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Marketplace</p>
          <p className="mt-1 text-base font-bold text-slate-900">{data.platform}</p>
        </div>

        <div className="border-t-4 border-t-govt-navy bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Declarations Found</p>
          <p className="mt-1 text-base font-bold text-slate-900">{foundCount} / {totalCount}</p>
        </div>

        <div className="border-t-4 border-t-saffron bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Captured Evidence</p>
          <p className="mt-1 text-base font-bold text-slate-900">{data.images?.length || 0} Media Assets</p>
        </div>

        <div className="border-t-4 border-t-govt-navy bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Inspection Time</p>
          <p className="mt-1 text-xs font-bold text-slate-800">
            {new Date(data.scannedAt).toLocaleString("en-IN")}
          </p>
        </div>
      </div>

      <div className="border border-slate-200 bg-white p-4 rounded-sm shadow-sm">
        <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Listing Title &amp; Target URL</p>
        <p className="mt-1 text-sm font-bold text-govt-navy">{data.title}</p>
        <a
          href={data.url}
          target="_blank"
          rel="noreferrer"
          className="mt-1 block truncate text-xs text-blue-600 hover:underline font-mono"
        >
          {data.url} ↗
        </a>
      </div>

      {/* Tabs */}
      <div className="border-b border-slate-300">
        <nav className="-mb-px flex gap-6">
          {[
            { key: "fields", label: "Detected Declarations Matrix" },
            { key: "images", label: "Captured Product Evidence" },
            { key: "raw", label: "Raw Page Optical Text" },
          ].map((t) => (
            <button
              key={t.key}
              type="button"
              onClick={() => setTab(t.key)}
              className={`border-b-4 px-3 py-2 text-xs sm:text-sm font-bold tracking-wide transition-colors ${
                tab === t.key
                  ? "border-saffron text-govt-navy"
                  : "border-transparent text-slate-500 hover:text-slate-800"
              }`}
            >
              {t.label}
            </button>
          ))}
        </nav>
      </div>

      {tab === "fields" && (
        <Panel
          title="Mandatory Declarations Audit"
          note="Extracted from listing body, specifications table, and packaging OCR text"
        >
          <div className="overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead className="bg-[#f1f5f9] text-[11px] uppercase tracking-wider text-slate-700 font-bold border-b border-slate-200">
                <tr>
                  <th className="px-4 py-3">#</th>
                  <th className="px-4 py-3">Mandatory Statutory Declaration</th>
                  <th className="px-4 py-3">Extracted Listing Value</th>
                  <th className="px-4 py-3 text-center">Status</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200">
                {extractedFields.map((f) => (
                  <tr key={f.id} className="hover:bg-slate-50">
                    <td className="px-4 py-3 text-slate-400 font-mono text-xs">{f.id}</td>
                    <td className="px-4 py-3 font-semibold text-slate-900 text-xs">{f.label}</td>
                    <td className="px-4 py-3 text-xs text-slate-800 font-medium">{f.value ?? "—"}</td>
                    <td className="px-4 py-3 text-center">
                      {f.found ? (
                        <span className="rounded-sm bg-emerald-100 px-2 py-0.5 text-xs font-bold text-emerald-900 border border-emerald-300">
                          ✓ DECLARED
                        </span>
                      ) : (
                        <span className="rounded-sm bg-red-100 px-2 py-0.5 text-xs font-bold text-red-900 border border-red-300">
                          ✗ MISSING
                        </span>
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </Panel>
      )}

      {tab === "images" && (
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-4">
          {data.images?.map((src, i) => (
            <div key={i} className="border border-slate-200 bg-white rounded-sm shadow-sm overflow-hidden">
              <img src={src} alt={`Product packaging scan ${i + 1}`} className="h-44 w-full object-cover" />
              <div className="p-2 border-t border-slate-100 bg-slate-50">
                <p className="text-[11px] font-mono text-slate-600 font-medium">evidence_asset_{i + 1}.jpg</p>
              </div>
            </div>
          ))}
        </div>
      )}

      {tab === "raw" && (
        <div className="border border-slate-300 bg-slate-900 p-4 rounded-sm shadow-inner">
          <pre className="whitespace-pre-wrap font-mono text-xs leading-relaxed text-slate-200 max-h-[500px] overflow-y-auto">
            {data.rawText?.join("\n")}
          </pre>
        </div>
      )}
    </div>
  );
}
