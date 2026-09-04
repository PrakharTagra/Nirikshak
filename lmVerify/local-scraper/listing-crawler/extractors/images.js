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

    return { count: items.length, items };
  });
}
