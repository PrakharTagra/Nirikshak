import { useState } from 'react';
import { useAuth } from '../lib/auth.jsx';

const fieldClass =
  'mt-1 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-[#0b2e6f] focus:outline-none focus:ring-1 focus:ring-[#0b2e6f]';

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

    // Confirm sirf frontend ka field hai — server tak jaata hi nahi, to check
    // yahin hota hai.
    if (form.new_password !== form.confirm) {
      setErrors({ confirm: 'The two passwords do not match.' });
      return;
    }

    setBusy(true);
    setErrors({});
    try {
      await changePassword(form.current_password, form.new_password);
      // must_change_password hatte hi App.jsx console render kar dega.
    } catch (err) {
      setErrors(err.details ? { ...err.details } : { form: err.message });
    } finally {
      setBusy(false);
    }
  }

  return (
    <div className="flex min-h-screen flex-col bg-slate-50">
      <header className="bg-[#0b2e6f] text-white">
        <div className="mx-auto flex max-w-5xl items-center justify-between gap-4 px-4 py-3">
          <p className="text-sm font-semibold">LM-VERIFY</p>
          <button onClick={logout} className="text-xs text-white/80 underline-offset-2 hover:underline">
            Sign out
          </button>
        </div>
        <div className="h-0.5 bg-gradient-to-r from-[#FF9933] via-white to-[#138808]" />
      </header>

      <main className="flex flex-1 items-start justify-center px-4 py-12">
        <div className="w-full max-w-sm">
          <h1 className="text-lg font-semibold text-slate-900">Set your password</h1>
          <p className="mt-1 text-sm text-slate-600">
            Signed in as {user?.full_name}. Replace the password you were issued before continuing.
          </p>

          <form onSubmit={submit} className="mt-6 border border-slate-200 bg-white p-5">
            <div>
              <label htmlFor="current_password" className="block text-sm text-slate-700">
                Password you were issued
              </label>
              <input id="current_password" type="password" autoComplete="current-password" autoFocus
                value={form.current_password} onChange={set('current_password')}
                aria-invalid={!!errors.current_password} className={fieldClass} />
              {errors.current_password && <p className="mt-1 text-xs text-red-700">{errors.current_password}</p>}
            </div>

            <div className="mt-4">
              <label htmlFor="new_password" className="block text-sm text-slate-700">New password</label>
              <input id="new_password" type="password" autoComplete="new-password"
                value={form.new_password} onChange={set('new_password')}
                aria-invalid={!!errors.new_password} aria-describedby="pw-hint" className={fieldClass} />
              <p id="pw-hint" className="mt-1 text-xs text-slate-500">At least 10 characters.</p>
              {errors.new_password && <p className="mt-1 text-xs text-red-700">{errors.new_password}</p>}
            </div>

            <div className="mt-4">
              <label htmlFor="confirm" className="block text-sm text-slate-700">Confirm new password</label>
              <input id="confirm" type="password" autoComplete="new-password"
                value={form.confirm} onChange={set('confirm')}
                aria-invalid={!!errors.confirm} className={fieldClass} />
              {errors.confirm && <p className="mt-1 text-xs text-red-700">{errors.confirm}</p>}
            </div>

            {errors.form && (
              <p role="alert" className="mt-4 border border-red-300 bg-red-50 px-3 py-2 text-sm text-red-800">
                {errors.form}
              </p>
            )}

            <button type="submit" disabled={busy}
              className="mt-5 w-full rounded-sm bg-[#0b2e6f] px-4 py-2 text-sm font-medium text-white hover:bg-[#092551] disabled:opacity-60">
              {busy ? 'Saving…' : 'Set password and continue'}
            </button>
          </form>
        </div>
      </main>
    </div>
  );
}