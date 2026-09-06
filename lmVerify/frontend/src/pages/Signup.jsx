import React, { useState } from "react";
import { Link, useNavigate, Navigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext.jsx";
import GovtHeader from "../components/GovtHeader.jsx";
import GovtFooter from "../components/GovtFooter.jsx";
import Emblem from "../components/Emblem.jsx";

const fieldClass =
  "mt-1.5 w-full rounded-sm border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy shadow-sm";
const labelClass = "block text-xs font-bold text-slate-800 uppercase tracking-wide";

const JURISDICTIONS = [
  "Central E-Commerce Surveillance Unit (HQ New Delhi)",
  "Northern Region E-Commerce Cell (Delhi / NCR)",
  "Western Region E-Commerce Cell (Mumbai)",
  "Southern Region E-Commerce Cell (Bengaluru / Chennai)",
  "Eastern Region E-Commerce Cell (Kolkata)",
  "Central Region Digital Marketplace Cell (Bhopal)",
];

export default function Signup() {
  const { signup, isAuthenticated } = useAuth();
  const navigate = useNavigate();

  const [form, setForm] = useState({
    full_name: "",
    username: "",
    email: "",
    phone: "",
    jurisdiction: JURISDICTIONS[0],
    badge_no: "",
    password: "",
    confirm_password: "",
  });

  const [error, setError] = useState("");
  const [submitting, setSubmitting] = useState(false);

  if (isAuthenticated) {
    return <Navigate to="/" replace />;
  }

  const handleChange = (key) => (e) => {
    setForm((f) => ({ ...f, [key]: e.target.value }));
    setError("");
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");

    if (!form.full_name.trim()) {
      setError("Please enter officer's full legal name.");
      return;
    }
    if (!form.username.trim() || form.username.trim().length < 3) {
      setError("Username must be at least 3 characters long.");
      return;
    }
    if (form.password.length < 6) {
      setError("Password must be at least 6 characters long.");
      return;
    }
    if (form.password !== form.confirm_password) {
      setError("Passwords do not match. Please verify.");
      return;
    }

    setSubmitting(true);
    try {
      await signup({
        full_name: form.full_name,
        username: form.username,
        email: form.email,
        phone: form.phone,
        jurisdiction: form.jurisdiction,
        badge_no: form.badge_no || `DMI-${Math.floor(1000 + Math.random() * 9000)}`,
        password: form.password,
      });
      navigate("/", { replace: true });
    } catch (err) {
      setError(err.message || "Failed to provision account. Please check entries.");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <div className="flex min-h-screen flex-col bg-govt-cream">
      <GovtHeader />

      <main className="flex flex-1 items-center justify-center px-4 py-8">
        <div className="w-full max-w-xl">
          <div className="text-center mb-6">
            <div className="flex justify-center mb-2">
              <Emblem size={52} />
            </div>
            <p className="text-xs font-bold tracking-[0.18em] text-govt-maroon uppercase">
              LM-Verify System • Officer Registration
            </p>
            <h1 className="mt-1 text-2xl font-bold text-slate-900">
              Provision Inspector Account
            </h1>
            <p className="text-xs text-slate-600 mt-1">
              Designation: <strong>Digital Marketplace Inspector (DMI)</strong> • Rank 3 E-Commerce Enforcement
            </p>
          </div>

          <form
            onSubmit={handleSubmit}
            className="border-t-4 border-t-govt-navy border-x border-b border-slate-200 bg-white p-6 shadow-md rounded-sm space-y-4"
          >
            {error && (
              <div role="alert" className="border-l-4 border-red-600 bg-red-50 p-3 text-xs text-red-800 font-medium">
                {error}
              </div>
            )}

            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <div>
                <label htmlFor="full_name" className={labelClass}>
                  Officer Full Legal Name <span className="text-red-600">*</span>
                </label>
                <input
                  id="full_name"
                  type="text"
                  required
                  value={form.full_name}
                  onChange={handleChange("full_name")}
                  placeholder="e.g. Ramesh Kumar"
                  className={fieldClass}
                />
              </div>

              <div>
                <label htmlFor="username" className={labelClass}>
                  Desired Username <span className="text-red-600">*</span>
                </label>
                <input
                  id="username"
                  type="text"
                  required
                  value={form.username}
                  onChange={handleChange("username")}
                  placeholder="e.g. ramesh.dmi"
                  className={fieldClass}
                />
              </div>
            </div>

            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <div>
                <label htmlFor="email" className={labelClass}>
                  Official Email Address
                </label>
                <input
                  id="email"
                  type="email"
                  value={form.email}
                  onChange={handleChange("email")}
                  placeholder="name@gov.in or name@nic.in"
                  className={fieldClass}
                />
              </div>

              <div>
                <label htmlFor="phone" className={labelClass}>
                  Official Contact Number
                </label>
                <input
                  id="phone"
                  type="tel"
                  value={form.phone}
                  onChange={handleChange("phone")}
                  placeholder="+91 98765 43210"
                  className={fieldClass}
                />
              </div>
            </div>

            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <div>
                <label htmlFor="jurisdiction" className={labelClass}>
                  Assigned Jurisdiction <span className="text-red-600">*</span>
                </label>
                <select
                  id="jurisdiction"
                  value={form.jurisdiction}
                  onChange={handleChange("jurisdiction")}
                  className={fieldClass}
                >
                  {JURISDICTIONS.map((j) => (
                    <option key={j} value={j}>
                      {j}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <label htmlFor="badge_no" className={labelClass}>
                  Inspector Badge / Enforcement ID
                </label>
                <input
                  id="badge_no"
                  type="text"
                  value={form.badge_no}
                  onChange={handleChange("badge_no")}
                  placeholder="e.g. DMI-HQ-2026-042"
                  className={fieldClass}
                />
              </div>
            </div>

            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <div>
                <label htmlFor="password" className={labelClass}>
                  Password <span className="text-red-600">*</span>
                </label>
                <input
                  id="password"
                  type="password"
                  required
                  value={form.password}
                  onChange={handleChange("password")}
                  placeholder="Min 6 characters"
                  className={fieldClass}
                />
              </div>

              <div>
                <label htmlFor="confirm_password" className={labelClass}>
                  Confirm Password <span className="text-red-600">*</span>
                </label>
                <input
                  id="confirm_password"
                  type="password"
                  required
                  value={form.confirm_password}
                  onChange={handleChange("confirm_password")}
                  placeholder="Re-enter password"
                  className={fieldClass}
                />
              </div>
            </div>

            <div className="rounded bg-blue-50/60 p-3 border border-blue-200 text-xs text-blue-900">
              <span className="font-bold">Role Assignment:</span> All accounts registered through this console are provisioned with the <strong>Digital Marketplace Inspector (DMI)</strong> statutory role, authorized to conduct automated marketplace crawlers and generate legal compliance notices.
            </div>

            <button
              type="submit"
              disabled={submitting}
              className="w-full rounded-sm bg-govt-navy px-4 py-2.5 text-sm font-bold tracking-wide text-white shadow hover:bg-blue-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-govt-navy disabled:opacity-70 transition-colors"
            >
              {submitting ? "Registering Inspector…" : "Provision & Sign In to Portal"}
            </button>

            <div className="text-center pt-2">
              <p className="text-xs text-slate-600">
                Already registered?{" "}
                <Link to="/login" className="font-bold text-govt-navy hover:underline">
                  Sign In with Existing Credentials
                </Link>
              </p>
            </div>
          </form>
        </div>
      </main>

      <GovtFooter />
    </div>
  );
}
