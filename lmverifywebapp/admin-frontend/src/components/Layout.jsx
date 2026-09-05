import { useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';

const NAV = [
  { to: '/', label: 'Dashboard', end: true },
  { to: '/reports', label: 'Inspection records' },
  { to: '/officers', label: 'Officers' },
  { to: '/officers/new', label: 'Create account' },
  { to: '/audit', label: 'Administrative log' },
];

function SidebarNav({ onNavigate }) {
  return (
    <nav aria-label="Sections" className="p-2">
      <ul>
        {NAV.map((item) => (
          <li key={item.to}>
            <NavLink
              to={item.to}
              end={item.end}
              onClick={onNavigate}
              className={({ isActive }) =>
                `block border-l-2 px-3 py-2 text-sm transition ${
                  isActive
                    ? 'border-[#FF9933] bg-white/10 font-medium text-white'
                    : 'border-transparent text-white/70 hover:bg-white/5 hover:text-white'
                }`
              }
            >
              {item.label}
            </NavLink>
          </li>
        ))}
      </ul>
    </nav>
  );
}

export default function Layout({ user }) {
  const [menuOpen, setMenuOpen] = useState(false);
  const { logout } = useAuth();

  return (
    <div className="min-h-screen bg-slate-50 text-slate-800">
      {/* Identity bar. Controller record par action leta hai, isliye kaun signed
          in hai woh hamesha dikhta hai — avatar ke peeche chhupta nahi. */}
      <header className="sticky top-0 z-20 bg-[#0b2e6f] text-white">
        <div className="flex items-center justify-between gap-4 px-4 py-2.5">
          <div className="flex items-center gap-3">
            <button
              onClick={() => setMenuOpen((o) => !o)}
              aria-expanded={menuOpen}
              aria-label="Toggle navigation"
              className="rounded border border-white/30 px-2 py-1 text-sm md:hidden"
            >
              Menu
            </button>
            <div>
              <p className="text-sm font-semibold leading-tight">LM-VERIFY</p>
              <p className="text-xs leading-tight text-white/70">
                Department of Consumer Affairs · Legal Metrology Division
              </p>
            </div>
          </div>

          <div className="flex items-center gap-4">
            <div className="text-right">
              <p className="text-sm font-medium leading-tight">{user?.full_name ?? '—'}</p>
              <p className="text-xs leading-tight text-white/70">{user?.designation ?? ''}</p>
            </div>
            <button
              onClick={logout}
              className="rounded-sm border border-white/40 px-3 py-1.5 text-xs text-white hover:bg-white/10 focus-visible:outline-2 focus-visible:outline-white"
            >
              Sign out
            </button>
          </div>
        </div>
        <div className="h-0.5 bg-gradient-to-r from-[#FF9933] via-white to-[#138808]" />
      </header>

      <div className="mx-auto flex max-w-[1400px]">
        <aside className={`${menuOpen ? 'block' : 'hidden'} w-full shrink-0 bg-[#123f7d] md:block md:w-56`}>
          <div className="md:sticky md:top-[68px]">
            <SidebarNav onNavigate={() => setMenuOpen(false)} />
            <p className="border-t border-white/10 px-4 py-3 text-xs leading-relaxed text-white/50">
              Decisions on reports are taken by Assistant Controllers. This console is
              for oversight and accounts.
            </p>
          </div>
        </aside>

        <main className="min-w-0 flex-1 px-4 py-6 md:px-6">
          <Outlet />
        </main>
      </div>
    </div>
  );
}