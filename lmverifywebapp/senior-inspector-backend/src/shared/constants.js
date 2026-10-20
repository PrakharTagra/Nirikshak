// Statutory nomenclature. Rename mat karna — ye strings database, API contract
// aur UI teenon mein hain, aur har service mein match karne chahiye.

export const ROLES = Object.freeze({
  CLM: 'CLM', // Controller of Legal Metrology  (rank 1, web)
  AC: 'AC',   // Assistant Controller           (rank 2, web)
  DMI: 'DMI', // Digital Marketplace Inspector  (rank 3, separate system)
  LMO: 'LMO', // Legal Metrology Officer, Field (rank 3, android)
});

export const ROLE_RANK = Object.freeze({ CLM: 1, AC: 2, DMI: 3, LMO: 3 });

export const REPORTS_TO = Object.freeze({
  AC: ROLES.CLM, DMI: ROLES.AC, LMO: ROLES.AC, CLM: null,
});

export const ACCOUNT_STATUS = Object.freeze({
  ACTIVE: 'active', SUSPENDED: 'suspended', DISABLED: 'disabled',
});

export const REPORT_STATUS = Object.freeze({
  PENDING: 'pending', APPROVED: 'approved', REJECTED: 'rejected',
});

// Only a refusal has to be explained. An approval needs no defence.
export const STATUSES_REQUIRING_REASON = Object.freeze(['rejected']);

export const CHANNEL = Object.freeze({ ECOMMERCE: 'ecommerce', FIELD: 'field' });
