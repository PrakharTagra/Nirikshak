import React, { useState } from "react";
import { Link, useLocation, useNavigate, Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext.jsx";
import GovtHeader from "../components/GovtHeader.jsx";
import GovtFooter from "../components/GovtFooter.jsx";
import Emblem from "../components/Emblem.jsx";

const fieldClass =
  "mt-1.5 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm";

export default function Login() {
  const { login, isAuthenticated } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [submitting, setSubmitting] = useState(false);

  if (isAuthenticated) {
    const redirectTo = location.state?.from?.pathname || "/";
    return <Navigate to={redirectTo} replace />;
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setSubmitting(true);
    try {
      await login(username, password);
      const redirectTo = location.state?.from?.pathname || "/";
      navigate(redirectTo, { replace: true });
    } catch (err) {
      setError(err.message || "Failed to sign in. Please check credentials.");
    } finally {
      setSubmitting(false);
    }
  };

  const handleDemoFill = (officerUsername) => {
    setUsername(officerUsername);
    setPassword("password123");
    setError("");
  };

  return (
    <div className="flex min-h-screen flex-col bg-govt-cream">
      <GovtHeader />

      <main className="flex flex-1 items-center justify-center px-4 py-10">
        <div className="w-full max-w-md">
          <div className="text-center mb-6">
            <div className="flex justify-center mb-3">
              <Emblem size={60} />
            </div>
            <p className="text-xs font-bold tracking-[0.18em] text-govt-maroon uppercase">
              LM-Verify System • Nirikshak
            </p>
            <h1 className="mt-1 text-2xl font-bold text-slate-900">Digital Marketplace Inspector</h1>
            <p className="text-xs text-slate-600 mt-1">
              Sign In to access the Statutory E-Commerce Compliance &amp; Verification Console
            </p>
          </div>

          <form
            onSubmit={handleSubmit}
            className="border-t-4 border-t-govt-navy border-x border-b border-slate-200 bg-white p-6 shadow-md rounded-sm"
          >
            <div>
              <label htmlFor="username" className="block text-sm font-semibold text-slate-800">
                Official Username or Email <span className="text-red-600">*</span>
              </label>
              <input
                id="username"
                type="text"
                autoComplete="username"
                autoFocus
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                placeholder="e.g. dmi.officer or name@gov.in"
                className={fieldClass}
                required
              />
            </div>

            <div className="mt-4">
              <div className="flex items-center justify-between">
                <label htmlFor="password" className="block text-sm font-semibold text-slate-800">
                  Password <span className="text-red-600">*</span>
                </label>
              </div>
              <input
                id="password"
                type="password"
                autoComplete="current-password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Enter your password"
                className={fieldClass}
                required
              />
            </div>

            {error && (
              <div role="alert" className="mt-4 border-l-4 border-red-600 bg-red-50 p-3 text-xs text-red-800 font-medium">
                {error}
              </div>
            )}

            <button
              type="submit"
              disabled={submitting}
              className="mt-6 w-full rounded-sm bg-govt-navy px-4 py-2.5 text-sm font-bold tracking-wide text-white shadow-sm hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-70 transition-colors"
            >
              {submitting ? "Authenticating Officer…" : "Sign In to DMI Portal"}
            </button>

            {/* Switch to Signup */}
            <div className="mt-4 text-center border-t border-slate-200 pt-3">
              <p className="text-xs text-slate-600">
                New Digital Marketplace Inspector?{" "}
                <Link to="/signup" className="font-bold text-govt-navy hover:underline">
                  Register / Provision Official Account
                </Link>
              </p>
            </div>

            {/* Quick Officer Demo Profiles */}
            <div className="mt-4 rounded bg-slate-50 p-3 border border-slate-200 text-xs">
              <p className="font-semibold text-slate-700 mb-1">Quick Fill Demo Accounts:</p>
              <div className="flex flex-wrap gap-2">
                <button
                  type="button"
                  onClick={() => handleDemoFill("dmi.officer")}
                  className="rounded border border-slate-300 bg-white px-2 py-1 text-[11px] font-medium text-slate-800 hover:bg-slate-100"
                >
                  DMI Rajesh Sharma
                </button>
                <button
                  type="button"
                  onClick={() => handleDemoFill("prakhar.dmi")}
                  className="rounded border border-slate-300 bg-white px-2 py-1 text-[11px] font-medium text-slate-800 hover:bg-slate-100"
                >
                  DMI Prakhar Tagra
                </button>
              </div>
              <p className="text-[10px] text-slate-400 mt-1">Default password: password123</p>
            </div>

            {/* Statutory Security Disclaimer */}
            <div className="mt-4 border-t border-slate-100 pt-3">
              <div className="flex items-start gap-2.5 bg-amber-50 p-2.5 border border-amber-200 rounded-sm">
                <span className="text-amber-600 text-base" aria-hidden="true">⚠️</span>
                <p className="text-[11px] leading-relaxed text-slate-700">
                  <strong className="block text-amber-900 font-semibold">Statutory Enforcement System.</strong>
                  Unauthorized access or data tampering is punishable under the Legal Metrology Act, 2009 &amp; IT Act, 2000.
                </p>
              </div>
            </div>
          </form>
        </div>
      </main>

      <GovtFooter />
    </div>
  );
}
