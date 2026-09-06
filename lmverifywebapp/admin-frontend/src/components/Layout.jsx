import { useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from './GovtHeader.jsx';
import GovtFooter from './GovtFooter.jsx';

const NAV = [
  { to: '/', label: 'Dashboard', end: true },
  { to: '/reports', label: 'Inspection records', end: true },
  { to: '/reports?channel=ecommerce', label: '🛒 DMI Reports' },
  { to: '/officers', label: 'Officers' },
  { to: '/officers/new', label: 'Create account' },
  { to: '/audit', label: 'Administrative log' },
];

export default function Layout({ user }) {
  const [menuOpen, setMenuOpen] = useState(false);
  const { logout } = useAuth();

  return (
    <div className="min-h-screen flex flex-col bg-govt-cream text-slate-800 font-sans">
      <GovtHeader user={user} onLogout={logout} />
      
      {/* Horizontal Navigation Bar */}
      <nav className="bg-[#1a3a6c] text-white/70 shadow-sm sticky top-0 z-10">
        <div className="px-4 md:hidden py-2 flex justify-end">
          <button 
            onClick={() => setMenuOpen(!menuOpen)}
            className="border border-white/30 rounded px-3 py-1 text-sm text-white"
          >
            Menu
          </button>
        </div>
        
        <ul className={`${menuOpen ? 'flex flex-col' : 'hidden'} md:flex md:flex-row max-w-7xl mx-auto px-4 md:px-8`}>
          {NAV.map((item) => (
            <li key={item.to}>
              <NavLink
                to={item.to}
                end={item.end}
                onClick={() => setMenuOpen(false)}
                className={({ isActive }) =>
                  `block px-4 py-3 text-sm transition-colors border-b-2 ${
                    isActive
                      ? 'border-saffron text-white font-medium bg-white/5'
                      : 'border-transparent hover:text-white hover:bg-white/5'
                  }`
                }
              >
                {item.label}
              </NavLink>
            </li>
          ))}
        </ul>
      </nav>

      <main id="main-content" className="flex-1 w-full max-w-7xl mx-auto px-4 md:px-8 py-6 md:py-8 min-w-0">
        <Outlet />
      </main>

      <GovtFooter />
    </div>
  );
}