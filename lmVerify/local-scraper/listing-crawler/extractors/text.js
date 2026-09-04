/**
 * Walks all visible product text in the rendered document and returns clean,
 * structured lines.
 *
 * Excludes site boilerplate (navigation headers, footers, customer reviews,
 * recommended/sponsored carousels) so that only genuine product listing details
 * (titles, prices, bullet points, technical specs, manufacturer declarations)
 * are extracted.
 */
export async function extractVisibleText(page) {
  return page.evaluate(() => {
    const HIDDEN_TAGS = new Set(["SCRIPT", "STYLE", "NOSCRIPT", "TEMPLATE", "SVG"]);

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

    const NOISE_HEADING_REGEX = /(?:bought\s+together|likely\s+to\s+buy|related\s+items|shop\s+by\s+brand|customers\s+who\s+(?:bought|viewed)|similar\s+brands|compare\s+with\s+similar|products\s+related\s+to|more\s+items\s+to|inspired\s+by\s+your|brands\s+in\s+this\s+category|top\s+picks\s+for\s+you|what\s+other\s+items\s+do\s+customers)/i;

    // Pre-mark any container whose heading indicates cross-sell, recommendations, or carousels
    try {
      const headingCandidates = document.querySelectorAll("h1, h2, h3, h4, h5, h6, .a-size-medium, .a-size-base-plus, b, strong, span.a-text-bold");
      headingCandidates.forEach((h) => {
        const text = (h.textContent || "").trim();
        if (text && NOISE_HEADING_REGEX.test(text)) {
          const container = h.closest(".celwidget, [data-cel-widget], .a-section, .a-cardui, section, div[id*='feature'], div[id*='sims'], div[id*='fbt'], div[id*='carousel']") || h.parentElement;
          if (container && container !== document.body && container !== document.documentElement) {
            container.classList.add("__lm_noise_container__");
          }
        }
      });
    } catch {
      // Ignore DOM tagging errors in restricted environments
    }

    function isVisible(el) {
      if (!el || el === document.body) return true;
      const style = window.getComputedStyle(el);
      if (style.display === "none" || style.visibility === "hidden" || style.opacity === "0") {
        return false;
      }
      const rect = el.getBoundingClientRect();
      if (rect.width === 0 && rect.height === 0) return false;
      return true;
    }

    function isInsideNoise(el) {
      if (!el || el === document.body) return false;
      try {
        if (el.closest(NOISE_SELECTORS)) return true;
      } catch {
        // Fallback if selector parsing fails
      }
      return false;
    }

    const lines = [];
    const seen = new Set();

    // Priority 1: High-value product detail tables / blocks
    const prioritySelectors = [
      "#productTitle",
      "h1",
      "#centerCol",
      "#feature-bullets",
      "#prodDetails",
      "#productDetails_techSpec_section_1",
      "#productDetails_db_sections",
      "#detailBullets_feature_div",
      "#technicalSpecifications_section_1",
      ".product-specs",
      ".product-details",
      "#corePrice_feature_div",
      "#corePriceDisplay_desktop_feature_div",
      "#apex_desktop",
      ".a-price",
    ];

    const priorityContainers = document.querySelectorAll(prioritySelectors.join(", "));
    priorityContainers.forEach((container) => {
      if (!isVisible(container) || isInsideNoise(container)) return;
      const text = (container.innerText || container.textContent || "").trim();
      if (!text) return;
      text.split("\n").forEach((line) => {
        const clean = line.replace(/\s+/g, " ").trim();
        if (clean.length > 1 && !NOISE_HEADING_REGEX.test(clean) && !seen.has(clean.toLowerCase())) {
          seen.add(clean.toLowerCase());
          lines.push(clean);
        }
      });
    });

    // Priority 2: General document tree walker excluding noise containers
    const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, {
      acceptNode(node) {
        const parent = node.parentElement;
        if (!parent) return NodeFilter.FILTER_REJECT;
        if (HIDDEN_TAGS.has(parent.tagName)) return NodeFilter.FILTER_REJECT;
        if (!node.textContent || !node.textContent.trim()) return NodeFilter.FILTER_REJECT;
        if (isInsideNoise(parent)) return NodeFilter.FILTER_REJECT;
        if (!isVisible(parent)) return NodeFilter.FILTER_REJECT;
        return NodeFilter.FILTER_ACCEPT;
      },
    });

    let node;
    // eslint-disable-next-line no-cond-assign
    while ((node = walker.nextNode())) {
      const clean = node.textContent.replace(/\s+/g, " ").trim();
      if (clean.length > 2 && !NOISE_HEADING_REGEX.test(clean) && !seen.has(clean.toLowerCase())) {
        seen.add(clean.toLowerCase());
        lines.push(clean);
      }
    }

    return lines.join("\n");
  });
}
