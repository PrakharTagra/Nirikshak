import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getScans } from "../lib/api.js";
import ComplianceBadge from "../components/ComplianceBadge.jsx";
import PageLoader from "../components/PageLoader.jsx";

export default function Dashboard() {
  const [scans, setScans] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

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

  if (loading) return <PageLoader />;

  const total = scans.length;
  const compliant = scans.filter((s) => s.status === "compliant").length;
  const nonCompliant = scans.filter((s) => s.status === "non_compliant").length;
  const platforms = new Set(scans.map((s) => s.platform)).size;

  return (
    <div className="space-y-8">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold text-slate-900">Dashboard</h1>
          <p className="mt-1 text-sm text-slate-500">
            Overview of listing scans and compliance status.
          </p>
        </div>
        <Link
          to="/scan/new"
          className="rounded-md bg-slate-900 px-4 py-2 text-sm font-medium text-white hover:bg-slate-800"
        >
          New scan
        </Link>
      </div>

      {error && <p className="text-sm text-red-600">{error}</p>}

      <div className="rounded-md bg-slate-100 px-4 py-2 text-xs font-medium text-slate-500">
        Showing sample scan history — the scraper backend doesn't persist
        scans yet, so real scans from "New scan" won't appear here until
        that storage layer is built.
      </div>

      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Total scans</p>
          <p className="mt-1 text-2xl font-semibold text-slate-900">{total}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Fully compliant</p>
          <p className="mt-1 text-2xl font-semibold text-emerald-600">{compliant}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Non-compliant</p>
          <p className="mt-1 text-2xl font-semibold text-red-600">{nonCompliant}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Platforms covered</p>
          <p className="mt-1 text-2xl font-semibold text-slate-900">{platforms}</p>
        </div>
      </div>

      <div>
        <div className="mb-3 flex items-center justify-between">
          <h2 className="text-sm font-semibold text-slate-900">Recent scans</h2>
          <Link to="/scans" className="text-xs font-medium text-slate-500 hover:text-slate-800">
            View all
          </Link>
        </div>
        <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-400">
              <tr>
                <th className="px-4 py-2 font-medium">Listing</th>
                <th className="px-4 py-2 font-medium">Platform</th>
                <th className="px-4 py-2 font-medium">Scanned</th>
                <th className="px-4 py-2 font-medium">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {scans.slice(0, 5).map((s) => (
                <tr key={s.id} className="cursor-pointer hover:bg-slate-50">
                  <td className="px-4 py-3">
                    <Link to={`/scans/${s.id}`} className="font-medium text-slate-800 hover:underline">
                      {s.title}
                    </Link>
                  </td>
                  <td className="px-4 py-3 text-slate-600">{s.platform}</td>
                  <td className="px-4 py-3 text-slate-500">
                    {new Date(s.scannedAt).toLocaleDateString()}
                  </td>
                  <td className="px-4 py-3">
                    <ComplianceBadge status={s.status} />
                  </td>
                </tr>
              ))}
              {scans.length === 0 && (
                <tr>
                  <td colSpan={4} className="px-4 py-8 text-center text-sm text-slate-400">
                    No scans yet. Run your first scan to see it here.
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}
