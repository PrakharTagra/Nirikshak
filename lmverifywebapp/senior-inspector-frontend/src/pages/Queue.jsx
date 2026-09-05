import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getQueue, AWAITING_STATUSES, STATUS_LABEL, CHANNEL_LABEL } from '../lib/acApi.js';
import { StatusBadge, PdfLink, Panel, Loading, EmptyState, formatDate } from '../components/ui.jsx';

const selectClass =
  'rounded-sm border border-slate-300 bg-white px-2 py-1.5 text-sm text-slate-800 focus:border-[#0b2e6f] focus:outline-none focus:ring-1 focus:ring-[#0b2e6f]';

/** Ek hi list, do framings. `awaiting` status filter ko us kaam par pin kar
 *  deta hai jo abhi khula hai; uske bina officer poora record dekh raha hai. */
export default function Queue({ awaiting = false }) {
  const [filters, setFilters] = useState({ status: 'all', channel: 'all', search: '' });
  const [rows, setRows] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    let cancelled = false;
    setRows(null);
    setError(null);
    getQueue({ ...filters, status: awaiting ? AWAITING_STATUSES : filters.status })
      .then((r) => { if (!cancelled) setRows(r); })
      .catch((e) => { if (!cancelled) setError(e.message); });
    return () => { cancelled = true; };
  }, [filters, awaiting]);

  const set = (key) => (e) => setFilters((f) => ({ ...f, [key]: e.target.value }));
  const open = rows?.filter((r) => r.status === 'pending').length ?? 0;

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-lg font-semibold text-slate-900">
          {awaiting ? 'Awaiting decision' : 'All reports'}
        </h1>
        <p className="mt-1 text-sm text-slate-600">
          {!rows
            ? 'Reports submitted in your jurisdiction.'
            : awaiting
              ? rows.length === 0
                ? 'Nothing is waiting on you. The queue is clear.'
                : `${rows.length} report${rows.length > 1 ? 's' : ''} still open.`
              : `${rows.length} report${rows.length === 1 ? '' : 's'} on record, ${open} still open.`}
        </p>
      </div>

      <div className="flex flex-wrap items-end gap-3 border border-slate-200 bg-white p-3">
        <div className="min-w-[14rem] flex-1">
          <label htmlFor="search" className="block text-xs text-slate-600">Search</label>
          <input id="search" type="search" value={filters.search} onChange={set('search')}
            placeholder="Reference or officer" className={`mt-1 w-full ${selectClass}`} />
        </div>

        {!awaiting && (
          <div>
            <label htmlFor="status" className="block text-xs text-slate-600">Status</label>
            <select id="status" value={filters.status} onChange={set('status')} className={`mt-1 ${selectClass}`}>
              <option value="all">All statuses</option>
              {Object.entries(STATUS_LABEL).map(([v, l]) => <option key={v} value={v}>{l}</option>)}
            </select>
          </div>
        )}

        <div>
          <label htmlFor="channel" className="block text-xs text-slate-600">Channel</label>
          <select id="channel" value={filters.channel} onChange={set('channel')} className={`mt-1 ${selectClass}`}>
            <option value="all">Both channels</option>
            <option value="ecommerce">{CHANNEL_LABEL.ecommerce}</option>
            <option value="field">{CHANNEL_LABEL.field}</option>
          </select>
        </div>
      </div>

      {error && (
        <p role="alert" className="border border-amber-300 bg-amber-50 px-4 py-3 text-sm text-amber-900">{error}</p>
      )}

      <Panel title="Reports" note={rows ? `${rows.length} shown` : undefined}>
        {!rows && !error && <Loading label="Loading queue" />}
        {rows?.length === 0 && (
          awaiting
            ? <EmptyState message="The queue is clear." hint="Every report in your jurisdiction has been decided." />
            : <EmptyState message="Nothing matches these filters." hint="Try clearing the search." />
        )}

        {rows?.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-left text-xs text-slate-600">
                  <th scope="col" className="px-4 py-2 font-medium">Reference</th>
                  <th scope="col" className="px-4 py-2 font-medium">Officer</th>
                  <th scope="col" className="px-4 py-2 font-medium">Channel</th>
                  <th scope="col" className="px-4 py-2 font-medium">Inspected on</th>
                  <th scope="col" className="px-4 py-2 font-medium">Status</th>
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
                    <td className="whitespace-nowrap px-4 py-2.5 tabular-nums text-slate-700">
                      {formatDate(r.inspected_at)}
                    </td>
                    <td className="px-4 py-2.5"><StatusBadge status={r.status} /></td>
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
