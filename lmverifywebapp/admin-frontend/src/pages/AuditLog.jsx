import { useEffect, useState } from 'react';
import { getAuditLog } from '../lib/adminApi.js';
import { Panel, Loading, EmptyState, formatDateTime, Breadcrumb } from '../components/ui.jsx';

const ACTION_LABEL = {
  'account.created': 'Account provisioned',
  'account.suspended': 'Access suspended',
  'account.disabled': 'Account deactivated permanently',
  'password.reset': 'Security credential reset',
};

const ACTION_ICON = {
  'account.created': '➕',
  'account.suspended': '⏸️',
  'account.disabled': '⛔',
  'password.reset': '🔑',
};

export default function AuditLog() {
  const [entries, setEntries] = useState(null);
  useEffect(() => { getAuditLog().then(setEntries); }, []);

  return (
    <div className="space-y-6 max-w-4xl mx-auto">
      <Breadcrumb items={[{ label: 'Administrative Log' }]} />

      <div className="border-b border-slate-300 pb-4">
        <h1 className="text-2xl font-bold text-govt-navy">Administrative Audit Log</h1>
        <p className="mt-1.5 text-sm text-slate-600 font-medium">
          Immutable ledger of all administrative actions performed within the Controller console. 
          <span className="font-bold text-govt-maroon ml-1">Entries cannot be edited or expunged.</span>
        </p>
      </div>

      <Panel title="System Action Ledger" note={entries ? `${entries.length} immutable records found` : undefined}>
        {!entries && <Loading label="Fetching secure audit logs" />}
        {entries?.length === 0 && <EmptyState message="No administrative actions have been recorded yet." />}
        
        {entries?.length > 0 && (
          <div className="px-2 py-4 sm:px-6">
            <div className="relative border-l-2 border-slate-200 ml-3 sm:ml-4 space-y-8 pb-4">
              {entries.map((e, idx) => (
                <div key={e.id} className="relative pl-6 sm:pl-8 group">
                  <div className="absolute -left-[17px] top-1 h-8 w-8 rounded-full bg-white border-2 border-slate-300 flex items-center justify-center text-sm shadow-sm group-hover:border-govt-navy transition-colors">
                    {ACTION_ICON[e.action] || '📝'}
                  </div>
                  
                  <div className="bg-white border border-slate-200 rounded p-4 shadow-sm group-hover:border-slate-300 group-hover:shadow-md transition-all">
                    <div className="flex flex-col sm:flex-row sm:items-baseline sm:justify-between gap-2 mb-2">
                      <h3 className="text-sm font-bold text-govt-navy uppercase tracking-wide">
                        {ACTION_LABEL[e.action] ?? e.action}
                      </h3>
                      <time className="text-xs font-bold text-slate-500 bg-slate-100 px-2 py-1 rounded">
                        {formatDateTime(e.created_at)}
                      </time>
                    </div>
                    
                    <div className="flex flex-col sm:flex-row gap-4 sm:gap-8 mt-3 pt-3 border-t border-slate-100">
                      <div>
                        <p className="text-[10px] font-bold uppercase text-slate-400 tracking-wider">Target Subject</p>
                        <p className="text-sm font-semibold text-slate-900 font-mono mt-0.5">{e.target}</p>
                      </div>
                      <div>
                        <p className="text-[10px] font-bold uppercase text-slate-400 tracking-wider">Authorized By</p>
                        <p className="text-sm font-semibold text-slate-700 mt-0.5">{e.actor}</p>
                      </div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </Panel>
    </div>
  );
}