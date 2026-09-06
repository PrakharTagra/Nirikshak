import React, { useState } from "react";
import { NavLink, Outlet, useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext.jsx";
import GovtHeader from "../components/GovtHeader.jsx";
import GovtFooter from "../components/GovtFooter.jsx";

const NAV_ITEMS = [
  { to: "/", label: "Surveillance Overview", end: true },
  { to: "/scan/new", label: "New Marketplace Scan" },
  { to: "/scans", label: "Historical Records" },
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
    <div className="min-h-screen flex flex-col bg-govt-cream text-slate-900">
      {/* Official Government 3-Tier Header */}
      <GovtHeader user={user} onLogout={handleLogout} />

      {/* Horizontal Nav Bar matching lmverifywebapp */}
      <nav className="bg-[#1a3a6c] text-white shadow-md">
        <div className="max-w-[1400px] mx-auto px-4 sm:px-6">
          <div className="md:hidden flex items-center justify-between py-2.5">
            <span className="text-xs font-semibold uppercase tracking-wider text-saffron">
              DMI Portal Navigation
            </span>
            <button
              type="button"
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="text-xs border border-white/30 px-3 py-1 rounded hover:bg-white/10 font-medium"
            >
              {mobileMenuOpen ? "Close Menu" : "Menu ☰"}
            </button>
          </div>

          <ul className={`md:flex ${mobileMenuOpen ? "block" : "hidden"} py-1 md:py-0`}>
            {NAV_ITEMS.map((item) => (
              <li key={item.to}>
                <NavLink
                  to={item.to}
                  end={item.end}
                  onClick={() => setMobileMenuOpen(false)}
                  className={({ isActive }) =>
                    `block px-5 py-3 text-xs sm:text-sm font-semibold tracking-wide transition-colors border-b-4 ${
                      isActive
                        ? "border-saffron text-white bg-white/10"
                        : "border-transparent text-white/80 hover:bg-white/5 hover:text-white"
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

      {/* Main Content Area */}
      <main className="flex-1 max-w-[1400px] w-full mx-auto px-4 py-6 md:px-6">
        <Outlet />
      </main>

      {/* Official Government Footer */}
      <GovtFooter />
    </div>
  );
}
