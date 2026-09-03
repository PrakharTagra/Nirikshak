import json
import os
import sys

import cv2

from ocr.pipeline import run_ocr


if len(sys.argv) != 2:
    print(
        "Usage:\n"
        "python -m tests.test_ocr \"C:\\path\\to\\image.jpg\""
    )
    sys.exit(1)

IMAGE_PATH = sys.argv[1]
image = cv2.imread(IMAGE_PATH)

if image is None:
    raise FileNotFoundError(f"Could not load image: {IMAGE_PATH}")

print("\n================================")
print("          OCR TEST")
print("================================")
print(f"Image: {IMAGE_PATH}")

result = run_ocr(image)

print(f"\nSuccess: {result['success']}")
print(f"Engine: {result['engine']}")
print(f"Detected text regions: {len(result['regions'])}")

print("\n--------------- RAW OCR ---------------")
for i, region in enumerate(result["regions"], 1):
    print(
        f"[{i:02d}] {region['text']} "
        f"| conf={region['confidence']:.3f} "
        f"| height={region['pixel_height']:.1f}px"
    )

print("\n----------- DECLARATIONS --------------")
print(json.dumps(result["declarations"], indent=2, ensure_ascii=False))

os.makedirs("tests", exist_ok=True)
with open("tests/ocr_result.json", "w", encoding="utf-8") as f:
    json.dump(result, f, indent=2, ensure_ascii=False, default=str)

# Draw OCR line boxes for debugging/calibration.  This is NOT the product ROI.
visualization = image.copy()
for region in result["regions"]:
    pts = __import__("numpy").array(region["bbox"], dtype=int)
    cv2.polylines(visualization, [pts], True, (0, 255, 0), 2)

cv2.imwrite("tests/ocr_visualization.jpeg", visualization)

print("\nSaved:")
print("  tests/ocr_result.json")
print("  tests/ocr_visualization.jpeg")
