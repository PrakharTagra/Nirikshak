import React, { useEffect, useMemo, useState } from "react";
import { Link } from "react-router-dom";
import { getScans } from "../lib/api.js";
import ComplianceBadge from "../components/ComplianceBadge.jsx";
import PageLoader from "../components/PageLoader.jsx";

export default function PreviousScans() {
  const [scans, setScans] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [query, setQuery] = useState("");
  const [statusFilter, setStatusFilter] = useState("all");

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
        s.platform.toLowerCase().includes(query.toLowerCase());
      const matchesStatus = statusFilter === "all" || s.status === statusFilter;
      return matchesQuery && matchesStatus;
    });
  }, [scans, query, statusFilter]);

  if (loading) return <PageLoader />;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold text-slate-900">Previous scans</h1>
        <p className="mt-1 text-sm text-slate-500">
          Search and review previously scanned product listings.
        </p>
      </div>

      {error && <p className="text-sm text-red-600">{error}</p>}

      <div className="rounded-md bg-slate-100 px-4 py-2 text-xs font-medium text-slate-500">
        Showing sample scan history — the scraper backend doesn't persist
        scans yet, so real scans from "New scan" won't appear here until
        that storage layer is built.
      </div>

      <div className="flex flex-col gap-3 sm:flex-row sm:items-center">
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search by title or platform"
          className="flex-1 rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-900 placeholder-slate-400 focus:border-slate-500 focus:outline-none focus:ring-1 focus:ring-slate-500"
        />
        <select
          value={statusFilter}
          onChange={(e) => setStatusFilter(e.target.value)}
          className="rounded-md border border-slate-300 px-3 py-2 text-sm text-slate-700 focus:border-slate-500 focus:outline-none focus:ring-1 focus:ring-slate-500"
        >
          <option value="all">All statuses</option>
          <option value="compliant">Fully compliant</option>
          <option value="partial">Partially compliant</option>
          <option value="non_compliant">Non-compliant</option>
        </select>
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
            {filtered.map((s) => (
              <tr key={s.id} className="hover:bg-slate-50">
                <td className="px-4 py-3">
                  <Link to={`/scans/${s.id}`} className="font-medium text-slate-800 hover:underline">
                    {s.title}
                  </Link>
                  <p className="truncate text-xs text-slate-400">{s.url}</p>
                </td>
                <td className="px-4 py-3 text-slate-600">{s.platform}</td>
                <td className="px-4 py-3 text-slate-500">
                  {new Date(s.scannedAt).toLocaleString()}
                </td>
                <td className="px-4 py-3">
                  <ComplianceBadge status={s.status} />
                </td>
              </tr>
            ))}
            {filtered.length === 0 && (
              <tr>
                <td colSpan={4} className="px-4 py-8 text-center text-sm text-slate-400">
                  No scans match your search.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  );
}
