import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getOfficers, setAccountStatus, resetPassword, ROLE_LABEL } from '../lib/adminApi.js';
import { Panel, Loading, EmptyState, formatDateTime, Breadcrumb } from '../components/ui.jsx';

const ACCOUNT_STYLE = {
  active: 'bg-emerald-50 text-emerald-800 border-emerald-300',
  suspended: 'bg-amber-50 text-amber-900 border-amber-300',
  disabled: 'bg-slate-100 text-slate-600 border-slate-300',
};

const linkBtn =
  'text-xs font-semibold text-govt-navy hover:text-blue-800 hover:bg-blue-50 px-2 py-1 rounded transition-colors disabled:cursor-not-allowed disabled:text-slate-400 disabled:hover:bg-transparent';

export default function Officers() {
  const [officers, setOfficers] = useState(null);
  const [busyId, setBusyId] = useState(null);
  const [issued, setIssued] = useState(null);
  const [error, setError] = useState(null);

  const load = () => getOfficers().then(setOfficers).catch((e) => setError(e.message));
  useEffect(() => { load(); }, []);

  async function changeStatus(officer, status) {
    setBusyId(officer.id); setError(null);
    try { await setAccountStatus(officer.id, status); await load(); }
    catch (e) { setError(e.message); }
    finally { setBusyId(null); }
  }

  async function issueNewPassword(officer) {
    setBusyId(officer.id); setError(null);
    try {
      const { temporary_password } = await resetPassword(officer.id);
      setIssued({ full_name: officer.full_name, temporary_password });
      await load();
    } catch (e) { setError(e.message); }
    finally { setBusyId(null); }
  }

  return (
    <div className="space-y-6">
      <Breadcrumb items={[{ label: 'Officers Register' }]} />

      <div className="flex flex-wrap items-end justify-between gap-4 border-b border-slate-300 pb-4">
        <div>
          <h1 className="text-2xl font-bold text-govt-navy">Officers Register</h1>
          <p className="mt-1.5 text-sm text-slate-600 font-medium">
            Administrative roster of all officer accounts. Accounts are issued here; public registration is disabled.
          </p>
        </div>
        <Link to="/officers/new"
          className="rounded bg-govt-navy px-5 py-2.5 text-sm font-semibold text-white hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy shadow-sm transition-colors flex items-center gap-2">
          <span>+</span> Create New Account
        </Link>
      </div>

      {issued && (
        <div className="border-l-[6px] border-saffron bg-[#fffaf0] px-5 py-4 shadow-md rounded-r">
          <div className="flex justify-between items-start">
            <div>
              <p className="text-base text-slate-900 font-medium">
                New temporary password generated for <span className="font-bold text-govt-navy">{issued.full_name}</span>
              </p>
              <div className="mt-3 inline-block bg-white border border-slate-300 px-4 py-2 rounded">
                <span className="font-mono text-xl font-bold tracking-widest text-govt-navy">{issued.temporary_password}</span>
              </div>
              <p className="mt-3 text-sm font-bold text-govt-maroon">
                ⚠️ CRITICAL: Write this down immediately. It will not be shown again.
              </p>
            </div>
            <button onClick={() => setIssued(null)} className="text-sm font-bold text-slate-500 hover:text-slate-800 bg-slate-100 px-3 py-1.5 rounded">
              Dismiss Message
            </button>
          </div>
        </div>
      )}

      {error && (
        <p role="alert" className="border-l-4 border-red-600 bg-red-50 px-4 py-3 text-sm text-red-900 font-medium shadow-sm">{error}</p>
      )}

      <Panel title="Official Roster" note={officers ? `Total ${officers.length} active and inactive accounts` : undefined}>
        {!officers && !error && <Loading label="Loading officers database" />}
        {officers?.length === 0 && <EmptyState message="No accounts exist in the system yet." hint="Create the first account to get started." />}

        {officers?.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm border-collapse">
              <thead className="bg-[#f0f4f8]">
                <tr className="border-b-2 border-slate-300 text-left text-xs font-bold text-govt-dark uppercase tracking-wider">
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Name</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Username</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Designation</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Jurisdiction</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300" title="Reports Filed">Filed</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300" title="Reports Decided">Decided</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Last Signed In</th>
                  <th scope="col" className="px-4 py-3 border-r border-slate-300">Account Status</th>
                  <th scope="col" className="px-4 py-3">Administrative Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200">
                {officers.map((o) => {
                  const busy = busyId === o.id;
                  return (
                    <tr key={o.id} className="even:bg-govt-light-blue hover:bg-slate-100 transition-colors">
                      <td className="whitespace-nowrap px-4 py-3 text-slate-900 font-bold border-r border-slate-200">{o.full_name}</td>
                      <td className="whitespace-nowrap px-4 py-3 font-mono text-xs text-govt-navy font-medium border-r border-slate-200">{o.username}</td>
                      <td className="whitespace-nowrap px-4 py-3 border-r border-slate-200">
                        <span className="font-bold text-slate-900">{o.role}</span>
                        <span className="ml-2 hidden text-[10px] uppercase font-bold text-slate-500 xl:inline bg-slate-200 px-1.5 py-0.5 rounded">{ROLE_LABEL[o.role]}</span>
                      </td>
                      <td className="whitespace-nowrap px-4 py-3 text-slate-800 font-medium border-r border-slate-200">{o.jurisdiction}</td>
                      <td className="px-4 py-3 tabular-nums text-slate-800 font-medium border-r border-slate-200 text-center">{o.filed || '—'}</td>
                      <td className="px-4 py-3 tabular-nums text-slate-800 font-medium border-r border-slate-200 text-center">{o.decided || '—'}</td>
                      <td className="whitespace-nowrap px-4 py-3 text-slate-700 border-r border-slate-200">
                        {o.must_change_password
                          ? <span className="text-amber-700 font-bold bg-amber-50 px-2 py-0.5 rounded border border-amber-200 text-xs">Pending Activation</span>
                          : formatDateTime(o.last_login_at)}
                      </td>
                      <td className="px-4 py-3 border-r border-slate-200">
                        <span className={`inline-flex items-center justify-center min-w-[80px] rounded px-2 py-1 text-xs font-bold uppercase tracking-wider border ${ACCOUNT_STYLE[o.status]}`}>
                          {o.status}
                        </span>
                      </td>
                      <td className="whitespace-nowrap px-4 py-3">
                        <div className="flex gap-1 flex-wrap">
                          {o.status !== 'active' && (
                            <button disabled={busy} onClick={() => changeStatus(o, 'active')} className={linkBtn}>
                              Restore
                            </button>
                          )}
                          {o.status !== 'suspended' && (
                            <button disabled={busy} onClick={() => changeStatus(o, 'suspended')} className={linkBtn}>
                              Suspend
                            </button>
                          )}
                          {o.status !== 'disabled' && (
                            <button
                              disabled={busy}
                              onClick={() => {
                                if (confirm(`Disable ${o.full_name}? They will not be able to sign in again unless you restore the account.`)) {
                                  changeStatus(o, 'disabled');
                                }
                              }}
                              className={`${linkBtn} text-govt-maroon hover:text-red-900 hover:bg-red-50`}
                            >
                              Disable
                            </button>
                          )}
                          <button disabled={busy} onClick={() => issueNewPassword(o)} className={linkBtn}>
                            Reset Password
                          </button>
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

      <div className="bg-slate-100 border border-slate-300 rounded p-4 text-xs leading-relaxed text-slate-600 font-medium flex gap-3">
        <span className="text-lg">ℹ️</span>
        <p>
          Accounts are suspended or disabled, never deleted — the administrative log holds a
          permanent record against each one for accountability. Digital Marketplace Inspectors sign in on the
          e-commerce system portal, which operates separately from this interface.
        </p>
      </div>
    </div>
  );
}