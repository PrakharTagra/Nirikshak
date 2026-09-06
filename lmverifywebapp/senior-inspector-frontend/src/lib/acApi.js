import { api } from './api.js';

export const STATUS_LABEL = {
  pending: 'Pending', approved: 'Approved', rejected: 'Rejected',
};

export const CHANNEL_LABEL = { ecommerce: 'E-commerce', field: 'Field' };

/** Only a pending report can be decided, and a decision is final. Mirrors the
 *  rule in senior-inspector-backend/src/routes/decisions.js — the server stays
 *  the authority; this only decides which buttons to show. */
export const DECIDABLE = 'pending';

export const REASON_REQUIRED = ['rejected'];

export const ACTION_LABEL = { approved: 'Approve', rejected: 'Reject' };

/** Still on the officer's desk. Sent as one filter so the two halves of the
 *  console can never disagree about what is open. */
export const AWAITING_STATUSES = 'pending';

export const COMPLIANCE_LABEL = {
  COMPLIANT: 'Compliant',
  NON_COMPLIANT: 'Non-Compliant',
  EXEMPT: 'Exempt',
};

export async function getJurisdictionLmos() {
  const { data } = await api.get('/reports/lmos');
  return data;
}

export async function getQueue({ status = 'all', channel = 'all', search = '', officer_id = 'all' } = {}) {
  const params = {};
  if (status !== 'all') params.status = status;
  if (channel !== 'all') params.channel = channel;
  if (officer_id && officer_id !== 'all') params.officer_id = officer_id;
  if (search.trim()) params.search = search.trim();

  const { data } = await api.get('/reports', { params });
  return data.reports;
}

export async function getReport(id) {
  const { data } = await api.get(`/reports/${id}`);
  return data.report;
}

export async function decide(id, status, reason) {
  const { data } = await api.post(`/reports/${id}/decision`, { status, reason });
  return data.report;
}
