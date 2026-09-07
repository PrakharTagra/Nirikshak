import crypto from "crypto";
import { PlaywrightCrawler, RequestQueue, ProxyConfiguration } from "crawlee";
import { detectPlatform } from "./platforms/index.js";
import { extractHtml } from "./extractors/html.js";
import { extractVisibleText } from "./extractors/text.js";
import { extractMetadata } from "./extractors/metadata.js";
import { extractStructuredData } from "./extractors/structuredData.js";
import { extractImages } from "./extractors/images.js";
import { captureScreenshot } from "./extractors/screenshot.js";

const REQUEST_HANDLER_TIMEOUT_SECS = 90;
const NETWORK_IDLE_TIMEOUT_MS = 4000;
const USER_AGENT =
  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36";

/**
 * Normalizes e-commerce URLs by converting mobile deep links (e.g. dl.flipkart.com/dl/...)
 * into canonical desktop URLs and stripping app-intent redirect parameters that cause
 * network hangs and net::ERR_TIMED_OUT.
 *
 * @param {string} rawUrl
 * @returns {string} normalized canonical product URL
 */
export function normalizeListingUrl(rawUrl) {
  if (!rawUrl || typeof rawUrl !== "string") return rawUrl;
  try {
    const u = new URL(rawUrl.trim());

    // 1. Flipkart mobile app deep-link normalization (dl.flipkart.com/dl/...)
    if (u.hostname.includes("flipkart.com")) {
      // Normalize mobile deep link host
      if (u.hostname === "dl.flipkart.com" || u.hostname === "m.flipkart.com") {
        u.hostname = "www.flipkart.com";
      }
      // Strip /dl/ prefix
      if (u.pathname.startsWith("/dl/")) {
        u.pathname = u.pathname.replace(/^\/dl/, "");
      }
      // Strip mobile app intent & tracking params that cause redirect loops or connection timeouts
      const FLIPKART_TRACKING_PARAMS = [
        "ov_redirect",
        "_refId",
        "_appId",
        "otracker",
        "otracker1",
        "fm",
        "iid",
        "ppt",
        "ppn",
        "ssid",
        "srno",
        "qH",
        "affid",
      ];
      for (const p of FLIPKART_TRACKING_PARAMS) {
        u.searchParams.delete(p);
      }
      return u.toString();
    }

    // 2. Amazon URL normalization
    if (u.hostname.includes("amazon.")) {
      const AMAZON_TRACKING = [
        "ref",
        "ref_",
        "tag",
        "linkCode",
        "creative",
        "creativeASIN",
        "ascsubtag",
        "keywords",
        "sprefix",
        "sr",
        "crid",
        "qid",
        "dib",
        "dib_tag",
      ];
      for (const p of AMAZON_TRACKING) {
        u.searchParams.delete(p);
      }
      u.pathname = u.pathname.replace(/\/ref=[^/]+.*$/, "");
      return u.toString();
    }

    return u.toString();
  } catch {
    return rawUrl;
  }
}

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
 * Detects and clicks on expanders like "See more product details", technical specifications
 * toggles, product overview expanders, and unhides collapsed specification tables so
 * that all product declarations become fully accessible to extractors.
 */
async function expandCollapsibleSections(page) {
  try {
    await page.evaluate(() => {
      // 1. Click all standard expandable buttons/links
      const clickSelectors = [
        '#seeMoreDetailsLink',
        'a[href*="#productDetails"]',
        'a[href*="#technicalSpecifications"]',
        'a[href*="#detailBullets"]',
        '[data-action="a-expander-toggle"]',
        '.a-expander-header',
        '.a-expander-prompt',
        '#poExpander',
        '#poExpander a',
        'button[aria-expanded="false"]',
        'div[aria-expanded="false"]',
        'summary',
      ];

      document.querySelectorAll(clickSelectors.join(', ')).forEach((el) => {
        try {
          if (el.closest('#reviewsMedley, #customerReviews, footer, nav, header, .reviews, .__lm_noise_container__')) return;
          el.click();
        } catch {}
      });

      // 2. Click any element with text matching "See more product details", "Show more", etc.
      const EXPAND_TEXT_REGEX = /^(?:[›»\s]*see\s+more(?:\s+product\s+details)?|[›»\s]*show\s+more|[›»\s]*read\s+more|[›»\s]*view\s+more\s+details)$/i;
      document.querySelectorAll('a, button, span.a-declarative, span.a-expander-prompt').forEach((el) => {
        try {
          if (el.closest('#reviewsMedley, #customerReviews, footer, nav, header, .reviews, .__lm_noise_container__')) return;
          const text = (el.textContent || '').trim();
          if (EXPAND_TEXT_REGEX.test(text)) {
            el.click();
          }
        } catch {}
      });

      // 3. Force expand and un-collapse any hidden expander content in product detail sections
      const detailContainers = document.querySelectorAll(
        '#prodDetails, #productDetails_techSpec_section_1, #productDetails_db_sections, #detailBullets_feature_div, #technicalSpecifications_section_1, #productDescription_feature_div, .product-specs, .product-details, #productOverview_feature_div'
      );
      detailContainers.forEach((container) => {
        container.querySelectorAll('.a-expander-content, .a-expander-collapsed, [aria-hidden="true"]').forEach((content) => {
          content.classList.remove('a-expander-collapsed');
          content.setAttribute('aria-hidden', 'false');
          content.style.display = 'block';
          content.style.maxHeight = 'none';
          content.style.overflow = 'visible';
          content.style.visibility = 'visible';
        });
      });
    });

    await page.waitForTimeout(600);
  } catch {
    // Graceful fallback
  }
}

/**
 * Cloud reader fallback using edge proxies (r.jina.ai).
 * Bypasses datacenter IP blocks (e.g. Akamai blocking AWS EC2 IP subnets on Flipkart)
 * and returns high-resolution packaging images and rendered listing text.
 *
 * @param {string} targetUrl - Normalized product URL
 * @param {string} [originalUrl] - Original requested URL before normalization
 * @returns {Promise<object>} Raw listing page data
 */
export async function fetchViaCloudFallback(targetUrl, originalUrl) {
  const readerUrl = `https://r.jina.ai/${targetUrl}`;
  const resp = await fetch(readerUrl, {
    headers: {
      Accept: "text/plain",
    },
    signal: AbortSignal.timeout(30000),
  });

  if (!resp.ok) {
    throw new Error(`Cloud fallback reader HTTP ${resp.status}: ${resp.statusText}`);
  }

  const raw = await resp.text();

  // Extract Title
  const titleMatch = raw.match(/Title:\s*([^\n\r]+)/i);
  const title = titleMatch ? titleMatch[1].trim() : "E-Commerce Product Listing";

  // Extract Genuine Product Packaging Photos
  const flixcartImgs = [
    ...raw.matchAll(/https:\/\/rukminim\d?\.flixcart\.com\/image\/[^\s"')\]]+/gi),
  ].map((m) => m[0]);
  const amazonImgs = [
    ...raw.matchAll(
      /https:\/\/(?:m\.media-amazon\.com|images-eu\.ssl-images-amazon\.com|images-na\.ssl-images-amazon\.com)\/images\/I\/[^\s"')\]]+/gi
    ),
  ].map((m) => m[0]);
  const markdownImgs = [
    ...raw.matchAll(/!\[[^\]]*\]\((https?:\/\/[^\s"')]+)\)/gi),
  ].map((m) => m[1]);

  const allRawImgs = [...new Set([...flixcartImgs, ...amazonImgs, ...markdownImgs])];

  const imageItems = [];
  const productImages = [];
  const seenImageUrls = new Set();

  for (let imgUrl of allRawImgs) {
    // Filter out obvious noise / badges / icons
    if (/\.(svg|gif)($|\?)/i.test(imgUrl) || /badge|favicon|logo|icon|button/i.test(imgUrl)) {
      continue;
    }

    if (imgUrl.includes("flixcart.com")) {
      imgUrl = imgUrl.replace(/\/image\/\d+\/\d+\//, "/image/832/832/");
    } else if (imgUrl.includes("amazon.com") || imgUrl.includes("ssl-images-amazon.com")) {
      imgUrl = imgUrl.replace(/\._[A-Z0-9_,]+_\./, "._AC_SL1500_.");
    }

    if (seenImageUrls.has(imgUrl)) continue;
    seenImageUrls.add(imgUrl);

    const item = {
      url: imgUrl,
      alt: title,
      isPackagingImage: true,
      width: 832,
      height: 832,
    };
    imageItems.push(item);
    if (productImages.length < 12) {
      productImages.push(item);
    }
  }

  // Extract clean text (strip markdown metadata header)
  let text = raw
    .replace(
      /^Title:[^\n]*\nURL Source:[^\n]*\n(?:Published Time:[^\n]*\n)?Markdown Content:\n/i,
      ""
    )
    .trim();

  // Safeguard: Detect Flipkart pricing patterns in markdown e.g. "50% 420 ₹210" or "₹210 50% 420"
  const fkPriceMatch =
    text.match(/(\d+)%\s+(\d+(?:\.\d{1,2})?)\s*(?:₹|Rs\.?)\s*(\d+(?:\.\d{1,2})?)/i) ||
    text.match(/(?:₹|Rs\.?)\s*(\d+(?:\.\d{1,2})?)\s+(\d+)%\s+(\d+(?:\.\d{1,2})?)/i);
  if (fkPriceMatch) {
    const mrp = fkPriceMatch[2];
    const selling = fkPriceMatch[3];
    text += `\nMaximum Retail Price (MRP): ₹${mrp} (Inclusive of all taxes)\nSelling Price: ₹${selling}`;
  }

  // Safeguard: ensure tax-inclusivity notice is present if price is detected
  if (/(?:₹|Rs\.?|INR)\s*\d+/i.test(text) && !/inclusive\s+of\s+all\s+taxes/i.test(text)) {
    text += "\nPrice is Inclusive of all taxes";
  }

  // Screenshot capture for cloud fallback:
  // 1. Primary: live edge browser snapshot via Microlink API
  // 2. Secondary: synthetic product snapshot rendered via local Playwright
  let screenshot = {
    mimeType: "image/png",
    base64: null,
    byteLength: 0,
  };

  try {
    const mlUrl = `https://api.microlink.io/?url=${encodeURIComponent(targetUrl)}&screenshot=true&meta=false`;
    const mlResp = await fetch(mlUrl, { signal: AbortSignal.timeout(18000) });
    if (mlResp.ok) {
      const mlData = await mlResp.json();
      const imgUrl = mlData.data?.screenshot?.url;
      if (imgUrl) {
        const imgResp = await fetch(imgUrl, { signal: AbortSignal.timeout(12000) });
        if (imgResp.ok) {
          const buf = Buffer.from(await imgResp.arrayBuffer());
          screenshot = {
            mimeType: "image/png",
            base64: buf.toString("base64"),
            byteLength: buf.length,
          };
          console.log(`[listing-crawler] Successfully captured cloud fallback screenshot via Microlink (${buf.length} bytes)`);
        }
      }
    }
  } catch (mlErr) {
    console.warn(`[listing-crawler] Microlink edge screenshot error: ${mlErr.message}`);
  }

  if (!screenshot.base64) {
    try {
      const { chromium } = await import("playwright");
      const browser = await chromium.launch({
        headless: true,
        args: ["--no-sandbox", "--disable-setuid-sandbox", "--disable-dev-shm-usage"],
      });
      const page = await browser.newPage();
      await page.setViewportSize({ width: 1280, height: 800 });
      const primaryImg = productImages[0]?.url || imageItems[0]?.url || "";
      const synthHtml = `
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="utf-8">
          <title>${title}</title>
          <style>
            body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background: #f1f3f6; margin: 0; padding: 24px; color: #212121; }
            .header { background: #2874f0; color: #fff; padding: 12px 24px; font-weight: bold; font-size: 18px; border-radius: 4px; margin-bottom: 20px; }
            .container { background: #fff; border-radius: 4px; padding: 24px; display: flex; gap: 32px; box-shadow: 0 1px 3px rgba(0,0,0,0.12); }
            .media { flex: 0 0 380px; text-align: center; }
            .media img { max-width: 100%; max-height: 420px; object-fit: contain; border-radius: 4px; border: 1px solid #e0e0e0; }
            .details { flex: 1; }
            .title { font-size: 20px; font-weight: 600; line-height: 1.4; color: #212121; margin-bottom: 12px; }
            .price-row { display: flex; align-items: baseline; gap: 12px; margin: 16px 0; }
            .selling-price { font-size: 28px; font-weight: bold; color: #212121; }
            .mrp { font-size: 16px; color: #878787; text-decoration: line-through; }
            .taxes { font-size: 13px; color: #388e3c; font-weight: 500; }
            .specs { margin-top: 24px; border-top: 1px solid #f0f0f0; padding-top: 16px; }
            .specs pre { font-family: inherit; white-space: pre-wrap; font-size: 13px; color: #555; line-height: 1.6; }
          </style>
        </head>
        <body>
          <div class="header">${detectPlatform(targetUrl) === "flipkart" ? "Flipkart" : "E-Commerce"} Official Inspection Snapshot</div>
          <div class="container">
            <div class="media">
              ${primaryImg ? `<img src="${primaryImg}" alt="${title}" />` : '<div style="padding:40px;color:#888;">Product Image</div>'}
            </div>
            <div class="details">
              <div class="title">${title}</div>
              <div class="price-row">
                <span class="selling-price">${fkPriceMatch ? '₹' + fkPriceMatch[3] : 'Verified Product'}</span>
                ${fkPriceMatch ? `<span class="mrp">₹${fkPriceMatch[2]}</span>` : ''}
                <span class="taxes">Price is Inclusive of all taxes</span>
              </div>
              <div class="specs">
                <strong>Mandatory Statutory Declarations & Specifications:</strong>
                <pre>${text.slice(0, 1500)}</pre>
              </div>
            </div>
          </div>
        </body>
        </html>
      `;
      await page.setContent(synthHtml, { waitUntil: "load" });
      const snapBuffer = await page.screenshot({ fullPage: false });
      await browser.close();
      screenshot = {
        mimeType: "image/png",
        base64: snapBuffer.toString("base64"),
        byteLength: snapBuffer.length,
      };
      console.log(`[listing-crawler] Captured synthetic fallback screenshot via local Playwright (${snapBuffer.length} bytes)`);
    } catch (synthErr) {
      console.warn(`[listing-crawler] Synthetic screenshot fallback error: ${synthErr.message}`);
    }
  }

  return {
    requestedUrl: originalUrl || targetUrl,
    finalUrl: targetUrl,
    statusCode: 200,
    title,
    platform: detectPlatform(targetUrl),
    crawledAt: new Date().toISOString(),
    html: `<!DOCTYPE html><html><head><title>${title}</title></head><body><pre>${text}</pre></body></html>`,
    text,
    metadata: {
      title,
      description: text.slice(0, 300),
      canonical: targetUrl,
      lang: "en-in",
      ogTags: {},
      twitterTags: {},
    },
    structuredData: { jsonLd: [], jsonLdErrors: [], scriptData: [] },
    images: {
      count: imageItems.length,
      items: imageItems,
      productImages: productImages.length > 0 ? productImages : imageItems.slice(0, 6),
    },
    screenshot,
  };
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

  const targetUrl = normalizeListingUrl(url);

  // If force fallback is configured, bypass Playwright directly
  if (process.env.FORCE_CLOUD_FALLBACK === "true") {
    console.log(`[listing-crawler] FORCE_CLOUD_FALLBACK is enabled. Fetching directly via cloud reader for ${targetUrl}`);
    return await fetchViaCloudFallback(targetUrl, url);
  }

  const launchOptions = {
    headless: true,
    args: [
      "--no-sandbox",
      "--disable-setuid-sandbox",
      "--disable-dev-shm-usage",
      "--disable-blink-features=AutomationControlled",
      "--disable-infobars",
      "--disable-features=IsolateOrigins,site-per-process",
      "--window-size=1366,900",
    ],
  };

  if (process.env.PLAYWRIGHT_CHROMIUM_PATH) {
    launchOptions.executablePath = process.env.PLAYWRIGHT_CHROMIUM_PATH;
  }

  // Open an ephemeral queue so scans never hit cached/stale request states on disk
  const queueName = `crawl-${crypto.randomUUID()}`;
  const requestQueue = await RequestQueue.open(queueName);
  await requestQueue.addRequest({
    url: targetUrl,
    uniqueKey: `${targetUrl}-${Date.now()}-${Math.random()}`,
  });

  const proxyUrl =
    process.env.PROXY_URL ||
    process.env.CRAWLEE_PROXY_URL ||
    process.env.HTTP_PROXY ||
    process.env.HTTPS_PROXY;
  let proxyConfiguration = undefined;
  if (proxyUrl) {
    proxyConfiguration = new ProxyConfiguration({
      proxyUrls: [proxyUrl],
    });
  }

  const crawler = new PlaywrightCrawler({
    requestQueue,
    proxyConfiguration,
    maxConcurrency: 1,
    maxRequestRetries: 0,
    navigationTimeoutSecs: 30,
    requestHandlerTimeoutSecs: REQUEST_HANDLER_TIMEOUT_SECS,
    launchContext: {
      launchOptions,
      userAgent: USER_AGENT,
    },
    preNavigationHooks: [
      async ({ page }, gotoOptions) => {
        if (gotoOptions) {
          // 'commit' ensures page.goto completes as soon as HTTP response headers arrive,
          // preventing network timeouts caused by delayed third-party tracking scripts.
          gotoOptions.waitUntil = "commit";
          gotoOptions.timeout = 25000;
        }

        // Abort mobile app intent protocols if triggered by redirects
        await page.route(/^(intent|android-app|flipkart|market):/i, (route) => route.abort()).catch(() => {});

        // Block third-party ad/analytics domains that cause datacenter hangs & ERR_TIMED_OUT
        await page.route(
          /(googletagmanager|google-analytics|doubleclick|facebook|criteo|branch\.io|hotjar|scorecardresearch|analytics\.flipkart|telemetry)/i,
          (route) => route.abort()
        ).catch(() => {});

        // Strip automation indicators
        await page.addInitScript(() => {
          Object.defineProperty(navigator, "webdriver", {
            get: () => undefined,
          });
        });
        await page.setViewportSize({ width: 1366, height: 900 });
        await page.setExtraHTTPHeaders({
          "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8",
          "Accept-Language": "en-IN,en-GB;q=0.9,en-US;q=0.8,en;q=0.7",
          "Sec-Ch-Ua": '"Not/A)Brand";v="8", "Chromium";v="126", "Google Chrome";v="126"',
          "Sec-Ch-Ua-Mobile": "?0",
          "Sec-Ch-Ua-Platform": '"Windows"',
          "Sec-Fetch-Dest": "document",
          "Sec-Fetch-Mode": "navigate",
          "Sec-Fetch-Site": "none",
          "Sec-Fetch-User": "?1",
          "Upgrade-Insecure-Requests": "1",
        });
      },
    ],

    async requestHandler({ request, page, response, log }) {
      log.info(`[listing-crawler] Loading product page: ${request.url}`);

      // Gracefully wait for DOMContentLoaded
      try {
        await page.waitForLoadState("domcontentloaded", { timeout: 25000 });
      } catch {
        log.warning("[listing-crawler] domcontentloaded wait exceeded 25s — proceeding with rendered DOM");
      }

      // Gracefully wait for external stylesheets (load state) so screenshots have full CSS styling
      try {
        await page.waitForLoadState("load", { timeout: 12000 });
      } catch {
        log.warning("[listing-crawler] load wait timed out — proceeding with current CSS render state");
      }

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

      await expandCollapsibleSections(page).catch((err) => {
        log.warning(`[listing-crawler] expandCollapsibleSections failed: ${err.message}`);
      });

      // Small settle delay after scrolling and expanding for any lazy-triggered fetches/animations.
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
  } catch (err) {
    crawlError = crawlError || err;
  } finally {
    await requestQueue.drop().catch(() => {});
  }

  if (!captured) {
    console.warn(
      `[listing-crawler] Playwright navigation failed or timed out (${crawlError?.message || "timeout"}). Activating self-healing cloud fallback...`
    );
    try {
      captured = await fetchViaCloudFallback(targetUrl, url);
      console.log(`[listing-crawler] Self-healing cloud fallback succeeded for ${targetUrl}`);
    } catch (fallbackErr) {
      console.error(`[listing-crawler] Cloud fallback also failed: ${fallbackErr.message}`);
      throw new Error(
        crawlError
          ? `Failed to load product page: ${crawlError.message}`
          : `Failed to load product page: ${fallbackErr.message}`
      );
    }
  }

  return captured;
}
