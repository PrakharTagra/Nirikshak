#!/usr/bin/env python3
"""
ocr_images_cli.py

Runs PaddleOCR on a list of product packaging images (URLs or local file paths).
Reads JSON input from stdin or command line arguments, runs the Stage 4 PaddleOCR
pipeline, and prints JSON output to stdout.
"""

from __future__ import annotations

import json
import os
import sys
import time
import urllib.request
from pathlib import Path
from typing import Any, Dict, List

# Ensure Nirikshak root and ComplianceEngine are in python path
ROOT_DIR = Path(__file__).resolve().parent.parent.parent
if str(ROOT_DIR) not in sys.path:
    sys.path.insert(0, str(ROOT_DIR))

import cv2
import numpy as np
from ComplianceEngine.stage4_ocr.ocr.pipeline import run_ocr

USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"


def download_image(url: str, timeout: float = 12.0) -> np.ndarray | None:
    """Download image bytes and decode as OpenCV BGR image."""
    try:
        if url.startswith("file://") or os.path.isfile(url):
            local_path = url[7:] if url.startswith("file://") else url
            return cv2.imread(local_path)

        req = urllib.request.Request(
            url,
            headers={
                "User-Agent": USER_AGENT,
                "Accept": "image/avif,image/webp,image/apng,image/*,*/*;q=0.8",
            },
        )
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            data = resp.read()
            arr = np.frombuffer(data, dtype=np.uint8)
            img = cv2.imdecode(arr, cv2.IMREAD_COLOR)
            return img
    except Exception as e:
        sys.stderr.write(f"[ocr_images_cli] Failed to load image {url}: {e}\n")
        return None


def process_images(image_urls: List[str], max_images: int = 6) -> Dict[str, Any]:
    """Process up to max_images through PaddleOCR pipeline."""
    urls = [u for u in image_urls if u and isinstance(u, str)][:max_images]
    results = []
    combined_lines = []

    start_all = time.time()

    for idx, url in enumerate(urls):
        t0 = time.time()
        img = download_image(url)
        if img is None:
            results.append({
                "index": idx,
                "url": url,
                "success": False,
                "error": "Failed to download or decode image",
                "text": "",
                "regions": [],
                "declarations": {},
            })
            continue

        try:
            ocr_out = run_ocr(img)
            text = ocr_out.get("text", "")
            regions = ocr_out.get("regions", [])
            declarations = ocr_out.get("declarations", {})

            clean_text = text.strip()
            if clean_text:
                combined_lines.append(f"--- [Product Packaging Panel Image {idx + 1}] ---\n{clean_text}")

            results.append({
                "index": idx,
                "url": url,
                "success": True,
                "text": clean_text,
                "regions": regions,
                "declarations": declarations,
                "elapsed_seconds": round(time.time() - t0, 3),
            })
        except Exception as e:
            sys.stderr.write(f"[ocr_images_cli] OCR failed on image {idx}: {e}\n")
            results.append({
                "index": idx,
                "url": url,
                "success": False,
                "error": str(e),
                "text": "",
                "regions": [],
                "declarations": {},
            })

    total_time = round(time.time() - start_all, 3)

    return {
        "success": True,
        "count": len(results),
        "total_elapsed_seconds": total_time,
        "combined_text": "\n\n".join(combined_lines),
        "results": results,
    }


def main():
    payload = None
    if len(sys.argv) > 1:
        arg = sys.argv[1]
        if arg.startswith("{") or arg.startswith("["):
            payload = json.loads(arg)
        elif os.path.isfile(arg) and arg.lower().endswith(".json"):
            with open(arg, "r", encoding="utf-8") as f:
                payload = json.load(f)
        else:
            payload = [arg]
    else:
        raw = sys.stdin.read().strip()
        if raw:
            payload = json.loads(raw)

    if not payload:
        sys.stderr.write("[ocr_images_cli] No input images provided.\n")
        print(json.dumps({"success": False, "error": "No input images provided", "results": []}))
        return

    image_urls = []
    if isinstance(payload, list):
        for item in payload:
            if isinstance(item, str):
                image_urls.append(item)
            elif isinstance(item, dict) and "url" in item:
                image_urls.append(item["url"])
    elif isinstance(payload, dict):
        imgs = payload.get("images") or payload.get("productImages") or payload.get("items") or []
        for item in imgs:
            if isinstance(item, str):
                image_urls.append(item)
            elif isinstance(item, dict) and "url" in item:
                image_urls.append(item["url"])

    res = process_images(image_urls)
    print(json.dumps(res))


if __name__ == "__main__":
    main()
