#!/usr/bin/env python3
"""
Nirikshak — Single-Command Legal Metrology Compliance Runner
============================================================
Takes an input folder of product packaging images and runs the complete
end-to-end Legal Metrology compliance pipeline, generating the official
statutory PDF report with photographic evidence exhibits.

Usage:
    python scan.py <path_to_input_folder> [--output <output_path.pdf>] [--pkg-dimensions "LxWxH mm"]

Examples:
    python scan.py input/HairRemoval
    python scan.py C:/Users/prakh/Desktop/product_sample --output final_report.pdf
    scan.bat input/HairRemoval
"""

import argparse
import os
import shutil
import subprocess
import sys
import time
import urllib.request
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent
if not (REPO_ROOT / "ComplianceEngine").is_dir() and (REPO_ROOT.parent / "ComplianceEngine").is_dir():
    REPO_ROOT = REPO_ROOT.parent

COMPLIANCE_ENGINE_DIR = REPO_ROOT / "ComplianceEngine"
STAGE2_DIR = COMPLIANCE_ENGINE_DIR / "stage2_preprocessing"
ORCHESTRATOR_DIR = COMPLIANCE_ENGINE_DIR / "orchestrator"
OUTPUT_DIR = COMPLIANCE_ENGINE_DIR / "output"

HEALTH_URL = "http://127.0.0.1:8000/health"
VALID_IMAGE_EXTS = {".jpg", ".jpeg", ".png", ".webp", ".heic", ".heif", ".bmp"}


def check_health(url=HEALTH_URL):
    try:
        req = urllib.request.Request(url, headers={"User-Agent": "Nirikshak-CLI"})
        with urllib.request.urlopen(req, timeout=1.5) as resp:
            return resp.status == 200
    except Exception:
        return False


def start_preprocessor():
    print("[*] Stage 2/4 Preprocessing & OCR service is not running. Starting it now on port 8000...")
    proc = subprocess.Popen(
        [sys.executable, "-m", "uvicorn", "app.main:app", "--host", "127.0.0.1", "--port", "8000"],
        cwd=str(STAGE2_DIR),
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )
    
    # Wait for service to become healthy
    for _ in range(30):
        time.sleep(0.5)
        if check_health():
            print("[+] Preprocessor & OCR microservice is live on http://127.0.0.1:8000")
            return proc
    print("[!] Warning: Preprocessor service started but health check timed out. Proceeding...")
    return proc


def find_images(folder_path):
    p = Path(folder_path).resolve()
    if not p.is_dir():
        return []
    return [
        str(f) for f in p.iterdir()
        if f.is_file() and f.suffix.lower() in VALID_IMAGE_EXTS
    ]


def get_latest_report():
    if not OUTPUT_DIR.is_dir():
        return None
    product_dirs = [
        d for d in OUTPUT_DIR.iterdir()
        if d.is_dir() and d.name.startswith("product_")
    ]
    if not product_dirs:
        return None
    # Sort by modification time
    product_dirs.sort(key=lambda d: d.stat().st_mtime, reverse=True)
    latest_dir = product_dirs[0]
    report_pdf = latest_dir / "report.pdf"
    if report_pdf.is_file():
        return report_pdf
    return None


def main():
    parser = argparse.ArgumentParser(
        description="Nirikshak — Run end-to-end Legal Metrology compliance scan on an input folder."
    )
    parser.add_argument("input_folder", help="Path to folder containing product packaging images.")
    parser.add_argument("--output", "-o", help="Optional target path for the generated PDF report.")
    parser.add_argument("--pkg-dimensions", help='Package dimensions (e.g. "120x80x40 mm").')
    parser.add_argument("--keep-alive", action="store_true", help="Keep preprocessor service running after completion.")

    args = parser.parse_args()

    input_path = Path(args.input_folder).resolve()
    if not input_path.exists():
        print(f"[-] Error: Input folder does not exist: {input_path}")
        sys.exit(1)

    if not input_path.is_dir():
        print(f"[-] Error: Path is not a directory: {input_path}")
        sys.exit(1)

    images = find_images(input_path)
    # Check for subdirectories (batch or multi-product)
    subdirs = [d for d in input_path.iterdir() if d.is_dir()]
    if not images and not subdirs:
        print(f"[-] Error: No valid images found in {input_path} (supported: {', '.join(VALID_IMAGE_EXTS)})")
        sys.exit(1)

    print("======================================================================")
    print("  NIRIKSHAK — STATUTORY COMPLIANCE SCAN")
    print(f"  Input Folder : {input_path}")
    print(f"  Images Found : {len(images)} image(s)")
    print("======================================================================")

    # 1. Ensure Preprocessor Microservice is running
    preprocessor_proc = None
    if not check_health():
        preprocessor_proc = start_preprocessor()
    else:
        print("[+] Preprocessor & OCR microservice is already running on http://127.0.0.1:8000")

    # 2. Build CLI command for Orchestrator
    cmd = ["node", "src/cli.js", str(input_path)]
    if args.pkg_dimensions:
        cmd.extend(["--pkg-dimensions", args.pkg_dimensions])

    print("\n[*] Running end-to-end compliance pipeline...")
    print("    • Stage 2: OpenCV Image Preprocessing (Deskewing / Contrast)")
    print("    • Stage 4: PaddleOCR Text & Bounding Box Extraction")
    print("    • Stage 5: Packaging Font & Readability Metrics")
    print("    • Stage 6: Groq LLM Statutory Declaration Extraction")
    print("    • Stage 7: Codified Rule Engine (Legal Metrology Rules, 2011)")
    print("    • Stage 8: Photographic Violation Evidence Annotations")
    print("    • Stage 9: Statutory Audit PDF Report Generation (ReportLab)\n")

    start_time = time.time()
    try:
        res = subprocess.run(cmd, cwd=str(ORCHESTRATOR_DIR))
        exit_code = res.returncode
    except KeyboardInterrupt:
        print("\n[!] Scan interrupted by user.")
        exit_code = 130
    finally:
        if preprocessor_proc and not args.keep_alive:
            # We can let it keep running or terminate
            pass

    elapsed = round(time.time() - start_time, 1)

    # 3. Locate Generated Report
    latest_report = get_latest_report()
    if latest_report and latest_report.is_file():
        target_report = latest_report
        if args.output:
            target_report = Path(args.output).resolve()
            target_report.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(str(latest_report), str(target_report))
        
        pdf_size_kb = round(target_report.stat().st_size / 1024, 1)
        print("\n======================================================================")
        print(f"  COMPLIANCE AUDIT COMPLETE ({elapsed}s)")
        print(f"  Final PDF Report : {target_report}")
        print(f"  Report Size      : {pdf_size_kb} KB")
        print("======================================================================\n")
    else:
        if exit_code != 0:
            print(f"\n[-] Inspection pipeline failed with exit code {exit_code}.")
        else:
            print("\n[-] Pipeline completed, but no report.pdf was generated.")
        sys.exit(exit_code)


if __name__ == "__main__":
    main()
