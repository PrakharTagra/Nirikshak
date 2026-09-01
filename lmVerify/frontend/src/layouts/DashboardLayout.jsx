import React from "react";
import { NavLink, Outlet, useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext.jsx";

const NAV_ITEMS = [
  { to: "/", label: "Dashboard", end: true },
  { to: "/scan/new", label: "New scan" },
  { to: "/scans", label: "Previous scans" },
];

export default function DashboardLayout() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate("/login", { replace: true });
  };

  return (
    <div className="flex min-h-screen bg-slate-50">
      <aside className="hidden w-60 flex-shrink-0 flex-col border-r border-slate-200 bg-white sm:flex">
        <div className="flex items-center gap-2 border-b border-slate-200 px-5 py-5">
          <div className="flex h-8 w-8 items-center justify-center rounded-md bg-slate-900 text-white">
            <span className="text-xs font-semibold">LM</span>
          </div>
          <div>
            <p className="text-sm font-semibold leading-tight text-slate-900">Listing Scanner</p>
            <p className="text-xs leading-tight text-slate-400">Legal Metrology</p>
          </div>
        </div>

        <nav className="flex-1 space-y-1 px-3 py-4">
          {NAV_ITEMS.map((item) => (
            <NavLink
              key={item.to}
              to={item.to}
              end={item.end}
              className={({ isActive }) =>
                `block rounded-md px-3 py-2 text-sm font-medium transition ${
                  isActive
                    ? "bg-slate-900 text-white"
                    : "text-slate-600 hover:bg-slate-100 hover:text-slate-900"
                }`
              }
            >
              {item.label}
            </NavLink>
          ))}
        </nav>

        <div className="border-t border-slate-200 px-4 py-4">
          <p className="truncate text-sm font-medium text-slate-800">{user?.name}</p>
          <p className="truncate text-xs text-slate-400">{user?.role}</p>
          <button
            onClick={handleLogout}
            className="mt-3 w-full rounded-md border border-slate-300 px-3 py-1.5 text-xs font-medium text-slate-600 hover:bg-slate-100"
          >
            Sign out
          </button>
        </div>
      </aside>

      <div className="flex min-w-0 flex-1 flex-col">
        {/* Mobile top bar */}
        <div className="flex items-center justify-between border-b border-slate-200 bg-white px-4 py-3 sm:hidden">
          <p className="text-sm font-semibold text-slate-900">Listing Scanner</p>
          <button
            onClick={handleLogout}
            className="text-xs font-medium text-slate-500 hover:text-slate-800"
          >
            Sign out
          </button>
        </div>

        <main className="flex-1 px-6 py-8">
          <div className="mx-auto max-w-5xl">
            <Outlet />
          </div>
        </main>
      </div>
    </div>
  );
}
