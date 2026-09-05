# Nirikshak — AI-Powered Legal Metrology Compliance Verification System
*Smart India Hackathon (SIH) Problem Statement 26034*

**Nirikshak** is an automated, AI-driven compliance inspection platform built to verify packaged commodities against the statutory requirements of the **Legal Metrology (Packaged Commodities) Rules, 2011**.

---

## 🏗️ Repository Architecture

```text
Nirikshak/
├── ComplianceEngine/                 # Self-contained backend compliance & reporting engine
│   ├── stage2_preprocessing/         # OpenCV deskewing, glare reduction & contrast normalization
│   ├── stage4_ocr/                   # PaddleOCR text extraction & bounding-box detection
│   ├── stage5_font_analysis/         # Packaging font geometry & readability checks
│   ├── stage9_reporting/             # Official Statutory PDF Report Generator (ReportLab)
│   ├── orchestrator/                 # Node.js pipeline runner, rule engine, LLM extraction & CLI
│   ├── output/                       # Inspection outputs, annotated evidence crops & reports
│   ├── docker-compose.yml            # Multi-service containerized deployment
│   ├── Dockerfile                    # Container build configuration
│   ├── run_engine.bat                # Windows quick launcher
│   ├── run_engine.sh                 # Linux/macOS quick launcher
│   └── README.md                     # Detailed ComplianceEngine deployment guide
├── lmVerify/                         # Web portal & e-commerce scraping system
│   ├── frontend/                     # React web dashboard for Inspectors and Admin
│   └── local-scraper/                # E-commerce listing crawler & verification service
├── docs/                             # Architecture blueprints & statutory reference checklists
│   ├── Execution_Plan_Compliance_Pipeline.md
│   ├── Legal_Metrology_Compliance_Checklist.md
│   └── System_Architecture_Roles.md
├── Stage-9/                          # Backward-compatibility forwarder delegating to ComplianceEngine
└── README.md                         # Master project guide
```

---

## 🚀 Quickstart Guide

### 1. Deploying the ComplianceEngine Backend
To run or deploy the core compliance analysis engine, navigate into `ComplianceEngine`:

```bash
cd ComplianceEngine

# Option A: Start using Docker Compose
docker compose up -d

# Option B: Run locally
# In terminal 1 (Python Preprocessor & OCR):
cd stage2_preprocessing && uvicorn app.main:app --port 8000

# In terminal 2 (Node.js Orchestrator & CLI):
cd orchestrator && node src/cli.js
```

See [ComplianceEngine/README.md](ComplianceEngine/README.md) for full instructions and configuration options.

### 2. Running lmVerify Web Portal & Scraper
```bash
# Start frontend
cd lmVerify/frontend
npm install
npm run dev

# Start listing scraper
cd lmVerify/local-scraper
npm install
node server.js
```

---

## 📜 Statutory Coverage

Nirikshak checks all key mandates of the Legal Metrology (Packaged Commodities) Rules, 2011:
- **Rule 6(1)(a)**: Name and complete address of the manufacturer / packer / importer.
- **Rule 6(1)(b)**: Generic or common name of the commodity.
- **Rule 6(1)(c)**: Net quantity in standard SI units (g, kg, ml, l, N, U).
- **Rule 6(1)(d)**: Month and year of manufacture or packaging.
- **Rule 6(1)(da)**: Maximum Retail Price (MRP) inclusive of all taxes.
- **Rule 6(1)(e)**: Consumer care details (name, address, telephone, email).
- **Rule 7**: Minimum numeral height requirements based on net quantity band.
- **Rule 8(1)**: Clearance / surrounding area free of other printed information around net quantity.
- **Rule 9(1)(b)**: Conspicuous color contrast between text and packaging background.
- **Rule 12(2)**: Multi-piece package piece count and individual/total net quantity declaration.
- **Rule 26**: Statutory exemption thresholds and applicability checks.

---

## 📄 License
Internal Prototype — Smart India Hackathon 2024.
