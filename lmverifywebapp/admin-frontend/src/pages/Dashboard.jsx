import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { Panel, Loading, Breadcrumb } from "../components/ui.jsx";
import { getDashboard, downloadRegister, STATUS_LABEL, CHANNEL_LABEL } from "../lib/adminApi.js";

const BAR_COLOUR = {
  pending: "bg-amber-500",
  approved: "bg-emerald-600",
  rejected: "bg-red-600",
};

function StatusLedger({ byStatus, total }) {
  const entries = Object.entries(byStatus).filter(([, n]) => n > 0);

  return (
    <div>
      <div
        className="flex h-3.5 w-full overflow-hidden rounded bg-slate-200 shadow-inner p-0.5"
        role="img"
        aria-label={entries.map(([s, n]) => `${STATUS_LABEL[s]}: ${n}`).join(", ")}
      >
        {entries.map(([status, count]) => (
          <div
            key={status}
            className={`${BAR_COLOUR[status]} transition-all first:rounded-l last:rounded-r`}
            style={{ width: `${total ? (count / total) * 100 : 0}%` }}
          />
        ))}
      </div>

      <dl className="mt-6 grid grid-cols-1 sm:grid-cols-3 gap-4">
        {Object.entries(byStatus).map(([status, count]) => {
          const pct = total ? Math.round((count / total) * 100) : 0;
          return (
            <div key={status} className="flex items-center justify-between bg-slate-50 p-3.5 rounded border border-slate-200">
              <div className="flex items-center gap-3">
                <span className={`h-3.5 w-3.5 shrink-0 rounded-full shadow-xs ${BAR_COLOUR[status]}`} />
                <div>
                  <dt className="text-xs font-bold uppercase tracking-wider text-slate-700">{STATUS_LABEL[status]}</dt>
                  <span className="text-[11px] text-slate-500">{pct}% of total records</span>
                </div>
              </div>
              <dd className="text-2xl font-bold tabular-nums text-slate-900">
                {count}
              </dd>
            </div>
          );
        })}
      </dl>
    </div>
  );
}

export default function Dashboard() {
  const [data, setData] = useState(null);
  const [error, setError] = useState(null);
  const [exporting, setExporting] = useState(false);
  const [exportError, setExportError] = useState(null);

  async function exportRegister() {
    setExporting(true);
    setExportError(null);
    try {
      await downloadRegister();
    } catch (e) {
      setExportError(e.message ?? "The export could not be generated.");
    } finally {
      setExporting(false);
    }
  }

  useEffect(() => {
    getDashboard()
      .then(setData)
      .catch((e) => setError(e.message ?? "Could not load the dashboard."));
  }, []);

  if (error) {
    return (
      <div className="border-l-4 border-amber-500 bg-amber-50 p-4 text-sm text-amber-900 font-medium">
        {error} Check that admin-backend is running.
      </div>
    );
  }
  if (!data) return <Loading label="Loading dashboard metrics" />;

  return (
    <div className="space-y-6">
      <Breadcrumb items={[{ label: 'Dashboard' }]} />
      
      {/* Top Banner Header */}
      <div className="flex flex-wrap items-end justify-between gap-4 border-b border-slate-300 pb-4">
        <div>
          <div className="flex items-center gap-2">
            <span className="px-2 py-0.5 text-[11px] font-bold uppercase tracking-wider rounded bg-govt-navy text-white">
              Executive View
            </span>
            <span className="text-xs text-slate-500 font-medium">Legal Metrology Act, 2009</span>
          </div>
          <h1 className="text-2xl font-bold text-govt-navy mt-1">Controller Dashboard</h1>
          <p className="mt-1 text-sm text-slate-600 font-medium">
            <span className="text-slate-900 font-bold">{data.awaitingDecision}</span> of <span className="text-slate-900 font-bold">{data.total}</span> inspection reports are currently awaiting Assistant Controller decision.
          </p>
        </div>
        <button
          onClick={exportRegister}
          disabled={exporting}
          className="rounded bg-govt-maroon px-4 py-2 text-xs font-bold uppercase tracking-wider text-white hover:bg-red-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-maroon disabled:opacity-60 transition-all shadow-sm flex items-center gap-2 cursor-pointer"
        >
          <span>📑</span> {exporting ? "Preparing Export…" : "Export Register (Excel)"}
        </button>
      </div>

      {exportError && (
        <p role="alert" className="border-l-4 border-red-600 bg-red-50 px-4 py-3 text-xs text-red-900 font-medium shadow-xs">
          {exportError}
        </p>
      )}

      {/* KPI Overview Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white p-4 rounded border border-slate-200 border-t-4 border-t-govt-navy shadow-xs">
          <div className="flex items-center justify-between text-slate-500">
            <span className="text-xs font-bold uppercase tracking-wider">Total Reports</span>
            <span className="text-lg">📁</span>
          </div>
          <p className="text-2xl font-extrabold text-slate-900 mt-2 tabular-nums">{data.total}</p>
          <p className="text-[11px] text-slate-500 mt-1">Across all inspection channels</p>
        </div>

        <div className="bg-white p-4 rounded border border-slate-200 border-t-4 border-t-amber-500 shadow-xs">
          <div className="flex items-center justify-between text-amber-600">
            <span className="text-xs font-bold uppercase tracking-wider text-slate-700">Awaiting Decision</span>
            <span className="text-lg">⏱</span>
          </div>
          <p className="text-2xl font-extrabold text-amber-600 mt-2 tabular-nums">{data.awaitingDecision}</p>
          <p className="text-[11px] text-slate-500 mt-1">Pending Assistant Controller action</p>
        </div>

        <div className="bg-white p-4 rounded border border-slate-200 border-t-4 border-t-emerald-600 shadow-xs">
          <div className="flex items-center justify-between text-emerald-600">
            <span className="text-xs font-bold uppercase tracking-wider text-slate-700">Approved Reports</span>
            <span className="text-lg">✓</span>
          </div>
          <p className="text-2xl font-extrabold text-emerald-700 mt-2 tabular-nums">{data.byStatus.approved || 0}</p>
          <p className="text-[11px] text-slate-500 mt-1">Sanctioned & verified</p>
        </div>

        <div className="bg-white p-4 rounded border border-slate-200 border-t-4 border-t-red-600 shadow-xs">
          <div className="flex items-center justify-between text-red-600">
            <span className="text-xs font-bold uppercase tracking-wider text-slate-700">Rejected / Action Taken</span>
            <span className="text-lg">✕</span>
          </div>
          <p className="text-2xl font-extrabold text-red-700 mt-2 tabular-nums">{data.byStatus.rejected || 0}</p>
          <p className="text-[11px] text-slate-500 mt-1">Enforcement notices issued</p>
        </div>
      </div>

      <Panel
        title="Inspection Caseload Breakdown"
        note={`${data.byChannel.ecommerce} from ${CHANNEL_LABEL.ecommerce} · ${data.byChannel.field} from ${CHANNEL_LABEL.field}`}
        action={
          <Link to="/reports" className="text-xs font-bold uppercase tracking-wider text-govt-navy hover:underline flex items-center gap-1">
            <span>View All Records</span>
            <span>→</span>
          </Link>
        }
      >
        <div className="p-5 md:p-6">
          <StatusLedger byStatus={data.byStatus} total={data.total} />
        </div>
      </Panel>

      <div className="grid items-start gap-6 lg:grid-cols-2">
        <Panel title="Active Inspectors" note="Reports filed from field and marketplaces">
          <table className="w-full text-sm border-collapse">
            <thead className="bg-[#f0f4f8]">
              <tr className="text-left text-xs text-govt-dark uppercase tracking-wider border-b border-slate-300">
                <th scope="col" className="px-4 py-2.5 font-bold border-r border-slate-200">Officer</th>
                <th scope="col" className="px-4 py-2.5 font-bold border-r border-slate-200">Designation</th>
                <th scope="col" className="px-4 py-2.5 font-bold text-right">Filed</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200">
              {data.inspectors.map((o) => (
                <tr key={o.id} className="even:bg-govt-light-blue/40 hover:bg-slate-100 transition-colors">
                  <td className="px-4 py-2.5 text-slate-900 font-medium border-r border-slate-200">{o.full_name}</td>
                  <td className="px-4 py-2.5 text-slate-600 border-r border-slate-200 font-mono text-xs">{o.role}</td>
                  <td className="px-4 py-2.5 tabular-nums text-slate-900 font-bold text-right">{o.filed}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>

        <Panel
          title="Assistant Controllers"
          note="Decisions taken across regional jurisdictions"
          action={
            <Link to="/officers" className="text-xs font-bold uppercase tracking-wider text-govt-navy hover:underline">
              Manage Officers →
            </Link>
          }
        >
          <table className="w-full text-sm border-collapse">
            <thead className="bg-[#f0f4f8]">
              <tr className="text-left text-xs text-govt-dark uppercase tracking-wider border-b border-slate-300">
                <th scope="col" className="px-4 py-2.5 font-bold border-r border-slate-200">Officer</th>
                <th scope="col" className="px-4 py-2.5 font-bold border-r border-slate-200 text-right">Decided</th>
                <th scope="col" className="px-4 py-2.5 font-bold text-right">Rejected</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200">
              {data.controllers.map((ac) => (
                <tr key={ac.id} className="even:bg-govt-light-blue/40 hover:bg-slate-100 transition-colors">
                  <td className="px-4 py-2.5 text-slate-900 font-medium border-r border-slate-200">{ac.full_name}</td>
                  <td className="px-4 py-2.5 tabular-nums text-emerald-700 font-bold border-r border-slate-200 text-right">{ac.decided}</td>
                  <td className="px-4 py-2.5 tabular-nums text-red-700 font-bold text-right">{ac.rejected}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>
      </div>

      {data.pendingAccountSetup > 0 && (
        <div className="border-l-4 border-saffron bg-orange-50/80 px-5 py-3.5 shadow-2xs rounded-r flex gap-3 items-start border border-orange-200">
          <span className="text-lg text-amber-600">⚠️</span>
          <p className="text-xs text-slate-800 font-medium leading-relaxed">
            <span className="font-bold text-amber-900">{data.pendingAccountSetup}</span> account{data.pendingAccountSetup > 1 ? "s have" : " has"} not been activated yet. The officer must set their personal password upon first login.
          </p>
        </div>
      )}
    </div>
  );
}
