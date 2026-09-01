/**
 * Collects standard page-level metadata: title, meta description, canonical
 * URL, language, charset, viewport, favicon, and all Open Graph / Twitter
 * card meta tags (commonly used by product pages for price/availability/
 * image hints even outside of JSON-LD).
 */
export async function extractMetadata(page) {
  return page.evaluate(() => {
    const getMetaContent = (selector) => {
      const el = document.querySelector(selector);
      return el ? el.getAttribute("content") : null;
    };

    const ogTags = {};
    document.querySelectorAll('meta[property^="og:"]').forEach((el) => {
      const prop = el.getAttribute("property");
      const content = el.getAttribute("content");
      if (prop && content) ogTags[prop] = content;
    });

    const twitterTags = {};
    document.querySelectorAll('meta[name^="twitter:"]').forEach((el) => {
      const name = el.getAttribute("name");
      const content = el.getAttribute("content");
      if (name && content) twitterTags[name] = content;
    });

    const canonicalEl = document.querySelector('link[rel="canonical"]');
    const faviconEl = document.querySelector('link[rel~="icon"]');

    return {
      title: document.title || null,
      description: getMetaContent('meta[name="description"]'),
      canonical: canonicalEl ? canonicalEl.href : null,
      lang: document.documentElement.lang || null,
      charset: document.characterSet || null,
      viewport: getMetaContent('meta[name="viewport"]'),
      favicon: faviconEl ? faviconEl.href : null,
      ogTags,
      twitterTags,
    };
  });
}
