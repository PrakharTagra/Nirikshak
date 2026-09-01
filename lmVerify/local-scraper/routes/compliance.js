import express from "express";
import { crawlListing } from "../listing-crawler/index.js";
import { runComplianceExtraction } from "../utils/llmCompliance.js";

const router = express.Router();

/**
 * POST /api/compliance
 * Body: either
 *   { url }                          — crawl the listing fresh, then check it
 *   { url, text, platform }          — reuse raw text you already have
 *     (e.g. from a prior POST /api/listing call) and skip re-crawling
 *
 * Response: { success, url, platform, crawledAt, compliance }
 * `compliance` is the structured report from utils/llmCompliance.js —
 * scope gates, all 7 Rule-6 declarations, format checks, overall status.
 */
router.post("/", async (req, res) => {
  const { url, text, platform } = req.body;

  if (!url) {
    return res.status(400).json({ error: "url is required." });
  }

  try {
    new URL(url);
  } catch {
    return res.status(400).json({ error: "Invalid URL format." });
  }

  try {
    let rawText = text;
    let resolvedPlatform = platform;
    let crawledAt = new Date().toISOString();
    let finalUrl = url;

    if (!rawText || !rawText.trim()) {
      console.log(`\n🛒 [compliance] No text supplied — crawling listing: ${url}`);
      const listing = await crawlListing(url);
      rawText = listing.text;
      resolvedPlatform = listing.platform;
      crawledAt = listing.crawledAt;
      finalUrl = listing.url;
    }

    console.log(`⚖️  [compliance] Running Legal Metrology extraction for: ${finalUrl}`);
    const compliance = await runComplianceExtraction(rawText, {
      url: finalUrl,
      platform: resolvedPlatform,
    });

    return res.json({
      success: true,
      url: finalUrl,
      platform: resolvedPlatform || null,
      crawledAt,
      compliance,
    });
  } catch (err) {
    console.error("Compliance check error:", err);
    const isModelError =
      err?.status === 404 || err?.error?.error?.code === "model_not_found";
    const detail = isModelError
      ? `${err.message} — set GROQ_MODEL in local-scraper/.env to a model currently listed at https://console.groq.com/docs/models`
      : err.message;
    return res.status(500).json({ error: "Compliance check failed.", detail });
  }
});

export default router;
