# Nirikshak — Statutory Compliance Pipeline Execution Plan
*Legal Metrology (Packaged Commodities) Rules, 2011 — Smart India Hackathon (SIH) 26034*

---

## 🏛️ System Architecture Overview

```text
[Stage 1] Image Acquisition (Field Capture / Web Scraper)
                │
                ▼
[Stage 2] Image Preprocessing (FastAPI + OpenCV) ───▶ [stage2_preprocessing]
                │
                ▼
[Stage 4] PaddleOCR Text & Box Extraction ─────────▶ [stage4_ocr]
                │
                ▼
[Stage 5] Font Geometry & Readability Analysis ────▶ [stage5_font_analysis]
                │
                ▼
[Stage 6] Groq LLM Statutory Field Extraction ─────▶ [orchestrator/stage6]
                │
                ▼
[Stage 7] Codified Legal Metrology Rule Engine ────▶ [orchestrator/stage7]
                │
                ▼
[Stage 8] Violation Evidence Photographic Crops ───▶ [orchestrator/stage8]
                │
                ▼
[Stage 9] Statutory PDF Compliance Report ────────▶ [stage9_reporting]
                │
                ▼
[Stage 10] Web Inspection Portal & Retrieval ──────▶ [lmVerify]
```

---

## 📁 Repository Directory Structure

```text
Nirikshak/
├── ComplianceEngine/                 # Self-contained backend compliance analysis engine
│   ├── stage2_preprocessing/         # OpenCV deskewing, glare removal, contrast normalization
│   │   ├── app/                      # FastAPI microservice (`main.py`, `preprocessing.py`)
│   │   ├── Dockerfile                # Python preprocessor container build
│   │   └── requirements.txt          # fastapi, uvicorn, opencv-python, pillow
│   ├── stage4_ocr/                   # PaddleOCR text extraction engine
│   │   ├── ocr/                      # PaddleOCR runner, detector, recognizer, contrast check
│   │   └── requirements.txt          # paddlepaddle, paddleocr
│   ├── stage5_font_analysis/         # Packaging font geometry & readability scripts
│   │   ├── font_geometry.py          # Numeral stroke width & height verification
│   │   ├── clearance_check.py        # Rule 8(1) surrounding free-area measurement
│   │   ├── dimension_resolver.py     # Package dimension parsing & scale resolution
│   │   └── readability_analyzer.py   # Rule 9(1)(b) color contrast analyzer
│   ├── stage9_reporting/             # Official Statutory PDF Report Generator (ReportLab)
│   │   ├── report_generator.py       # CLI entrypoint for generating audit PDF reports
│   │   ├── compliance_mapper.py      # Maps structured inspection JSON into Section 1-6 models
│   │   ├── pdf_builder.py            # ReportLab layout engine with NumberedCanvas page numbering
│   │   ├── image_handler.py          # High-resolution image cropping and photographic exhibits
│   │   ├── json_validator.py         # Schema validator for mapped inspection results
│   │   ├── styles.py                 # Typography, palettes, and statutory report styles
│   │   └── requirements.txt          # reportlab, pillow
│   ├── orchestrator/                 # Node.js pipeline runner, rule engine, & CLI
│   │   ├── src/                      # Orchestrator core
│   │   │   ├── cli.js                # CLI entrypoint for folder, image, or batch inspection
│   │   │   ├── config/index.js       # Central environment & path configuration
│   │   │   ├── integrations/         # HTTP bridge to Stage 2/4 FastAPI preprocessor
│   │   │   ├── pipeline/             # Stages 2, 4, 5, 6, 7, 8, 9 execution stages
│   │   │   │   ├── groqDeclarationExtractor.js     # Stage 6: LLM statutory extraction
│   │   │   │   ├── netQuantityClearanceLayer.js    # Stage 5/7: Multi-piece & clearance
│   │   │   │   ├── netQuantityImageAnnotator.js    # Stage 8: Net Quantity bounding box
│   │   │   │   ├── violationEvidenceAnnotator.js   # Stage 8: Photographic evidence crops
│   │   │   │   ├── stage6_ruleEngine/              # Stage 7: Codified Rules (6, 7, 8, 9, 12...)
│   │   │   │   ├── stage7_report.js                # Stage 9: ReportLab child process invoker
│   │   │   │   └── orchestrator.js                 # Complete pipeline coordinator
│   │   │   ├── providers/            # OCR and detection abstraction providers
│   │   │   └── utils/                # Logging, PDF writer fallback, product ID counter
│   │   ├── test/                     # Unit & integration test suites
│   │   ├── input/                    # Packaging photos input directory
│   │   └── package.json              # Node.js dependencies (groq-sdk, dotenv, sharp)
│   ├── output/                       # Product scan folders (`product_<n>/mapped.json`, `report.pdf`)
│   ├── docker-compose.yml            # Multi-service deployment config
│   ├── Dockerfile                    # Container build configuration
│   ├── run_engine.bat                # Windows quick launcher
│   ├── run_engine.sh                 # Linux/macOS quick launcher
│   └── README.md                     # Engine documentation & setup guide
├── lmVerify/                         # Web portal & e-commerce scraping system
│   ├── frontend/                     # React web dashboard for Field Inspectors & Admins
│   └── local-scraper/                # Web scraper & crawler for e-commerce listings
├── docs/                             # Statutory references & technical architecture
│   ├── Execution_Plan_Compliance_Pipeline.md
│   ├── Legal_Metrology_Compliance_Checklist.md
│   └── System_Architecture_Roles.md
├── .gitignore                        # Standardized repository gitignore
└── README.md                         # Master project guide
```

---

## ⚙️ Stage-by-Stage Execution Breakdown

### Stage 1: Image Acquisition
- **Sources**: 
  1. Field capture: Mobile app captures package angles (Principal Display Panel, stamp panel, MRP panel).
  2. Digital inspection: `lmVerify/local-scraper` extracts packaging images from Amazon, Flipkart, Blinkit, etc.
- **Output**: High-resolution image files (`.jpg`, `.png`, `.webp`, `.heic`).

### Stage 2: Image Preprocessing (`stage2_preprocessing`)
- **Technology**: OpenCV, NumPy, FastAPI.
- **Operations**:
  - Auto-orientation deskewing and perspective normalization.
  - Bilateral noise reduction, contrast enhancement, and glare removal.
  - Encoding preprocessed image to base64.
- **Endpoint**: `POST http://127.0.0.1:8000/preprocess/ocr`
- **Output**: Clean preprocessed PNG saved to `output/product_<n>/preprocessed.png`.

### Stage 4: Text Extraction & OCR (`stage4_ocr`)
- **Technology**: PaddleOCR (Hindi + English models).
- **Operations**:
  - Runs directly on the Stage 2 preprocessed image.
  - Extracts per-word and per-line bounding boxes: `[[x1, y1], [x2, y2], [x3, y3], [x4, y4]]`.
  - Measures numeral pixel heights and confidence scores.
- **Output**: JSON payload with `extracted_text`, `ocr.lines`, and pixel dimensions.

### Stage 5: Packaging Font & Readability Analysis (`stage5_font_analysis`)
- **Technology**: Python OpenCV / Node.js geometric analyzer.
- **Operations**:
  - **Rule 7**: Table I / Table II minimum numeral height verification based on net quantity band.
  - **Rule 7(3)**: Aspect ratio verification (numeral width $\ge \frac{1}{3}$ height).
  - **Rule 8(1)**: Surrounding clear area measurement (clearance $\ge$ height above/below, $\ge 2\times$ height left/right).
  - **Rule 9(1)(b)**: Color contrast ratio calculation between text luminance and packaging background.
- **Output**: `fontAnalysis` and `netQuantityClearance` metric objects.

### Stage 6: Declaration Extraction (`orchestrator/src/pipeline/groqDeclarationExtractor.js`)
- **Technology**: Groq LLM API (`openai/gpt-oss-20b`) with deterministic regex fallback.
- **Operations**:
  - Maps noisy OCR lines into canonical Legal Metrology declaration fields:
    - Manufacturer / Packer / Importer details (Name & complete address).
    - Generic product identity / name.
    - Net Quantity (value, unit, multi-piece count).
    - Maximum Retail Price (MRP value, currency, tax inclusive statement).
    - Month and Year of Manufacture / Packaging.
    - Consumer Care contact (Email, phone, physical address).
    - Packaging dimensions / size.
- **Output**: Canonical `declarations` dictionary.

### Stage 7: Codified Rule Engine (`orchestrator/src/pipeline/stage6_ruleEngine`)
- **Technology**: Node.js deterministic rules engine.
- **Operations**:
  - **Applicability & Exemptions**: Rule 3 (>25 kg/L) and Rule 26 (<10 g/ml, fast food, drugs).
  - **Mandatory Declarations Check**: Rule 6(1)(a) through Rule 6(1)(e).
  - **Standard Units & Multi-Piece**: Rule 12(2) individual piece and total weight verification.
  - **MRP Formatting**: Rule 6(1)(da) inclusive of all taxes.
  - **Date Format**: Rule 6(1)(d) month and year syntax.
- **Output**: `complianceResult` containing `status`, `summary`, and detailed `violations` array.

### Stage 8: Violation Evidence Generation (`orchestrator/src/pipeline/violationEvidenceAnnotator.js`)
- **Technology**: Sharp / Canvas / Pillow image cropping.
- **Operations**:
  - Locates OCR bounding boxes corresponding to every detected infraction.
  - Generates photographic annotated crops (`violation_evidence_1.png`, `violation_evidence_2.png`, etc.) with highlighted red/green boundary indicators.
  - Generates full panel green bounding box overlay on Net Quantity (`annotated_panel_0.png`).
- **Output**: Crop images saved directly into `output/product_<n>/`.

### Stage 9: Statutory PDF Report Generator (`stage9_reporting`)
- **Technology**: ReportLab (Python), ReportLab NumberedCanvas.
- **Operations**:
  - Builds a formal 6-section statutory inspection audit report:
    1. Inspection Header & Statutory Citation.
    2. Executive Summary & Compliance Score.
    3. Mandatory Declarations Audit Matrix (Rule-by-rule pass/fail table).
    4. Legibility & Geometric Analysis (Heights, clearance, contrast).
    5. Detailed Statutory Findings & Photographic Verification Exhibits.
    6. Regulatory Assessment & Statutory Penalties (Rule 32 liability).
- **Execution**: Invoked synchronously via child process from `orchestrator/src/pipeline/stage7_report.js`.
- **Output**: `output/product_<n>/report.pdf`.

### Stage 10: Review Portal & Web Dashboard (`lmVerify`)
- **Technology**: React, TailwindCSS, Express.js.
- **Operations**:
  - Role-based inspector dashboards (Junior Field Inspector, Digital Market Inspector, Senior Reviewing Officer, Admin).
  - Audit trail, PDF download, and digital approval workflow.

---

## 🚀 Execution Commands

### 1. Launching the Backend Preprocessor & OCR Microservice (Port 8000)
```bash
# Navigate to stage2_preprocessing:
cd ComplianceEngine/stage2_preprocessing

# Install dependencies (first time only):
python -m pip install -r requirements.txt
python -m pip install -r ../stage4_ocr/requirements.txt

# Start FastAPI service:
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000
```

### 2. Running Compliance Pipeline Inspections (CLI)
```bash
# In a new terminal, navigate to orchestrator:
cd ComplianceEngine/orchestrator

# Run full input directory:
node src/cli.js

# Run a single product with multiple panels (e.g. Front PDP + Bottom Stamp):
node src/cli.js input/HairRemoval/panel_front.jpg input/HairRemoval/panel_bottom.jpg

# Run batch mode across multiple products:
node src/cli.js --batch input/HairRemoval input/ALLOUT
```

### 3. Running Stage 9 Report Generator Standalone
```bash
# Navigate to ComplianceEngine:
cd ComplianceEngine

# Generate official PDF report from any mapped inspection JSON:
python stage9_reporting/report_generator.py \
  --input output/product_4/mapped.json \
  --output output/product_4/report.pdf \
  --image-dir output/product_4
```

### 4. Running the Complete Automated Test Suite
```bash
cd ComplianceEngine/orchestrator
node test/testNetQuantityMultiPieceLayer.js
```

### 5. Running the Web Portal & E-Commerce Scraper (lmVerify)
```bash
# Terminal 1: React Frontend (Port 5173)
cd lmVerify/frontend
npm install
npm run dev

# Terminal 2: Scraper & Pipeline API (Port 5000)
cd lmVerify/local-scraper
npm install
node server.js
```
