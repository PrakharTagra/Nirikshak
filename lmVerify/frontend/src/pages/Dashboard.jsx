import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getScans } from "../lib/api.js";
import { StatusBadge, Panel, Loading, EmptyState } from "../components/ui.jsx";
import { generatePdfReport } from "../lib/pdfReportGenerator.js";
import { useAuth } from "../context/AuthContext.jsx";

export default function Dashboard() {
  const { user } = useAuth();
  const [scans, setScans] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [downloadingId, setDownloadingId] = useState(null);

  useEffect(() => {
    let active = true;
    getScans()
      .then((data) => {
        if (active) setScans(data);
      })
      .catch(() => active && setError("Couldn't load scan history."))
      .finally(() => active && setLoading(false));
    return () => {
      active = false;
    };
  }, []);

  const handleDownloadPdf = async (e, scan) => {
    e.stopPropagation();
    e.preventDefault();
    setDownloadingId(scan.id);
    try {
      await generatePdfReport(scan, user);
    } catch (err) {
      console.error("PDF generation failed:", err);
      alert("Failed to generate PDF report: " + err.message);
    } finally {
      setDownloadingId(null);
    }
  };

  if (loading) return <Loading label="Loading Surveillance Registry" />;

  const total = scans.length;
  const compliant = scans.filter((s) => s.status === "compliant").length;
  const nonCompliant = scans.filter((s) => s.status === "non_compliant").length;
  const platforms = new Set(scans.map((s) => s.platform)).size;

  return (
    <div className="space-y-6">
      {/* Top Banner / Breadcrumb area */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 pb-4 border-b border-slate-300">
        <div>
          <div className="flex items-center gap-2">
            <h1 className="text-xl sm:text-2xl font-bold text-govt-navy tracking-tight">
              E-Commerce Surveillance Dashboard
            </h1>
            <span className="rounded bg-govt-light-blue px-2 py-0.5 text-xs font-bold text-govt-navy border border-blue-200">
              DMI Portal
            </span>
          </div>
          <p className="mt-1 text-xs sm:text-sm text-slate-600 font-medium">
            Automated statutory compliance tracking under Legal Metrology (Packaged Commodities) Rules, 2011.
          </p>
        </div>

        <Link
          to="/scan/new"
          className="inline-flex items-center justify-center gap-2 rounded-sm bg-govt-navy px-5 py-2.5 text-xs sm:text-sm font-bold tracking-wide text-white shadow-sm hover:bg-blue-900 transition-colors"
        >
          <span>+</span>
          <span>Initiate New Scan</span>
        </Link>
      </div>

      {error && (
        <div className="border-l-4 border-red-600 bg-red-50 p-4 text-xs font-semibold text-red-900 shadow-sm">
          {error}
        </div>
      )}

      {/* KPI Metrics */}
      <div className="grid grid-cols-2 gap-4 sm:grid-cols-4">
        <div className="border-t-4 border-t-govt-navy bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Total Scans Filed</p>
          <p className="mt-1 text-2xl font-extrabold text-govt-dark">{total}</p>
          <p className="mt-0.5 text-[11px] text-slate-400 font-medium">Digital marketplace listings</p>
        </div>

        <div className="border-t-4 border-t-emerald-600 bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-emerald-800">Statutory Compliant</p>
          <p className="mt-1 text-2xl font-extrabold text-emerald-600">{compliant}</p>
          <p className="mt-0.5 text-[11px] text-slate-400 font-medium">Zero contraventions found</p>
        </div>

        <div className="border-t-4 border-t-govt-maroon bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-red-800">Contraventions</p>
          <p className="mt-1 text-2xl font-extrabold text-govt-maroon">{nonCompliant}</p>
          <p className="mt-0.5 text-[11px] text-slate-400 font-medium">Rule violations detected</p>
        </div>

        <div className="border-t-4 border-t-saffron bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-700">Marketplaces</p>
          <p className="mt-1 text-2xl font-extrabold text-slate-900">{platforms}</p>
          <p className="mt-0.5 text-[11px] text-slate-400 font-medium">Platforms under surveillance</p>
        </div>
      </div>

      {/* Recent Surveillance Records Panel */}
      <Panel
        title="Recent Statutory Listing Inspections"
        note="Showing latest digital marketplace scans and rule engine verdicts"
        action={
          <Link
            to="/scans"
            className="text-xs font-bold text-govt-navy hover:underline inline-flex items-center gap-1"
          >
            View Full Register <span>→</span>
          </Link>
        }
      >
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-[#f1f5f9] text-[11px] uppercase tracking-wider text-slate-600 border-b border-slate-200 font-bold">
              <tr>
                <th className="px-4 py-3">Product Listing / Commodity</th>
                <th className="px-4 py-3">Marketplace</th>
                <th className="px-4 py-3">Inspection Date</th>
                <th className="px-4 py-3">Rule Verdict</th>
                <th className="px-4 py-3 text-right">Statutory PDF</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200">
              {scans.slice(0, 6).map((s) => (
                <tr key={s.id} className="hover:bg-slate-50 transition-colors">
                  <td className="px-4 py-3.5">
                    <Link
                      to={`/scans/${s.id}`}
                      className="font-bold text-govt-navy hover:underline line-clamp-1"
                    >
                      {s.title}
                    </Link>
                    <p className="text-[11px] text-slate-500 font-mono truncate max-w-md">{s.url}</p>
                  </td>
                  <td className="px-4 py-3.5 font-semibold text-slate-700">
                    <span className="inline-block rounded bg-slate-100 px-2 py-0.5 text-xs font-medium border border-slate-200">
                      {s.platform}
                    </span>
                  </td>
                  <td className="px-4 py-3.5 text-xs text-slate-600 font-medium">
                    {new Date(s.scannedAt).toLocaleDateString("en-IN", {
                      day: "2-digit",
                      month: "short",
                      year: "numeric",
                    })}
                  </td>
                  <td className="px-4 py-3.5">
                    <StatusBadge status={s.status} />
                  </td>
                  <td className="px-4 py-3.5 text-right">
                    <button
                      type="button"
                      onClick={(e) => handleDownloadPdf(e, s)}
                      disabled={downloadingId === s.id}
                      className="inline-flex items-center gap-1.5 rounded-sm border border-govt-navy bg-white px-2.5 py-1 text-xs font-bold text-govt-navy hover:bg-govt-light-blue shadow-sm transition-colors"
                      title="Download Official PDF Report"
                    >
                      <span>📄</span>
                      <span>{downloadingId === s.id ? "PDF…" : "Download PDF"}</span>
                    </button>
                  </td>
                </tr>
              ))}

              {scans.length === 0 && (
                <tr>
                  <td colSpan={5}>
                    <EmptyState
                      message="No surveillance records found."
                      hint="Initiate a new marketplace listing scan to evaluate Legal Metrology compliance."
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
