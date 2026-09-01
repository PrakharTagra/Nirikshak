// In-memory seed data for the prototype. Replace src/lib/api.js's internals
// with real HTTP calls once the scraping/compliance backend is ready — no
// page component needs to change, they only depend on api.js's exports.

let idCounter = 1000;
export function nextId() {
  idCounter += 1;
  return String(idCounter);
}

const SAMPLE_IMAGES = [
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Front+Pack",
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Back+Label",
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Side+Panel",
  "https://placehold.co/300x300/1e293b/e2e8f0?text=Nutrition+Info",
];

function makeFields(overrides = {}) {
  const base = [
    { id: 1, label: "Net quantity", value: "1000 g", found: true },
    { id: 2, label: "MRP (inclusive of taxes)", value: "Rs. 28.00", found: true },
    { id: 3, label: "Manufacturer / packer / importer name & address", value: "Tata Consumer Products Ltd, Kolkata", found: true },
    { id: 4, label: "Consumer care details", value: "1800-208-3000", found: true },
    { id: 5, label: "Month & year of manufacture/packing", value: null, found: false },
    { id: 6, label: "Country of origin", value: null, found: false },
    { id: 7, label: "Unit sale price (Rs./g or Rs./kg)", value: null, found: false },
  ];
  return base.map((f) => ({ ...f, ...(overrides[f.id] || {}) }));
}

function statusFromFields(fields) {
  const found = fields.filter((f) => f.found).length;
  if (found === fields.length) return "compliant";
  if (found === 0) return "non_compliant";
  return "partial";
}

function buildScan({ id, url, platform, title, scannedAt, fieldOverrides = {} }) {
  const extractedFields = makeFields(fieldOverrides);
  return {
    id,
    url,
    platform,
    title,
    scannedAt,
    status: statusFromFields(extractedFields),
    extractedFields,
    images: SAMPLE_IMAGES,
    rawText: [
      title,
      "MRP: Rs. 28.00 (Inclusive of all taxes)",
      "Net Wt: 1000g",
      "Marketed by: Tata Consumer Products Limited, 1 Bishop Lefroy Road, Kolkata - 700020",
      "Customer Care: 1800-208-3000",
      "FSSAI Lic. No. 10012021001234",
    ],
  };
}

export const initialScans = [
  buildScan({
    id: "1001",
    url: "https://www.amazon.in/dp/EXAMPLE001",
    platform: "Amazon.in",
    title: "Tata Salt Iodized Vacuum Evaporated Salt, 1kg",
    scannedAt: "2026-08-27T10:15:00.000Z",
    fieldOverrides: {},
  }),
  buildScan({
    id: "1002",
    url: "https://www.flipkart.com/product/EXAMPLE002",
    platform: "Flipkart",
    title: "Aashirvaad Shudh Chakki Atta, 5kg",
    scannedAt: "2026-08-26T14:40:00.000Z",
    fieldOverrides: {
      5: { value: "08/2026", found: true },
      6: { value: "India", found: true },
    },
  }),
  buildScan({
    id: "1003",
    url: "https://www.meesho.com/product/EXAMPLE003",
    platform: "Meesho",
    title: "Local Brand Turmeric Powder, 200g Pouch",
    scannedAt: "2026-08-25T09:05:00.000Z",
    fieldOverrides: {
      1: { value: null, found: false },
      3: { value: null, found: false },
      4: { value: null, found: false },
    },
  }),
  buildScan({
    id: "1004",
    url: "https://www.bigbasket.com/pd/EXAMPLE004",
    platform: "BigBasket",
    title: "Fortune Sunflower Oil, 1L Pouch",
    scannedAt: "2026-08-24T18:22:00.000Z",
    fieldOverrides: {
      5: { value: "07/2026", found: true },
      7: { value: "Rs. 145 / L", found: true },
    },
  }),
];
