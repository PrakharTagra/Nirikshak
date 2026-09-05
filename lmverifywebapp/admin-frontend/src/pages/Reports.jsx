import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getReports, getOfficers, STATUSES, STATUS_LABEL, CHANNEL_LABEL } from '../lib/adminApi.js';
import { StatusBadge, PdfLink, Panel, Loading, EmptyState, formatDate } from '../components/ui.jsx';

const selectClass =
  'rounded-sm border border-slate-300 bg-white px-2 py-1.5 text-sm text-slate-800 focus:border-[#0b2e6f] focus:outline-none focus:ring-1 focus:ring-[#0b2e6f]';

export default function Reports() {
  const [filters, setFilters] = useState({ status: 'all', channel: 'all', officerId: 'all', search: '' });
  const [rows, setRows] = useState(null);
  const [officers, setOfficers] = useState([]);

  useEffect(() => {
    getOfficers().then((all) => setOfficers(all.filter((o) => o.role === 'DMI' || o.role === 'LMO')));
  }, []);

  useEffect(() => {
    let cancelled = false;
    setRows(null);
    getReports(filters).then((r) => { if (!cancelled) setRows(r); });
    return () => { cancelled = true; };
  }, [filters]);

  const set = (key) => (e) => setFilters((f) => ({ ...f, [key]: e.target.value }));

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-lg font-semibold text-slate-900">Inspection records</h1>
        <p className="mt-1 text-sm text-slate-600">
          Every report filed, from both channels. Decisions are taken by Assistant Controllers;
          this register is read-only.
        </p>
      </div>

      <div className="flex flex-wrap items-end gap-3 border border-slate-200 bg-white p-3">
        <div className="min-w-[14rem] flex-1">
          <label htmlFor="search" className="block text-xs text-slate-600">Search</label>
          <input id="search" type="search" value={filters.search} onChange={set('search')}
            placeholder="Reference or officer" className={`mt-1 w-full ${selectClass}`} />
        </div>

        <div>
          <label htmlFor="status" className="block text-xs text-slate-600">Status</label>
          <select id="status" value={filters.status} onChange={set('status')} className={`mt-1 ${selectClass}`}>
            <option value="all">All statuses</option>
            {STATUSES.map((s) => <option key={s} value={s}>{STATUS_LABEL[s]}</option>)}
          </select>
        </div>

        <div>
          <label htmlFor="channel" className="block text-xs text-slate-600">Channel</label>
          <select id="channel" value={filters.channel} onChange={set('channel')} className={`mt-1 ${selectClass}`}>
            <option value="all">Both channels</option>
            <option value="ecommerce">{CHANNEL_LABEL.ecommerce}</option>
            <option value="field">{CHANNEL_LABEL.field}</option>
          </select>
        </div>

        <div>
          <label htmlFor="officer" className="block text-xs text-slate-600">Filed by</label>
          <select id="officer" value={filters.officerId} onChange={set('officerId')} className={`mt-1 ${selectClass}`}>
            <option value="all">All officers</option>
            {officers.map((o) => <option key={o.id} value={o.id}>{o.full_name} ({o.role})</option>)}
          </select>
        </div>
      </div>

      <Panel title="Records" note={rows ? `${rows.length} shown` : undefined}>
        {!rows && <Loading label="Loading records" />}

        {rows && rows.length === 0 && (
          <EmptyState message="No records match these filters." hint="Clear the search or widen the status filter." />
        )}

        {rows && rows.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-left text-xs text-slate-600">
                  <th scope="col" className="px-4 py-2 font-medium">Reference</th>
                  <th scope="col" className="px-4 py-2 font-medium">Officer</th>
                  <th scope="col" className="px-4 py-2 font-medium">Channel</th>
                  <th scope="col" className="px-4 py-2 font-medium">Inspected on</th>
                  <th scope="col" className="px-4 py-2 font-medium">Status</th>
                  <th scope="col" className="px-4 py-2 font-medium">Decided by</th>
                  <th scope="col" className="px-4 py-2 font-medium">Report</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {rows.map((r) => (
                  <tr key={r.id} className="hover:bg-slate-50">
                    <td className="whitespace-nowrap px-4 py-2.5">
                      <Link to={`/reports/${r.id}`}
                        className="font-mono text-xs text-[#0b2e6f] underline-offset-2 hover:underline">
                        {r.reference_no}
                      </Link>
                    </td>
                    <td className="whitespace-nowrap px-4 py-2.5">
                      <span className="text-slate-900">{r.officer_name}</span>
                      <span className="ml-2 text-xs text-slate-500">{r.officer_role}</span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-2.5 text-slate-700">{CHANNEL_LABEL[r.channel]}</td>
                    {/* inspected_at, created_at nahi. Field app offline chalti
                        hai, to inspection aur sync mein dinon ka farak ho sakta hai. */}
                    <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-slate-700">
                      {formatDate(r.inspected_at)}
                    </td>
                    <td className="px-4 py-2.5"><StatusBadge status={r.status} /></td>
                    <td className="whitespace-nowrap px-4 py-2.5 text-slate-700">{r.decided_by_name ?? '—'}</td>
                    <td className="whitespace-nowrap px-4 py-2.5"><PdfLink url={r.pdf_url} label="PDF" /></td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </Panel>
    </div>
  );
}
