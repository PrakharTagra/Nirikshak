import React, { useState } from "react";
import { Link, useLocation, useNavigate, Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext.jsx";
import GovtHeader from "../components/GovtHeader.jsx";
import GovtFooter from "../components/GovtFooter.jsx";
import Emblem from "../components/Emblem.jsx";

const fieldClass =
  "mt-1.5 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm";

export default function Login() {
  const { login, changePassword, isAuthenticated } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [submitting, setSubmitting] = useState(false);

  // Forced password change state
  const [needNewPassword, setNeedNewPassword] = useState(false);
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [changingPass, setChangingPass] = useState(false);

  if (isAuthenticated && !needNewPassword) {
    const redirectTo = location.state?.from?.pathname || "/";
    return <Navigate to={redirectTo} replace />;
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    setSubmitting(true);
    try {
      const officer = await login(username, password);
      if (officer.must_change_password) {
        setNeedNewPassword(true);
      } else {
        const redirectTo = location.state?.from?.pathname || "/";
        navigate(redirectTo, { replace: true });
      }
    } catch (err) {
      setError(err.message || "Failed to sign in. Please check credentials.");
    } finally {
      setSubmitting(false);
    }
  };

  const handlePasswordChange = async (e) => {
    e.preventDefault();
    setError("");
    if (!newPassword || newPassword.length < 8) {
      setError("New password must be at least 8 characters long.");
      return;
    }
    if (newPassword !== confirmPassword) {
      setError("New passwords do not match.");
      return;
    }

    setChangingPass(true);
    try {
      await changePassword(password, newPassword);
      const redirectTo = location.state?.from?.pathname || "/";
      navigate(redirectTo, { replace: true });
    } catch (err) {
      setError(err.message || "Could not update password.");
    } finally {
      setChangingPass(false);
    }
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

          {!needNewPassword ? (
            <form
              onSubmit={handleSubmit}
              className="border-t-4 border-t-govt-navy border-x border-b border-slate-200 bg-white p-6 shadow-md rounded-sm"
            >
              <div>
                <label htmlFor="username" className="block text-sm font-semibold text-slate-800">
                  Official Username <span className="text-red-600">*</span>
                </label>
                <input
                  id="username"
                  type="text"
                  autoComplete="username"
                  autoFocus
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  placeholder="e.g. prakhar.dmi"
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
                  placeholder="Enter temporary or permanent password"
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

              <div className="mt-5 border-t border-slate-200 pt-3 text-center">
                <p className="text-[11px] text-slate-500 font-medium">
                  Official accounts are provisioned exclusively by the <strong className="text-govt-navy">Controller of Legal Metrology (CLM)</strong>.
                </p>
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
          ) : (
            <form
              onSubmit={handlePasswordChange}
              className="border-t-4 border-t-amber-600 border-x border-b border-slate-200 bg-white p-6 shadow-md rounded-sm"
            >
              <div className="mb-4 bg-amber-50 border border-amber-200 p-3 rounded text-xs text-amber-900">
                <strong className="block font-bold mb-1">🔐 First Time Sign-In Detected</strong>
                You are currently signed in with a one-time temporary password. Set your permanent official password to continue.
              </div>

              <div>
                <label htmlFor="newPassword" className="block text-sm font-semibold text-slate-800">
                  New Permanent Password <span className="text-red-600">*</span>
                </label>
                <input
                  id="newPassword"
                  type="password"
                  value={newPassword}
                  onChange={(e) => setNewPassword(e.target.value)}
                  placeholder="At least 8 characters"
                  className={fieldClass}
                  required
                />
              </div>

              <div className="mt-4">
                <label htmlFor="confirmPassword" className="block text-sm font-semibold text-slate-800">
                  Confirm New Password <span className="text-red-600">*</span>
                </label>
                <input
                  id="confirmPassword"
                  type="password"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  placeholder="Re-enter new password"
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
                disabled={changingPass}
                className="mt-6 w-full rounded-sm bg-emerald-700 px-4 py-2.5 text-sm font-bold tracking-wide text-white shadow-sm hover:bg-emerald-800 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700 disabled:opacity-70 transition-colors"
              >
                {changingPass ? "Updating Password…" : "Save Password & Enter Console"}
              </button>
            </form>
          )}
        </div>
      </main>

      <GovtFooter />
    </div>
  );
}
