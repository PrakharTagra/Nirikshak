import { useState } from 'react';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from '../components/GovtHeader.jsx';
import GovtFooter from '../components/GovtFooter.jsx';

const fieldClass =
  'mt-1 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm';

export default function ChangePassword() {
  const { user, changePassword, logout } = useAuth();
  const [form, setForm] = useState({ current_password: '', new_password: '', confirm: '' });
  const [errors, setErrors] = useState({});
  const [busy, setBusy] = useState(false);

  const set = (key) => (e) => {
    setForm((f) => ({ ...f, [key]: e.target.value }));
    setErrors((x) => ({ ...x, [key]: undefined, form: undefined }));
  };

  async function submit(e) {
    e.preventDefault();

    if (form.new_password !== form.confirm) {
      setErrors({ confirm: 'The two passwords do not match.' });
      return;
    }

    setBusy(true);
    setErrors({});
    try {
      await changePassword(form.current_password, form.new_password);
    } catch (err) {
      setErrors(err.details ? { ...err.details } : { form: err.message });
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="flex min-h-screen flex-col bg-govt-cream">
      <GovtHeader user={user} onLogout={logout} />

      <main className="flex flex-1 items-start justify-center px-4 py-12">
        <div className="w-full max-w-md">
          <div className="mb-6">
            <h1 className="text-xl font-bold text-slate-900">Mandatory Password Update</h1>
            <p className="mt-2 text-sm text-slate-600 border-l-2 border-govt-navy pl-3">
              Welcome, {user?.full_name}. For security reasons, you must replace your issued password before continuing to the portal.
            </p>
          </div>

          <form onSubmit={submit} className="border-t-4 border-t-govt-navy border-x border-b border-slate-200 bg-white p-6 shadow-md">
            <div>
              <label htmlFor="current_password" className="block text-sm font-medium text-slate-800">
                Current / Issued Password
              </label>
              <input id="current_password" type="password" autoComplete="current-password" autoFocus
                value={form.current_password} onChange={set('current_password')}
                aria-invalid={!!errors.current_password} className={fieldClass} />
              {errors.current_password && <p className="mt-1 text-xs text-red-700 font-medium">{errors.current_password}</p>}
            </div>

            <div className="mt-5 pt-5 border-t border-slate-100">
              <label htmlFor="new_password" className="block text-sm font-medium text-slate-800">New Password</label>
              <input id="new_password" type="password" autoComplete="new-password"
                value={form.new_password} onChange={set('new_password')}
                aria-invalid={!!errors.new_password} aria-describedby="pw-hint" className={fieldClass} />
              <p id="pw-hint" className="mt-1 text-xs text-slate-500">Must be at least 10 characters long.</p>
              {errors.new_password && <p className="mt-1 text-xs text-red-700 font-medium">{errors.new_password}</p>}
            </div>

            <div className="mt-4">
              <label htmlFor="confirm" className="block text-sm font-medium text-slate-800">Confirm New Password</label>
              <input id="confirm" type="password" autoComplete="new-password"
                value={form.confirm} onChange={set('confirm')}
                aria-invalid={!!errors.confirm} className={fieldClass} />
              {errors.confirm && <p className="mt-1 text-xs text-red-700 font-medium">{errors.confirm}</p>}
            </div>

            {errors.form && (
              <p role="alert" className="mt-5 border-l-4 border-red-500 bg-red-50 px-4 py-3 text-sm text-red-800">
                {errors.form}
              </p>
            )}

            <button type="submit" disabled={busy}
              className="mt-6 w-full rounded-sm bg-govt-navy px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-70 transition-colors">
              {busy ? 'Saving changes…' : 'Set Password & Continue'}
            </button>
          </form>
        </div>
      </main>
      
      <GovtFooter />
    </div>
  );
}