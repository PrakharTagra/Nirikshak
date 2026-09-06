// Real API client connecting the DMI frontend to the Legal Metrology
// backend ecosystem (MongoDB Atlas via nirikshakwebapi.duckdns.org).

import { AUTH_API_BASE } from "../context/AuthContext.jsx";

function getAuthHeaders() {
  const token = localStorage.getItem("lm_verify_dmi_token");
  return {
    "Content-Type": "application/json",
    ...(token ? { Authorization: `Bearer ${token}` } : {}),
  };
}

export function detectPlatform(url) {
  if (!url) return "E-Commerce Marketplace";
  const host = (() => {
    try {
      return new URL(url).hostname.toLowerCase();
    } catch {
      return "";
    }
  })();
  if (host.includes("amazon")) return "Amazon.in";
  if (host.includes("flipkart")) return "Flipkart";
  if (host.includes("meesho")) return "Meesho";
  if (host.includes("bigbasket")) return "BigBasket";
  if (host.includes("jiomart")) return "JioMart";
  if (host.includes("blinkit")) return "Blinkit";
  if (host.includes("zepto")) return "Zepto";
  return host || "E-Commerce Marketplace";
}

/**
 * Normalizes a raw backend report into the format expected by DMI frontend components
 */
function normalizeReport(r) {
  const comp = r.compliance_result || r.complianceResult;
  const status =
    comp === "compliant"
      ? "compliant"
      : comp === "non_compliant"
      ? "non_compliant"
      : comp === "exempt"
      ? "exempt"
      : "pending";

  const declaredValues = r.declared_values || r.declarations || {};
  const violations = r.summary?.violations || r.violations || [];
  const packageRecord = r.package_record || r.packageRecord || {
    commodity: {
      productName: r.product_name || r.productName,
      brandName: r.brand,
      category: r.category,
      isDigitalMarketplace: true,
      isEcommerce: true,
    },
  };

  const evidenceImages =
    r.evidenceImages ||
    r.evidence_images ||
    r.images ||
    (r.listing?.images?.items
      ? r.listing.images.items.map((i) => (typeof i === "string" ? i : i.url))
      : []) ||
    [];

  return {
    id: r.id || r._id,
    reference_no: r.reference_no,
    title: r.product_name || r.productName || r.brand || "Statutory Marketplace Inspection",
    product_name: r.product_name || r.productName,
    brand: r.brand,
    category: r.category,
    platform: detectPlatform(r.listing_url),
    url: r.listing_url || "",
    scannedAt: r.inspected_at || r.submitted_at || new Date().toISOString(),
    inspected_at: r.inspected_at,
    submitted_at: r.submitted_at,
    status,
    compliance_result: r.compliance_result,
    controller_status: r.status, // pending | approved | rejected
    decided_by: r.decided_by_name || r.decided_by,
    decided_at: r.decided_at,
    decision_reason: r.decision_reason,
    pdf_url: r.pdf_url || r.report_pdf_link,
    declarations: declaredValues,
    summary: {
      totalViolations: violations.length,
      violations,
      ...(r.summary || {}),
    },
    packageRecord,
    compliance: {
      compliance: {
        compliant: status === "compliant",
        applicable: status !== "exempt",
        violations,
      },
      declarations: declaredValues,
      packageRecord,
      summary: r.summary || {},
    },
    evidenceImages,
    images: evidenceImages,
  };
}

/**
 * Fetch historical DMI reports filed by the signed-in inspector
 */
export async function getScans() {
  const headers = getAuthHeaders();
  if (!headers.Authorization) {
    return [];
  }

  try {
    const res = await fetch(`${AUTH_API_BASE}/inspector/reports`, { headers });
    if (!res.ok) {
      if (res.status === 401 || res.status === 403) return [];
      throw new Error(`Failed to load reports: ${res.statusText}`);
    }
    const data = await res.json();
    const reports = data.reports || [];
    return reports.map(normalizeReport);
  } catch (err) {
    console.warn("Could not fetch reports from backend:", err.message);
    return [];
  }
}

/**
 * Fetch a single inspection report by ID
 */
export async function getScanById(id) {
  const headers = getAuthHeaders();
  const res = await fetch(`${AUTH_API_BASE}/inspector/reports/${id}`, { headers });
  if (!res.ok) {
    throw new Error("Statutory inspection record not found.");
  }
  const data = await res.json();
  return normalizeReport(data.report || data);
}

/**
 * File an official statutory report in MongoDB Atlas via the backend
 */
export async function fileStatutoryReport(scanResult) {
  const headers = getAuthHeaders();
  if (!headers.Authorization) {
    throw new Error("Officer session expired. Please sign in again.");
  }

  const compliance = scanResult?.compliance?.compliance || scanResult?.compliance || {};
  const declarations = scanResult?.declarations || scanResult?.compliance?.declarations || {};
  const packageRecord = scanResult?.packageRecord || {};
  const summary = scanResult?.summary || {};

  const isCompliant = compliance.compliant === true;
  const isApplicable = compliance.applicable !== false;
  const complianceResult = !isApplicable ? "exempt" : isCompliant ? "compliant" : "non_compliant";

  const rawImages =
    scanResult.evidenceImages ||
    scanResult.images ||
    (scanResult.listing?.images?.items
      ? scanResult.listing.images.items.map((i) => (typeof i === "string" ? i : i.url))
      : []) ||
    [];

  const payload = {
    channel: "ecommerce",
    product_name:
      scanResult.listing?.title ||
      scanResult.listing?.metadata?.title ||
      packageRecord.commodity?.productName ||
      declarations.commodityName?.value ||
      "Marketplace Listing Inspection",
    brand: declarations.commodityClassification?.brandName || packageRecord.commodity?.brandName || null,
    category: declarations.commodityClassification?.category || packageRecord.commodity?.category || null,
    listing_url: scanResult.url,
    is_edible: declarations.commodityClassification?.isFood === true,
    is_imported: declarations.countryOfOrigin?.isImported === true,
    declared_values: declarations,
    compliance_result: complianceResult,
    summary: {
      totalViolations: compliance.violations?.length || 0,
      violations: compliance.violations || [],
      ...summary,
    },
    evidenceImages: rawImages.slice(0, 10),
    package_record: packageRecord,
    inspected_at: scanResult.crawledAt || new Date().toISOString(),
    pdf_url: `https://nirikshakscraper.duckdns.org/reports/dmi-${Date.now()}`,
  };

  const res = await fetch(`${AUTH_API_BASE}/inspector/reports`, {
    method: "POST",
    headers,
    body: JSON.stringify(payload),
  });

  const data = await res.json();
  if (!res.ok) {
    const msg = data.error?.message || data.message || "Failed to file statutory report.";
    throw new Error(msg);
  }

  return normalizeReport(data.report || data);
}
