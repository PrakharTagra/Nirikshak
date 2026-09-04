import crypto from "crypto";
import { PlaywrightCrawler, RequestQueue } from "crawlee";
import { detectPlatform } from "./platforms/index.js";
import { extractHtml } from "./extractors/html.js";
import { extractVisibleText } from "./extractors/text.js";
import { extractMetadata } from "./extractors/metadata.js";
import { extractStructuredData } from "./extractors/structuredData.js";
import { extractImages } from "./extractors/images.js";
import { captureScreenshot } from "./extractors/screenshot.js";

const REQUEST_HANDLER_TIMEOUT_SECS = 60;
const NETWORK_IDLE_TIMEOUT_MS = 15000;
const USER_AGENT =
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36";

/**
 * Scrolls the page to the bottom in small steps so that lazy-loaded content
 * (images, infinite-scroll blocks, etc.) has a chance to mount before we
 * consider the page "fully rendered". This is intentionally generic —
 * platform-specific scroll/interaction quirks can be layered in later via
 * the platform registry without changing this core loader.
 */
async function autoScroll(page) {
  await page.evaluate(async () => {
    await new Promise((resolve) => {
      let totalHeight = 0;
      const step = 400;
      const timer = setInterval(() => {
        const scrollHeight = document.body.scrollHeight;
        window.scrollBy(0, step);
        totalHeight += step;
        if (totalHeight >= scrollHeight - window.innerHeight) {
          clearInterval(timer);
          resolve();
        }
      }, 150);
    });
  });
  // Scroll back to top so screenshots/extractions in later phases start
  // from a consistent, predictable viewport position.
  await page.evaluate(() => window.scrollTo(0, 0));
}

/**
 * Loads a single product URL with PlaywrightCrawler, waits until the page
 * is "fully rendered" (DOM ready, network mostly idle, lazy content
 * triggered via a full-page scroll pass), then extracts the raw data
 * needed to build a RawListingData object: HTML, visible text, metadata,
 * structured data (JSON-LD + relevant script data), image URLs (including
 * lazy-loaded and srcset variants), and a full-page screenshot.
 *
 * @param {string} url - the product page URL to load
 * @returns {Promise<object>} raw page data captured during the crawl
 */
export async function loadProductPage(url) {
  let captured = null;
  let crawlError = null;

  const launchOptions = {
    headless: true,
    args: [
      "--no-sandbox",
      "--disable-setuid-sandbox",
      "--disable-blink-features=AutomationControlled",
      "--disable-infobars",
    ],
  };

  if (process.env.PLAYWRIGHT_CHROMIUM_PATH) {
    launchOptions.executablePath = process.env.PLAYWRIGHT_CHROMIUM_PATH;
  }

  // Open an ephemeral queue so scans never hit cached/stale request states on disk
  const queueName = `crawl-${crypto.randomUUID()}`;
  const requestQueue = await RequestQueue.open(queueName);
  await requestQueue.addRequest({
    url,
    uniqueKey: `${url}-${Date.now()}-${Math.random()}`,
  });

  const crawler = new PlaywrightCrawler({
    requestQueue,
    maxRequestsPerCrawl: 1,
    maxConcurrency: 1,
    requestHandlerTimeoutSecs: REQUEST_HANDLER_TIMEOUT_SECS,
    launchContext: {
      launchOptions,
      userAgent: USER_AGENT,
    },
    preNavigationHooks: [
      async ({ page }) => {
        // Strip automation indicators
        await page.addInitScript(() => {
          Object.defineProperty(navigator, "webdriver", {
            get: () => undefined,
          });
        });
        await page.setViewportSize({ width: 1366, height: 900 });
        await page.setExtraHTTPHeaders({
          "Accept-Language": "en-IN,en-GB;q=0.9,en-US;q=0.8,en;q=0.7",
          "Upgrade-Insecure-Requests": "1",
        });
      },
    ],

    async requestHandler({ request, page, response, log }) {
      log.info(`[listing-crawler] Loading product page: ${request.url}`);

      await page.waitForLoadState("domcontentloaded");

      // If intercepted by anti-bot challenge or redirected to root homepage, reload once
      let title = await page.title();
      if (title === "Robot Check" || title === "Amazon.in") {
        log.warning(`[listing-crawler] Anti-bot or homepage redirect detected ("${title}"), re-attempting navigation...`);
        await page.waitForTimeout(1500);
        await page.goto(request.url, { waitUntil: "domcontentloaded", timeout: 30000 }).catch(() => {});
        title = await page.title();
      }

      try {
        await page.waitForLoadState("networkidle", { timeout: NETWORK_IDLE_TIMEOUT_MS });
      } catch {
        log.warning(
          `[listing-crawler] networkidle wait timed out after ${NETWORK_IDLE_TIMEOUT_MS}ms — continuing with current render state`
        );
      }

      await autoScroll(page).catch((err) => {
        log.warning(`[listing-crawler] autoScroll failed: ${err.message}`);
      });

      // Small settle delay after scrolling for any lazy-triggered fetches/animations.
      await page.waitForTimeout(500);

      const finalUrl = page.url();

      log.info("[listing-crawler] Extracting raw data from rendered page");
      const [html, text, metadata, structuredData, images, screenshot] = await Promise.all([
        extractHtml(page),
        extractVisibleText(page),
        extractMetadata(page),
        extractStructuredData(page),
        extractImages(page),
        captureScreenshot(page),
      ]);

      captured = {
        requestedUrl: url,
        finalUrl,
        statusCode: response ? response.status() : null,
        title: await page.title(),
        platform: detectPlatform(finalUrl),
        crawledAt: new Date().toISOString(),
        html,
        text,
        metadata,
        structuredData,
        images,
        screenshot,
      };
    },

    failedRequestHandler({ request, log }, error) {
      crawlError = error;
      log.error(`[listing-crawler] Failed to load ${request.url}: ${error.message}`);
    },
  });

  try {
    await crawler.run();
    await crawler.teardown();
  } finally {
    await requestQueue.drop().catch(() => {});
  }

  if (!captured) {
    throw new Error(
      crawlError
        ? `Failed to load product page: ${crawlError.message}`
        : "Failed to load product page: unknown error"
    );
  }

  return captured;
}
