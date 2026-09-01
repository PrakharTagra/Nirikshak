// Mock API layer. Every function here simulates a network call with a
// delay and returns plausible data. Swap the internals for real `fetch`
// calls to your backend (see .env.example for VITE_API_BASE_URL) — page
// components only import from this file, so nothing else needs to change.

import { initialScans, nextId } from "./mockData.js";

const DELAY = 700;
const wait = (ms = DELAY) => new Promise((resolve) => setTimeout(resolve, ms));

// In-memory store, seeded once per page load.
let scans = [...initialScans];

export async function loginRequest(email, password) {
  await wait(600);
  if (!email.trim() || !password.trim()) {
    throw new Error("Enter both email and password.");
  }
  if (password.length < 4) {
    throw new Error("Incorrect email or password.");
  }
  return {
    name: email.split("@")[0].replace(/[._]/g, " ") || "Enforcement Officer",
    email,
    role: "Enforcement Officer",
  };
}

export async function getScans() {
  await wait(500);
  return [...scans].sort((a, b) => new Date(b.scannedAt) - new Date(a.scannedAt));
}

export async function getScanById(id) {
  await wait(400);
  const found = scans.find((s) => s.id === id);
  if (!found) throw new Error("Scan not found.");
  return found;
}

const SAMPLE_IMAGES = [
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Front+Pack",
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Back+Label",
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Side+Panel",
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Nutrition+Info",
];

function detectPlatform(url) {
  const host = (() => {
    try {
      return new URL(url).hostname;
    } catch {
      return "";
    }
  })();
  if (host.includes("amazon")) return "Amazon.in";
  if (host.includes("flipkart")) return "Flipkart";
  if (host.includes("meesho")) return "Meesho";
  if (host.includes("bigbasket")) return "BigBasket";
  if (host.includes("jiomart")) return "JioMart";
  return host || "Unknown platform";
}

// TODO: replace this whole function body with a real call, e.g.:
//   const res = await fetch(`${import.meta.env.VITE_API_BASE_URL}/scrape`, {
//     method: "POST",
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify({ url }),
//   });
//   if (!res.ok) throw new Error("Scan failed");
//   const scan = await res.json();
//   scans = [scan, ...scans];
//   return scan;
export async function scanUrl(url) {
  await wait(1400);

  let parsed;
  try {
    parsed = new URL(url);
  } catch {
    throw new Error("Enter a valid listing URL.");
  }

  const extractedFields = [
    { id: 1, label: "Net quantity", value: "1000 g", found: true },
    { id: 2, label: "MRP (inclusive of taxes)", value: "Rs. 28.00", found: true },
    { id: 3, label: "Manufacturer / packer / importer name & address", value: "Sample Foods Pvt Ltd, Pune", found: true },
    { id: 4, label: "Consumer care details", value: "1800-111-2222", found: true },
    { id: 5, label: "Month & year of manufacture/packing", value: null, found: false },
    { id: 6, label: "Country of origin", value: "India", found: true },
    { id: 7, label: "Unit sale price (Rs./g or Rs./kg)", value: null, found: false },
  ];

  const scan = {
    id: nextId(),
    url: parsed.href,
    platform: detectPlatform(parsed.href),
    title: "Scanned listing — " + parsed.pathname.split("/").filter(Boolean).pop() || "Product listing",
    scannedAt: new Date().toISOString(),
    status: extractedFields.every((f) => f.found)
      ? "compliant"
      : extractedFields.some((f) => f.found)
      ? "partial"
      : "non_compliant",
    extractedFields,
    images: SAMPLE_IMAGES,
    rawText: [
      "Product listing scraped from " + detectPlatform(parsed.href),
      "MRP: Rs. 28.00 (Inclusive of all taxes)",
      "Net Wt: 1000 g",
      "Marketed by: Sample Foods Pvt Ltd, Pune - 411001",
      "Customer Care: 1800-111-2222",
      "Country of Origin: India",
    ],
  };

  scans = [scan, ...scans];
  return scan;
}
