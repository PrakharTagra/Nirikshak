import axios from 'axios';

const TOKEN_KEY = 'lmv_admin_token';

// Vite VITE_-prefixed vars padhta hai; vite.config.js mein envDir root par set
// hai, to .env abhi bhi ek hi jagah rahega.
const baseURL = import.meta.env.VITE_ADMIN_API_URL || 'http://localhost:4001/api';

export const api = axios.create({ baseURL, timeout: 20_000 });

api.interceptors.request.use((config) => {
  const token = getToken();
  if (token) config.headers.Authorization = `Bearer ${token}`;
  return config;
});

// Backend hamesha { error: { code, message, details } } se fail hota hai. Yahin
// unwrap kar dete hain taaki kisi component ko axios ke andar na ghusna pade.
api.interceptors.response.use(
  (res) => res,
  (err) => Promise.reject({
    code: err.response?.data?.error?.code ?? 'NETWORK_ERROR',
    message: err.response?.data?.error?.message
      ?? 'Could not reach the server. Check that admin-backend is running.',
    details: err.response?.data?.error?.details,
    status: err.response?.status,
  }),
);

// sessionStorage, localStorage nahi: browser band hone par session khatam — ek
// aise console ke liye yahi sahi default hai jo enforcement accounts issue karta hai.
export const getToken = () => sessionStorage.getItem(TOKEN_KEY);
export const setToken = (t) => sessionStorage.setItem(TOKEN_KEY, t);
export const clearToken = () => sessionStorage.removeItem(TOKEN_KEY);