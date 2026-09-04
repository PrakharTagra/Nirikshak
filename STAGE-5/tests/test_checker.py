"""Sanity tests for Stage 5. These use synthetic data to confirm the
pipeline runs correctly end-to-end — swap in real OCR output and real
calibration once Stage 3/4 exist.
"""
import numpy as np
from src.measure import TextRegion
from src.checker import check_by_quantity, check_by_pdp_area


def test_mrp_passes_when_tall_enough():
    # Simulate a 500ml product's MRP numerals: needs >= 2mm (Table I, band 2)
    px_per_mm = 10  # 10 pixels per mm, a stand-in calibration value
    region = TextRegion(label="MRP", text="175.00", height_px=25, width_px=15)
    result = check_by_quantity(region, px_per_mm, quantity_value_normalized=500)
    assert result.measured_mm == 2.5
    assert result.required_mm == 2.0
    assert result.passed_height is True


def test_mrp_fails_when_too_small():
    px_per_mm = 10
    region = TextRegion(label="MRP", text="175.00", height_px=15, width_px=8)
    result = check_by_quantity(region, px_per_mm, quantity_value_normalized=500)
    assert result.measured_mm == 1.5
    assert result.required_mm == 2.0
    assert result.passed_height is False


def test_embossed_text_gets_higher_threshold():
    px_per_mm = 10
    region = TextRegion(label="mfg_date", text="09/07/26", height_px=25,
                         width_px=15, is_embossed=True)
    result = check_by_quantity(region, px_per_mm, quantity_value_normalized=90)
    # 90ml falls in the "up to 200" band: embossed threshold is 2mm, not 1mm
    assert result.required_mm == 2.0


def test_pdp_area_based_check():
    px_per_mm = 8
    region = TextRegion(label="net_quantity", text="90 ml", height_px=20, width_px=10)
    result = check_by_pdp_area(region, px_per_mm, pdp_area_cm2=250)
    assert result.required_mm == 2.0


def test_width_ratio_flagged_when_too_narrow():
    px_per_mm = 10
    region = TextRegion(label="MRP", text="175.00", height_px=25, width_px=5)
    result = check_by_quantity(region, px_per_mm, quantity_value_normalized=500)
    assert result.passed_width is False
    assert result.passed is False


if __name__ == "__main__":
    test_mrp_passes_when_tall_enough()
    test_mrp_fails_when_too_small()
    test_embossed_text_gets_higher_threshold()
    test_pdp_area_based_check()
    test_width_ratio_flagged_when_too_narrow()
    print("All Stage 5 sanity tests passed.")
