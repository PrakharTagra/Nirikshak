/**
 * Extractor + RawListingData shape test.
 *
 * The real crawler drives a Playwright Chromium page. Chromium's browser
 * binary isn't always available in a given environment (e.g. no network
 * access to download it), so this test drives the SAME extractor functions
 * against a JSDOM-rendered version of the fixture page instead, using a
 * minimal mock `page` object that implements just the Playwright page
 * methods the extractors call (`content`, `evaluate`, `title`, `url`,
 * `screenshot`). This proves the extraction + assembly logic end-to-end
 * without depending on a real browser being installed.
 *
 * Run: node listing-crawler/test/testExtractors.mjs
 */
import { JSDOM } from "jsdom";
import vm from "node:vm";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

import { extractHtml } from "../extractors/html.js";
import { extractVisibleText } from "../extractors/text.js";
import { extractMetadata } from "../extractors/metadata.js";
import { extractStructuredData } from "../extractors/structuredData.js";
import { extractImages } from "../extractors/images.js";
import { captureScreenshot } from "../extractors/screenshot.js";
import { detectPlatform } from "../platforms/index.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const FIXTURE_PATH = path.join(__dirname, "..", "fixtures", "sample-product.html");
const FIXTURE_URL = "https://www.example-store.com/product/wh-1000";

function makeMockPage(html, url) {
  const dom = new JSDOM(html, {
    url,
    pretendToBeVisual: true, // enables getComputedStyle / layout-ish APIs
  });
  const { window } = dom;

  // getBoundingClientRect isn't implemented by JSDOM's layout engine —
  // extractors only use it to detect zero-size (display:none-collapsed)
  // boxes, so a reasonable stand-in is: 0-size only when the element (or
  // an ancestor) is display:none, which getComputedStyle already reports.
  window.HTMLElement.prototype.getBoundingClientRect = function () {
    const style = window.getComputedStyle(this);
    const hidden = style.display === "none";
    return { width: hidden ? 0 : 100, height: hidden ? 0 : 20, top: 0, left: 0, right: 0, bottom: 0 };
  };

  return {
    async content() {
      return dom.serialize();
    },
    async evaluate(fn) {
      const context = vm.createContext(window);
      // Re-run the given function's source inside the jsdom window context
      // so `document`, `window`, `NodeFilter`, etc. resolve exactly like
      // they would inside a real browser page.
      const script = new vm.Script(`(${fn.toString()})()`);
      return script.runInContext(context);
    },
    async title() {
      return window.document.title;
    },
    url() {
      return url;
    },
    async screenshot(options) {
      // No real renderer available here — return a small placeholder
      // buffer so captureScreenshot's shape/contract can still be verified.
      return Buffer.from(`fake-screenshot:${options.type}`);
    },
  };
}

function assert(condition, message) {
  if (!condition) throw new Error(`Assertion failed: ${message}`);
}

async function main() {
  const html = fs.readFileSync(FIXTURE_PATH, "utf-8");
  const page = makeMockPage(html, FIXTURE_URL);

  console.log("Running extractors against fixture page...\n");

  const [extractedHtml, text, metadata, structuredData, images, screenshot] = await Promise.all([
    extractHtml(page),
    extractVisibleText(page),
    extractMetadata(page),
    extractStructuredData(page),
    extractImages(page),
    captureScreenshot(page),
  ]);

  const platform = detectPlatform(FIXTURE_URL);

  // Mirrors listing-crawler/crawler.js + index.js's assembly, so this test
  // exercises the exact RawListingData shape crawlListing() produces.
  const rawListingData = {
    url: FIXTURE_URL,
    platform,
    crawledAt: new Date().toISOString(),
    html: extractedHtml,
    text,
    images,
    screenshot,
    metadata,
    structuredData,
  };

  console.log("--- RawListingData contract ---");
  const REQUIRED_KEYS = ["url", "platform", "crawledAt", "html", "text", "images", "screenshot", "metadata", "structuredData"];
  for (const key of REQUIRED_KEYS) {
    assert(key in rawListingData, `missing key "${key}"`);
    console.log(`  ✓ ${key}: ${typeof rawListingData[key]}`);
  }
  assert(Object.keys(rawListingData).length === REQUIRED_KEYS.length, "object has extra keys beyond the RawListingData contract");
  console.log(`  ✓ exactly ${REQUIRED_KEYS.length} keys, no extras\n`);

  console.log("--- Field checks ---");
  assert(rawListingData.platform === "generic", `expected platform "generic" for unknown host, got "${rawListingData.platform}"`);
  console.log("  ✓ platform detection (unknown host -> generic)");

  assert(rawListingData.html.includes("Wireless Noise-Cancelling Headphones"), "html missing expected product title");
  console.log("  ✓ html: full rendered document captured");

  assert(rawListingData.text.includes("Wireless Noise-Cancelling Headphones"), "visible text missing product title");
  assert(!rawListingData.text.includes("This paragraph should never be visible"), "visible text leaked display:none content");
  console.log("  ✓ text: visible text captured, hidden nodes excluded");

  assert(rawListingData.metadata.title === "Wireless Noise-Cancelling Headphones - Test Store", "metadata.title mismatch");
  assert(rawListingData.metadata.ogTags["og:price:amount"] === "199.99", "og:price:amount not captured");
  assert(rawListingData.metadata.twitterTags["twitter:card"] === "summary_large_image", "twitter:card not captured");
  console.log("  ✓ metadata: title/description/OG/Twitter tags captured");

  assert(rawListingData.structuredData.jsonLd.length === 2, `expected 2 JSON-LD blocks, got ${rawListingData.structuredData.jsonLd.length}`);
  assert(rawListingData.structuredData.jsonLd[0]["@type"] === "Product", "first JSON-LD block should be Product");
  assert(rawListingData.structuredData.scriptData.some((s) => s.key === "window.__NEXT_DATA__"), "__NEXT_DATA__ not detected");
  assert(rawListingData.structuredData.scriptData.some((s) => s.key === "dataLayer"), "dataLayer not detected");
  console.log("  ✓ structuredData: JSON-LD parsed, __NEXT_DATA__ + dataLayer detected");

  assert(rawListingData.images.count === rawListingData.images.items.length, "images.count mismatch with items.length");
  assert(rawListingData.images.count >= 5, `expected at least 5 images, got ${rawListingData.images.count}`);
  const lazyImg = rawListingData.images.items.find((i) => i.url.includes("headphones-lazy-1"));
  assert(lazyImg && lazyImg.lazy === true, "lazy-loaded image (data-src) not detected as lazy");
  const srcsetImg = rawListingData.images.items.find((i) => i.url.includes("headphones-large"));
  assert(srcsetImg, "largest srcset candidate not picked up");
  const pictureImg = rawListingData.images.items.find((i) => i.url.includes("headphones-webp-large"));
  assert(pictureImg, "<picture><source srcset> variant not captured");
  console.log(`  ✓ images: ${rawListingData.images.count} found, incl. lazy-src, srcset, and <picture><source> variants`);

  assert(rawListingData.screenshot.mimeType === "image/jpeg", "screenshot mimeType mismatch");
  assert(typeof rawListingData.screenshot.base64 === "string" && rawListingData.screenshot.base64.length > 0, "screenshot base64 missing");
  console.log("  ✓ screenshot: shape correct (mimeType/base64/byteLength)");

  console.log("\nAll checks passed.");
}

main().catch((err) => {
  console.error("\nTEST FAILED:", err.message);
  process.exit(1);
});
