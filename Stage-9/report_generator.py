"""
report_generator.py — CLI Entry Point
======================================
Main script for generating compliance assessment reports.

Usage:
    python report_generator.py --input <mapped_json_path> --output <pdf_path> [--image-dir <dir>]

Examples:
    python report_generator.py \
        --input ../ComplianceEngine/output/product_1/mapped.json \
        --output ./reports/compliance_report_product1.pdf \
        --image-dir ../ComplianceEngine/output/product_1/

    python report_generator.py --input mapped.json --output report.pdf
    # (image-dir defaults to the directory containing mapped.json)

Legal Methodology Compliance Automation — Stage-9
"""

import argparse
import os
import sys
import time
from datetime import datetime

# Add parent dirs to path if running from Stage-9 folder
_HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, _HERE)

import json_validator
import compliance_mapper
import pdf_builder


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def _banner():
    print('=' * 70)
    print('  NIRIKSHAK — LEGAL METHODOLOGY COMPLIANCE REPORT GENERATOR')
    print('  Stage-9 | Legal Metrology (Packaged Commodities) Rules, 2011')
    print('=' * 70)


def _build_argparser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        description='Generate a Compliance Assessment Report PDF from a mapped JSON file.',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    p.add_argument(
        '--input', '-i',
        required=True,
        metavar='MAPPED_JSON',
        help='Path to the mapped.json file (required).',
    )
    p.add_argument(
        '--output', '-o',
        required=False,
        metavar='PDF_PATH',
        help=(
            'Destination path for the generated PDF. '
            'Defaults to <input_dir>/compliance_report_<timestamp>.pdf'
        ),
    )
    p.add_argument(
        '--image-dir', '-d',
        required=False,
        metavar='IMAGE_DIR',
        help=(
            'Directory containing product images. '
            'Defaults to the directory containing the input JSON.'
        ),
    )
    p.add_argument(
        '--strict', '-s',
        action='store_true',
        default=False,
        help='Abort on validation warnings (default: continue with warnings).',
    )
    return p


# ---------------------------------------------------------------------------
# MAIN FLOW
# ---------------------------------------------------------------------------

def run(
    json_path:  str,
    output_path: str,
    image_dir:   str,
    strict:      bool = False,
) -> str:
    """
    Full generation flow:
      JSON Validation → Data Extraction → Compliance Mapping → PDF Generation
    """
    _banner()
    start = time.time()

    json_path   = os.path.abspath(json_path)
    image_dir   = os.path.abspath(image_dir) if image_dir else os.path.dirname(json_path)

    print(f'\n[1/5] Input   : {json_path}')
    print(f'      Images  : {image_dir}')

    # ------------------------------------------------------------------
    # Step 1: JSON Validation
    # ------------------------------------------------------------------
    print('\n[2/5] Validating JSON...')
    validation = json_validator.validate_json(json_path, image_dir)
    validation.print_summary()

    if validation.has_errors():
        print('\n  [ERROR] Critical validation errors found. Aborting.')
        sys.exit(1)

    if strict and validation.warnings:
        print('\n  [ERROR] Warnings found and --strict mode is enabled. Aborting.')
        sys.exit(1)

    raw_data = validation.data

    # ------------------------------------------------------------------
    # Step 2: Extract metadata
    # ------------------------------------------------------------------
    print('\n[3/5] Extracting compliance data...')
    meta        = json_validator.extract_metadata(raw_data)
    image_paths = json_validator.extract_image_paths(raw_data, image_dir)

    missing_images = [k for k, v in image_paths.items() if v is None]
    if missing_images:
        print(f'  [WARN] {len(missing_images)} image(s) not found:')
        for m in missing_images:
            print(f'      - {m}')
    else:
        print(f'  [OK] {len(image_paths)} image(s) located.')

    print(f'  [OK] Report ID : {meta["report_id"]}')
    print(f'  [OK] Entity    : {meta["entity"]}')

    # ------------------------------------------------------------------
    # Step 3: Build Compliance Model
    # ------------------------------------------------------------------
    print('\n[4/5] Building compliance model...')
    model = compliance_mapper.build_model(raw_data, meta, image_paths)

    print(f'  [OK] {model.summary.total_requirements} compliance requirement(s) mapped.')
    print(f'  [OK] {model.summary.total_violations} violation(s) identified.')
    print(f'  [OK] {len(model.evidences)} evidence item(s) linked.')
    print(f'  [OK] Compliance score: {model.summary.compliance_score:.1f}%')

    # ------------------------------------------------------------------
    # Step 4: Determine output path
    # ------------------------------------------------------------------
    if not output_path:
        ts = datetime.now().strftime('%Y%m%d_%H%M%S')
        output_path = os.path.join(
            os.path.dirname(json_path),
            f'compliance_report_{ts}.pdf',
        )
    output_path = os.path.abspath(output_path)
    os.makedirs(os.path.dirname(output_path), exist_ok=True)

    print(f'\n[5/5] Generating PDF...')
    print(f'  Output: {output_path}')

    # ------------------------------------------------------------------
    # Step 5: Generate PDF
    # ------------------------------------------------------------------
    try:
        final_path = pdf_builder.generate_pdf(model, output_path)
    except Exception as exc:
        print(f'\n  [ERROR] PDF generation failed: {exc}')
        import traceback
        traceback.print_exc()
        sys.exit(1)

    # ------------------------------------------------------------------
    # Verify output
    # ------------------------------------------------------------------
    if not os.path.isfile(final_path):
        print('\n  [ERROR] PDF was not created. Generation may have failed silently.')
        sys.exit(1)

    pdf_size = os.path.getsize(final_path)
    elapsed  = time.time() - start

    print(f'\n{"=" * 70}')
    print(f'  SUCCESS -- Report generated in {elapsed:.1f}s')
    print(f'  PDF size: {pdf_size:,} bytes ({pdf_size / 1024:.1f} KB)')
    print(f'  Output  : {final_path}')
    print(f'{"=" * 70}\n')

    if pdf_size < 10_000:
        print('  [WARN] WARNING: PDF appears very small. Please verify the output.')

    return final_path


# ---------------------------------------------------------------------------
# ENTRY POINT
# ---------------------------------------------------------------------------

if __name__ == '__main__':
    parser = _build_argparser()
    args   = parser.parse_args()

    run(
        json_path=args.input,
        output_path=args.output or '',
        image_dir=args.image_dir or '',
        strict=args.strict,
    )
