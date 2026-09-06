import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { getJurisdictions, createAccount, ROLE_LABEL } from '../lib/adminApi.js';
import { Panel, Breadcrumb } from '../components/ui.jsx';

const ROLES = ['AC', 'DMI', 'LMO'];

const fieldClass =
  'mt-1.5 w-full rounded border border-slate-300 bg-white px-3 py-2 text-sm font-medium text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm';
const labelClass = "block text-sm font-bold text-govt-dark";

const EMPTY = { full_name: '', username: '', role: 'AC', jurisdiction_id: '', email: '', phone: '', password: '' };

export default function CreateAccount() {
  const navigate = useNavigate();
  const [form, setForm] = useState(EMPTY);
  const [jurisdictions, setJurisdictions] = useState([]);
  const [errors, setErrors] = useState({});
  const [saving, setSaving] = useState(false);
  const [created, setCreated] = useState(null);
  const [copied, setCopied] = useState(false);

  useEffect(() => { getJurisdictions().then(setJurisdictions); }, []);

  const set = (key) => (e) => {
    setForm((f) => ({ ...f, [key]: e.target.value }));
    setErrors((x) => ({ ...x, [key]: undefined }));
  };

  function validate() {
    const next = {};
    if (!form.full_name.trim()) next.full_name = 'Enter the officer\u2019s official name.';
    if (!/^[a-z0-9.]{3,}$/.test(form.username)) {
      next.username = 'Use lowercase letters, numbers and dots, at least 3 characters.';
    }
    if (form.password && form.password.trim().length < 6) {
      next.password = 'Password must be at least 6 characters.';
    }
    if (!form.jurisdiction_id) next.jurisdiction_id = 'Assignment to a jurisdiction is mandatory.';
    if (form.email && !/^\S+@\S+\.\S+$/.test(form.email)) next.email = 'Enter a valid email address.';
    setErrors(next);
    return Object.keys(next).length === 0;
  }

  async function handleSubmit() {
    if (!validate()) return;
    setSaving(true);
    try {
      const { officer, temporary_password } = await createAccount(form);
      setCreated({ ...officer, temporary_password });
    } catch (err) {
      setErrors({
        ...(err.details || {}),
        form: err.message ?? 'The account could not be created due to a system error.',
      });
    } finally {
      setSaving(false);
    }
  }

  const handleCopyCredentials = () => {
    if (!created) return;
    const portalUrl = created.role === 'DMI'
      ? 'https://nirikshak-13jz.vercel.app/login'
      : created.role === 'AC'
      ? 'https://nirikshak-y7y9.vercel.app/login'
      : 'https://nirikshak-omega.vercel.app/login';

    const text = [
      `🏛️ NIRIKSHAK OFFICIAL CREDENTIALS`,
      `Designation: ${ROLE_LABEL[created.role]}`,
      `Portal URL: ${portalUrl}`,
      `Username: ${created.username}`,
      `Password: ${created.temporary_password}`,
      `Jurisdiction ID: ${created.jurisdiction_id}`,
    ].join('\n');

    navigator.clipboard.writeText(text);
    setCopied(true);
    setTimeout(() => setCopied(false), 2500);
  };

  if (created) {
    const isDmi = created.role === 'DMI';
    const targetPortalUrl = isDmi
      ? 'https://nirikshak-13jz.vercel.app/login'
      : created.role === 'AC'
      ? 'https://nirikshak-y7y9.vercel.app/login'
      : '/login';

    return (
      <div className="max-w-2xl space-y-6 mx-auto">
        <Breadcrumb items={[{ label: 'Officers Register', to: '/officers' }, { label: 'Account Created' }]} />
        
        <div className="border-b border-slate-300 pb-4">
          <h1 className="text-2xl font-bold text-emerald-700 flex items-center gap-2">
            <span>✅</span> Official Account Generated
          </h1>
        </div>

        <Panel title={created.full_name} note={ROLE_LABEL[created.role]}>
          <dl className="divide-y divide-slate-200 text-sm">
            <div className="flex flex-col sm:flex-row sm:justify-between gap-2 sm:gap-4 px-6 py-4 bg-slate-50">
              <dt className="text-slate-600 font-bold uppercase tracking-wider text-xs">System Username</dt>
              <dd className="font-mono font-bold text-govt-navy text-lg">{created.username}</dd>
            </div>
            <div className="flex flex-col sm:flex-row sm:justify-between gap-2 sm:gap-4 px-6 py-4">
              <dt className="text-slate-600 font-bold uppercase tracking-wider text-xs">Official Password</dt>
              <dd className="font-mono font-bold text-govt-maroon text-xl tracking-widest bg-red-50 px-3 py-1 rounded border border-red-100">{created.temporary_password}</dd>
            </div>
            {isDmi && (
              <div className="flex flex-col sm:flex-row sm:justify-between gap-2 sm:gap-4 px-6 py-4 bg-blue-50/50">
                <dt className="text-slate-600 font-bold uppercase tracking-wider text-xs">DMI Scraper Portal</dt>
                <dd className="text-govt-navy font-semibold text-xs">
                  <a href={targetPortalUrl} target="_blank" rel="noreferrer" className="underline hover:text-blue-900">
                    {targetPortalUrl} ↗
                  </a>
                </dd>
              </div>
            )}
          </dl>
        </Panel>

        <div className="border-l-[6px] border-saffron bg-[#fffaf0] px-5 py-4 shadow-md rounded-r">
          <p className="text-sm text-slate-800 font-bold leading-relaxed">
            ⚠️ MANDATORY INSTRUCTION:<br/>
            Transmit these exact credentials to the officer securely. They will use them to access the designated enforcement console.
          </p>
        </div>

        <div className="flex flex-wrap gap-4 pt-4 border-t border-slate-200">
          <button
            onClick={handleCopyCredentials}
            className="rounded bg-emerald-700 px-6 py-2.5 text-sm font-bold text-white hover:bg-emerald-800 shadow-sm transition-colors flex items-center gap-2"
          >
            <span>{copied ? '✓ Copied to Clipboard!' : '📋 Copy All Credentials'}</span>
          </button>
          <button onClick={() => { setCreated(null); setForm(EMPTY); }}
            className="rounded bg-govt-navy px-6 py-2.5 text-sm font-bold text-white hover:bg-blue-900 shadow-sm transition-colors">
            + Provision Another Account
          </button>
          <button onClick={() => navigate('/officers')}
            className="rounded border-2 border-slate-300 px-6 py-2.5 text-sm font-bold text-slate-700 hover:bg-slate-100 transition-colors">
            Return to Roster
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-2xl space-y-6 mx-auto">
      <Breadcrumb items={[{ label: 'Officers Register', to: '/officers' }, { label: 'Create Account' }]} />
      
      <div className="border-b border-slate-300 pb-4">
        <h1 className="text-2xl font-bold text-govt-navy">Provision New Account</h1>
        <p className="mt-1.5 text-sm text-slate-600 font-medium">
          Create an official system identity. The system will auto-generate a secure temporary password.
        </p>
      </div>

      <Panel title="Officer Credentials Form" note="Fields marked with asterisk (*) are mandatory">
        <div className="space-y-6 p-6">
          <div>
            <label htmlFor="full_name" className={labelClass}>Full Legal Name <span className="text-red-600">*</span></label>
            <input id="full_name" value={form.full_name} onChange={set('full_name')} className={fieldClass}
              aria-invalid={!!errors.full_name} placeholder="e.g. Ramesh Kumar" />
            {errors.full_name && <p className="mt-1.5 text-xs font-bold text-red-700 flex items-center gap-1"><span>❌</span> {errors.full_name}</p>}
          </div>

          <div>
            <label htmlFor="username" className={labelClass}>Desired Username <span className="text-red-600">*</span></label>
            <input id="username" value={form.username} onChange={set('username')} className={fieldClass}
              placeholder="e.g. ramesh.kumar" aria-invalid={!!errors.username} />
            <p className="mt-1 text-[11px] text-slate-500 font-medium">Format: lowercase letters, numbers, and dots only. Minimum 3 characters.</p>
            {errors.username && <p className="mt-1.5 text-xs font-bold text-red-700 flex items-center gap-1"><span>❌</span> {errors.username}</p>}
          </div>

          <div>
            <label htmlFor="password" className={labelClass}>Initial Account Password (Optional)</label>
            <input id="password" type="text" value={form.password} onChange={set('password')} className={fieldClass}
              placeholder="Leave blank to auto-generate a secure one-time password" aria-invalid={!!errors.password} />
            <p className="mt-1 text-[11px] text-slate-500 font-medium">Leave blank for the system to auto-generate, or provide a custom initial password (min. 6 characters).</p>
            {errors.password && <p className="mt-1.5 text-xs font-bold text-red-700 flex items-center gap-1"><span>❌</span> {errors.password}</p>}
          </div>

          <div className="grid gap-6 sm:grid-cols-2 bg-slate-50 p-4 rounded border border-slate-200">
            <div>
              <label htmlFor="role" className={labelClass}>Designation <span className="text-red-600">*</span></label>
              <select id="role" value={form.role} onChange={set('role')} className={fieldClass}>
                {ROLES.map((r) => <option key={r} value={r}>{ROLE_LABEL[r]}</option>)}
              </select>
              {form.role === 'DMI' && (
                <p className="mt-2 text-xs font-bold text-amber-700 bg-amber-50 p-2 rounded border border-amber-200">
                  Note: Digital Marketplace Inspectors authenticate via the e-commerce portal subsystem.
                </p>
              )}
            </div>

            <div>
              <label htmlFor="jurisdiction" className={labelClass}>Posting Jurisdiction <span className="text-red-600">*</span></label>
              <select id="jurisdiction" value={form.jurisdiction_id} onChange={set('jurisdiction_id')}
                className={fieldClass} aria-invalid={!!errors.jurisdiction_id}>
                <option value="">-- Select Office --</option>
                {jurisdictions.map((j) => <option key={j.id} value={j.id}>{j.name} ({j.code})</option>)}
              </select>
              {errors.jurisdiction_id && <p className="mt-1.5 text-xs font-bold text-red-700 flex items-center gap-1"><span>❌</span> {errors.jurisdiction_id}</p>}
            </div>
          </div>

          <div className="grid gap-6 sm:grid-cols-2">
            <div>
              <label htmlFor="email" className={labelClass}>Official Email Address</label>
              <input id="email" type="email" value={form.email} onChange={set('email')} className={fieldClass}
                aria-invalid={!!errors.email} placeholder="name@gov.in" />
              {errors.email && <p className="mt-1.5 text-xs font-bold text-red-700 flex items-center gap-1"><span>❌</span> {errors.email}</p>}
            </div>
            <div>
              <label htmlFor="phone" className={labelClass}>Contact Number</label>
              <input id="phone" value={form.phone} onChange={set('phone')} className={fieldClass} placeholder="10-digit mobile number" />
            </div>
          </div>

          {errors.form && (
            <p className="border-l-4 border-red-600 bg-red-50 px-4 py-3 text-sm text-red-900 font-bold shadow-sm">{errors.form}</p>
          )}

          <div className="flex flex-wrap gap-4 pt-6 border-t border-slate-200">
            <button onClick={handleSubmit} disabled={saving}
              className="rounded bg-govt-navy px-6 py-2.5 text-sm font-bold text-white hover:bg-blue-900 disabled:opacity-60 shadow-sm transition-colors min-w-[150px]">
              {saving ? 'Processing…' : 'Generate Account'}
            </button>
            <button onClick={() => navigate('/officers')}
              className="rounded border-2 border-slate-300 px-6 py-2.5 text-sm font-bold text-slate-700 hover:bg-slate-100 transition-colors">
              Cancel
            </button>
          </div>
        </div>
      </Panel>
    </div>
  );
}