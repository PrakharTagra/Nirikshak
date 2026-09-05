import { useState } from 'react';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from '../components/GovtHeader.jsx';
import GovtFooter from '../components/GovtFooter.jsx';
import Emblem from '../components/Emblem.jsx';

const fieldClass =
  'mt-1 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm';

export default function Login() {
  const { login } = useAuth();
  const [form, setForm] = useState({ username: '', password: '' });
  const [errors, setErrors] = useState({});
  const [busy, setBusy] = useState(false);

  const set = (key) => (e) => {
    setForm((f) => ({ ...f, [key]: e.target.value }));
    setErrors((x) => ({ ...x, [key]: undefined, form: undefined }));
  };

  async function submit(e) {
    e.preventDefault();
    setBusy(true);
    setErrors({});
    try {
      await login(form.username, form.password);
    } catch (err) {
      setErrors(err.details ? { ...err.details } : { form: err.message });
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="flex min-h-screen flex-col bg-govt-cream">
      <GovtHeader />

      <main className="flex flex-1 items-center justify-center px-4 py-12">
        <div className="w-full max-w-md">
          <div className="text-center mb-8">
            <div className="flex justify-center mb-4">
              <Emblem size={64} />
            </div>
            <p className="text-sm font-semibold tracking-[0.15em] text-govt-maroon uppercase">
              LM-Verify System
            </p>
            <h1 className="mt-2 text-2xl font-bold text-slate-900">Assistant Controller</h1>
            <p className="text-sm text-slate-600 mt-1">Sign In to continue to the portal</p>
          </div>

          <form onSubmit={submit} className="border-t-4 border-t-govt-navy border-x border-b border-slate-200 bg-white p-6 shadow-md">
            <div>
              <label htmlFor="username" className="block text-sm font-medium text-slate-800">Username</label>
              <input id="username" autoComplete="username" autoFocus
                value={form.username} onChange={set('username')}
                aria-invalid={!!errors.username} className={fieldClass} />
              {errors.username && <p className="mt-1 text-xs text-red-700 font-medium">{errors.username}</p>}
            </div>

            <div className="mt-5">
              <label htmlFor="password" className="block text-sm font-medium text-slate-800">Password</label>
              <input id="password" type="password" autoComplete="current-password"
                value={form.password} onChange={set('password')}
                aria-invalid={!!errors.password} className={fieldClass} />
              {errors.password && <p className="mt-1 text-xs text-red-700 font-medium">{errors.password}</p>}
            </div>

            {errors.form && (
              <p role="alert" className="mt-5 border-l-4 border-red-500 bg-red-50 px-4 py-3 text-sm text-red-800">
                {errors.form}
              </p>
            )}

            <button type="submit" disabled={busy}
              className="mt-6 w-full rounded-sm bg-govt-navy px-4 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-70 transition-colors">
              {busy ? 'Signing in…' : 'Sign In'}
            </button>
            
            <div className="mt-6 border-t border-slate-100 pt-4">
              <div className="flex items-start gap-3 bg-amber-50 p-3 border border-amber-200 rounded-sm">
                <span className="text-amber-600 text-lg">⚠️</span>
                <p className="text-xs leading-relaxed text-slate-700">
                  <strong className="block text-amber-900">This is a restricted government system.</strong>
                  Unauthorized access is strictly prohibited. Accounts are issued by the Controller.
                </p>
              </div>
            </div>
          </form>
        </div>
      </main>

      <GovtFooter />
    </div>
  );
}