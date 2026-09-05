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
        className="flex h-4 w-full overflow-hidden rounded bg-slate-200 shadow-inner"
        role="img"
        aria-label={entries.map(([s, n]) => `${STATUS_LABEL[s]}: ${n}`).join(", ")}
      >
        {entries.map(([status, count]) => (
          <div
            key={status}
            className={BAR_COLOUR[status]}
            style={{ width: `${(count / total) * 100}%` }}
          />
        ))}
      </div>

      <dl className="mt-6 grid grid-cols-3 gap-x-6 gap-y-4">
        {Object.entries(byStatus).map(([status, count]) => (
          <div key={status} className="flex items-start gap-3 bg-slate-50 p-3 rounded border border-slate-100">
            <span className={`mt-1 h-3 w-3 shrink-0 rounded-full shadow-sm ${BAR_COLOUR[status]}`} />
            <div>
              <dd className="text-2xl font-bold tabular-nums leading-none text-slate-900">
                {count}
              </dd>
              <dt className="mt-1.5 text-xs font-medium uppercase tracking-wide text-slate-600">{STATUS_LABEL[status]}</dt>
            </div>
          </div>
        ))}
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
  if (!data) return <Loading label="Loading dashboard" />;

  return (
    <div className="space-y-6">
      <Breadcrumb items={[{ label: 'Dashboard' }]} />
      
      <div className="flex flex-wrap items-end justify-between gap-4 border-b border-slate-300 pb-4">
        <div>
          <h1 className="text-2xl font-bold text-govt-navy">Controller Dashboard</h1>
          <p className="mt-1.5 text-sm text-slate-600 font-medium">
            <span className="text-slate-900 font-bold">{data.awaitingDecision}</span> of <span className="text-slate-900 font-bold">{data.total}</span> reports are still waiting on
            an Assistant Controller.
          </p>
        </div>
        <button
          onClick={exportRegister}
          disabled={exporting}
          className="rounded bg-govt-maroon px-5 py-2.5 text-sm font-semibold text-white hover:bg-red-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-maroon disabled:opacity-60 transition-colors shadow-sm flex items-center gap-2"
        >
          <span>📊</span> {exporting ? "Preparing Export…" : "Export to Excel"}
        </button>
      </div>

      {exportError && (
        <p role="alert" className="border-l-4 border-red-600 bg-red-50 px-4 py-3 text-sm text-red-900 font-medium shadow-sm">
          {exportError}
        </p>
      )}

      <Panel
        title="Inspection Caseload Overview"
        note={`${data.byChannel.ecommerce} from ${CHANNEL_LABEL.ecommerce} · ${data.byChannel.field} from ${CHANNEL_LABEL.field}`}
        action={
          <Link to="/reports" className="text-sm font-medium text-govt-navy underline-offset-2 hover:underline">
            View all records →
          </Link>
        }
      >
        <div className="p-6">
          <StatusLedger byStatus={data.byStatus} total={data.total} />
        </div>
      </Panel>

      <div className="grid items-start gap-6 lg:grid-cols-2">
        <Panel title="Active Inspectors" note="Reports filed from the field and from marketplaces">
          <table className="w-full text-sm border-collapse border border-slate-300">
            <thead className="bg-[#f0f4f8]">
              <tr className="text-left text-xs text-govt-dark uppercase tracking-wider border-b border-slate-300">
                <th scope="col" className="px-4 py-3 font-semibold border-r border-slate-300">Officer</th>
                <th scope="col" className="px-4 py-3 font-semibold border-r border-slate-300">Designation</th>
                <th scope="col" className="px-4 py-3 font-semibold">Filed</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200">
              {data.inspectors.map((o) => (
                <tr key={o.id} className="even:bg-govt-light-blue hover:bg-slate-100 transition-colors">
                  <td className="px-4 py-3 text-slate-900 font-medium border-r border-slate-300">{o.full_name}</td>
                  <td className="px-4 py-3 text-slate-600 border-r border-slate-300">{o.role}</td>
                  <td className="px-4 py-3 tabular-nums text-slate-800 font-medium">{o.filed}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>

        <Panel
          title="Assistant Controllers"
          note="Decisions taken in each jurisdiction"
          action={
            <Link to="/officers" className="text-sm font-medium text-govt-navy underline-offset-2 hover:underline">
              Manage officers →
            </Link>
          }
        >
          <table className="w-full text-sm border-collapse border border-slate-300">
            <thead className="bg-[#f0f4f8]">
              <tr className="text-left text-xs text-govt-dark uppercase tracking-wider border-b border-slate-300">
                <th scope="col" className="px-4 py-3 font-semibold border-r border-slate-300">Officer</th>
                <th scope="col" className="px-4 py-3 font-semibold border-r border-slate-300">Decided</th>
                <th scope="col" className="px-4 py-3 font-semibold">Rejected</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200">
              {data.controllers.map((ac) => (
                <tr key={ac.id} className="even:bg-govt-light-blue hover:bg-slate-100 transition-colors">
                  <td className="px-4 py-3 text-slate-900 font-medium border-r border-slate-300">{ac.full_name}</td>
                  <td className="px-4 py-3 tabular-nums text-slate-800 font-medium border-r border-slate-300">{ac.decided}</td>
                  <td className="px-4 py-3 tabular-nums text-slate-800 font-medium">{ac.rejected}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>
      </div>

      {data.pendingAccountSetup > 0 && (
        <div className="border-l-4 border-saffron bg-orange-50 px-5 py-4 shadow-sm flex gap-3 items-start">
          <span className="text-xl">⚠️</span>
          <p className="text-sm text-slate-800 font-medium leading-relaxed">
            <span className="font-bold">{data.pendingAccountSetup}</span> account{data.pendingAccountSetup > 1 ? "s have" : " has"} not been activated
            yet. The officer must set their own password before signing in.
          </p>
        </div>
      )}
    </div>
  );
}
