import { useEffect, useState } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { getReports, getOfficers, STATUSES, STATUS_LABEL, CHANNEL_LABEL } from '../lib/adminApi.js';
import { StatusBadge, PdfLink, Panel, Loading, EmptyState, formatDate, Breadcrumb } from '../components/ui.jsx';

const selectClass =
  'rounded border border-slate-400 bg-white px-3 py-2 text-sm font-medium text-slate-800 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm';

export default function Reports() {
  const [searchParams] = useSearchParams();
  const paramChannel = searchParams.get('channel');
  const [filters, setFilters] = useState({
    status: 'all',
    channel: (paramChannel === 'ecommerce' || paramChannel === 'field') ? paramChannel : 'all',
    officerId: 'all',
    search: '',
  });
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
    <div className="space-y-6">
      <Breadcrumb items={[{ label: 'Inspection Records' }]} />
      
      <div className="border-b border-slate-300 pb-4">
        <h1 className="text-2xl font-bold text-govt-navy">Inspection Records</h1>
        <p className="mt-1.5 text-sm text-slate-600 font-medium">
          Official register of all reports filed from field and marketplace channels.
          Read-only view for Controller oversight.
        </p>
      </div>

      {/* Quick Channel Tabs */}
      <div className="flex flex-wrap gap-2 border-b border-slate-300 pb-1">
        <button
          type="button"
          onClick={() => setFilters((f) => ({ ...f, channel: 'all' }))}
          className={`px-4 py-2 text-xs font-bold rounded-t uppercase tracking-wider transition-colors ${
            filters.channel === 'all'
              ? 'bg-govt-navy text-white shadow-sm'
              : 'bg-slate-200 text-slate-700 hover:bg-slate-300'
          }`}
        >
          All Records
        </button>
        <button
          type="button"
          onClick={() => setFilters((f) => ({ ...f, channel: 'ecommerce' }))}
          className={`px-4 py-2 text-xs font-bold rounded-t uppercase tracking-wider transition-colors flex items-center gap-1.5 ${
            filters.channel === 'ecommerce'
              ? 'bg-blue-900 text-white shadow-sm ring-2 ring-blue-400'
              : 'bg-blue-50 text-blue-900 hover:bg-blue-100 border border-blue-200'
          }`}
        >
          <span>🛒</span>
          <span>Digital Marketplace (DMI) Reports</span>
        </button>
        <button
          type="button"
          onClick={() => setFilters((f) => ({ ...f, channel: 'field' }))}
          className={`px-4 py-2 text-xs font-bold rounded-t uppercase tracking-wider transition-colors flex items-center gap-1.5 ${
            filters.channel === 'field'
              ? 'bg-emerald-900 text-white shadow-sm ring-2 ring-emerald-400'
              : 'bg-emerald-50 text-emerald-900 hover:bg-emerald-100 border border-emerald-200'
          }`}
        >
          <span>🏢</span>
          <span>Field Inspections (LMO)</span>
        </button>
      </div>

      <div className="flex flex-wrap items-end gap-4 border border-slate-300 bg-slate-100 p-5 rounded shadow-sm border-t-[3px] border-t-govt-navy">
        <div className="min-w-[16rem] flex-1">
          <label htmlFor="search" className="block text-xs font-semibold uppercase tracking-wider text-govt-dark mb-1">Search Reference</label>
          <input id="search" type="search" value={filters.search} onChange={set('search')}
            placeholder="Search by reference no or officer name..." className={`w-full ${selectClass}`} />
        </div>

        <div className="min-w-[12rem]">
          <label htmlFor="status" className="block text-xs font-semibold uppercase tracking-wider text-govt-dark mb-1">Status</label>
          <select id="status" value={filters.status} onChange={set('status')} className={`w-full ${selectClass}`}>
            <option value="all">All statuses</option>
            {STATUSES.map((s) => <option key={s} value={s}>{STATUS_LABEL[s]}</option>)}
          </select>
        </div>

        <div className="min-w-[12rem]">
          <label htmlFor="channel" className="block text-xs font-semibold uppercase tracking-wider text-govt-dark mb-1">Channel Filter</label>
          <select id="channel" value={filters.channel} onChange={set('channel')} className={`w-full ${selectClass}`}>
            <option value="all">Both channels</option>
            <option value="ecommerce">{CHANNEL_LABEL.ecommerce}</option>
            <option value="field">{CHANNEL_LABEL.field}</option>
          </select>
        </div>

        <div className="min-w-[14rem]">
          <label htmlFor="officer" className="block text-xs font-semibold uppercase tracking-wider text-govt-dark mb-1">Filed by</label>
          <select id="officer" value={filters.officerId} onChange={set('officerId')} className={`w-full ${selectClass}`}>
            <option value="all">All officers</option>
            {officers.map((o) => <option key={o.id} value={o.id}>{o.full_name} ({o.role})</option>)}
          </select>
        </div>
      </div>

      <Panel title="Official Register" note={rows ? `Total ${rows.length} records shown based on active filters` : undefined}>
        {!rows && <Loading label="Retrieving records" />}

        {rows && rows.length === 0 && (
          <EmptyState message="No inspection records match these filters." hint="Clear the search or adjust the filters above." />
        )}

        {rows && rows.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm border-collapse">
              <thead className="bg-[#f0f4f8]">
                <tr className="border-b-2 border-slate-300 text-left text-xs font-bold text-govt-dark uppercase tracking-wider">
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Reference No.</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Product / Commodity</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Filed By Officer</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Channel</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Inspected On</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Status</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Decided By</th>
                  <th scope="col" className="px-4 py-3">Document</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200">
                {rows.map((r) => (
                  <tr key={r.id} className="even:bg-govt-light-blue hover:bg-slate-100 transition-colors">
                    <td className="whitespace-nowrap px-4 py-3 border-r border-slate-200">
                      <Link to={`/reports/${r.id}`}
                        className="font-mono font-bold text-govt-navy hover:text-blue-700 underline-offset-4 hover:underline">
                        {r.reference_no}
                      </Link>
                    </td>
                    <td className="px-4 py-3 border-r border-slate-200 max-w-[240px] truncate text-slate-800 font-medium" title={r.product_name || r.brand || '—'}>
                      {r.product_name || r.brand || (r.channel === 'ecommerce' ? 'Marketplace Listing' : 'Packaged Commodity')}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 border-r border-slate-200">
                      <span className="font-medium text-slate-900">{r.officer_name}</span>
                      <span className={`ml-2 inline-block px-1.5 py-0.5 rounded text-xs font-bold ${r.officer_role === 'DMI' ? 'bg-blue-100 text-blue-800' : 'bg-slate-200 text-slate-700'}`}>
                        {r.officer_role}
                      </span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 text-slate-800 font-medium border-r border-slate-200">
                      {r.channel === 'ecommerce' ? (
                        <span className="inline-flex items-center gap-1 rounded bg-blue-50 px-2 py-0.5 text-xs font-bold text-blue-700 border border-blue-200">
                          🛒 Marketplace
                        </span>
                      ) : (
                        <span className="inline-flex items-center gap-1 rounded bg-emerald-50 px-2 py-0.5 text-xs font-bold text-emerald-700 border border-emerald-200">
                          🏢 Field
                        </span>
                      )}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 tabular-nums text-slate-800 border-r border-slate-200">
                      {formatDate(r.inspected_at)}
                    </td>
                    <td className="px-4 py-3 border-r border-slate-200"><StatusBadge status={r.status} /></td>
                    <td className="whitespace-nowrap px-4 py-3 text-slate-800 border-r border-slate-200">{r.decided_by_name ?? '—'}</td>
                    <td className="whitespace-nowrap px-4 py-3"><PdfLink url={r.pdf_url} label="View PDF" /></td>
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
