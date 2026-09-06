import React, { createContext, useContext, useEffect, useState } from "react";

const AuthContext = createContext(null);
const SESSION_KEY = "lm_verify_dmi_session";
const OFFICERS_KEY = "lm_verify_dmi_officers";

// Default pre-seeded Digital Marketplace Inspector
const DEFAULT_OFFICERS = [
  {
    id: "dmi-officer-01",
    username: "dmi.officer",
    email: "officer.dmi@gov.in",
    full_name: "Rajesh Sharma",
    role: "DMI",
    designation: "Digital Marketplace Inspector",
    jurisdiction: "Central E-Commerce Cell (HQ Delhi)",
    phone: "+91 98765 43210",
    badge_no: "DMI-DEL-2024-089",
    password: "password123",
  },
  {
    id: "dmi-officer-02",
    username: "prakhar.dmi",
    email: "prakhar.tagra@gov.in",
    full_name: "Prakhar Tagra",
    role: "DMI",
    designation: "Digital Marketplace Inspector",
    jurisdiction: "Northern Digital Surveillance Zone",
    phone: "+91 98123 45678",
    badge_no: "DMI-NZ-2024-001",
    password: "password123",
  },
];

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [initializing, setInitializing] = useState(true);

  // Initialize officers and restore active session
  useEffect(() => {
    try {
      const storedOfficers = localStorage.getItem(OFFICERS_KEY);
      if (!storedOfficers) {
        localStorage.setItem(OFFICERS_KEY, JSON.stringify(DEFAULT_OFFICERS));
      }

      const savedSession = localStorage.getItem(SESSION_KEY);
      if (savedSession) {
        setUser(JSON.parse(savedSession));
      }
    } catch (e) {
      console.warn("Auth initialization error:", e);
      localStorage.removeItem(SESSION_KEY);
    } finally {
      setInitializing(false);
    }
  }, []);

  const getOfficers = () => {
    try {
      const data = localStorage.getItem(OFFICERS_KEY);
      return data ? JSON.parse(data) : DEFAULT_OFFICERS;
    } catch {
      return DEFAULT_OFFICERS;
    }
  };

  /**
   * Log in as a Digital Marketplace Inspector
   */
  const login = async (usernameOrEmail, password) => {
    // Artificial slight delay for realistic UX
    await new Promise((r) => setTimeout(r, 400));

    const query = usernameOrEmail.trim().toLowerCase();
    const pass = password.trim();

    if (!query || !pass) {
      throw new Error("Enter both official username/email and password.");
    }

    const officers = getOfficers();
    const found = officers.find(
      (o) =>
        (o.username.toLowerCase() === query || (o.email && o.email.toLowerCase() === query)) &&
        o.password === pass
    );

    if (!found) {
      // If prototype quick test: let any email with 4+ char password in as a fallback DMI
      if (query.includes("@") && pass.length >= 4) {
        const adhoc = {
          id: `dmi-${Date.now()}`,
          username: query.split("@")[0].replace(/[^a-z0-9.]/gi, "."),
          email: query,
          full_name: query.split("@")[0].replace(/[._]/g, " ").replace(/\b\w/g, (c) => c.toUpperCase()) || "Marketplace Inspector",
          role: "DMI",
          designation: "Digital Marketplace Inspector",
          jurisdiction: "Central E-Commerce Surveillance",
          phone: "+91 99999 00000",
          badge_no: `DMI-TEMP-${Math.floor(1000 + Math.random() * 9000)}`,
        };
        setUser(adhoc);
        localStorage.setItem(SESSION_KEY, JSON.stringify(adhoc));
        return adhoc;
      }
      throw new Error("Invalid officer credentials. Please check your username and password.");
    }

    const sessionUser = {
      id: found.id,
      username: found.username,
      email: found.email,
      full_name: found.full_name,
      name: found.full_name,
      role: "DMI",
      designation: "Digital Marketplace Inspector",
      jurisdiction: found.jurisdiction || "Central E-Commerce Cell",
      phone: found.phone || "",
      badge_no: found.badge_no || "",
    };

    setUser(sessionUser);
    localStorage.setItem(SESSION_KEY, JSON.stringify(sessionUser));
    return sessionUser;
  };

  /**
   * Register / Sign up a new Digital Marketplace Inspector
   */
  const signup = async (officerData) => {
    await new Promise((r) => setTimeout(r, 500));

    const { full_name, username, email, phone, jurisdiction, badge_no, password } = officerData;

    if (!full_name?.trim()) throw new Error("Full official legal name is required.");
    if (!username?.trim() || username.trim().length < 3) {
      throw new Error("Username must contain at least 3 characters (lowercase letters, numbers, dots).");
    }
    if (!password || password.length < 6) {
      throw new Error("Password must be at least 6 characters long.");
    }

    const cleanUsername = username.trim().toLowerCase();
    const officers = getOfficers();

    if (officers.some((o) => o.username.toLowerCase() === cleanUsername)) {
      throw new Error("An inspector account with that username already exists.");
    }
    if (email && officers.some((o) => o.email?.toLowerCase() === email.trim().toLowerCase())) {
      throw new Error("An inspector account with that email already exists.");
    }

    const newOfficer = {
      id: `dmi-${Date.now()}`,
      username: cleanUsername,
      email: email?.trim() || `${cleanUsername}@dmi.gov.in`,
      full_name: full_name.trim(),
      role: "DMI",
      designation: "Digital Marketplace Inspector",
      jurisdiction: jurisdiction?.trim() || "Central E-Commerce Cell",
      phone: phone?.trim() || "",
      badge_no: badge_no?.trim() || `DMI-${Math.floor(1000 + Math.random() * 9000)}`,
      password: password.trim(),
      created_at: new Date().toISOString(),
    };

    const updated = [newOfficer, ...officers];
    localStorage.setItem(OFFICERS_KEY, JSON.stringify(updated));

    const sessionUser = {
      id: newOfficer.id,
      username: newOfficer.username,
      email: newOfficer.email,
      full_name: newOfficer.full_name,
      name: newOfficer.full_name,
      role: "DMI",
      designation: "Digital Marketplace Inspector",
      jurisdiction: newOfficer.jurisdiction,
      phone: newOfficer.phone,
      badge_no: newOfficer.badge_no,
    };

    setUser(sessionUser);
    localStorage.setItem(SESSION_KEY, JSON.stringify(sessionUser));
    return sessionUser;
  };

  const logout = () => {
    setUser(null);
    localStorage.removeItem(SESSION_KEY);
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        isAuthenticated: !!user,
        initializing,
        login,
        signup,
        logout,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error("useAuth must be used within an AuthProvider");
  return ctx;
}
