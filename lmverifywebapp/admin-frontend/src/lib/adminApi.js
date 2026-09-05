// Ekmatra file jo jaanti hai data kahan se aa raha hai.
// Ab sab kuch asli admin-backend se aata hai. mockData.js ki zaroorat nahi rahi.

import { api } from './api.js';

export const STATUSES = ['pending', 'approved', 'rejected'];

export const STATUS_LABEL = {
  pending: 'Pending', approved: 'Approved', rejected: 'Rejected',
};

export const CHANNEL_LABEL = { ecommerce: 'E-commerce', field: 'Field' };

export const ROLE_LABEL = {
  CLM: 'Controller of Legal Metrology',
  AC: 'Assistant Controller',
  DMI: 'Digital Marketplace Inspector',
  LMO: 'Legal Metrology Officer (Field)',
};

export async function getJurisdictions() {
  const { data } = await api.get('/jurisdictions');
  return data.jurisdictions;
}

export async function getOfficers() {
  const { data } = await api.get('/accounts');
  return data.officers;
}

export async function getReports(filters = {}) {
  // Sirf woh filters bhejte hain jo set hain, taaki debugging ke waqt network
  // tab mein query string padhne layak rahe.
  const params = {};
  if (filters.status && filters.status !== 'all') params.status = filters.status;
  if (filters.channel && filters.channel !== 'all') params.channel = filters.channel;
  if (filters.officerId && filters.officerId !== 'all') params.officerId = filters.officerId;
  if (filters.search?.trim()) params.search = filters.search.trim();

  const { data } = await api.get('/reports', { params });
  return data.reports;
}


export async function getReport(id) {
  const { data } = await api.get(`/reports/${id}`);
  return data.report;
}

/** Download ko Authorization header chahiye, isliye ye plain link nahi ho
 *  sakta. Blob ke roop mein laao, fir browser ko file ki tarah do. */
export async function downloadRegister() {
  const res = await api.get('/export/reports.xlsx', { responseType: 'blob' });

  const disposition = res.headers['content-disposition'] ?? '';
  const match = disposition.match(/filename="([^"]+)"/);
  const filename = match?.[1] ?? 'lm-verify-register.xlsx';

  const url = URL.createObjectURL(res.data);
  const a = document.createElement('a');
  a.href = url;
  a.download = filename;
  document.body.appendChild(a);
  a.click();
  a.remove();
  URL.revokeObjectURL(url);
}

export async function getDashboard() {
  const { data } = await api.get('/dashboard');
  return data;
}

export async function getAuditLog() {
  const { data } = await api.get('/audit-log');
  return data.entries;
}

/** { officer, temporary_password } deta hai. Password sirf isi response mein
 *  padhne layak roop mein hai — kahin store nahi hota. */
export async function createAccount(payload) {
  const { data } = await api.post('/accounts', payload);
  return data;
}

export async function setAccountStatus(id, status) {
  const { data } = await api.patch(`/accounts/${id}/status`, { status });
  return data.officer;
}

/** Ye bhi { temporary_password } deta hai aur officer ko wapas
 *  forced-password-change state mein daal deta hai. */
export async function resetPassword(id) {
  const { data } = await api.post(`/accounts/${id}/reset-password`);
  return data;
}