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
