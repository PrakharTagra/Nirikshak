import React, { useState } from "react";
import { Link, useLocation, useNavigate, Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext.jsx";
import GovtHeader from "../components/GovtHeader.jsx";
import GovtFooter from "../components/GovtFooter.jsx";
import Emblem from "../components/Emblem.jsx";

const fieldClass =
  "mt-1.5 w-full rounded border border-slate-300 bg-white px-3.5 py-2.5 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-2 focus:ring-govt-navy/20 shadow-sm transition-all";

export default function Login() {
  const { login, changePassword, isAuthenticated } = useAuth();
  const navigate = useNavigate();
  const location = useLocation();

  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);
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
    <div className="flex min-h-screen flex-col bg-govt-cream font-sans">
      <GovtHeader />

      <main id="main-content" className="flex flex-1 items-center justify-center px-4 py-10 md:py-16">
        <div className="w-full max-w-md">
          {/* Official Emblem & Portal Title Card */}
          <div className="text-center mb-6 flex flex-col items-center">
            <div className="p-2 mb-3 bg-white rounded-full border border-slate-200 shadow-sm">
              <Emblem size={68} variant="dark" />
            </div>
            <div className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-full bg-govt-navy/10 text-govt-navy text-xs font-semibold uppercase tracking-wider mb-2">
              <span>🏛️</span> Statutory Enforcement Portal
            </div>
            <h1 className="text-2xl font-bold text-govt-navy tracking-wide">निरीक्षक · NIRIKSHAK</h1>
            <h2 className="text-base font-semibold text-slate-800 mt-0.5">Digital Marketplace Inspector (DMI)</h2>
            <p className="text-xs text-slate-600 mt-1">E-Commerce Compliance &amp; Marketplace Surveillance System</p>
          </div>

          {!needNewPassword ? (
            <div className="border border-slate-300 bg-white shadow-md rounded-sm overflow-hidden">
              {/* Header Accent Bar */}
              <div className="h-1.5 w-full bg-govt-navy" />

              <form onSubmit={handleSubmit} className="p-6 md:p-8">
                <div>
                  <label htmlFor="username" className="block text-xs font-bold uppercase tracking-wider text-slate-700">
                    Inspector Username / यूजरनेम <span className="text-red-600">*</span>
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

                <div className="mt-5">
                  <div className="flex items-center justify-between">
                    <label htmlFor="password" className="block text-xs font-bold uppercase tracking-wider text-slate-700">
                      Password / पासवर्ड <span className="text-red-600">*</span>
                    </label>
                  </div>
                  <div className="relative mt-1">
                    <input
                      id="password"
                      type={showPassword ? "text" : "password"}
                      autoComplete="current-password"
                      value={password}
                      onChange={(e) => setPassword(e.target.value)}
                      placeholder="Enter assigned password"
                      className={`${fieldClass} pr-10`}
                      required
                    />
                    <button
                      type="button"
                      onClick={() => setShowPassword(!showPassword)}
                      className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-700 text-xs p-1 focus:outline-none cursor-pointer"
                      aria-label={showPassword ? "Hide password" : "Show password"}
                    >
                      {showPassword ? "👁️" : "👁️‍🗨️"}
                    </button>
                  </div>
                </div>

                {error && (
                  <div role="alert" className="mt-5 border-l-4 border-red-600 bg-red-50 p-3 text-xs text-red-900 font-medium rounded-r">
                    <span className="font-bold">Authentication Failed: </span>{error}
                  </div>
                )}

                <button
                  type="submit"
                  disabled={submitting}
                  className="mt-6 w-full rounded bg-govt-navy px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-70 transition-all shadow-sm flex items-center justify-center gap-2 cursor-pointer"
                >
                  {submitting ? (
                    <>
                      <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                      <span>Authenticating Officer…</span>
                    </>
                  ) : (
                    <>
                      <span>Sign In to DMI Console</span>
                      <span aria-hidden="true">→</span>
                    </>
                  )}
                </button>

                <div className="mt-6 border-t border-slate-200 pt-4">
                  <div className="flex items-start gap-2.5 bg-amber-50/80 p-3 rounded border border-amber-200 text-xs text-slate-700 leading-relaxed">
                    <span className="text-amber-700 text-sm mt-0.5">🔒</span>
                    <div>
                      <strong className="text-amber-900 block font-semibold">Government Authorized System</strong>
                      Accounts are provisioned exclusively by the Controller of Legal Metrology (CLM). Unauthorized access or data tampering is prohibited under the Legal Metrology Act, 2009.
                    </div>
                  </div>
                </div>
              </form>
            </div>
          ) : (
            <div className="border border-slate-300 bg-white shadow-md rounded-sm overflow-hidden">
              <div className="h-1.5 w-full bg-amber-500" />
              <form onSubmit={handlePasswordChange} className="p-6 md:p-8">
                <div className="mb-5 bg-amber-50 border border-amber-200 p-3.5 rounded text-xs text-amber-900 leading-relaxed">
                  <strong className="block font-bold mb-1 text-amber-950">🔐 First Time Sign-In Detected</strong>
                  You are currently signed in with a one-time temporary password. You must set your permanent official password to activate your inspector account.
                </div>

                <div>
                  <label htmlFor="newPassword" className="block text-xs font-bold uppercase tracking-wider text-slate-700">
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
                  <label htmlFor="confirmPassword" className="block text-xs font-bold uppercase tracking-wider text-slate-700">
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
                  <div role="alert" className="mt-4 border-l-4 border-red-600 bg-red-50 p-3 text-xs text-red-900 font-medium rounded-r">
                    {error}
                  </div>
                )}

                <button
                  type="submit"
                  disabled={changingPass}
                  className="mt-6 w-full rounded bg-emerald-700 px-4 py-2.5 text-sm font-semibold text-white hover:bg-emerald-800 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700 disabled:opacity-70 transition-all shadow-sm flex items-center justify-center gap-2 cursor-pointer"
                >
                  {changingPass ? (
                    <>
                      <div className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                      <span>Updating Password…</span>
                    </>
                  ) : (
                    <span>Save Password &amp; Enter Console</span>
                  )}
                </button>
              </form>
            </div>
          )}
        </div>
      </main>

      <GovtFooter />
    </div>
  );
}
