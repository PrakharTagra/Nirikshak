/**
 * Walks all text nodes in the rendered document and returns the
 * concatenated visible text — i.e. text a shopper would actually see.
 * Skips <script>/<style>/<noscript>/<template> content and anything hidden
 * via display:none, visibility:hidden, opacity:0, or zero-size boxes.
 */
export async function extractVisibleText(page) {
  return page.evaluate(() => {
    const HIDDEN_TAGS = new Set(["SCRIPT", "STYLE", "NOSCRIPT", "TEMPLATE"]);

    function isVisible(el) {
      const style = window.getComputedStyle(el);
      if (style.display === "none" || style.visibility === "hidden" || style.opacity === "0") {
        return false;
      }
      const rect = el.getBoundingClientRect();
      if (rect.width === 0 && rect.height === 0) return false;
      return true;
    }

    const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, {
      acceptNode(node) {
        const parent = node.parentElement;
        if (!parent) return NodeFilter.FILTER_REJECT;
        if (HIDDEN_TAGS.has(parent.tagName)) return NodeFilter.FILTER_REJECT;
        if (!node.textContent || !node.textContent.trim()) return NodeFilter.FILTER_REJECT;
        if (!isVisible(parent)) return NodeFilter.FILTER_REJECT;
        return NodeFilter.FILTER_ACCEPT;
      },
    });

    const chunks = [];
    let node;
    // eslint-disable-next-line no-cond-assign
    while ((node = walker.nextNode())) {
      chunks.push(node.textContent.trim());
    }

    return chunks.join(" ").replace(/\s+/g, " ").trim();
  });
}
