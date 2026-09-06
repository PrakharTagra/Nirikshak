import React, { useEffect, useMemo, useState } from "react";
import { Link } from "react-router-dom";
import { getScans } from "../lib/api.js";
import { Breadcrumb, Panel, Loading, EmptyState, StatusBadge } from "../components/ui.jsx";
import { generatePdfReport } from "../lib/pdfReportGenerator.js";
import { useAuth } from "../context/AuthContext.jsx";

export default function PreviousScans() {
  const { user } = useAuth();
  const [scans, setScans] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [query, setQuery] = useState("");
  const [statusFilter, setStatusFilter] = useState("all");
  const [downloadingId, setDownloadingId] = useState(null);

  useEffect(() => {
    let active = true;
    getScans()
      .then((data) => active && setScans(data))
      .catch(() => active && setError("Couldn't load scan history."))
      .finally(() => active && setLoading(false));
    return () => {
      active = false;
    };
  }, []);

  const filtered = useMemo(() => {
    return scans.filter((s) => {
      const matchesQuery =
        !query.trim() ||
        s.title.toLowerCase().includes(query.toLowerCase()) ||
        s.platform.toLowerCase().includes(query.toLowerCase()) ||
        (s.id && s.id.toLowerCase().includes(query.toLowerCase()));
      const matchesStatus = statusFilter === "all" || s.status === statusFilter;
      return matchesQuery && matchesStatus;
    });
  }, [scans, query, statusFilter]);

  const handleDownloadPdf = (e, scan) => {
    e.stopPropagation();
    e.preventDefault();
    setDownloadingId(scan.id);
    try {
      generatePdfReport(scan, user);
    } catch (err) {
      alert("Failed to generate PDF: " + err.message);
    } finally {
      setDownloadingId(null);
    }
  };

  if (loading) return <Loading label="Loading Historical Records" />;

  return (
    <div className="space-y-6">
      <Breadcrumb items={[{ label: "Historical Records" }]} />

      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 pb-4 border-b border-slate-300">
        <div>
          <h1 className="text-xl sm:text-2xl font-bold text-govt-navy">
            Surveillance Registry &amp; Historical Dossiers
          </h1>
          <p className="mt-1 text-xs sm:text-sm text-slate-600 font-medium">
            Search, review, and export statutory inspection reports across e-commerce marketplaces.
          </p>
        </div>

        <Link
          to="/scan/new"
          className="inline-flex items-center justify-center gap-1.5 rounded-sm bg-govt-navy px-4 py-2 text-xs font-bold text-white shadow hover:bg-blue-900 transition-colors shrink-0"
        >
          <span>+</span>
          <span>New Inspection</span>
        </Link>
      </div>

      {error && (
        <div className="border-l-4 border-red-600 bg-red-50 p-4 text-xs font-semibold text-red-900 shadow-sm">
          {error}
        </div>
      )}

      {/* Filter Bar */}
      <div className="flex flex-col sm:flex-row gap-3 bg-white p-4 border border-slate-200 rounded-sm shadow-sm">
        <div className="flex-1">
          <label htmlFor="search-input" className="sr-only">Search</label>
          <input
            id="search-input"
            type="text"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder="Search by product title, reference ID, or platform name…"
            className="w-full rounded-sm border border-slate-300 bg-white px-3.5 py-2 text-xs sm:text-sm text-slate-900 placeholder-slate-400 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy"
          />
        </div>
        <div className="sm:w-56">
          <label htmlFor="status-select" className="sr-only">Filter by status</label>
          <select
            id="status-select"
            value={statusFilter}
            onChange={(e) => setStatusFilter(e.target.value)}
            className="w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-xs sm:text-sm text-slate-700 font-medium focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy"
          >
            <option value="all">All Verdict Statuses</option>
            <option value="compliant">Statutory Compliant</option>
            <option value="partial">Partially Compliant</option>
            <option value="non_compliant">Contraventions Found</option>
          </select>
        </div>
      </div>

      {/* Surveillance Table Panel */}
      <Panel
        title={`Filed Inspection Dossiers (${filtered.length})`}
        note="Permanent audit log of analyzed digital marketplace packaged commodities"
      >
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-[#f1f5f9] text-[11px] uppercase tracking-wider text-slate-700 font-bold border-b border-slate-200">
              <tr>
                <th className="px-4 py-3">Reference No.</th>
                <th className="px-4 py-3">Product Listing / Record</th>
                <th className="px-4 py-3">Marketplace</th>
                <th className="px-4 py-3">Scanned Date</th>
                <th className="px-4 py-3">Rule Verdict</th>
                <th className="px-4 py-3">AC Decision</th>
                <th className="px-4 py-3 text-right">Official Action</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200">
              {filtered.map((s) => (
                <tr key={s.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-4 py-3.5 whitespace-nowrap">
                    <Link
                      to={`/scans/${s.id}`}
                      className="font-mono font-bold text-xs text-govt-navy hover:underline"
                    >
                      {s.reference_no || `REC-${s.id.slice(-6)}`}
                    </Link>
                  </td>
                  <td className="px-4 py-3.5">
                    <Link
                      to={`/scans/${s.id}`}
                      className="font-bold text-slate-900 hover:text-govt-navy hover:underline line-clamp-1"
                    >
                      {s.title}
                    </Link>
                    <p className="text-[11px] text-slate-500 font-mono truncate max-w-sm">{s.url || "Marketplace Listing"}</p>
                  </td>
                  <td className="px-4 py-3.5 font-semibold text-slate-700 whitespace-nowrap">
                    <span className="inline-block rounded bg-slate-100 px-2 py-0.5 text-xs font-medium border border-slate-200">
                      {s.platform}
                    </span>
                  </td>
                  <td className="px-4 py-3.5 text-xs text-slate-600 font-medium whitespace-nowrap">
                    {new Date(s.scannedAt).toLocaleString("en-IN", {
                      day: "2-digit",
                      month: "short",
                      year: "numeric",
                    })}
                  </td>
                  <td className="px-4 py-3.5 whitespace-nowrap">
                    <StatusBadge status={s.status} />
                  </td>
                  <td className="px-4 py-3.5 whitespace-nowrap">
                    {s.controller_status === "approved" ? (
                      <span className="inline-flex items-center gap-1 text-xs font-bold text-emerald-800 bg-emerald-50 px-2 py-0.5 rounded border border-emerald-200">
                        ✅ Approved
                      </span>
                    ) : s.controller_status === "rejected" ? (
                      <span className="inline-flex items-center gap-1 text-xs font-bold text-red-800 bg-red-50 px-2 py-0.5 rounded border border-red-200" title={s.decision_reason}>
                        ❌ Rejected
                      </span>
                    ) : (
                      <span className="inline-flex items-center gap-1 text-xs font-bold text-amber-800 bg-amber-50 px-2 py-0.5 rounded border border-amber-200">
                        ⏳ In Review
                      </span>
                    )}
                  </td>
                  <td className="px-4 py-3.5 text-right whitespace-nowrap">
                    <div className="inline-flex items-center gap-2">
                      <button
                        type="button"
                        onClick={(e) => handleDownloadPdf(e, s)}
                        disabled={downloadingId === s.id}
                        className="inline-flex items-center gap-1 rounded-sm border border-govt-navy bg-white px-2.5 py-1 text-xs font-bold text-govt-navy hover:bg-govt-light-blue shadow-sm transition-colors"
                        title="Download Official PDF Inspection Report"
                      >
                        <span>📄</span>
                        <span>{downloadingId === s.id ? "PDF…" : "PDF"}</span>
                        <span>⬇</span>
                      </button>
                      <Link
                        to={`/scans/${s.id}`}
                        className="rounded-sm bg-slate-100 px-2.5 py-1 text-xs font-bold text-slate-700 hover:bg-slate-200 border border-slate-300"
                      >
                        Details
                      </Link>
                    </div>
                  </td>
                </tr>
              ))}

              {filtered.length === 0 && (
                <tr>
                  <td colSpan={7}>
                    <EmptyState
                      message="No records match your filter criteria."
                      hint="Try adjusting the search query or status filter."
                    />
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </Panel>
    </div>
  );
}
