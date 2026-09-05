import axios from 'axios';

// Controller console se alag key. Dono localhost par chalte hain, to ek hi key
// hone par ek mein login karte hi doosre se chupchaap logout ho jaata.
const TOKEN_KEY = 'lmv_ac_token';

const baseURL = import.meta.env.VITE_AC_API_URL || 'http://localhost:4002/api';

export const api = axios.create({ baseURL, timeout: 20_000 });

api.interceptors.request.use((config) => {
  const token = getToken();
  if (token) config.headers.Authorization = `Bearer ${token}`;
  return config;
});

api.interceptors.response.use(
  (res) => res,
  (err) => Promise.reject({
    code: err.response?.data?.error?.code ?? 'NETWORK_ERROR',
    message: err.response?.data?.error?.message
      ?? 'Could not reach the server. Check that senior-inspector-backend is running.',
    details: err.response?.data?.error?.details,
    status: err.response?.status,
  }),
);

export const getToken = () => sessionStorage.getItem(TOKEN_KEY);
export const setToken = (t) => sessionStorage.setItem(TOKEN_KEY, t);
export const clearToken = () => sessionStorage.removeItem(TOKEN_KEY);