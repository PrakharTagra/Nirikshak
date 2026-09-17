"""
Verification test for Concurrent Multi-Core OCR via OCREnginePool.
"""

import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

import cv2
import numpy as np

ENGINE_DIR = Path(__file__).resolve().parents[1]
STAGE4_DIR = ENGINE_DIR / "stage4_ocr"
STAGE2_DIR = ENGINE_DIR / "stage2_preprocessing"

for p in [str(ENGINE_DIR), str(STAGE4_DIR), str(STAGE2_DIR)]:
    if p not in sys.path:
        sys.path.insert(0, p)

from stage4_ocr.ocr.pipeline import get_engine_pool, run_ocr


def test_pool_initialization():
    pool = get_engine_pool()
    assert pool.max_size >= 1
    print(f"[+] OCREnginePool initialized with capacity: {pool.max_size}")


def test_concurrent_ocr():
    input_dir = ENGINE_DIR / "orchestrator" / "input"
    images = list(input_dir.glob("*.jpeg")) + list(input_dir.glob("*.jpg")) + list(input_dir.glob("*.png"))
    if not images:
        print("[!] No sample images found for concurrent OCR test.")
        return

    test_img = cv2.imread(str(images[0]))
    assert test_img is not None, "Failed to load sample image"

    num_workers = 4
    print(f"[*] Dispatching {num_workers} concurrent OCR jobs to verify thread safety and pooling...")
    start_time = time.time()

    def _worker_task(idx):
        t0 = time.time()
        res = run_ocr(test_img)
        elapsed = round(time.time() - t0, 3)
        return idx, res["success"], len(res["regions"]), elapsed

    with ThreadPoolExecutor(max_workers=num_workers) as executor:
        futures = [executor.submit(_worker_task, i) for i in range(num_workers)]
        results = [f.result() for f in as_completed(futures)]

    total_time = round(time.time() - start_time, 3)
    print(f"[+] All {num_workers} concurrent OCR tasks finished in {total_time}s!")
    for idx, success, region_count, el in results:
        assert success is True, f"Worker {idx} failed OCR"
        print(f"    - Worker {idx}: success={success}, regions={region_count}, task_time={el}s")


def test_fastapi_batch_endpoint():
    from fastapi.testclient import TestClient
    from app.main import app

    client = TestClient(app)
    input_dir = ENGINE_DIR / "orchestrator" / "input"
    images = list(input_dir.glob("*.jpeg"))[:2]
    if len(images) < 2:
        images = list(input_dir.glob("*.jpeg")) * 2

    files = [
        ("images", (f"panel_{i}.jpeg", open(img_path, "rb"), "image/jpeg"))
        for i, img_path in enumerate(images)
    ]

    print("[*] Testing FastAPI /preprocess/ocr/batch endpoint with concurrent panels...")
    resp = client.post("/preprocess/ocr/batch", files=files)
    assert resp.status_code == 200, f"Batch OCR failed: {resp.status_code} - {resp.text}"
    data = resp.json()
    assert "items" in data
    assert len(data["items"]) == len(images)
    print(f"[+] /preprocess/ocr/batch endpoint verified successfully with {len(data['items'])} panels!")


if __name__ == "__main__":
    print("=== Running Concurrent Multi-Core OCR Verification Suite ===")
    test_pool_initialization()
    test_concurrent_ocr()
    test_fastapi_batch_endpoint()
    print("=== All Concurrent Multi-Core OCR Tests Successfully Passed! ===")
