import { useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from './GovtHeader.jsx';
import GovtFooter from './GovtFooter.jsx';

const NAV = [
  { to: '/', label: 'Awaiting Decision', icon: '⏳', end: true },
  { to: '/all', label: 'All Jurisdiction Reports', icon: '📂' },
];

export default function Layout({ user }) {
  const [menuOpen, setMenuOpen] = useState(false);
  const { logout } = useAuth();

  return (
    <div className="min-h-screen flex flex-col bg-govt-cream text-slate-900 font-sans antialiased">
      <GovtHeader user={user} onLogout={logout} />
      
      {/* Horizontal Government Navigation Bar */}
      <nav className="bg-[#0f2e5a] text-white shadow-md sticky top-0 z-30 border-b border-white/10" aria-label="Main Navigation">
        <div className="max-w-[1400px] mx-auto px-4 sm:px-6">
          <div className="md:hidden flex items-center justify-between py-2.5">
            <span className="text-xs uppercase tracking-widest text-white/70 font-semibold">
              AC Portal Menu
            </span>
            <button
              onClick={() => setMenuOpen(!menuOpen)}
              aria-expanded={menuOpen}
              className="text-xs border border-white/20 px-2.5 py-1 rounded hover:bg-white/10 flex items-center gap-1.5"
            >
              <span>{menuOpen ? '✕' : '☰'}</span>
              <span>{menuOpen ? 'Close' : 'Menu'}</span>
            </button>
          </div>
          <ul className={`md:flex ${menuOpen ? 'flex flex-col py-2 border-t border-white/10' : 'hidden'} gap-1 py-1 md:py-0`}>
            {NAV.map((item) => (
              <li key={item.to}>
                <NavLink
                  to={item.to}
                  end={item.end}
                  onClick={() => setMenuOpen(false)}
                  className={({ isActive }) =>
                    `flex items-center gap-2 px-4 py-2.5 text-xs font-semibold tracking-wide transition-all border-b-2 ${
                      isActive
                        ? 'border-saffron text-white bg-white/10 shadow-sm'
                        : 'border-transparent text-white/75 hover:bg-white/5 hover:text-white'
                    }`
                  }
                >
                  <span className="text-sm opacity-90">{item.icon}</span>
                  <span>{item.label}</span>
                </NavLink>
              </li>
            ))}
          </ul>
        </div>
      </nav>

      {/* Main Content Container */}
      <main id="main-content" className="flex-1 max-w-[1400px] w-full mx-auto px-4 py-6 md:px-6 min-w-0">
        <Outlet />
      </main>

      <GovtFooter />
    </div>
  );
}