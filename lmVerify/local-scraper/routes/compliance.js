import express from "express";
import { crawlListing } from "../listing-crawler/index.js";
import { runCompliancePipeline } from "../services/compliancePipeline.js";

const router = express.Router();

/**
 * POST /api/compliance
 * Body: either
 *   { url }                          — crawl the listing fresh, then run post-OCR mapping & rule engine
 *   { url, text, platform }          — reuse raw text already available
 *     (e.g. from a prior POST /api/listing call) and skip re-crawling
 *
 * Runs the identical Stage 5/6 mapping & Stage 6/7 rule engine flow
 * from ComplianceEngine.
 */
router.post("/", async (req, res) => {
  const { url, text, platform, structuredData, metadata, productImages, images } = req.body;

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
    let listingData = null;

    if (!rawText || !rawText.trim()) {
      console.log(`\n🛒 [compliance] No text supplied — crawling listing: ${url}`);
      listingData = await crawlListing(url);
      rawText = listingData.text;
      resolvedPlatform = listingData.platform;
      crawledAt = listingData.crawledAt;
      finalUrl = listingData.url;
    }

    const resolvedStructuredData = structuredData || listingData?.structuredData || null;
    const resolvedMetadata = metadata || listingData?.metadata || null;
    const resolvedProductImages =
      productImages ||
      listingData?.images?.productImages ||
      images ||
      listingData?.images?.items ||
      [];

    console.log(`⚖️  [compliance] Running ComplianceEngine post-OCR mapping & rule engine for: ${finalUrl}`);
    const pipelineResult = await runCompliancePipeline(rawText, {
      url: finalUrl,
      platform: resolvedPlatform,
      crawledAt,
      structuredData: resolvedStructuredData,
      metadata: resolvedMetadata,
      productImages: resolvedProductImages,
    });

    return res.json({
      success: true,
      url: finalUrl,
      platform: resolvedPlatform || null,
      crawledAt,
      declarations: pipelineResult.declarations,
      packageRecord: pipelineResult.packageRecord,
      compliance: pipelineResult.compliance,
      summary: pipelineResult.summary,
      imageOcr: pipelineResult.imageOcr,
      listing: listingData ? {
        title: listingData.metadata?.title || null,
        images: listingData.images?.items || [],
        productImages: listingData.images?.productImages || [],
        imageCount: listingData.images?.count || 0,
      } : null,
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
