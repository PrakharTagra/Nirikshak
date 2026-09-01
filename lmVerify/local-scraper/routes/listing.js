import express from "express";
import { crawlListing } from "../listing-crawler/index.js";

const router = express.Router();

router.post("/", async (req, res) => {
  const { url } = req.body;

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
    return res.json({ success: true, data });
  } catch (err) {
    console.error("Listing crawl error:", err);
    return res.status(500).json({ error: "Listing crawl failed.", detail: err.message });
  }
});

export default router;
