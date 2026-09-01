/**
 * Returns the fully rendered HTML of the page (post-JS DOM serialization),
 * not the original server response body. This is what we want for
 * e-commerce pages, since prices/images/variants are frequently injected
 * client-side after initial load.
 */
export async function extractHtml(page) {
  return page.content();
}
