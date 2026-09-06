/**
 * Collects image URLs from the rendered page, resolved to absolute URLs.
 *
 * Handles three common patterns on e-commerce sites:
 *  - Plain <img src="...">
 *  - Lazy-loaded images where the real URL lives in a data-* attribute
 *    (data-src, data-lazy-src, data-original, data-lazy, data-echo) until
 *    a lazy-load library swaps it into `src` on scroll/intersection.
 *  - Responsive images via `srcset` / `data-srcset` (on <img>) and
 *    `<picture><source srcset="...">` variants.
 *
 * Because the core crawler (Phase 1) already performs a full-page scroll
 * pass before extraction runs, most lazy-loaders will have already fired
 * and swapped their real URL into `src` by this point. We still check the
 * lazy attributes first (and flag `lazy: true` when found) so we capture
 * the correct source even for loaders that leave the data-* attribute in
 * place, or that didn't trigger in time.
 */
export async function extractImages(page) {
  return page.evaluate(() => {
    const LAZY_SRC_ATTRS = ["data-src", "data-lazy-src", "data-original", "data-lazy", "data-echo"];
    const LAZY_SRCSET_ATTRS = ["data-srcset", "data-lazy-srcset"];

    function resolve(url) {
      try {
        return new URL(url, document.baseURI).href;
      } catch {
        return url;
      }
    }

    function parseSrcset(srcset) {
      if (!srcset) return [];
      return srcset
        .split(",")
        .map((part) => {
          const trimmed = part.trim();
          const spaceIdx = trimmed.lastIndexOf(" ");
          if (spaceIdx === -1) return { url: trimmed, descriptor: null };
          return { url: trimmed.slice(0, spaceIdx).trim(), descriptor: trimmed.slice(spaceIdx + 1).trim() };
        })
        .filter((c) => c.url);
    }

    const NOISE_SELECTORS = [
      "header",
      "nav",
      "footer",
      "#navbar",
      "#nav-main",
      "#nav-subnav",
      "#navFooter",
      "#footer",
      "#reviewsMedley",
      "#customerReviews",
      "#cm_cr_dp_d_rating_histogram",
      ".reviews",
      "#cr-summarization-attributes-list",
      "#rhf",
      "#rhf-container",
      "#rhf-shoveler",
      "#similarities_feature_div",
      "#sp_detail",
      "#sp_detail2",
      "#desktop-dp-sims_feature_div",
      "#desktop-dp-sims_feature_div_2",
      "#sims-consolidated-1_feature_div",
      "#sims-consolidated-2_feature_div",
      "#sims-consolidated-3_feature_div",
      "#sims-consolidated-4_feature_div",
      "#sims-consolidated-5_feature_div",
      "#sims-consolidated-6_feature_div",
      "#fbt_feature_div",
      "#frequently-bought-together",
      ".frequently-bought-together",
      "#bundle-v2-atf",
      "#bundle-v2-btf",
      "#session-sims-feature",
      "#purchase-sims-feature",
      "#dp-ads-center-promo_feature_div",
      "#HLCXComparisonWidget_feature_div",
      "#comparison_table",
      "#dpx-btf-hlcx-comparison_feature_div",
      ".a-carousel",
      ".a-carousel-container",
      ".a-carousel-viewport",
      ".a-carousel-card",
      "div[data-component-type='s-carousel']",
      "[data-a-carousel-options]",
      "[data-cel-widget*='sims']",
      "[data-cel-widget*='recs']",
      "[data-cel-widget*='fbt']",
      "[data-cel-widget*='sp_detail']",
      "[data-cel-widget*='sponsored']",
      "[data-cel-widget*='cross-sell']",
      "[data-cel-widget*='fresh-cross-sell']",
      "[data-cel-widget*='browse']",
      "[data-cel-widget*='deals']",
      ".sponsored-products",
      "#ad-feedback-text",
      ".a-popover-preload",
      "#tellAFriendBox_feature_div",
      "#quickPromoBucketContent",
      ".__lm_noise_container__",
    ].join(", ");

    function isInsideNoise(el) {
      if (!el || el === document.body) return false;
      try {
        if (el.closest(NOISE_SELECTORS)) return true;
      } catch {
        // Fallback
      }
      return false;
    }

    const items = [];
    const seenUrls = new Set();

    function pushItem(url, meta) {
      if (!url) return;
      const resolved = resolve(url);
      if (seenUrls.has(resolved)) return;
      seenUrls.add(resolved);
      items.push({ url: resolved, ...meta });
    }

    document.querySelectorAll("img").forEach((img) => {
      if (isInsideNoise(img)) return;
      const alt = img.getAttribute("alt") || null;

      let sourceUrl = img.getAttribute("src");
      let attribute = "src";
      let lazy = false;

      for (const attr of LAZY_SRC_ATTRS) {
        const val = img.getAttribute(attr);
        if (val) {
          sourceUrl = val;
          attribute = attr;
          lazy = true;
          break;
        }
      }

      let srcsetRaw = img.getAttribute("srcset");
      for (const attr of LAZY_SRCSET_ATTRS) {
        const val = img.getAttribute(attr);
        if (val) {
          srcsetRaw = val;
          lazy = true;
          break;
        }
      }
      const srcset = parseSrcset(srcsetRaw).map((c) => ({ url: resolve(c.url), descriptor: c.descriptor }));

      if (sourceUrl) {
        pushItem(sourceUrl, { alt, attribute, lazy, srcset });
      } else if (srcset.length) {
        // No usable src/data-src, but we do have srcset candidates — use the
        // last (typically largest) candidate as the representative URL.
        const best = srcset[srcset.length - 1];
        pushItem(best.url, { alt, attribute: "srcset", lazy: true, srcset });
      }
    });

    // <picture><source srcset="..."></picture> variants not already covered
    // by a sibling <img> (some themes rely on source-only <picture> blocks).
    document.querySelectorAll("picture source[srcset]").forEach((source) => {
      const candidates = parseSrcset(source.getAttribute("srcset")).map((c) => ({
        url: resolve(c.url),
        descriptor: c.descriptor,
      }));
      if (candidates.length) {
        const best = candidates[candidates.length - 1];
        pushItem(best.url, { alt: null, attribute: "picture-source-srcset", lazy: false, srcset: candidates });
      }
    });

    // -----------------------------------------------------------------------
    // Product Images Only Isolation
    // -----------------------------------------------------------------------
    const PRODUCT_CONTAINER_SELECTORS = [
      "#main-image-container",
      "#imgTagWrapperId",
      "#altImages",
      "#imageBlock",
      "#imageBlock_feature_div",
      "#leftCol",
      ".imgTagWrapper",
      "[data-action='main-image-click']",
      "div._2c7YLP",
      "div._396cs4",
      "ul._3GnUWp",
      ".product-gallery",
      ".product-images",
      ".pdp-image-viewer",
      ".pdp-images",
      ".product__media",
      ".product-single__photos",
      "[data-testid*='product-image']",
      "[data-testid*='image-gallery']",
      "[data-gallery-role='gallery']",
      ".woocommerce-product-gallery",
      ".product-slider",
      ".product-carousel",
      "#product-image-carousel",
    ].join(", ");

    const NON_PRODUCT_URL_PATTERN =
      /(?:[\b_/-](?:logo|icon|badge|star|rating|sprite|arrow|loader|spinner|prime|assured|payment|visa|mastercard|upi|rupay|delivery|truck|tick|check|close|share|heart|wishlist|transparent|pixel)[\b_.-]|\/images\/G\/|data:image\/svg|\.svg$)/i;

    function cleanAmazonRes(url) {
      if (!url) return url;
      // Strip dynamic resizing modifier: e.g. ._AC_SR38,50_.jpg or ._SX466_.jpg -> .jpg
      return url.replace(/\._[A-Za-z0-9_,]+_(\.[a-zA-Z]+)$/, "$1");
    }

    function cleanFlipkartRes(url) {
      if (!url) return url;
      // Upgrade Flipkart image dimensions to high resolution for clear label OCR
      return url.replace(/\/image\/\d+\/\d+\//, "/image/832/832/");
    }

    function normalizeProductImageUrl(url) {
      if (!url) return null;
      let u = resolve(url);
      if (u.includes("media-amazon.com") || u.includes("images-amazon.com")) {
        // Amazon catalog item images reside in /images/I/
        if (!u.includes("/images/I/")) return null;
        u = cleanAmazonRes(u);
      } else if (u.includes("flixcart.com") || u.includes("flipkart.com")) {
        u = cleanFlipkartRes(u);
      }
      return u;
    }

    const productUrlsSet = new Set();
    const productImages = [];

    function addProductImage(rawUrl, meta = {}) {
      if (!rawUrl) return;
      if (NON_PRODUCT_URL_PATTERN.test(rawUrl)) return;

      const norm = normalizeProductImageUrl(rawUrl);
      if (!norm || productUrlsSet.has(norm)) return;
      if (NON_PRODUCT_URL_PATTERN.test(norm)) return;

      productUrlsSet.add(norm);
      productImages.push({
        url: norm,
        alt: meta.alt || null,
        isPackagingImage: true,
      });
    }

    // 1. Check Amazon dynamic high-res image maps (e.g. data-a-dynamic-image on #landingImage)
    document.querySelectorAll("[data-a-dynamic-image]").forEach((el) => {
      try {
        const raw = el.getAttribute("data-a-dynamic-image");
        if (raw) {
          const parsed = JSON.parse(raw);
          Object.keys(parsed).forEach((imgUrl) => {
            addProductImage(imgUrl, { alt: el.getAttribute("alt") });
          });
        }
      } catch {}
    });

    // 2. Check JSON-LD Product schema images from the DOM
    document.querySelectorAll('script[type="application/ld+json"]').forEach((script) => {
      try {
        const parsed = JSON.parse(script.textContent || "");
        const blocks = Array.isArray(parsed) ? parsed : [parsed];
        for (const block of blocks) {
          if (block && (block["@type"] === "Product" || block.image)) {
            const imgs = Array.isArray(block.image)
              ? block.image
              : block.image
              ? [block.image]
              : [];
            for (const img of imgs) {
              const url = typeof img === "string" ? img : img?.url;
              if (url) addProductImage(url, { alt: block.name });
            }
          }
        }
      } catch {}
    });

    // 3. Check OpenGraph Product Image meta tag
    const ogImage = document.querySelector('meta[property="og:image"]')?.getAttribute("content");
    if (ogImage) {
      addProductImage(ogImage, { alt: "Primary Listing Image" });
    }

    // 4. Targeted Product Gallery Elements
    document.querySelectorAll(PRODUCT_CONTAINER_SELECTORS).forEach((container) => {
      container.querySelectorAll("img").forEach((img) => {
        if (isInsideNoise(img)) return;

        // Skip obvious tiny icons
        const w = img.naturalWidth || img.width || 0;
        const h = img.naturalHeight || img.height || 0;
        if ((w > 0 && w < 60) || (h > 0 && h < 60)) return;

        const src =
          img.getAttribute("data-old-hires") ||
          img.getAttribute("data-zoom-image") ||
          img.getAttribute("data-src") ||
          img.getAttribute("src");

        const alt = img.getAttribute("alt") || "";
        if (src) addProductImage(src, { alt });
      });
    });

    // 5. Fallback: If no product images isolated yet, take high-confidence images from items
    if (productImages.length === 0) {
      items.forEach((item) => {
        if (!NON_PRODUCT_URL_PATTERN.test(item.url)) {
          addProductImage(item.url, { alt: item.alt });
        }
      });
    }

    return {
      count: items.length,
      items,
      productImages,
    };
  });
}
