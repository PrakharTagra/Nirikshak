import "dotenv/config";
import express from "express";
import cors from "cors";

import scrapeRouter from "./routes/scrape.js";
import listingRouter from "./routes/listing.js";
import complianceRouter from "./routes/compliance.js";
import reportsRouter from "./routes/reports.js";

const app = express();

app.use(cors({
  origin: true,
  methods: ["GET", "POST", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"],
}));

app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: true }));

app.use("/api/scrape", scrapeRouter);
app.use("/api/listing", listingRouter);
app.use("/api/compliance", complianceRouter);
app.use("/reports", reportsRouter);
app.use("/api/reports", reportsRouter);

app.get("/api/health", (req, res) => res.json({ status: "ok", role: "local-scraper" }));
app.get(["/", "/ping", "/api/ping"], (req, res) => {
  res.status(200).json({
    status: "ok",
    message: "pong",
    service: "local-scraper",
    uptimeSeconds: Math.floor(process.uptime()),
    timestamp: new Date().toISOString(),
  });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Local scraper running on http://localhost:${PORT}`);

  // Automatic Keep-Alive Self-Pinger (prevents Render free tier from sleeping)
  const keepAliveUrl = process.env.RENDER_EXTERNAL_URL || process.env.KEEP_ALIVE_URL;
  if (keepAliveUrl) {
    const pingTarget = keepAliveUrl.endsWith('/ping') ? keepAliveUrl : `${keepAliveUrl.replace(/\/+$/, '')}/ping`;
    const intervalMinutes = Number(process.env.KEEP_ALIVE_INTERVAL_MINUTES) || 12;
    console.log(`📡 [Keep-Alive] Self-ping active for ${pingTarget} every ${intervalMinutes} minutes`);
    setTimeout(() => {
      const doPing = async () => {
        try {
          const resp = await fetch(pingTarget);
          console.log(`[Keep-Alive] Ping sent to ${pingTarget} -> ${resp.status}`);
        } catch (err) {
          console.warn(`[Keep-Alive] Ping error:`, err.message);
        }
      };
      doPing();
      setInterval(doPing, intervalMinutes * 60 * 1000);
    }, 10000);
  }
});
