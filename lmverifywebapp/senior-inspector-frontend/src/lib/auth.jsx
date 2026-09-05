import { createContext, useContext, useEffect, useState, useCallback } from 'react';
import { api, setToken, clearToken, getToken } from './api.js';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [checking, setChecking] = useState(true);

  // Load par stored token ko maana nahi jaata, server se verify hota hai.
  // /auth/me database se padhta hai, to suspension turant lagti hai — token
  // expire hone ka intezaar nahi.
  useEffect(() => {
    if (!getToken()) { setChecking(false); return; }
    api.get('/auth/me')
      .then((res) => setUser(res.data.user))
      .catch(() => { clearToken(); setUser(null); })
      .finally(() => setChecking(false));
  }, []);

  const login = useCallback(async (username, password) => {
    const res = await api.post('/auth/login', { username, password });
    setToken(res.data.token);
    setUser(res.data.user);
    return res.data.user;
  }, []);

  const changePassword = useCallback(async (current_password, new_password) => {
    const res = await api.post('/auth/change-password', { current_password, new_password });
    setToken(res.data.token); // purane token mein abhi bhi mcp: true hai
    setUser(res.data.user);
    return res.data.user;
  }, []);

  const logout = useCallback(() => { clearToken(); setUser(null); }, []);

  return (
    <AuthContext.Provider value={{ user, checking, login, logout, changePassword }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used inside AuthProvider');
  return ctx;
}