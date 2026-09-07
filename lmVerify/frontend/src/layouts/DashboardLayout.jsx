import React, { useState } from "react";
import { NavLink, Outlet, useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext.jsx";
import GovtHeader from "../components/GovtHeader.jsx";
import GovtFooter from "../components/GovtFooter.jsx";

const NAV_ITEMS = [
  { to: "/", label: "Surveillance Overview", icon: "📊", end: true },
  { to: "/scan/new", label: "New Marketplace Scan", icon: "🛒" },
  { to: "/scans", label: "Historical Records", icon: "📋" },
];

export default function DashboardLayout() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  const handleLogout = () => {
    logout();
    navigate("/login", { replace: true });
  };

  return (
    <div className="min-h-screen flex flex-col bg-govt-cream text-slate-900 font-sans antialiased">
      {/* Official Government 3-Tier Header */}
      <GovtHeader user={user} onLogout={handleLogout} />

      {/* Horizontal Navigation Bar matching lmverifywebapp */}
      <nav className="bg-[#0f2e5a] text-white/85 shadow-md sticky top-0 z-30 border-b border-white/10" aria-label="DMI Main Navigation">
        <div className="max-w-[1400px] mx-auto px-4 sm:px-6">
          <div className="md:hidden flex items-center justify-between py-2.5">
            <span className="text-xs font-semibold uppercase tracking-wider text-amber-300">
              DMI Portal Menu
            </span>
            <button
              type="button"
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="text-xs border border-white/20 px-2.5 py-1 rounded hover:bg-white/10 flex items-center gap-1.5 cursor-pointer text-white"
            >
              <span>{mobileMenuOpen ? "✕" : "☰"}</span>
              <span>{mobileMenuOpen ? "Close" : "Menu"}</span>
            </button>
          </div>

          <ul className={`md:flex ${mobileMenuOpen ? "flex flex-col py-2 border-t border-white/10" : "hidden"} gap-1 py-1 md:py-0`}>
            {NAV_ITEMS.map((item) => (
              <li key={item.to}>
                <NavLink
                  to={item.to}
                  end={item.end}
                  onClick={() => setMobileMenuOpen(false)}
                  className={({ isActive }) =>
                    `flex items-center gap-2 px-4 py-2.5 text-xs font-semibold tracking-wide transition-all border-b-2 ${
                      isActive
                        ? "border-saffron text-white bg-white/10 shadow-sm"
                        : "border-transparent text-white/75 hover:bg-white/5 hover:text-white"
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
      <main id="main-content" className="flex-1 max-w-[1400px] w-full mx-auto px-4 py-6 md:px-6 min-w-0">
        <Outlet />
      </main>

      {/* Official Government Footer */}
      <GovtFooter />
    </div>
  );
}
