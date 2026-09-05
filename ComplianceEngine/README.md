# Nirikshak — Legal Metrology Compliance Engine

The **ComplianceEngine** is the self-contained backend analysis pipeline for verifying packaged commodities against the **Legal Metrology (Packaged Commodities) Rules, 2011** (SIH Problem Statement 26034).

It accepts field package photos or online listing images and produces a comprehensive statutory compliance assessment alongside a formal audit PDF report complete with photographic evidence exhibits.

---

## 🏛️ Pipeline Architecture

```text
Original Packaging Photos (Front PDP, MRP panel, Stamp, etc.)
               │
               ▼
   [Stage 2] Image Preprocessing (FastAPI + OpenCV)
   • Deskewing, glare reduction, contrast normalization
               │
               ▼
   [Stage 4] PaddleOCR Text & Coordinate Extraction
   • Word-level & line-level bounding boxes, text recognition
               │
               ▼
   [Stage 5] Packaging Font & Readability Analysis
   • Numeral height measurement, stroke width, Rule 9 contrast
               │
               ▼
   [Stage 6] Groq LLM Statutory Declaration Extraction
   • Maps raw OCR into canonical Legal Metrology declaration fields
               │
               ▼
   [Stage 7] Codified Legal Metrology Rule Engine
   • Rules 6, 7, 8, 9, 12, 18, 26 evaluation, clearance analysis
               │
               ▼
   [Stage 8] Violation Detection & Evidence Generation
   • Generates visual bounding-box evidence crops for all infractions
               │
               ▼
   [Stage 9] Statutory PDF Compliance Report (ReportLab)
   • 6-section formal audit report with photographic verification exhibits
```

---

## 📁 Standardized Folder Structure

```text
ComplianceEngine/
├── stage2_preprocessing/        # OpenCV Preprocessing microservice (FastAPI on :8000)
├── stage4_ocr/                  # PaddleOCR text extraction engine
├── stage5_font_analysis/        # Packaging font geometry & readability scripts
├── stage9_reporting/            # Statutory PDF report generator (ReportLab)
├── orchestrator/                # Node.js pipeline runner, rule engine, & CLI
│   ├── src/                     # Pipeline source code
│   ├── test/                    # Comprehensive unit tests
│   ├── input/                   # Default inspection image directory
│   └── package.json
├── output/                      # Shared outputs (product_<n> folders, PDF reports, JSON)
├── docker-compose.yml           # Multi-container deployment configuration
├── Dockerfile                   # Orchestrator & ReportLab container specification
├── run_engine.bat               # Windows one-click runner
├── run_engine.sh                # Linux/macOS runner
└── README.md                    # This deployment guide
```

*Note: Backward-compatibility junctions and aliases (`STAGE-2`, `STAGE-4`, `STAGE-5`, `STAGE-9`, `deployment`) are maintained to ensure zero disruption to legacy workflows.*

---

## 🚀 Deployment Options

### Option 1: Docker Compose (Recommended for Production)

Deploy both the Python Preprocessing/OCR microservice and the Node.js Orchestrator with one command:

```bash
cd ComplianceEngine
docker compose up -d
```

### Option 2: Local Development / Native Deployment

#### Step 1: Start the Python Preprocessor & OCR Service
```bash
cd stage2_preprocessing
python -m pip install -r requirements.txt
python -m pip install -r ../stage4_ocr/requirements.txt
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000
```

#### Step 2: Install Stage 9 Reporting Dependencies
```bash
cd ../stage9_reporting
python -m pip install -r requirements.txt
```

#### Step 3: Configure Orchestrator Environment
```bash
cd ../orchestrator
npm install
cp .env.example .env
```
Ensure `.env` contains:
```env
PREPROCESSOR_URL=http://127.0.0.1:8000
EXTRACTION_PROVIDER=groq
GROQ_API_KEY=your_groq_api_key_here
GROQ_MODEL=openai/gpt-oss-20b
GROQ_FALLBACK_TO_REGEX=true
```

#### Step 4: Run an Inspection
```bash
# Process all product folders in input/
node src/cli.js

# Process a specific multi-panel product (e.g. Front PDP + Bottom Stamp):
node src/cli.js path/to/pdp.jpg path/to/stamp.jpg

# Or use the one-click runner:
# Windows:
..\run_engine.bat
# Linux/macOS:
../run_engine.sh cli path/to/image.jpg
```

---

## 🧪 Testing

Run the full rule engine, clearance detection, and multi-piece net quantity test suite:

```bash
cd orchestrator
node test/testNetQuantityMultiPieceLayer.js
```

Or test Stage 9 report generation directly:
```bash
python stage9_reporting/report_generator.py \
  --input output/product_4/mapped.json \
  --output output/product_4/report.pdf \
  --image-dir output/product_4
```
