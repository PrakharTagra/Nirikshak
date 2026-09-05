import { useState } from 'react';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from '../components/GovtHeader.jsx';
import GovtFooter from '../components/GovtFooter.jsx';
import Emblem from '../components/Emblem.jsx';

const fieldClass =
  'mt-1 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy';

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
    <div className="flex min-h-screen flex-col bg-govt-cream font-sans">
      <GovtHeader />

      <main className="flex flex-1 items-start justify-center px-4 py-12 md:py-20">
        <div className="w-full max-w-md">
          <div className="text-center mb-8 flex flex-col items-center">
            <Emblem size={64} className="mb-3" />
            <h1 className="text-2xl font-bold text-govt-navy tracking-wide mb-1">निरीक्षक · NIRIKSHAK</h1>
            <h2 className="text-lg font-semibold text-slate-800">Controller of Legal Metrology</h2>
            <p className="text-slate-600 mt-1">Sign In to Controller Dashboard</p>
          </div>

          <form onSubmit={submit} className="border border-slate-300 bg-white p-6 shadow-sm border-t-[4px] border-t-govt-maroon">
            <div>
              <label htmlFor="username" className="block text-sm font-medium text-slate-700">Username</label>
              <input id="username" autoComplete="username" autoFocus
                value={form.username} onChange={set('username')}
                aria-invalid={!!errors.username} className={fieldClass} />
              {errors.username && <p className="mt-1 text-xs text-red-700">{errors.username}</p>}
            </div>

            <div className="mt-5">
              <label htmlFor="password" className="block text-sm font-medium text-slate-700">Password</label>
              <input id="password" type="password" autoComplete="current-password"
                value={form.password} onChange={set('password')}
                aria-invalid={!!errors.password} className={fieldClass} />
              {errors.password && <p className="mt-1 text-xs text-red-700">{errors.password}</p>}
            </div>

            {errors.form && (
              <p role="alert" className="mt-5 border-l-4 border-red-600 bg-red-50 px-4 py-3 text-sm text-red-900 font-medium">
                {errors.form}
              </p>
            )}

            <button type="submit" disabled={busy}
              className="mt-6 w-full rounded bg-govt-navy px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-70 transition-colors shadow-sm">
              {busy ? 'Signing in…' : 'Sign In'}
            </button>
            
            <div className="mt-6 border-t border-slate-200 pt-4">
              <p className="text-xs text-slate-500 leading-relaxed text-center bg-slate-50 p-2 rounded border border-slate-100">
                ⚠️ This is a restricted government system.
                Accounts are issued by the Controller.
                Assistant Controllers and field officers sign in on their own systems.
              </p>
            </div>
          </form>
        </div>
      </main>
      
      <GovtFooter />
    </div>
  );
}