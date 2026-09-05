import { useState } from 'react';
import { NavLink, Outlet } from 'react-router-dom';
import { useAuth } from '../lib/auth.jsx';
import GovtHeader from './GovtHeader.jsx';
import GovtFooter from './GovtFooter.jsx';

const NAV = [
  { to: '/', label: 'Awaiting Decision', end: true },
  { to: '/all', label: 'All Reports' },
];

export default function Layout({ user }) {
  const [menuOpen, setMenuOpen] = useState(false);
  const { logout } = useAuth();

  return (
    <div className="min-h-screen flex flex-col bg-govt-cream text-slate-900">
      <GovtHeader user={user} onLogout={logout} />
      
      {/* Horizontal Nav Bar */}
      <nav className="bg-[#1a3a6c] text-white">
        <div className="max-w-[1400px] mx-auto px-4 sm:px-6">
          <div className="md:hidden flex items-center py-2">
            <button
              onClick={() => setMenuOpen(!menuOpen)}
              className="text-sm border border-white/30 px-3 py-1 rounded hover:bg-white/10"
            >
              Menu
            </button>
          </div>
          <ul className={`md:flex ${menuOpen ? 'block' : 'hidden'} py-1 md:py-0`}>
            {NAV.map((item) => (
              <li key={item.to}>
                <NavLink
                  to={item.to}
                  end={item.end}
                  onClick={() => setMenuOpen(false)}
                  className={({ isActive }) =>
                    `block px-4 py-3 text-sm font-medium transition-colors border-b-4 ${
                      isActive
                        ? 'border-saffron text-white bg-white/10'
                        : 'border-transparent text-white/80 hover:bg-white/5 hover:text-white'
                    }`
                  }
                >
                  {item.label}
                </NavLink>
              </li>
            ))}
          </ul>
        </div>
      </nav>

      <main className="flex-1 max-w-[1400px] w-full mx-auto px-4 py-6 md:px-6">
        <Outlet />
      </main>

      <GovtFooter />
    </div>
  );
}