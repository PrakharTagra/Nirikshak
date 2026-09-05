import { useState } from 'react';
import { useAuth } from '../lib/auth.jsx';

const fieldClass =
  'mt-1 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-[#0b2e6f] focus:outline-none focus:ring-1 focus:ring-[#0b2e6f]';

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
      // Yahan redirect nahi. App.jsx user object se tay karta hai kya dikhana
      // hai, to pehli baar wala officer password change screen par jayega.
    } catch (err) {
      // details mein backend validator ke per-field messages aate hain.
      setErrors(err.details ? { ...err.details } : { form: err.message });
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="flex min-h-screen flex-col bg-slate-50">
      <header className="bg-[#0b2e6f] text-white">
        <div className="mx-auto max-w-5xl px-4 py-4">
          <p className="text-sm font-semibold leading-tight">उपभोक्ता मामले विभाग</p>
          <p className="text-sm font-semibold leading-tight">Department of Consumer Affairs</p>
          <p className="mt-0.5 text-xs text-white/70">
            Ministry of Consumer Affairs, Food &amp; Public Distribution · Legal Metrology Division
          </p>
        </div>
        <div className="h-0.5 bg-gradient-to-r from-[#FF9933] via-white to-[#138808]" />
      </header>

      <main className="flex flex-1 items-start justify-center px-4 py-12">
        <div className="w-full max-w-sm">
          <p className="text-xs font-semibold uppercase tracking-[0.15em] text-[#0b2e6f]">LM-VERIFY</p>
          <h1 className="mt-1 text-lg font-semibold text-slate-900">Assistant Controller sign-in</h1>
          <p className="mt-1 text-sm text-slate-600">
            Restricted to Assistant Controllers of Legal Metrology.
          </p>

          <form onSubmit={submit} className="mt-6 border border-slate-200 bg-white p-5">
            <div>
              <label htmlFor="username" className="block text-sm text-slate-700">Username</label>
              <input id="username" autoComplete="username" autoFocus
                value={form.username} onChange={set('username')}
                aria-invalid={!!errors.username} className={fieldClass} />
              {errors.username && <p className="mt-1 text-xs text-red-700">{errors.username}</p>}
            </div>

            <div className="mt-4">
              <label htmlFor="password" className="block text-sm text-slate-700">Password</label>
              <input id="password" type="password" autoComplete="current-password"
                value={form.password} onChange={set('password')}
                aria-invalid={!!errors.password} className={fieldClass} />
              {errors.password && <p className="mt-1 text-xs text-red-700">{errors.password}</p>}
            </div>

            {errors.form && (
              <p role="alert" className="mt-4 border border-red-300 bg-red-50 px-3 py-2 text-sm text-red-800">
                {errors.form}
              </p>
            )}

            <button type="submit" disabled={busy}
              className="mt-5 w-full rounded-sm bg-[#0b2e6f] px-4 py-2 text-sm font-medium text-white hover:bg-[#092551] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#0b2e6f] disabled:opacity-60">
              {busy ? 'Signing in…' : 'Sign in'}
            </button>
          </form>

          <p className="mt-4 text-xs leading-relaxed text-slate-500">
            Accounts are issued by the Controller. There is no public registration.
            The Controller and field officers sign in on their own systems.
          </p>
        </div>
      </main>
    </div>
  );
}