# Legal Metrology Compliance — Deployment Engine

A self-contained, **zero-required-dependency** Node.js pipeline:
**images in → PDF compliance report out.**

This is the deployable execution of the pipeline described in the
project's execution plan — Stages 1 through 9 collapsed into 7 code
stages (Stage 8's violation scoring lives inside Stage 6's rule
engine; Stage 10's dashboard/DB/search is a separate system, out of
scope for this engine, which only produces the PDF).

## Folder Structure

```
deployment-engine/
├── package.json
├── .env.example              # copy to .env to override defaults
├── README.md
├── input/                    # drop package photos here
├── output/                   # generated PDF reports land here
├── temp/                     # scratch space for future real preprocessing
├── test/
│   └── generateSampleImages.js   # creates 2 demo fixtures, no deps needed
└── src/
    ├── cli.js                # entry point
    ├── config/
    │   └── index.js          # provider selection + paths (env-driven)
    ├── utils/
    │   ├── logger.js
    │   ├── fileHelpers.js     # dir setup, image discovery, dependency-free PNG/JPEG dimension reader
    │   └── simplePdfWriter.js # dependency-free PDF generator
    ├── providers/             # swappable real-vs-mock implementations
    │   ├── detection/
    │   │   └── mockDetectionProvider.js
    │   └── ocr/
    │       ├── mockOcrProvider.js
    │       └── tesseractOcrProvider.js   # real integration, documented, not wired in by default
    └── pipeline/
        ├── stage1_preprocess.js          # image read + preprocessing hook
        ├── stage2_labelDetection.js      # PDP detection + px-to-mm calibration
        ├── stage3_ocr.js                 # text extraction orchestration
        ├── stage4_fontAnalysis.js        # px -> mm numeral height/width (Rule 7)
        ├── stage5_extraction.js          # NLP/regex -> structured package record
        ├── stage6_ruleEngine/            # the full rule engine (unchanged from the standalone package)
        │   ├── index.js
        │   ├── schedules.js
        │   └── ruleEngine.js
        ├── stage7_report.js              # PDF report generation
        └── orchestrator.js               # runs stage 1 -> 7 for one image / a batch
```

## Quick Start

```bash
cd deployment-engine
npm run generate-samples   # creates 2 tiny demo images in input/
node src/cli.js            # processes every image in input/, writes PDFs to output/
```

Or point it at your own images:

```bash
node src/cli.js path/to/photo.jpg      # single image
node src/cli.js path/to/photo_folder   # every image in a folder
```

Each run prints a per-image status and the exact PDF path:

```
sample_biscuit_noncompliant.png -> NON-COMPLIANT (10 issue(s)) -> output/sample_biscuit_noncompliant_report_....pdf
sample_salt_compliant.png -> COMPLIANT -> output/sample_salt_compliant_report_....pdf
```

## What's real vs. mocked right now

| Stage | Status | Notes |
|---|---|---|
| 1. Preprocess | **Real** (dimension reading) / stub (image ops) | Reads actual PNG/JPEG width/height with zero dependencies. Deskew/denoise/contrast-normalize hooks are marked in the file for `sharp`/OpenCV. |
| 2. Label/PDP detection | **Mocked** | No trained detector is available in this environment. Returns a deterministic scenario keyed off the filename so the rest of the pipeline can be exercised realistically. Swap `providers/detection/mockDetectionProvider.js` for a real YOLOv8 call. |
| 3. OCR | **Mocked** (+ a real, documented Tesseract integration ready to enable) | `mockOcrProvider.js` returns canned label text; `tesseractOcrProvider.js` is real code using `tesseract.js` — install it and set `OCR_PROVIDER=tesseract` to use it. |
| 4. Font analysis | **Real logic**, fed by whatever Stage 3 returns | The px→mm math and Rule 7 threshold lookups are genuine; accuracy depends entirely on Stage 2's calibration and Stage 3's geometry being real. |
| 5. Extraction (NLP) | **Real regex-based classification**, with an NER upgrade path documented | Works whether or not OCR supplies `fieldHint` — see `classifyLine()`. |
| 6. Rule engine | **Fully real** | Same engine delivered standalone earlier — every rule/exception from the compliance checklist, unit-tested against both a compliant and a non-compliant scenario. |
| 7. Report (PDF) | **Fully real** | Dependency-free PDF writer; validated with `pypdf` to confirm the output is a structurally correct, text-extractable PDF. |

## Swapping in real providers

1. **OCR** — set `OCR_PROVIDER=tesseract` in `.env`, then `npm install tesseract.js`. For Google Cloud Vision instead, write `providers/ocr/visionOcrProvider.js` matching the same `{ lines: [{text, heightPx, fieldHint?}] }` return shape and register it in `stage3_ocr.js`.
2. **Detection** — replace `providers/detection/mockDetectionProvider.js`'s `detect()` with a real YOLOv8 (or similar) inference call. Keep the return shape (`category`, `physicalForm`, `pdpBoxPx`, `pxPerMm`, `pdpAreaCm2`, `isBlownFormedMoldedEmbossedOrPerforated`) — everything downstream depends only on that contract, not on how it was produced.
3. **Image preprocessing** — add `sharp` calls in `stage1_preprocess.js` where the hook comment is.
4. **PDF richness** — if you need embedded evidence photos or a logo, swap `utils/simplePdfWriter.js` for `pdfkit` inside `stage7_report.js` only; nothing else needs to change.
5. **Category taxonomy** — `stage5_extraction.js` currently sets `isFoodArticle: false` and several other commodity flags to safe defaults because they can't be inferred from label text alone. Once your product taxonomy/category database exists, look these up there instead of hardcoding.

## Known limitations (by design, for this scope)

- **Single-image only** — Rule 19/22's Maximum Permissible Error (lot statistical testing) needs *multiple physical measurements of the same lot*, which a single photo can't provide. The rule engine supports it (`pkg.quantitySamples`); this pipeline just doesn't populate it. Feed it from your app if/when you add multi-unit weighing.
- **No registration check** — Rules 27-30 require a database lookup against your manufacturer/packer registry, not image analysis. Add that as a separate check in your backend, using the `category`/`manufacturer` fields this engine already extracts.
- **No dashboard/storage** — this engine is deliberately just "images in, PDF out," per the scope requested. Stage 10 (storage/dashboard/search) belongs in the full system's backend (see the role-architecture and pipeline execution-plan documents).
