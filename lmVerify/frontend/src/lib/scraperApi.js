// Client for the local-scraper backend connecting directly to
// ComplianceEngine's post-OCR mapping & rule engine pipeline.

const API_BASE_URL =
  import.meta.env.VITE_API_BASE_URL ||
  (typeof window !== "undefined" && window.location.hostname !== "localhost" && window.location.hostname !== "127.0.0.1"
    ? "https://nirikshakscraper.duckdns.org"
    : "http://localhost:5000");

/**
 * Crawl a product listing URL via the local-scraper backend.
 * Optionally runs compliance mapping & rule engine in the same roundtrip.
 *
 * @param {string} url
 * @param {{ checkCompliance?: boolean }} [options]
 * @returns {Promise<object>} RawListingData or { data, compliance }
 */
export async function crawlListing(url, options = {}) {
  let response;
  try {
    response = await fetch(`${API_BASE_URL}/api/listing`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ url, checkCompliance: !!options.checkCompliance }),
    });
  } catch {
    throw new Error(
      `Couldn't reach the scraper service at ${API_BASE_URL}. Make sure the local-scraper server is running (npm start in /local-scraper).`
    );
  }

  let body;
  try {
    body = await response.json();
  } catch {
    throw new Error("The scraper service returned an unexpected response.");
  }

  if (!response.ok || !body.success) {
    throw new Error(body.detail || body.error || "The scan failed.");
  }

  if (options.checkCompliance && body.compliance) {
    return {
      ...body.data,
      complianceReport: body.compliance,
    };
  }

  return body.data;
}

/**
 * Run the Legal Metrology post-OCR mapping and codified rule engine
 * for a listing via the local-scraper backend.
 *
 * Sends the listing text to Stage 5/6 Groq structured extraction mapping,
 * builds the canonical package record, and evaluates all rules with
 * Stage 6/7 ruleEngine.
 *
 * @param {string} url
 * @param {{ text?: string, platform?: string }} [alreadyCrawled]
 * @returns {Promise<object>} { success, url, platform, crawledAt, declarations, packageRecord, compliance, summary }
 */
export async function checkCompliance(url, alreadyCrawled = {}) {
  let response;
  try {
    response = await fetch(`${API_BASE_URL}/api/compliance`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ url, ...alreadyCrawled }),
    });
  } catch {
    throw new Error(
      `Couldn't reach the scraper service at ${API_BASE_URL}. Make sure the local-scraper server is running (npm start in /local-scraper).`
    );
  }

  let body;
  try {
    body = await response.json();
  } catch {
    throw new Error("The compliance service returned an unexpected response.");
  }

  if (!response.ok || !body.success) {
    throw new Error(body.detail || body.error || "The compliance check failed.");
  }

  return body;
}
