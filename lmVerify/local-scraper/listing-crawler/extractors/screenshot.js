/**
 * Captures a full-page screenshot of the already-rendered page.
 *
 * Returned as base64 (rather than written to disk) so RawListingData stays
 * a single self-contained, JSON-serializable object regardless of how the
 * crawler is invoked (module call, HTTP route, queue worker, etc.) — the
 * caller decides whether/where to persist the image bytes.
 *
 * Defaults to JPEG at a moderate quality to keep payload size reasonable
 * for long product pages; pass `{ type: "png" }` for lossless capture.
 */
export async function captureScreenshot(page, { type = "jpeg", quality = 80 } = {}) {
  const options = { fullPage: true, type };
  if (type === "jpeg") {
    options.quality = quality;
  }

  const buffer = await page.screenshot(options);

  return {
    mimeType: type === "jpeg" ? "image/jpeg" : "image/png",
    base64: buffer.toString("base64"),
    byteLength: buffer.length,
  };
}
