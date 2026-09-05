import { useEffect, useState } from 'react';
import { getAuditLog } from '../lib/adminApi.js';
import { Panel, Loading, EmptyState, formatDateTime } from '../components/ui.jsx';

const ACTION_LABEL = {
  'account.created': 'Account created',
  'account.suspended': 'Account suspended',
  'account.disabled': 'Account disabled',
  'password.reset': 'Password reset',
};

export default function AuditLog() {
  const [entries, setEntries] = useState(null);
  useEffect(() => { getAuditLog().then(setEntries); }, []);

  return (
    <div className="space-y-5">
      <div>
        <h1 className="text-lg font-semibold text-slate-900">Administrative log</h1>
        <p className="mt-1 text-sm text-slate-600">
          Every account action taken on this console. Entries cannot be edited or removed.
        </p>
      </div>

      <Panel title="Entries" note={entries ? `${entries.length} recorded` : undefined}>
        {!entries && <Loading label="Loading log" />}
        {entries?.length === 0 && <EmptyState message="Nothing recorded yet." />}
        {entries?.length > 0 && (
          <ul className="divide-y divide-slate-100">
            {entries.map((e) => (
              <li key={e.id} className="flex flex-wrap items-baseline justify-between gap-2 px-4 py-3 text-sm">
                <div>
                  <span className="text-slate-900">{ACTION_LABEL[e.action] ?? e.action}</span>
                  <span className="ml-2 text-slate-600">{e.target}</span>
                </div>
                <div className="text-xs text-slate-500">{e.actor} · {formatDateTime(e.created_at)}</div>
              </li>
            ))}
          </ul>
        )}
      </Panel>
    </div>
  );
}