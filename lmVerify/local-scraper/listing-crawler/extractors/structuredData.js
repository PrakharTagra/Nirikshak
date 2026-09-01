/**
 * Collects two kinds of embedded data from the page:
 *
 * 1. jsonLd — every <script type="application/ld+json"> block, parsed.
 *    Product pages commonly embed schema.org Product/Offer data here.
 *
 * 2. scriptData — "relevant" inline <script> data that isn't JSON-LD but
 *    often carries product/state info: framework hydration payloads
 *    (window.__NEXT_DATA__, __NUXT__, __INITIAL_STATE__, __APOLLO_STATE__,
 *    __PRELOADED_STATE__) and known e-commerce globals (dataLayer,
 *    ShopifyAnalytics). Assignment-style globals are best-effort JSON
 *    parsed; anything we can't safely parse is still returned as a raw,
 *    truncated snippet so later phases (or a human) can mine it further.
 *
 * This stays intentionally generic/platform-agnostic. Per-platform parsing
 * rules (e.g. exact Amazon/Flipkart globals) can be added later via the
 * platform registry without changing this extractor's contract.
 */
export async function extractStructuredData(page) {
  return page.evaluate(() => {
    const result = { jsonLd: [], jsonLdErrors: [], scriptData: [] };

    document.querySelectorAll('script[type="application/ld+json"]').forEach((el) => {
      const raw = el.textContent || "";
      if (!raw.trim()) return;
      try {
        const parsed = JSON.parse(raw);
        if (Array.isArray(parsed)) {
          result.jsonLd.push(...parsed);
        } else {
          result.jsonLd.push(parsed);
        }
      } catch (err) {
        result.jsonLdErrors.push({
          snippet: raw.slice(0, 300),
          error: String((err && err.message) || err),
        });
      }
    });

    const ASSIGNMENT_PATTERNS = [
      { key: "window.__NEXT_DATA__", re: /window\.__NEXT_DATA__\s*=\s*/ },
      { key: "window.__NUXT__", re: /window\.__NUXT__\s*=\s*/ },
      { key: "window.__INITIAL_STATE__", re: /window\.__INITIAL_STATE__\s*=\s*/ },
      { key: "window.__APOLLO_STATE__", re: /window\.__APOLLO_STATE__\s*=\s*/ },
      { key: "window.__PRELOADED_STATE__", re: /window\.__PRELOADED_STATE__\s*=\s*/ },
    ];

    const KEYWORD_PATTERNS = [
      { key: "dataLayer", re: /\bdataLayer\b/ },
      { key: "shopifyAnalytics", re: /ShopifyAnalytics|Shopify\.theme/ },
    ];

    const MAX_SCRIPT_ENTRIES = 20;
    const inlineScripts = Array.from(document.querySelectorAll("script:not([src])"));

    for (const el of inlineScripts) {
      if (result.scriptData.length >= MAX_SCRIPT_ENTRIES) break;
      if (el.getAttribute("type") === "application/ld+json") continue;

      const text = el.textContent || "";
      if (!text.trim()) continue;

      let matchedAssignment = false;
      for (const { key, re } of ASSIGNMENT_PATTERNS) {
        const match = re.exec(text);
        if (!match) continue;
        matchedAssignment = true;

        const after = text
          .slice(match.index + match[0].length)
          .trim()
          .replace(/;\s*$/, "");

        let parsed = null;
        try {
          parsed = JSON.parse(after);
        } catch {
          // Best-effort only — leave parsed as null, raw snippet still returned below.
        }

        result.scriptData.push({
          key,
          matchType: "assignment",
          parsed,
          snippet: text.slice(0, 2000),
        });
      }

      if (!matchedAssignment) {
        for (const { key, re } of KEYWORD_PATTERNS) {
          if (re.test(text)) {
            result.scriptData.push({
              key,
              matchType: "keyword",
              parsed: null,
              snippet: text.slice(0, 1000),
            });
            break; // one label per script block is enough signal
          }
        }
      }
    }

    return result;
  });
}
