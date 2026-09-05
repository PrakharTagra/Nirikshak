import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { Panel, Loading } from "../components/ui.jsx";
import { getDashboard, downloadRegister, STATUS_LABEL, CHANNEL_LABEL } from "../lib/adminApi.js";

const BAR_COLOUR = {
  pending: "bg-amber-500",
  approved: "bg-emerald-600",
  rejected: "bg-red-600",
};

/* Reports ki poori aabadi ek proportional bar mein. Teen ek jaise stat cards
   wahi numbers dikhate, par asli baat chhupa dete: caseload bata kaise hai. */
function StatusLedger({ byStatus, total }) {
  const entries = Object.entries(byStatus).filter(([, n]) => n > 0);

  return (
    <div>
      <div
        className="flex h-3 w-full overflow-hidden rounded-sm bg-slate-100"
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

      <dl className="mt-4 grid grid-cols-3 gap-x-6 gap-y-3">
        {Object.entries(byStatus).map(([status, count]) => (
          <div key={status} className="flex items-baseline gap-2">
            <span className={`mt-1 h-2.5 w-2.5 shrink-0 rounded-sm ${BAR_COLOUR[status]}`} />
            <div>
              <dd className="text-lg font-semibold tabular-nums leading-none text-slate-900">
                {count}
              </dd>
              <dt className="mt-1 text-xs text-slate-600">{STATUS_LABEL[status]}</dt>
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
      <div className="border border-amber-300 bg-amber-50 p-4 text-sm text-amber-900">
        {error} Check that admin-backend is running.
      </div>
    );
  }
  if (!data) return <Loading label="Loading dashboard" />;

  return (
    <div className="space-y-5">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-lg font-semibold text-slate-900">Dashboard</h1>
          <p className="mt-1 text-sm text-slate-600">
            {data.awaitingDecision} of {data.total} reports are still waiting on
            an Assistant Controller.
          </p>
        </div>
        <button
          onClick={exportRegister}
          disabled={exporting}
          className="rounded-sm border border-[#0b2e6f] px-4 py-2 text-sm font-medium text-[#0b2e6f] hover:bg-[#0b2e6f] hover:text-white focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#0b2e6f] disabled:opacity-60"
        >
          {exporting ? "Preparing…" : "Export to Excel"}
        </button>
      </div>

      {exportError && (
        <p role="alert" className="border border-red-300 bg-red-50 px-3 py-2 text-sm text-red-800">
          {exportError}
        </p>
      )}

      <Panel
        title="Caseload"
        note={`${data.byChannel.ecommerce} from ${CHANNEL_LABEL.ecommerce} · ${data.byChannel.field} from ${CHANNEL_LABEL.field}`}
        action={
          <Link to="/reports" className="text-sm text-[#0b2e6f] underline-offset-2 hover:underline">
            View records
          </Link>
        }
      >
        <div className="p-4">
          <StatusLedger byStatus={data.byStatus} total={data.total} />
        </div>
      </Panel>

      <div className="grid items-start gap-5 lg:grid-cols-2">
        <Panel title="Inspectors" note="Reports filed from the field and from marketplaces">
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-slate-200 text-left text-xs text-slate-600">
                <th scope="col" className="px-4 py-2 font-medium">Officer</th>
                <th scope="col" className="px-4 py-2 font-medium">Designation</th>
                <th scope="col" className="px-4 py-2 font-medium">Filed</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {data.inspectors.map((o) => (
                <tr key={o.id}>
                  <td className="px-4 py-2.5 text-slate-900">{o.full_name}</td>
                  <td className="px-4 py-2.5 text-slate-600">{o.role}</td>
                  <td className="px-4 py-2.5 tabular-nums text-slate-700">{o.filed}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>

        <Panel
          title="Assistant Controllers"
          note="Decisions taken in each jurisdiction"
          action={
            <Link to="/officers" className="text-sm text-[#0b2e6f] underline-offset-2 hover:underline">
              All officers
            </Link>
          }
        >
          <table className="w-full text-sm">
            <thead>
              <tr className="border-b border-slate-200 text-left text-xs text-slate-600">
                <th scope="col" className="px-4 py-2 font-medium">Officer</th>
                <th scope="col" className="px-4 py-2 font-medium">Decided</th>
                <th scope="col" className="px-4 py-2 font-medium">Of which rejected</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {data.controllers.map((ac) => (
                <tr key={ac.id}>
                  <td className="px-4 py-2.5 text-slate-900">{ac.full_name}</td>
                  <td className="px-4 py-2.5 tabular-nums text-slate-700">{ac.decided}</td>
                  <td className="px-4 py-2.5 tabular-nums text-slate-700">{ac.rejected}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>
      </div>

      {data.pendingAccountSetup > 0 && (
        <p className="border-l-4 border-[#FF9933] bg-white px-4 py-3 text-sm text-slate-700">
          {data.pendingAccountSetup} account
          {data.pendingAccountSetup > 1 ? "s have" : " has"} not been activated
          yet. The officer must set their own password before signing in.
        </p>
      )}
    </div>
  );
}
