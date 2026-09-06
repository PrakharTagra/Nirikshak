import "dotenv/config";
import express from "express";
import cors from "cors";

import scrapeRouter from "./routes/scrape.js";
import listingRouter from "./routes/listing.js";
import complianceRouter from "./routes/compliance.js";

const app = express();

app.use(cors({
  origin: true,
  methods: ["GET", "POST", "OPTIONS"],
  allowedHeaders: ["Content-Type", "Authorization"],
}));

app.use(express.json());

app.use("/api/scrape", scrapeRouter);
app.use("/api/listing", listingRouter);
app.use("/api/compliance", complianceRouter);

app.get("/api/health", (req, res) => res.json({ status: "ok", role: "local-scraper" }));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () =>
  console.log(`Local scraper running on http://localhost:${PORT}`)
);
