import express from "express";
import { crawlListing } from "../listing-crawler/index.js";
import { runCompliancePipeline } from "../services/compliancePipeline.js";

const router = express.Router();

router.post("/", async (req, res) => {
  const { url, checkCompliance = false } = req.body;

  if (!url) {
    return res.status(400).json({ error: "url is required." });
  }

  try {
    new URL(url);
  } catch {
    return res.status(400).json({ error: "Invalid URL format." });
  }

  try {
    console.log(`\n🛒 Crawling product listing: ${url}`);
    const data = await crawlListing(url);

    let complianceResult = null;
    if (checkCompliance || req.query.verify === "true") {
      console.log(`⚖️  [listing] Running ComplianceEngine post-OCR mapping & rule engine for: ${url}`);
      complianceResult = await runCompliancePipeline(data.text, {
        url: data.url,
        platform: data.platform,
        crawledAt: data.crawledAt,
      });
    }

    return res.json({
      success: true,
      data,
      compliance: complianceResult ? {
        declarations: complianceResult.declarations,
        packageRecord: complianceResult.packageRecord,
        compliance: complianceResult.compliance,
        summary: complianceResult.summary,
      } : null,
    });
  } catch (err) {
    console.error("Listing crawl error:", err);
    return res.status(500).json({ error: "Listing crawl failed.", detail: err.message });
  }
});

export default router;
