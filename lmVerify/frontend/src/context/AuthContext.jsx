import React, { createContext, useContext, useEffect, useState } from "react";

const AuthContext = createContext(null);
const SESSION_KEY = "lm_verify_dmi_session";
const TOKEN_KEY = "lm_verify_dmi_token";

// Backend API URL for AC / Inspector Auth & Statutory Reports
export const AUTH_API_BASE =
  import.meta.env.VITE_AC_API_BASE_URL || "https://nirikshakwebapi.duckdns.org/ac-api";

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [token, setToken] = useState(null);
  const [initializing, setInitializing] = useState(true);

  // Restore session and verify JWT token validity against backend on startup
  useEffect(() => {
    async function restoreSession() {
      try {
        const savedToken = localStorage.getItem(TOKEN_KEY);
        const savedSession = localStorage.getItem(SESSION_KEY);

        if (savedToken && savedSession) {
          const parsed = JSON.parse(savedSession);
          setUser(parsed);
          setToken(savedToken);

          // Verify token is active with /inspector/auth/me
          try {
            const res = await fetch(`${AUTH_API_BASE}/inspector/auth/me`, {
              headers: { Authorization: `Bearer ${savedToken}` },
            });
            if (res.ok) {
              const data = await res.json();
              if (data.user) {
                const freshUser = {
                  ...data.user,
                  token: savedToken,
                  name: data.user.full_name || data.user.username,
                };
                setUser(freshUser);
                localStorage.setItem(SESSION_KEY, JSON.stringify(freshUser));
              }
            } else if (res.status === 401 || res.status === 403) {
              logout();
            }
          } catch (netErr) {
            console.warn("Could not verify token with backend, using offline cache:", netErr);
          }
        }
      } catch (e) {
        console.warn("Auth restoration error:", e);
        logout();
      } finally {
        setInitializing(false);
      }
    }

    restoreSession();
  }, []);

  /**
   * Log in using real credentials created by the Controller of Legal Metrology (CLM)
   */
  const login = async (username, password) => {
    const u = username.trim().toLowerCase();
    const p = password.trim();

    if (!u || !p) {
      throw new Error("Enter both official username and password.");
    }

    let res;
    try {
      res = await fetch(`${AUTH_API_BASE}/inspector/auth/login`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username: u, password: p }),
      });
    } catch {
      throw new Error(
        `Unable to reach authentication server at ${AUTH_API_BASE}. Please verify internet connectivity.`
      );
    }

    let data;
    try {
      data = await res.json();
    } catch {
      throw new Error("Unexpected response from authentication service.");
    }

    if (!res.ok) {
      const msg =
        data.error?.message ||
        data.message ||
        (data.error?.details && Object.values(data.error.details).join(" ")) ||
        "Invalid officer credentials.";
      throw new Error(msg);
    }

    const { token: jwtToken, user: officerUser } = data;
    const sessionUser = {
      ...officerUser,
      token: jwtToken,
      name: officerUser.full_name || officerUser.username,
    };

    setToken(jwtToken);
    setUser(sessionUser);
    localStorage.setItem(TOKEN_KEY, jwtToken);
    localStorage.setItem(SESSION_KEY, JSON.stringify(sessionUser));
    return sessionUser;
  };

  /**
   * Update officer password (required upon initial temporary password login)
   */
  const changePassword = async (currentPassword, newPassword) => {
    const activeToken = token || localStorage.getItem(TOKEN_KEY);
    if (!activeToken) throw new Error("No active session found. Please sign in again.");

    let res;
    try {
      res = await fetch(`${AUTH_API_BASE}/inspector/auth/change-password`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${activeToken}`,
        },
        body: JSON.stringify({
          current_password: currentPassword.trim(),
          new_password: newPassword.trim(),
        }),
      });
    } catch {
      throw new Error("Network error contacting authentication server.");
    }

    const data = await res.json();
    if (!res.ok) {
      const msg =
        data.error?.message ||
        data.message ||
        (data.error?.details && Object.values(data.error.details).join(" ")) ||
        "Failed to update password.";
      throw new Error(msg);
    }

    const { token: updatedToken, user: updatedUser } = data;
    const sessionUser = {
      ...updatedUser,
      token: updatedToken || activeToken,
      name: updatedUser.full_name || updatedUser.username,
      must_change_password: false,
    };

    setToken(updatedToken || activeToken);
    setUser(sessionUser);
    localStorage.setItem(TOKEN_KEY, updatedToken || activeToken);
    localStorage.setItem(SESSION_KEY, JSON.stringify(sessionUser));
    return sessionUser;
  };

  const logout = () => {
    setUser(null);
    setToken(null);
    localStorage.removeItem(TOKEN_KEY);
    localStorage.removeItem(SESSION_KEY);
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        token: token || localStorage.getItem(TOKEN_KEY),
        isAuthenticated: !!user,
        initializing,
        login,
        changePassword,
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
