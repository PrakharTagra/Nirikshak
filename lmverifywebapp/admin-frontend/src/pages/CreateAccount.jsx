import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { getJurisdictions, createAccount, ROLE_LABEL } from '../lib/adminApi.js';
import { Panel } from '../components/ui.jsx';

const ROLES = ['AC', 'DMI', 'LMO'];

const fieldClass =
  'mt-1 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-[#0b2e6f] focus:outline-none focus:ring-1 focus:ring-[#0b2e6f]';

const EMPTY = { full_name: '', username: '', role: 'AC', jurisdiction_id: '', email: '', phone: '' };

export default function CreateAccount() {
  const navigate = useNavigate();
  const [form, setForm] = useState(EMPTY);
  const [jurisdictions, setJurisdictions] = useState([]);
  const [errors, setErrors] = useState({});
  const [saving, setSaving] = useState(false);
  const [created, setCreated] = useState(null);

  useEffect(() => { getJurisdictions().then(setJurisdictions); }, []);

  const set = (key) => (e) => {
    setForm((f) => ({ ...f, [key]: e.target.value }));
    setErrors((x) => ({ ...x, [key]: undefined }));
  };

  function validate() {
    const next = {};
    if (!form.full_name.trim()) next.full_name = 'Enter the officer\u2019s name.';
    if (!/^[a-z0-9.]{3,}$/.test(form.username)) {
      next.username = 'Use lowercase letters, numbers and dots, at least 3 characters.';
    }
    // Schema kisi bhi non-CLM account ko bina jurisdiction ke refuse karta hai,
    // to yahin pakad lo — insert fail hone se pehle.
    if (!form.jurisdiction_id) next.jurisdiction_id = 'Every officer works within a jurisdiction.';
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
      setErrors({ form: err.message ?? 'The account could not be created.' });
      } finally {
      setSaving(false);
    }
  }

  if (created) {
    return (
      <div className="max-w-2xl space-y-5">
        <h1 className="text-lg font-semibold text-slate-900">Account created</h1>
        <Panel title={created.full_name} note={ROLE_LABEL[created.role]}>
          <dl className="divide-y divide-slate-100 text-sm">
            <div className="flex justify-between gap-4 px-4 py-2.5">
              <dt className="text-slate-600">Username</dt>
              <dd className="font-mono text-slate-900">{created.username}</dd>
            </div>
            <div className="flex justify-between gap-4 px-4 py-2.5">
              <dt className="text-slate-600">Temporary password</dt>
              <dd className="text-slate-900">{created.temporary_password}</dd>
            </div>
          </dl>
        </Panel>
        <p className="border-l-4 border-[#FF9933] bg-white px-4 py-3 text-sm text-slate-700">
          Give these credentials to the officer directly. They will be required to set their own
          password before they can do anything else.
        </p>
        <div className="flex gap-3">
          <button onClick={() => { setCreated(null); setForm(EMPTY); }}
            className="rounded-sm bg-[#0b2e6f] px-4 py-2 text-sm font-medium text-white hover:bg-[#092551]">
            Create another
          </button>
          <button onClick={() => navigate('/officers')}
            className="rounded-sm border border-slate-300 px-4 py-2 text-sm text-slate-700 hover:bg-slate-50">
            Back to roster
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-2xl space-y-5">
      <div>
        <h1 className="text-lg font-semibold text-slate-900">Create account</h1>
        <p className="mt-1 text-sm text-slate-600">
          The officer receives a username and a temporary password, and must replace the password
          on first sign-in.
        </p>
      </div>

      <Panel title="Officer details">
        <div className="space-y-4 p-4">
          <div>
            <label htmlFor="full_name" className="block text-sm text-slate-700">Full name</label>
            <input id="full_name" value={form.full_name} onChange={set('full_name')} className={fieldClass}
              aria-invalid={!!errors.full_name} />
            {errors.full_name && <p className="mt-1 text-xs text-red-700">{errors.full_name}</p>}
          </div>

          <div>
            <label htmlFor="username" className="block text-sm text-slate-700">Username</label>
            <input id="username" value={form.username} onChange={set('username')} className={fieldClass}
              placeholder="ac.verma" aria-invalid={!!errors.username} />
            {errors.username && <p className="mt-1 text-xs text-red-700">{errors.username}</p>}
          </div>

          <div>
            <label htmlFor="role" className="block text-sm text-slate-700">Designation</label>
            <select id="role" value={form.role} onChange={set('role')} className={fieldClass}>
              {ROLES.map((r) => <option key={r} value={r}>{ROLE_LABEL[r]}</option>)}
            </select>
            {form.role === 'DMI' && (
              <p className="mt-1.5 text-xs text-slate-500">
                Marketplace inspectors sign in on the e-commerce system, which runs separately.
              </p>
            )}
          </div>

          <div>
            <label htmlFor="jurisdiction" className="block text-sm text-slate-700">Jurisdiction</label>
            <select id="jurisdiction" value={form.jurisdiction_id} onChange={set('jurisdiction_id')}
              className={fieldClass} aria-invalid={!!errors.jurisdiction_id}>
              <option value="">Select a jurisdiction</option>
              {jurisdictions.map((j) => <option key={j.id} value={j.id}>{j.name} ({j.code})</option>)}
            </select>
            {errors.jurisdiction_id && <p className="mt-1 text-xs text-red-700">{errors.jurisdiction_id}</p>}
          </div>

          <div className="grid gap-4 sm:grid-cols-2">
            <div>
              <label htmlFor="email" className="block text-sm text-slate-700">Email</label>
              <input id="email" type="email" value={form.email} onChange={set('email')} className={fieldClass}
                aria-invalid={!!errors.email} />
              {errors.email && <p className="mt-1 text-xs text-red-700">{errors.email}</p>}
            </div>
            <div>
              <label htmlFor="phone" className="block text-sm text-slate-700">Phone</label>
              <input id="phone" value={form.phone} onChange={set('phone')} className={fieldClass} />
            </div>
          </div>

          {errors.form && (
            <p className="border border-red-300 bg-red-50 px-3 py-2 text-sm text-red-800">{errors.form}</p>
          )}

          <div className="flex gap-3 pt-1">
            <button onClick={handleSubmit} disabled={saving}
              className="rounded-sm bg-[#0b2e6f] px-4 py-2 text-sm font-medium text-white hover:bg-[#092551] disabled:opacity-60">
              {saving ? 'Creating…' : 'Create account'}
            </button>
            <button onClick={() => navigate('/officers')}
              className="rounded-sm border border-slate-300 px-4 py-2 text-sm text-slate-700 hover:bg-slate-50">
              Cancel
            </button>
          </div>
        </div>
      </Panel>
    </div>
  );
}