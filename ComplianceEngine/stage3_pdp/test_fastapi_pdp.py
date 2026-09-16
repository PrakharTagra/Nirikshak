"""
Test FastAPI Preprocessing and PDP endpoint integration.
"""

import sys
from pathlib import Path

STAGE2_DIR = Path(__file__).resolve().parents[1] / "stage2_preprocessing"
if str(STAGE2_DIR) not in sys.path:
    sys.path.insert(0, str(STAGE2_DIR))

from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_health():
    resp = client.get("/health")
    assert resp.status_code == 200
    assert resp.json() == {"status": "ok"}
    print("[+] /health check passed!")


def test_pdp_endpoint():
    sample_img_path = Path(__file__).resolve().parents[1] / "orchestrator" / "input" / "front.jpeg"
    if not sample_img_path.is_file():
        print("[!] Warning: sample image front.jpeg not found.")
        return

    with open(sample_img_path, "rb") as f:
        files = {"image": ("front.jpeg", f, "image/jpeg")}
        resp = client.post(
            "/preprocess/pdp",
            files=files,
            params={"pkg_dimensions": "120x80x40 mm"},
        )

    assert resp.status_code == 200, f"Error: {resp.status_code} - {resp.text}"
    data = resp.json()
    assert "pdp" in data
    assert "image_base64" in data
    assert data["pdp"]["pdp_detected"] is True
    print("[+] /preprocess/pdp endpoint passed successfully!")
    print(f"    - Detection Source: {data['pdp']['detection_source']}")
    print(f"    - Area (cm2): {data['pdp']['area_metrics']['area_cm2']}")
    print(f"    - Rule 7 Min Height: {data['pdp']['statutory_min_numeral_height_mm']} mm")
    print(f"    - Predicted Panel Role: {data['pdp']['classification']['predicted_panel_role']}")


if __name__ == "__main__":
    print("=== Testing FastAPI Preprocessing & PDP Endpoints ===")
    test_health()
    test_pdp_endpoint()
    print("=== All FastAPI PDP Tests Passed! ===")
