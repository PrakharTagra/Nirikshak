# Listing crawler

Crawls a single e-commerce product page with `PlaywrightCrawler` and returns
a `RawListingData` object — no compliance checking yet, just evidence
capture (Phase 4 of the build plan).

## Status

| Phase | What | Status |
| --- | --- | --- |
| 1 | Load a product URL, wait for full render (network idle + lazy-scroll) | Done |
| 2 | Extract html, visible text, metadata, JSON-LD/script data, images (incl. lazy/srcset) | Done |
| 3 | Full-page screenshot | Done |
| 4 | Assemble the clean `RawListingData` object, expose `crawlListing(url)` | Done |
| 5 | Declaration extraction / Legal Metrology rule checking | Not started |

## `crawlListing(url) → RawListingData`

```js
import { crawlListing } from "./listing-crawler/index.js";

const data = await crawlListing("https://www.amazon.in/dp/...");
// {
//   url, platform, crawledAt,
//   html, text, images, screenshot, metadata, structuredData
// }
```

Exactly these 9 keys — `crawlListing` throws if the assembled object ever
has extras, so the contract can't silently drift.

## Files

```
listing-crawler/
  crawler.js              PlaywrightCrawler setup — loads + waits + scrolls
  index.js                crawlListing(url) — assembles RawListingData
  extractors/
    html.js               rendered page HTML
    text.js                visible page text (hidden nodes excluded)
    metadata.js            title/description/canonical/OG/Twitter tags
    structuredData.js      JSON-LD + framework hydration state / dataLayer
    images.js               <img>, lazy data-* attrs, srcset, <picture>
    screenshot.js           full-page screenshot (base64 jpeg/png)
  platforms/index.js      URL → platform id (amazon, flipkart, generic, ...)
  fixtures/
    sample-product.html    static fixture used by the test below
    serve.js                serves the fixture at http://localhost:4321
  test/
    testExtractors.mjs      unit test — see below
```

## Running it

```bash
cd local-scraper
npm install
npx playwright install          # downloads the Chromium build Playwright drives
npm start                       # http://localhost:5000
```

Then, from another terminal:

```bash
curl -X POST http://localhost:5000/api/listing \
  -H "Content-Type: application/json" \
  -d '{"url":"https://www.amazon.in/dp/SOME_PRODUCT"}'
```

Or call it against the bundled fixture instead of a live site:

```bash
npm run fixture:serve            # http://localhost:4321/sample-product.html
# in another terminal:
curl -X POST http://localhost:5000/api/listing \
  -H "Content-Type: application/json" \
  -d '{"url":"http://localhost:4321/sample-product.html"}'
```

## Testing without a browser install

`npm run test:extractors` runs the same extractor functions the real
crawler uses, against a JSDOM-rendered copy of the fixture page, and
asserts the final object matches the `RawListingData` contract exactly
(right keys, no extras, images/JSON-LD/lazy-loading all detected
correctly). Useful for CI or any environment where downloading a full
Chromium build isn't possible — it doesn't replace testing the real
crawler end-to-end, but it catches extractor/assembly bugs fast.

```bash
npm run test:extractors
```

## Next phase

Declaration extraction: turn `RawListingData.text` / `.structuredData` /
`.images` into the checklist of Legal Metrology declarations (net
quantity, MRP, manufacturer address, etc.) with found/missing status —
this is what the frontend's compliance table (`ScanResultView`) currently
mocks. Likely a new `listing-crawler/rules/` module that takes
`RawListingData` in and returns the declaration checklist, kept separate
from crawling so it can be tested and iterated on without re-running a
browser each time.
