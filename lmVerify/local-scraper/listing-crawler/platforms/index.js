/**
 * Platform registry for the product listing crawler.
 *
 * This module only detects which e-commerce platform a URL belongs to today.
 * In later phases, each platform can get its own extraction rules (selectors,
 * JSON-LD quirks, image handling, etc.) by adding an entry here and a
 * corresponding file in this folder (e.g. amazon.js, flipkart.js) that
 * exports platform-specific overrides. The core crawler stays generic and
 * just asks this registry "which platform is this?" and, later, "does this
 * platform have custom extraction logic?".
 */

const PLATFORM_MATCHERS = [
  { id: "amazon", pattern: /(^|\.)amazon\.[a-z.]+$/i },
  { id: "flipkart", pattern: /(^|\.)flipkart\.com$/i },
  { id: "ebay", pattern: /(^|\.)ebay\.[a-z.]+$/i },
  { id: "etsy", pattern: /(^|\.)etsy\.com$/i },
  { id: "walmart", pattern: /(^|\.)walmart\.com$/i },
  { id: "myntra", pattern: /(^|\.)myntra\.com$/i },
  { id: "ajio", pattern: /(^|\.)ajio\.com$/i },
  { id: "shopify", pattern: /\.myshopify\.com$/i }, // generic Shopify storefronts
];

/**
 * Detect the e-commerce platform from a URL's hostname.
 * Falls back to "generic" when no known platform matches, so the crawler
 * can still process unknown/independent storefronts using generic rules.
 */
export function detectPlatform(url) {
  try {
    const hostname = new URL(url).hostname;
    const match = PLATFORM_MATCHERS.find((m) => m.pattern.test(hostname));
    return match ? match.id : "generic";
  } catch {
    return "generic";
  }
}

/**
 * Placeholder for future per-platform extraction config lookup.
 * Later phases will return things like custom image selectors or
 * JSON-LD parsing hints keyed by platform id. Returning an empty object
 * for every platform today keeps the core crawler platform-agnostic.
 */
export function getPlatformConfig(_platformId) {
  return {};
}
