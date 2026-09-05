import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getQueue, AWAITING_STATUSES, STATUS_LABEL, CHANNEL_LABEL } from '../lib/acApi.js';
import { StatusBadge, PdfLink, Panel, Loading, EmptyState, formatDate, Breadcrumb } from '../components/ui.jsx';

const selectClass =
  'rounded-sm border border-slate-300 bg-white px-3 py-1.5 text-sm text-slate-800 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm';

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
      <Breadcrumb items={[{label: awaiting ? 'Awaiting Decision' : 'All Reports'}]} />
      
      <div>
        <h1 className="text-xl font-bold text-govt-navy uppercase tracking-wide">
          {awaiting ? 'Awaiting Decision' : 'All Reports'}
        </h1>
        <p className="mt-1 text-sm font-medium text-slate-600">
          {!rows
            ? 'Reports submitted in your jurisdiction.'
            : awaiting
              ? rows.length === 0
                ? 'Nothing is waiting on you. The queue is clear.'
                : `${rows.length} report${rows.length > 1 ? 's' : ''} still open.`
              : `${rows.length} report${rows.length === 1 ? '' : 's'} on record, ${open} still open.`}
        </p>
      </div>

      <div className="flex flex-wrap items-end gap-4 border border-slate-300 bg-slate-50 p-4 rounded-sm shadow-sm">
        <div className="min-w-[16rem] flex-1">
          <label htmlFor="search" className="block text-xs font-semibold uppercase tracking-wider text-slate-600 mb-1">Search</label>
          <input id="search" type="search" value={filters.search} onChange={set('search')}
            placeholder="Reference or officer name..." className={`w-full ${selectClass}`} />
        </div>

        {!awaiting && (
          <div className="min-w-[12rem]">
            <label htmlFor="status" className="block text-xs font-semibold uppercase tracking-wider text-slate-600 mb-1">Status</label>
            <select id="status" value={filters.status} onChange={set('status')} className={`w-full ${selectClass}`}>
              <option value="all">All Statuses</option>
              {Object.entries(STATUS_LABEL).map(([v, l]) => <option key={v} value={v}>{l}</option>)}
            </select>
          </div>
        )}

        <div className="min-w-[12rem]">
          <label htmlFor="channel" className="block text-xs font-semibold uppercase tracking-wider text-slate-600 mb-1">Channel</label>
          <select id="channel" value={filters.channel} onChange={set('channel')} className={`w-full ${selectClass}`}>
            <option value="all">Both Channels</option>
            <option value="ecommerce">{CHANNEL_LABEL.ecommerce}</option>
            <option value="field">{CHANNEL_LABEL.field}</option>
          </select>
        </div>
      </div>

      {error && (
        <p role="alert" className="border-l-4 border-amber-500 bg-amber-50 px-4 py-3 text-sm text-amber-900 shadow-sm">{error}</p>
      )}

      <Panel title="Inspection Reports" note={rows ? `${rows.length} records found` : undefined}>
        {!rows && !error && <Loading label="Fetching records" />}
        {rows?.length === 0 && (
          awaiting
            ? <EmptyState message="The queue is clear." hint="Every report in your jurisdiction has been decided." />
            : <EmptyState message="No records match the current filters." hint="Try adjusting your search or clearing filters." />
        )}

        {rows?.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm border-collapse">
              <thead>
                <tr className="bg-govt-cream border-y-2 border-slate-300 text-left text-xs font-semibold uppercase tracking-wider text-slate-700">
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Reference No.</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Officer</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Channel</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Inspected On</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Status</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200 text-center">Action</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200 bg-white">
                {rows.map((r, i) => (
                  <tr key={r.id} className={`hover:bg-govt-light-blue transition-colors ${i % 2 === 0 ? '' : 'bg-slate-50'}`}>
                    <td className="whitespace-nowrap px-4 py-3 border-x border-slate-200">
                      <Link to={`/reports/${r.id}`}
                        className="font-mono text-sm font-semibold text-govt-navy underline-offset-4 hover:underline">
                        {r.reference_no}
                      </Link>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 border-x border-slate-200">
                      <div className="font-medium text-slate-900">{r.officer_name}</div>
                      <div className="text-xs text-slate-500 mt-0.5">{r.officer_role}</div>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-slate-700 border-x border-slate-200">
                      <span className="bg-slate-100 text-slate-800 px-2 py-1 rounded text-xs font-medium border border-slate-200">
                        {CHANNEL_LABEL[r.channel]}
                      </span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 tabular-nums text-slate-700 font-medium border-x border-slate-200">
                      {formatDate(r.inspected_at)}
                    </td>
                    <td className="px-4 py-3 border-x border-slate-200"><StatusBadge status={r.status} /></td>
                    <td className="whitespace-nowrap px-4 py-3 text-center border-x border-slate-200">
                      <PdfLink url={r.pdf_url} label="View PDF" />
                    </td>
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
