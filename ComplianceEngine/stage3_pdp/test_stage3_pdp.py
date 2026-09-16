"""
Unit and Integration Tests for Stage 3 PDP Engine
"""

import math
import sys
from pathlib import Path

import cv2
import numpy as np

STAGE3_DIR = Path(__file__).resolve().parent
if str(STAGE3_DIR.parent) not in sys.path:
    sys.path.insert(0, str(STAGE3_DIR.parent))

from stage3_pdp.classifier import DualStreamPDPClassifier
from stage3_pdp.geometry import (
    calculate_pdp_area,
    compute_rule7_min_height,
    compute_rule8_clearance_box,
    four_point_transform,
    order_points,
    parse_package_dimensions,
)
from stage3_pdp.pipeline import run_pdp_stage


def test_order_points_and_warp():
    # Create synthetic rotated rectangle
    img = np.zeros((300, 300, 3), dtype=np.uint8)
    cv2.rectangle(img, (50, 50), (250, 250), (255, 255, 255), -1)

    # Angled points (e.g. tilted box)
    pts = np.array([[60, 50], [240, 70], [220, 240], [40, 220]], dtype=np.float32)
    ordered = order_points(pts)
    assert ordered.shape == (4, 2)
    assert ordered[0][1] <= ordered[2][1]  # Top-left y is above bottom-right y

    warped, m = four_point_transform(img, pts)
    assert warped.shape[0] > 0 and warped.shape[1] > 0
    assert m.shape == (3, 3)
    print("[+] test_order_points_and_warp passed!")


def test_statutory_rule7_min_height():
    # Test area-based tiers (Rule 7, Table 1)
    assert compute_rule7_min_height(area_cm2=40.0) == 1.0   # <= 50 cm2
    assert compute_rule7_min_height(area_cm2=80.0) == 1.5   # 50 - 100 cm2
    assert compute_rule7_min_height(area_cm2=250.0) == 2.5  # 100 - 500 cm2
    assert compute_rule7_min_height(area_cm2=1000.0) == 4.0 # 500 - 2500 cm2
    assert compute_rule7_min_height(area_cm2=3000.0) == 6.0 # > 2500 cm2

    # Test net quantity fallback
    assert compute_rule7_min_height(weight_or_vol=45, unit="g") == 1.0
    assert compute_rule7_min_height(weight_or_vol=150, unit="g") == 2.0
    assert compute_rule7_min_height(weight_or_vol=500, unit="ml") == 4.0
    assert compute_rule7_min_height(weight_or_vol=2, unit="kg") == 6.0
    print("[+] test_statutory_rule7_min_height passed!")


def test_rule8_clearance_and_intrusions():
    # Net quantity bbox: [100, 100, 200, 140] -> height is 40px
    nq_box = [100.0, 100.0, 200.0, 140.0]
    numeral_h = 40.0

    # 1. Clean clearance (other text is far away)
    clean_boxes = [
        {"text": "Far Away Text", "bbox": [10.0, 10.0, 60.0, 30.0]}
    ]
    res_clean = compute_rule8_clearance_box(nq_box, numeral_h, clean_boxes)
    assert res_clean["rule8_compliant"] is True
    assert res_clean["intrusion_count"] == 0

    # 2. Intrusion within 1H vertical or 2H horizontal buffer
    # buffer left is 2H = 80px (100 - 80 = 20), buffer top is 1H = 40px (100 - 40 = 60)
    intruding_boxes = [
        {"text": "Printed Logo Touching Qty", "bbox": [85.0, 110.0, 98.0, 130.0]}
    ]
    res_intrude = compute_rule8_clearance_box(nq_box, numeral_h, intruding_boxes)
    assert res_intrude["rule8_compliant"] is False
    assert res_intrude["intrusion_count"] == 1
    print("[+] test_rule8_clearance_and_intrusions passed!")


def test_dual_stream_classifier():
    classifier = DualStreamPDPClassifier()

    # Front PDP scenario
    pdp_img = np.full((200, 200, 3), (40, 180, 240), dtype=np.uint8)  # vibrant color
    pdp_text = ["Brand Supreme", "Face Wash Deep Clean", "Net Qty: 100 ml", "New Formula"]
    res_pdp = classifier.classify_panel(pdp_img, pdp_text)
    assert res_pdp["is_pdp"] is True
    assert res_pdp["pdp_confidence"] >= 0.70

    # Back statutory / nutrition scenario
    back_img = np.full((200, 200, 3), (230, 230, 230), dtype=np.uint8)  # dull gray/white
    back_text = [
        "Nutritional Information per 100g",
        "Energy 450 kcal",
        "Ingredients: Water, Sugar, Cocoa",
        "Mfd. By: ABC Foods Pvt Ltd, Plot No 42",
        "Consumer Care: 1800-111-222"
    ]
    res_back = classifier.classify_panel(back_img, back_text)
    assert res_back["is_pdp"] is False
    assert res_back["semantic_metrics"]["has_nutrition_table"] is True
    print("[+] test_dual_stream_classifier passed!")


def test_real_image_pipeline():
    input_dir = STAGE3_DIR.parent / "orchestrator" / "input"
    test_img_path = input_dir / "front.jpeg"
    if not test_img_path.is_file():
        # Try alternate
        for p in input_dir.glob("*.jpeg"):
            test_img_path = p
            break

    if test_img_path and test_img_path.is_file():
        result = run_pdp_stage(
            str(test_img_path),
            pkg_dimensions="150x80x50 mm",
        )
        assert result["pdp_detected"] is True
        assert "cropped_image" in result
        assert result["area_metrics"]["area_cm2"] is not None
        assert result["statutory_min_numeral_height_mm"] in (1.0, 1.5, 2.0, 2.5, 4.0, 6.0)
        print(f"[+] test_real_image_pipeline passed on {test_img_path.name}!")
        print(f"    - Detection source: {result['detection_source']}")
        print(f"    - PDP Confidence: {result['detection_confidence']}")
        print(f"    - Area (cm2): {result['area_metrics']['area_cm2']}")
        print(f"    - Rule 7 Min Numeral Height: {result['statutory_min_numeral_height_mm']} mm")
    else:
        print("[!] Note: No sample image found to test real image pipeline.")


if __name__ == "__main__":
    print("=== Running Stage 3 PDP Test Suite ===")
    test_order_points_and_warp()
    test_statutory_rule7_min_height()
    test_rule8_clearance_and_intrusions()
    test_dual_stream_classifier()
    test_real_image_pipeline()
    print("=== All Stage 3 Tests Successfully Passed! ===")
