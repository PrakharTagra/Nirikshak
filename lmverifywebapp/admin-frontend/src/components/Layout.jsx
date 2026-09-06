import { useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from './GovtHeader.jsx';
import GovtFooter from './GovtFooter.jsx';

const NAV = [
  { to: '/', label: 'Dashboard', icon: '📊', end: true },
  { to: '/reports', label: 'Inspection Records', icon: '📋', end: true },
  { to: '/reports?channel=ecommerce', label: 'DMI Reports', icon: '🛒' },
  { to: '/officers', label: 'Officers Register', icon: '👥' },
  { to: '/officers/new', label: 'Create Account', icon: '➕' },
  { to: '/audit', label: 'Administrative Log', icon: '🛡️' },
];

export default function Layout({ user }) {
  const [menuOpen, setMenuOpen] = useState(false);
  const { logout } = useAuth();

  return (
    <div className="min-h-screen flex flex-col bg-govt-cream text-slate-800 font-sans antialiased">
      <GovtHeader user={user} onLogout={logout} />
      
      {/* Horizontal Government Navigation Bar */}
      <nav className="bg-[#0f2e5a] text-white/80 shadow-md sticky top-0 z-30 border-b border-white/10" aria-label="Main Navigation">
        <div className="max-w-7xl mx-auto px-4 md:px-8">
          <div className="flex items-center justify-between md:justify-start">
            <div className="md:hidden py-2.5 flex items-center justify-between w-full">
              <span className="text-xs uppercase tracking-widest text-white/70 font-semibold">
                CLM Portal Menu
              </span>
              <button 
                onClick={() => setMenuOpen(!menuOpen)}
                aria-expanded={menuOpen}
                className="inline-flex items-center gap-1.5 border border-white/20 rounded px-2.5 py-1 text-xs text-white hover:bg-white/10 transition-colors"
              >
                <span>{menuOpen ? '✕' : '☰'}</span>
                <span>{menuOpen ? 'Close' : 'Menu'}</span>
              </button>
            </div>
          </div>

          <ul className={`${menuOpen ? 'flex flex-col py-2 border-t border-white/10' : 'hidden'} md:flex md:flex-row gap-1`}>
            {NAV.map((item) => (
              <li key={item.to}>
                <NavLink
                  to={item.to}
                  end={item.end}
                  onClick={() => setMenuOpen(false)}
                  className={({ isActive }) =>
                    `flex items-center gap-2 px-3.5 py-2.5 text-xs font-semibold tracking-wide transition-all border-b-2 ${
                      isActive
                        ? 'border-saffron text-white bg-white/10 shadow-sm'
                        : 'border-transparent text-white/75 hover:text-white hover:bg-white/5'
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

      {/* Main Content Area */}
      <main id="main-content" className="flex-1 w-full max-w-7xl mx-auto px-4 md:px-8 py-6 md:py-8 min-w-0">
        <Outlet />
      </main>

      <GovtFooter />
    </div>
  );
}