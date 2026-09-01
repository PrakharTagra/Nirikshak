# Execution Plan: Image → Compliance Report Pipeline
*Legal Metrology (Packaged Commodities) Compliance System — SIH Problem Statement 26034*

---

## Stage-by-Stage Execution Plan

### Stage 1 — Image Acquisition
**What happens:** Field inspector captures a photo (or multiple angles) of a packaged commodity via the mobile app, or the system pulls product listing images from an e-commerce page.
**Steps:**
1. Mobile app captures image(s) of the package's principal display panel and any other panel with declarations.
2. Metadata is attached: GPS location, inspector ID, timestamp, product category (optional).
3. Image is uploaded to cloud storage and a scan record is created in the database with status "Pending."

**Tech:** React Native / Flutter (camera capture), REST API upload, AWS S3 / Firebase Storage, MongoDB/PostgreSQL (scan metadata record).

---

### Stage 2 — Image Preprocessing
**What happens:** Raw image is cleaned up so downstream detection/OCR is reliable.
**Steps:**
1. Auto-orientation correction (deskew) and cropping.
2. Noise reduction, contrast/brightness normalization, glare removal.
3. Resolution check — reject/flag images below a usability threshold and prompt re-capture.

**Tech:** OpenCV (Python), PIL/Pillow.

---

### Stage 3 — Label / PDP Region Detection
**What happens:** The system locates the Principal Display Panel (PDP) and other label regions within the full package image, since declarations must be checked specifically within the PDP under Rule 8.
**Steps:**
1. Object-detection model identifies label/PDP bounding boxes on the package.
2. Each detected region is cropped for focused analysis.
3. A reference object (ruler/known-size marker) in frame, or known package dimensions, is used to establish a pixel-to-mm scale for later font-height measurement (needed for Rule 7's Table I/II checks).

**Tech:** YOLOv8 / Detectron2 (object detection), OpenCV (calibration/scale).

---

### Stage 4 — Text Extraction (OCR)
**What happens:** All printed text on the label region is extracted along with its bounding box and pixel height.
**Steps:**
1. Run OCR across the cropped PDP region.
2. Retain per-character/per-line bounding boxes (needed for font-height calculation, not just plain text).
3. Handle multi-language text (Hindi Devnagri + English, per Rule 9(4)).

**Tech:** Google Cloud Vision API / AWS Textract / PaddleOCR / Tesseract OCR (with Hindi + English language packs).

---

### Stage 5 — Font Size & Readability Analysis
**What happens:** Measured pixel heights of RSP and net-quantity numerals are converted to real-world mm using the Stage 3 scale and checked against Rule 7's Table I / Table II minimums.
**Steps:**
1. Map OCR bounding-box heights to mm using the calibration scale.
2. Classify each declaration by net-quantity band (e.g., "up to 200 g/ml") to pick the correct minimum-height row.
3. Flag numerals below the required height, and check width ≥ ⅓ height (per Rule 7(3)).
4. Check contrast between numeral colour and label background (Rule 9(1)(b)).

**Tech:** OpenCV (contour/height measurement), custom Python scale-conversion logic.

---

### Stage 6 — Declaration Extraction & Classification (NLP/NER)
**What happens:** Raw OCR text is parsed into the specific mandatory-declaration fields required by Rule 6: manufacturer/packer/importer name & address, net quantity, MRP, month/year of manufacture, consumer-care contact, dimensions.
**Steps:**
1. Regex + pattern rules for structured fields (MRP: "MRP Rs.../₹...", net quantity units g/ml/kg/l/N/U, dates).
2. NER model to tag free-text spans as ADDRESS, MANUFACTURER, PACKER, IMPORTER, CONTACT.
3. Normalize extracted values (units, date formats) into a structured JSON record per package.

**Tech:** spaCy / Hugging Face Transformers (fine-tuned NER), regex libraries, LLM-assisted extraction (e.g., Claude API) as a fallback/verification layer for ambiguous label text.

---

### Stage 7 — Rule-Based Compliance Engine
**What happens:** The structured declaration JSON is run against a codified version of the Legal Metrology (Packaged Commodities) Rules, 2011 (see the compliance checklist already prepared).
**Steps:**
1. Applicability filter — check Rule 3 thresholds (>25kg/25L, industrial/institutional) and Rule 26 blanket exemptions (≤10g/ml, fast food, drugs, agri produce >50kg) to decide if the rules even apply.
2. Mandatory-field presence check against Rule 6's list, applying the correct exceptions (bidi/LPG date exemption, food-article MRP carve-out, etc.).
3. Font-size pass/fail from Stage 5.
4. Standard-package-size check against the Second Schedule (or valid "non-standard size" declaration).
5. "When packed" qualifier validity check against the Third Schedule.
6. Unit-of-declaration check against the Fourth Schedule exceptions.
7. Maximum Permissible Error check (if multiple units of the same product/lot are scanned) against the First Schedule bands.
8. Wholesale-package-specific checks (Rule 24) if the image is of a wholesale package.

**Tech:** Rules encoded as structured JSON/YAML "rule definitions" (one entry per rule/sub-rule with condition + exception logic), evaluated by a rules engine — e.g., a custom Python/Node.js rule evaluator, or a lightweight rules engine library (e.g., `json-rules-engine` for Node.js, or `durable_rules` for Python).

---

### Stage 8 — Violation Detection & Scoring
**What happens:** Each failed check becomes a discrete violation entry with severity and the specific rule/sub-rule cited.
**Steps:**
1. Aggregate all failed checks from Stage 7 into a violation list, each tagged with the exact rule number (e.g., "Rule 7(2) — numeral height 0.7mm, required 1mm").
2. Assign severity/penalty reference (Rule 32: ₹4,000 for Rules 27–31 contraventions, ₹2,000 otherwise).
3. Compute an overall compliance status: Compliant / Non-Compliant / Needs Manual Review (for low-confidence OCR/NER fields).

**Tech:** Backend business logic (Node.js/Express or Python/FastAPI).

---

### Stage 9 — Report Generation
**What happens:** A formal compliance/non-compliance report is generated with all findings, supporting photo evidence, and rule citations.
**Steps:**
1. Populate a report template with: product details, extracted declarations, pass/fail table per rule, violation summary, evidence photos, inspector/reviewer sign-off fields.
2. Export in both PDF (fixed, shareable) and editable format (e.g., DOCX) as required by the problem statement.
3. Attach the report to the scan record and route it for review/approval (senior inspector web portal workflow).

**Tech:** ReportLab / WeasyPrint (Python PDF generation) or PDFKit/Puppeteer (Node.js), docx generation libraries (python-docx / docx npm package).

---

### Stage 10 — Storage, Dashboard & Retrieval
**What happens:** Every scan, its extracted data, compliance result, and report are stored and made searchable, with dashboards for enforcement monitoring.
**Steps:**
1. Persist scan record, extracted fields, violations, and report links in the database.
2. Web dashboard displays inspection stats, violation trends, product/manufacturer history, and pending reviews.
3. Role-based access (field inspector / senior inspector / admin) with secure authentication.
4. Search & retrieval by product, manufacturer, date range, or compliance status.

**Tech:** MongoDB/PostgreSQL, React.js (web dashboard), Node.js/Express or Python/FastAPI (backend API), JWT/OAuth (auth), charting library (Chart.js/Recharts) for dashboard visualizations.

---

## Consolidated Technology Stack

| Layer | Technology Options |
|---|---|
| Mobile app (field inspector) | React Native or Flutter |
| Web portal (senior inspector, admin, dashboard) | React.js |
| Backend API | Node.js + Express, or Python + FastAPI |
| Database | MongoDB or PostgreSQL |
| Cloud/object storage | AWS S3 / Firebase Storage |
| Image preprocessing | OpenCV, Pillow |
| Label/PDP detection | YOLOv8 / Detectron2 |
| OCR | Google Cloud Vision API / AWS Textract / PaddleOCR / Tesseract |
| NLP/NER for field extraction | spaCy, Hugging Face Transformers, regex, optional LLM-assisted extraction |
| Rule engine | Custom JSON/YAML rule definitions + Python (`durable_rules`) or Node.js (`json-rules-engine`) evaluator |
| Report generation | ReportLab/WeasyPrint (PDF), python-docx / docx (editable) |
| Auth | JWT / OAuth2 |
| Dashboard visualization | Chart.js / Recharts |
| Deployment | Docker containers on AWS/Azure/GCP; CI/CD via GitHub Actions |

---

*A flowchart of this pipeline is shown alongside this report.*
