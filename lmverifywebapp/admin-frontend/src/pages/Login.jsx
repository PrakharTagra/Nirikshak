import { useState } from 'react';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from '../components/GovtHeader.jsx';
import GovtFooter from '../components/GovtFooter.jsx';
import Emblem from '../components/Emblem.jsx';

const fieldClass =
  'mt-1.5 w-full rounded border border-slate-300 bg-white px-3.5 py-2.5 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-2 focus:ring-govt-navy/20 shadow-sm transition-all';

export default function Login() {
  const { login } = useAuth();
  const [form, setForm] = useState({ username: '', password: '' });
  const [showPassword, setShowPassword] = useState(false);
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

      <main id="main-content" className="flex flex-1 items-center justify-center px-4 py-10 md:py-16">
        <div className="w-full max-w-md">
          {/* Official Emblem & Portal Title Card */}
          <div className="text-center mb-6 flex flex-col items-center">
            <div className="p-2 mb-3 bg-white rounded-full border border-slate-200 shadow-sm">
              <Emblem size={68} variant="dark" />
            </div>
            <div className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-full bg-govt-navy/10 text-govt-navy text-xs font-semibold uppercase tracking-wider mb-2">
              <span>🏛️</span> National Portal
            </div>
            <h1 className="text-2xl font-bold text-govt-navy tracking-wide">निरीक्षक · NIRIKSHAK</h1>
            <h2 className="text-base font-semibold text-slate-800 mt-0.5">Controller of Legal Metrology</h2>
            <p className="text-xs text-slate-600 mt-1">Single Sign-On for Regulatory Oversight & Enforcement</p>
          </div>

          {/* Login Form Container */}
          <div className="border border-slate-300 bg-white shadow-md rounded-sm overflow-hidden">
            {/* Header Accent Bar */}
            <div className="h-1.5 w-full bg-govt-maroon" />

            <form onSubmit={submit} className="p-6 md:p-8">
              <div>
                <label htmlFor="username" className="block text-xs font-bold uppercase tracking-wider text-slate-700">
                  Officer Username / आईडी
                </label>
                <div className="relative mt-1">
                  <input 
                    id="username" 
                    autoComplete="username" 
                    autoFocus
                    placeholder="Enter your username"
                    value={form.username} 
                    onChange={set('username')}
                    aria-invalid={!!errors.username} 
                    className={fieldClass} 
                  />
                </div>
                {errors.username && <p className="mt-1.5 text-xs text-red-700 font-medium">{errors.username}</p>}
              </div>

              <div className="mt-5">
                <div className="flex items-center justify-between">
                  <label htmlFor="password" className="block text-xs font-bold uppercase tracking-wider text-slate-700">
                    Password / पासवर्ड
                  </label>
                </div>
                <div className="relative mt-1">
                  <input 
                    id="password" 
                    type={showPassword ? "text" : "password"} 
                    autoComplete="current-password"
                    placeholder="••••••••"
                    value={form.password} 
                    onChange={set('password')}
                    aria-invalid={!!errors.password} 
                    className={`${fieldClass} pr-10`} 
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-700 text-xs p-1 focus:outline-none"
                    aria-label={showPassword ? "Hide password" : "Show password"}
                  >
                    {showPassword ? '👁️' : '👁️‍🗨️'}
                  </button>
                </div>
                {errors.password && <p className="mt-1.5 text-xs text-red-700 font-medium">{errors.password}</p>}
              </div>

              {errors.form && (
                <div role="alert" className="mt-5 border-l-4 border-red-600 bg-red-50 p-3 text-xs text-red-900 font-medium rounded-r">
                  <span className="font-bold">Login Failed: </span>{errors.form}
                </div>
              )}

              <button 
                type="submit" 
                disabled={busy}
                className="mt-6 w-full rounded bg-govt-navy px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-70 transition-all shadow-sm flex items-center justify-center gap-2 cursor-pointer"
              >
                {busy ? (
                  <>
                    <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                    <span>Signing in…</span>
                  </>
                ) : (
                  <>
                    <span>Sign In Securely</span>
                    <span aria-hidden="true">→</span>
                  </>
                )}
              </button>
              
              <div className="mt-6 border-t border-slate-200 pt-4">
                <div className="flex items-start gap-2.5 bg-amber-50/80 p-3 rounded border border-amber-200 text-xs text-slate-700 leading-relaxed">
                  <span className="text-amber-700 text-sm mt-0.5">🔒</span>
                  <div>
                    <strong className="text-amber-900 block font-semibold">Government Authorized System</strong>
                    Access restricted to registered Legal Metrology Controller Officers. Assistant Controllers and field personnel must use their designated credentials.
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </main>
      
      <GovtFooter />
    </div>
  );
}