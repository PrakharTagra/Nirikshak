import { loadProductPage } from "./crawler.js";

/**
 * RawListingData — the crawler's complete, final output contract.
 * {
 *   url,            // final URL of the product page (post-redirects)
 *   platform,       // detected e-commerce platform (amazon, flipkart, generic, ...)
 *   crawledAt,      // ISO timestamp of when the crawl completed
 *   html,           // fully rendered page HTML
 *   text,           // concatenated visible page text
 *   images,         // { count, items[] } — incl. lazy-loaded + srcset variants
 *   screenshot,     // { mimeType, base64, byteLength } full-page capture
 *   metadata,       // title/description/canonical/OG/Twitter tags/etc.
 *   structuredData, // { jsonLd[], jsonLdErrors[], scriptData[] }
 * }
 *
 * This is deliberately a flat, JSON-serializable object with exactly these
 * nine keys — no transport- or debug-only fields — so it can cross an HTTP
 * boundary, get persisted, or get handed to a compliance-checking phase
 * later without callers needing to know how it was produced.
 */

const RAW_LISTING_DATA_KEYS = [
  "url",
  "platform",
  "crawledAt",
  "html",
  "text",
  "images",
  "screenshot",
  "metadata",
  "structuredData",
];

/**
 * Crawl a single product listing URL and return a RawListingData object.
 * @param {string} url
 * @returns {Promise<object>} RawListingData
 */
export async function crawlListing(url) {
  if (!url || typeof url !== "string") {
    throw new Error("crawlListing: a product URL string is required");
  }

  try {
    // eslint-disable-next-line no-new
    new URL(url);
  } catch {
    throw new Error(`crawlListing: "${url}" is not a valid URL`);
  }

  const pageResult = await loadProductPage(url);

  // Diagnostics only (requested vs. final URL, HTTP status, <title>) — log
  // them for local debugging rather than attaching them to the returned
  // object, so RawListingData always matches its contract exactly.
  console.log(
    `[listing-crawler] done: requested=${pageResult.requestedUrl} final=${pageResult.finalUrl} ` +
      `status=${pageResult.statusCode} title="${pageResult.title}"`
  );

  const rawListingData = {
    url: pageResult.finalUrl || url,
    platform: pageResult.platform,
    crawledAt: pageResult.crawledAt,
    html: pageResult.html,
    text: pageResult.text,
    images: pageResult.images,
    screenshot: pageResult.screenshot,
    metadata: pageResult.metadata,
    structuredData: pageResult.structuredData,
  };

  const extraKeys = Object.keys(rawListingData).filter((k) => !RAW_LISTING_DATA_KEYS.includes(k));
  if (extraKeys.length > 0) {
    throw new Error(`crawlListing: internal error — unexpected keys on RawListingData: ${extraKeys.join(", ")}`);
  }

  return rawListingData;
}
