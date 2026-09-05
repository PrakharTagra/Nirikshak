# Stage-9 — Compliance Report Generator

A professional **A4 government/legal-style Compliance Assessment Report** generator for the **Nirikshak Legal Methodology Compliance Automation** pipeline.

---

## Overview

Stage-9 takes a **mapped JSON file** produced by the compliance pipeline and generates a standardized, print-ready PDF report that looks like an official government/legal compliance document.

**Every report generated follows exactly the same structure, design, typography, and section order — only the data changes.**

---

## Setup

```bash
pip install -r requirements.txt
```

Requirements:
- `reportlab >= 5.0.0`
- `pillow >= 9.0.0`

---

## Usage

```bash
# Basic usage — image directory defaults to the JSON file's directory
python report_generator.py \
    --input <path_to_mapped.json> \
    --output <output_pdf_path>

# Specify a separate image directory
python report_generator.py \
    --input ../ComplianceEngine/output/product_1/mapped.json \
    --output ./reports/compliance_report_product1.pdf \
    --image-dir ../ComplianceEngine/output/product_1/

# Strict mode — abort on any validation warning
python report_generator.py --input mapped.json --output report.pdf --strict
```

### Arguments

| Argument | Short | Required | Description |
|----------|-------|----------|-------------|
| `--input` | `-i` | ✅ | Path to the mapped JSON file |
| `--output` | `-o` | ❌ | Output PDF path (defaults to `<input_dir>/compliance_report_<timestamp>.pdf`) |
| `--image-dir` | `-d` | ❌ | Directory containing product images (defaults to JSON's directory) |
| `--strict` | `-s` | ❌ | Abort on validation warnings |

---

## Generated Report Structure

Every report contains exactly these sections in this order:

| # | Section | Description |
|---|---------|-------------|
| — | **Cover Page** | Title, report metadata, overall status |
| 1 | **Document Control** | Formal document metadata table |
| 2 | **Executive Summary** | Compliance counts, violation counts, overall assessment |
| 3 | **Compliance Register** | All compliance requirements in a single table |
| 4 | **Compliance Details** | Per-compliance detailed subsections |
| 5 | **Violations / Non-Compliance Findings** | Per-violation finding blocks with embedded evidence images |
| 6 | **Evidence Register** | Complete evidence traceability table |
| 7 | **Legal Traceability Matrix** | Requirement → Compliance → Finding → Evidence linkage |
| 8 | **Corrective Action Register** | Required actions for each finding |
| 9 | **Final Assessment** | Overall status summary and declaration |

---

## File Structure

```
Stage-9/
├── report_generator.py   # CLI entry point — run this
├── json_validator.py     # JSON validation & metadata extraction
├── compliance_mapper.py  # Raw JSON → normalized compliance model
├── image_handler.py      # Image loading, annotation, ReportLab integration
├── pdf_builder.py        # Master PDF construction (9 sections)
├── styles.py             # All fonts, colors, styles (single source of truth)
├── requirements.txt      # Dependencies
└── README.md             # This file
```

---

## JSON Field Mapping

Stage-9 maps the following `mapped.json` fields to compliance records:

| JSON Field | Compliance ID Suffix | Legal Rule |
|------------|---------------------|------------|
| `commodityName` | `COMM-NAME` | Rule 6(1)(a) & 6(1)(b) |
| `manufacturer` | `MFR` | Rule 6(1)(c) |
| `netQuantity` | `NET-QTY` | Rule 6(1)(e) & Rule 8 |
| `mrp` | `MRP` | Rule 6(1)(f) |
| `mfgDate` | `MFG-DATE` | Rule 6(1)(g) |
| `consumerCare` | `CONSUMER-CARE` | Rule 6(1)(h) |
| `packer` | `PACKER` | Rule 6(1)(c) |
| `importer` | `IMPORTER` | Rule 6(1)(c) & Rule 6A |
| `standardPackDeclaration` | `STD-PACK` | Schedule II / Rule 5 |
| `dimensions` | `DIMS` | Rule 6(1)(d) |
| `sheetCount` | `SHEET` | Rule 6(1)(d) |
| Label contrast | `CONTRAST` | Rule 11 |
| Language | `LANGUAGE` | Rule 11(1) |

---

## Design Principles

- **Government document style** — conservative, formal, professional
- **Fixed structure** — same section order and design regardless of data volume
- **Data accuracy** — never invents missing information; displays "Not Available"
- **Evidence integrity** — original images are never modified; annotated copies are created in memory
- **Image embedding** — evidence images are embedded directly in the PDF (not just filenames)
- **Page X of Y** — correct automatic page numbering via two-pass rendering
- **Table headers repeat** — multi-page tables always repeat the header row

---

## Design Specs

| Property | Value |
|----------|-------|
| Page size | A4 (210 × 297 mm) |
| Margins | 25mm left/right, 22mm top/bottom |
| Primary font | Helvetica (built-in) |
| Heading colour | Navy `#1B2A4A` |
| Body text | 10pt Helvetica |
| Table font | 8pt Helvetica |
| Header | Navy stripe — report title + report ID |
| Footer | Navy stripe — "CONFIDENTIAL" + "Page X of Y" |
