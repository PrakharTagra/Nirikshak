// Real client for the local-scraper backend (see /local-scraper/server.js and
// /local-scraper/listing-crawler). Unlike lib/api.js (which still serves
// mock data for auth and scan history), this file makes an actual network
// call and returns a genuine RawListingData object — no mock fallback, so a
// failure here always means "the scraper couldn't be reached or the crawl
// failed," never silently-wrong data.

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || "http://localhost:5000";

/**
 * Crawl a product listing URL via the local-scraper backend.
 * @param {string} url
 * @returns {Promise<object>} RawListingData — see local-scraper/listing-crawler/index.js
 */
export async function crawlListing(url) {
  let response;
  try {
    response = await fetch(`${API_BASE_URL}/api/listing`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ url }),
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

  return body.data;
}

/**
 * Run the Legal Metrology compliance check for a listing via the
 * local-scraper backend (see /local-scraper/routes/compliance.js). The
 * whole raw listing text is sent to an LLM in a single call — no chunking
 * or vector search — and the LLM returns a structured report against the
 * Rule 6 checklist. Pass `text`/`platform` from an already-crawled
 * RawListingData object to skip re-crawling the page.
 *
 * @param {string} url
 * @param {{ text?: string, platform?: string }} [alreadyCrawled]
 * @returns {Promise<object>} { url, platform, crawledAt, compliance }
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
