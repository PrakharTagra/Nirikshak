import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getQueue, getJurisdictionLmos, AWAITING_STATUSES, STATUS_LABEL, CHANNEL_LABEL } from '../lib/acApi.js';
import { StatusBadge, ComplianceBadge, PdfLink, Panel, Loading, EmptyState, formatDate, Breadcrumb } from '../components/ui.jsx';

const selectClass =
  'rounded-sm border border-slate-300 bg-white px-3 py-1.5 text-sm text-slate-800 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm';

export default function Queue({ awaiting = false }) {
  const [filters, setFilters] = useState({ status: 'all', channel: 'all', search: '', officer_id: 'all' });
  const [rows, setRows] = useState(null);
  const [officersData, setOfficersData] = useState(null);
  const [error, setError] = useState(null);

  // Load LMOs for this Assistant Controller's jurisdiction
  useEffect(() => {
    let cancelled = false;
    getJurisdictionLmos()
      .then((data) => { if (!cancelled) setOfficersData(data); })
      .catch((err) => { console.warn('Could not load jurisdiction officers:', err.message); });
    return () => { cancelled = true; };
  }, []);

  // Load reports based on filters
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
  const selectOfficer = (id) => setFilters((f) => ({ ...f, officer_id: id }));

  const openCount = rows?.filter((r) => r.status === 'pending').length ?? 0;
  const selectedOfficer = officersData?.officers?.find((o) => o.id === filters.officer_id);

  return (
    <div className="space-y-6">
      <Breadcrumb items={[{ label: awaiting ? 'Awaiting Decision' : 'All Reports' }]} />

      {/* Page Title Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-2 border-b border-slate-200 pb-4">
        <div>
          <h1 className="text-2xl font-bold text-govt-navy uppercase tracking-wide">
            {awaiting ? 'Awaiting Statutory Decision' : 'Jurisdiction Reports'}
          </h1>
          <p className="mt-1 text-sm font-medium text-slate-600">
            {!rows
              ? 'Retrieving submitted inspection reports for your region...'
              : awaiting
                ? rows.length === 0
                  ? 'All reports in your region have been processed. Queue is clear.'
                  : `${rows.length} pending report${rows.length > 1 ? 's' : ''} awaiting Assistant Controller decision.`
                : `${rows.length} total report${rows.length === 1 ? '' : 's'} on record, ${openCount} currently pending.`}
          </p>
        </div>

        {awaiting && (
          <div className="inline-flex items-center gap-2 bg-amber-50 border border-amber-300 text-amber-900 px-3 py-1.5 rounded-sm text-xs font-semibold">
            <span className="w-2.5 h-2.5 rounded-full bg-amber-500 animate-pulse"></span>
            <span>Manual Decision Required ({openCount} Pending)</span>
          </div>
        )}
      </div>

      {/* Legal Metrology Officers (LMOs) in Region */}
      {officersData && officersData.officers && officersData.officers.length > 0 && (
        <section className="bg-white border border-slate-300 rounded-sm p-4 shadow-sm">
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-3">
            <div>
              <h2 className="text-xs font-bold uppercase tracking-wider text-govt-navy">
                Legal Metrology Officers (LMOs) In Your Region
              </h2>
              <p className="text-xs text-slate-500">
                Click an officer to inspect pending reports submitted by them, or select "All Officers" to view the outside queue.
              </p>
            </div>
            <div className="text-xs font-semibold text-slate-700">
              Total Outside Pending: <span className="text-amber-700 font-bold">{officersData.summary?.total_pending ?? 0}</span>
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3 pt-1">
            {/* Consolidated "All Officers" outside queue tile */}
            <button
              type="button"
              onClick={() => selectOfficer('all')}
              className={`text-left p-3 rounded-sm border transition-all ${
                filters.officer_id === 'all'
                  ? 'border-govt-navy bg-govt-light-blue ring-2 ring-govt-navy/40 shadow-sm'
                  : 'border-slate-200 bg-slate-50 hover:bg-slate-100 hover:border-slate-300'
              }`}
            >
              <div className="flex items-center justify-between">
                <span className="text-xs font-bold uppercase tracking-wider text-govt-navy">All Officers</span>
                <span className="inline-flex items-center px-2 py-0.5 rounded text-xs font-bold bg-amber-100 text-amber-800 border border-amber-300">
                  {officersData.summary?.total_pending ?? 0} Pending
                </span>
              </div>
              <div className="mt-1 text-xs text-slate-600">
                Entire regional queue outside
              </div>
              <div className="mt-2 text-[11px] font-medium text-slate-500">
                {officersData.summary?.total_reports ?? 0} total submitted
              </div>
            </button>

            {/* Individual LMO Officer tiles */}
            {officersData.officers.map((o) => {
              const isSelected = filters.officer_id === o.id;
              return (
                <button
                  key={o.id}
                  type="button"
                  onClick={() => selectOfficer(o.id)}
                  className={`text-left p-3 rounded-sm border transition-all ${
                    isSelected
                      ? 'border-govt-navy bg-govt-light-blue ring-2 ring-govt-navy/40 shadow-sm'
                      : 'border-slate-200 bg-slate-50 hover:bg-slate-100 hover:border-slate-300'
                  }`}
                >
                  <div className="flex items-center justify-between gap-1">
                    <span className="text-xs font-bold text-slate-900 truncate" title={o.full_name}>
                      {o.full_name}
                    </span>
                    <span
                      className={`inline-flex items-center px-2 py-0.5 rounded text-[11px] font-bold border ${
                        o.pending_count > 0
                          ? 'bg-amber-100 text-amber-900 border-amber-300'
                          : 'bg-slate-100 text-slate-600 border-slate-200'
                      }`}
                    >
                      {o.pending_count} Pending
                    </span>
                  </div>
                  <div className="mt-0.5 text-xs text-slate-500 flex items-center justify-between">
                    <span>@{o.username}</span>
                    <span className="uppercase text-[10px] font-semibold text-slate-400">{o.role}</span>
                  </div>
                  <div className="mt-2 text-[11px] text-slate-600 flex items-center justify-between border-t border-slate-200 pt-1.5">
                    <span>Total filed: <strong className="text-slate-800">{o.total_count}</strong></span>
                    <span className="text-[10px] text-slate-400">
                      {o.approved_count} ✓ / {o.rejected_count} ✗
                    </span>
                  </div>
                </button>
              );
            })}
          </div>

          {selectedOfficer && (
            <div className="mt-3 flex items-center justify-between bg-blue-50 border-l-4 border-govt-navy px-3 py-2 text-xs text-govt-navy">
              <span>
                Filtering reports filed by: <strong>{selectedOfficer.full_name}</strong> ({selectedOfficer.pending_count} pending decision)
              </span>
              <button
                type="button"
                onClick={() => selectOfficer('all')}
                className="font-bold underline hover:text-blue-900 ml-2"
              >
                Clear Officer Filter (View All)
              </button>
            </div>
          )}
        </section>
      )}

      {/* Filter Toolbar */}
      <div className="flex flex-wrap items-end gap-4 border border-slate-300 bg-slate-50 p-4 rounded-sm shadow-sm">
        <div className="min-w-[16rem] flex-1">
          <label htmlFor="search" className="block text-xs font-semibold uppercase tracking-wider text-slate-600 mb-1">
            Search
          </label>
          <input
            id="search"
            type="search"
            value={filters.search}
            onChange={set('search')}
            placeholder="Reference, product name, or officer..."
            className={`w-full ${selectClass}`}
          />
        </div>

        {officersData?.officers && (
          <div className="min-w-[12rem]">
            <label htmlFor="officer_id" className="block text-xs font-semibold uppercase tracking-wider text-slate-600 mb-1">
              Filter by LMO
            </label>
            <select id="officer_id" value={filters.officer_id} onChange={set('officer_id')} className={`w-full ${selectClass}`}>
              <option value="all">All Regional Officers</option>
              {officersData.officers.map((o) => (
                <option key={o.id} value={o.id}>
                  {o.full_name} ({o.pending_count} pending)
                </option>
              ))}
            </select>
          </div>
        )}

        {!awaiting && (
          <div className="min-w-[11rem]">
            <label htmlFor="status" className="block text-xs font-semibold uppercase tracking-wider text-slate-600 mb-1">
              Decision Status
            </label>
            <select id="status" value={filters.status} onChange={set('status')} className={`w-full ${selectClass}`}>
              <option value="all">All Statuses</option>
              {Object.entries(STATUS_LABEL).map(([v, l]) => (
                <option key={v} value={v}>{l}</option>
              ))}
            </select>
          </div>
        )}

        <div className="min-w-[10rem]">
          <label htmlFor="channel" className="block text-xs font-semibold uppercase tracking-wider text-slate-600 mb-1">
            Channel
          </label>
          <select id="channel" value={filters.channel} onChange={set('channel')} className={`w-full ${selectClass}`}>
            <option value="all">Both Channels</option>
            <option value="field">{CHANNEL_LABEL.field}</option>
            <option value="ecommerce">{CHANNEL_LABEL.ecommerce}</option>
          </select>
        </div>
      </div>

      {error && (
        <p role="alert" className="border-l-4 border-amber-500 bg-amber-50 px-4 py-3 text-sm text-amber-900 shadow-sm">
          {error}
        </p>
      )}

      {/* Main Inspection Reports Table */}
      <Panel
        title={awaiting ? 'Pending Reports Awaiting Assistant Controller Decision' : 'All Statutory Inspection Reports'}
        note={rows ? `${rows.length} record(s) matching criteria` : undefined}
      >
        {!rows && !error && <Loading label="Fetching records" />}
        {rows?.length === 0 && (
          awaiting
            ? <EmptyState message="The queue is clear." hint="Every report in your jurisdiction has been decided. New inspections will appear here automatically." />
            : <EmptyState message="No records match the current filters." hint="Try adjusting your search or clearing the officer filter." />
        )}

        {rows?.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm border-collapse">
              <thead>
                <tr className="bg-govt-cream border-y-2 border-slate-300 text-left text-xs font-semibold uppercase tracking-wider text-slate-700">
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Reference No.</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Product / Commodity</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Submitting Officer</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Inspected On</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">AI Assessment</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200">Statutory Status</th>
                  <th scope="col" className="px-4 py-3 border-x border-slate-200 text-center">Action</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200 bg-white">
                {rows.map((r, i) => {
                  const isPending = r.status === 'pending';
                  return (
                    <tr
                      key={r.id}
                      className={`hover:bg-govt-light-blue transition-colors ${
                        isPending ? 'bg-amber-50/40 font-medium' : i % 2 === 0 ? '' : 'bg-slate-50'
                      }`}
                    >
                      <td className="whitespace-nowrap px-4 py-3 border-x border-slate-200">
                        <Link
                          to={`/reports/${r.id}`}
                          className="font-mono text-sm font-bold text-govt-navy underline-offset-4 hover:underline"
                        >
                          {r.reference_no}
                        </Link>
                      </td>
                      <td className="px-4 py-3 border-x border-slate-200 max-w-[200px]">
                        <div className="font-semibold text-slate-900 truncate" title={r.product_name}>
                          {r.product_name}
                        </div>
                        <div className="mt-1">
                          {r.channel === 'ecommerce' ? (
                            <span className="inline-flex items-center gap-1 rounded bg-blue-50 px-1.5 py-0.5 text-[10px] font-bold text-blue-800 border border-blue-200">
                              🛒 Marketplace (DMI)
                            </span>
                          ) : (
                            <span className="inline-flex items-center gap-1 rounded bg-emerald-50 px-1.5 py-0.5 text-[10px] font-bold text-emerald-800 border border-emerald-200">
                              🏢 Field (LMO)
                            </span>
                          )}
                        </div>
                      </td>
                      <td className="whitespace-nowrap px-4 py-3 border-x border-slate-200">
                        <div className="font-semibold text-slate-900">{r.officer_name}</div>
                        <div className="text-xs text-slate-500 mt-0.5">{r.officer_role}</div>
                      </td>
                      <td className="whitespace-nowrap px-4 py-3 tabular-nums text-slate-700 font-medium border-x border-slate-200">
                        {formatDate(r.inspected_at)}
                      </td>
                      <td className="whitespace-nowrap px-4 py-3 border-x border-slate-200">
                        <ComplianceBadge result={r.compliance_result} />
                      </td>
                      <td className="whitespace-nowrap px-4 py-3 border-x border-slate-200">
                        <StatusBadge status={r.status} />
                      </td>
                      <td className="whitespace-nowrap px-4 py-3 text-center border-x border-slate-200">
                        <div className="inline-flex items-center gap-2">
                          <PdfLink url={r.pdf_url} label="PDF" />
                          <Link
                            to={`/reports/${r.id}`}
                            className={`rounded-sm px-3 py-1.5 text-xs font-bold transition-all shadow-sm ${
                              isPending
                                ? 'bg-govt-navy text-white hover:bg-blue-900 ring-1 ring-govt-navy'
                                : 'bg-slate-100 text-slate-700 hover:bg-slate-200 border border-slate-300'
                            }`}
                          >
                            {isPending ? 'Review & Decide' : 'View Record'}
                          </Link>
                        </div>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        )}
      </Panel>
    </div>
  );
}
