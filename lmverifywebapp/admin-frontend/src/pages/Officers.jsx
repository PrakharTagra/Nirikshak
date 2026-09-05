import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { getOfficers, setAccountStatus, resetPassword, ROLE_LABEL } from '../lib/adminApi.js';
import { Panel, Loading, EmptyState, formatDateTime } from '../components/ui.jsx';

const ACCOUNT_STYLE = {
  active: 'bg-emerald-50 text-emerald-800 ring-emerald-300',
  suspended: 'bg-amber-50 text-amber-900 ring-amber-300',
  disabled: 'bg-slate-100 text-slate-600 ring-slate-300',
};

const linkBtn =
  'text-xs text-[#0b2e6f] underline-offset-2 hover:underline disabled:cursor-not-allowed disabled:text-slate-400 disabled:no-underline';

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
    <div className="space-y-5">
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-lg font-semibold text-slate-900">Officers</h1>
          <p className="mt-1 text-sm text-slate-600">
            Every account on the system. Accounts are issued here; officers cannot register themselves.
          </p>
        </div>
        <Link to="/officers/new"
          className="rounded-sm bg-[#0b2e6f] px-4 py-2 text-sm font-medium text-white hover:bg-[#092551] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#0b2e6f]">
          Create account
        </Link>
      </div>

      {/* Dobara jaari kiya password sirf ek baar padha ja sakta hai, isliye use
          apna panel milta hai — toast jo miss ho jaye, woh nahi. */}
      {issued && (
        <div className="border-l-4 border-[#FF9933] bg-white px-4 py-3">
          <p className="text-sm text-slate-800">
            New temporary password for <span className="font-medium">{issued.full_name}</span>:{' '}
            <span className="font-mono text-slate-900">{issued.temporary_password}</span>
          </p>
          <p className="mt-1 text-xs text-slate-600">
            Write it down now — it cannot be shown again. They must replace it on next sign-in.
          </p>
          <button onClick={() => setIssued(null)} className="mt-2 text-xs text-[#0b2e6f] underline-offset-2 hover:underline">
            Dismiss
          </button>
        </div>
      )}

      {error && (
        <p role="alert" className="border border-red-300 bg-red-50 px-3 py-2 text-sm text-red-800">{error}</p>
      )}

      <Panel title="Roster" note={officers ? `${officers.length} accounts` : undefined}>
        {!officers && !error && <Loading label="Loading officers" />}
        {officers?.length === 0 && <EmptyState message="No accounts yet." hint="Create the first one." />}

        {officers?.length > 0 && (
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b border-slate-200 text-left text-xs text-slate-600">
                  <th scope="col" className="px-4 py-2 font-medium">Name</th>
                  <th scope="col" className="px-4 py-2 font-medium">Username</th>
                  <th scope="col" className="px-4 py-2 font-medium">Designation</th>
                  <th scope="col" className="px-4 py-2 font-medium">Jurisdiction</th>
                  <th scope="col" className="px-4 py-2 font-medium">Filed</th>
                  <th scope="col" className="px-4 py-2 font-medium">Decided</th>
                  <th scope="col" className="px-4 py-2 font-medium">Last signed in</th>
                  <th scope="col" className="px-4 py-2 font-medium">Account</th>
                  <th scope="col" className="px-4 py-2 font-medium">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-100">
                {officers.map((o) => {
                  const busy = busyId === o.id;
                  return (
                    <tr key={o.id} className="hover:bg-slate-50">
                      <td className="whitespace-nowrap px-4 py-2.5 text-slate-900">{o.full_name}</td>
                      <td className="whitespace-nowrap px-4 py-2.5 font-mono text-xs text-slate-700">{o.username}</td>
                      <td className="whitespace-nowrap px-4 py-2.5">
                        <span className="text-slate-900">{o.role}</span>
                        <span className="ml-2 hidden text-xs text-slate-500 xl:inline">{ROLE_LABEL[o.role]}</span>
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-slate-700">{o.jurisdiction}</td>
                      <td className="px-4 py-2.5 tabular-nums text-slate-700">{o.filed || '—'}</td>
                      <td className="px-4 py-2.5 tabular-nums text-slate-700">{o.decided || '—'}</td>
                      <td className="whitespace-nowrap px-4 py-2.5 text-slate-600">
                        {o.must_change_password
                          ? <span className="text-amber-800">Not activated</span>
                          : formatDateTime(o.last_login_at)}
                      </td>
                      <td className="px-4 py-2.5">
                        <span className={`inline-flex rounded-sm px-2 py-0.5 text-xs font-medium capitalize ring-1 ring-inset ${ACCOUNT_STYLE[o.status]}`}>
                          {o.status}
                        </span>
                      </td>
                      <td className="whitespace-nowrap px-4 py-2.5">
                        <div className="flex gap-3">
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
                                // Disable ek account ke kaam ka ant hai, aur audit log
                                // use permanent bana deta hai, isliye pehle poochta hai.
                                if (confirm(`Disable ${o.full_name}? They will not be able to sign in again unless you restore the account.`)) {
                                  changeStatus(o, 'disabled');
                                }
                              }}
                              className={linkBtn}
                            >
                              Disable
                            </button>
                          )}
                          <button disabled={busy} onClick={() => issueNewPassword(o)} className={linkBtn}>
                            Reset password
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

      <p className="text-xs leading-relaxed text-slate-500">
        Accounts are suspended or disabled, never deleted — the administrative log holds a
        permanent record against each one. Digital Marketplace Inspectors sign in on the
        e-commerce system, which runs separately.
      </p>
    </div>
  );
}