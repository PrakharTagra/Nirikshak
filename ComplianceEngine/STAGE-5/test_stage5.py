"""Unit tests for Stage 5 Font & Readability Analysis Engine."""

import unittest
import numpy as np

from .dimension_resolver import (
    parse_dimension_string,
    is_inner_product_dimension,
    extract_packaging_dimensions,
    calculate_pixels_per_mm,
)
from .font_geometry import measure_declaration_font
from .clearance_check import evaluate_quantity_clearance
from .readability_analyzer import analyze_font_and_readability


class TestStage5Engine(unittest.TestCase):
    def test_dimension_string_parsing(self):
        d1 = parse_dimension_string("Pack Size: 120 x 80 x 40 mm")
        self.assertIsNotNone(d1)
        self.assertEqual(d1["all_dimensions_mm"], [120.0, 80.0, 40.0])

        d2 = parse_dimension_string("Dimensions: 10 cm x 5 cm x 15 cm")
        self.assertIsNotNone(d2)
        self.assertEqual(d2["all_dimensions_mm"], [150.0, 100.0, 50.0])

        d3 = parse_dimension_string("85 x 14 x 85 mm")
        self.assertIsNotNone(d3)
        self.assertEqual(d3["all_dimensions_mm"], [85.0, 85.0, 14.0])

    def test_inner_product_vs_packaging_rejection(self):
        # Inner product dimensions should be identified
        self.assertTrue(is_inner_product_dimension("Sheet Size: 15cm x 20cm"))
        self.assertTrue(is_inner_product_dimension("Size of wipe: 10 x 10 cm"))
        self.assertTrue(is_inner_product_dimension("Each tablet: 5 mm x 5 mm"))

        # Packaging dimensions should NOT be flagged as inner product
        self.assertFalse(is_inner_product_dimension("Box Dimensions: 120 x 80 x 40 mm"))
        self.assertFalse(is_inner_product_dimension("Pack Size: 100 x 50 x 20 mm"))
        self.assertFalse(is_inner_product_dimension("Carton Size: 200 x 100 mm"))

    def test_extract_packaging_dimensions_from_lines(self):
        lines = [
            {"text": "Brand ABC Wipes"},
            {"text": "Sheet size: 15cm x 15cm"},  # Inner product -> should be skipped!
            {"text": "Outer Box Dimensions: 120 x 80 x 40 mm"},  # Packaging dimension -> should be picked!
        ]
        res = extract_packaging_dimensions(lines)
        self.assertIsNotNone(res)
        self.assertEqual(res["length_mm"], 120.0)
        self.assertEqual(res["width_mm"], 80.0)
        self.assertEqual(res["height_mm"], 40.0)

    def test_scale_calculation(self):
        dims = {"all_dimensions_mm": [100.0, 50.0]}
        # Image 1000 x 500 px for a 100 x 50 mm panel = 10 px/mm
        scale = calculate_pixels_per_mm((500, 1000), dims)
        self.assertAlmostEqual(scale, 10.0, places=1)

    def test_font_geometry_rule7_aspect_ratio(self):
        # Line with 40px height and scale 10 px/mm -> 4.0 mm
        line = {
            "text": "Net Wt: 500g",
            "pixel_height": 40.0,
            "bbox": [[10, 10], [100, 10], [100, 50], [10, 50]],
        }
        res = measure_declaration_font(line, image=None, pixels_per_mm=10.0)
        self.assertEqual(res["height_mm"], 4.0)
        self.assertTrue(res["aspect_ratio_ok"])

    def test_rule8_clearance_zone(self):
        # Quantity line at y=100..120 (height=20)
        qty_line = {
            "text": "Net Wt. 500g",
            "bbox": [[100, 100], [200, 100], [200, 120], [100, 120]],
        }

        # Another line outside the clearance zone (y=200..220, clearance zone is y=80..140)
        far_line = {
            "text": "Manufactured by XYZ",
            "bbox": [[100, 200], [200, 200], [200, 220], [100, 220]],
        }
        res_clean = evaluate_quantity_clearance(qty_line, [qty_line, far_line], numeral_height_px=20.0)
        self.assertTrue(res_clean["clearance_ok"])
        self.assertFalse(res_clean["has_printed_info"])

        # Intruding line right above Net Quantity (y=105..115, inside exclusion zone)
        intruding_line = {
            "text": "Special Offer 20% Extra",
            "bbox": [[110, 105], [190, 105], [190, 115], [110, 115]],
        }
        res_fail = evaluate_quantity_clearance(qty_line, [qty_line, intruding_line], numeral_height_px=20.0)
        self.assertFalse(res_fail["clearance_ok"])
        self.assertTrue(res_fail["has_printed_info"])
        self.assertIn("Special Offer 20% Extra", res_fail["overlapping_texts"])

    def test_master_readability_analyzer(self):
        ocr = {
            "lines": [
                {"text": "Super Soap", "bbox": [[10, 10], [100, 10], [100, 30], [10, 30]], "pixel_height": 20},
                {"text": "Net Wt: 250 g", "bbox": [[10, 50], [100, 50], [100, 70], [10, 70]], "pixel_height": 20},
                {"text": "MRP Rs. 45/-", "bbox": [[10, 90], [100, 90], [100, 110], [10, 110]], "pixel_height": 20},
                {"text": "Carton Dimensions: 100 x 50 x 25 mm", "bbox": [[10, 130], [150, 130], [150, 145], [10, 145]], "pixel_height": 15},
            ],
        }
        metrics = analyze_font_and_readability(
            ocr_result=ocr,
            image=None,
            allow_user_prompt=False,
            pixels_per_mm_override=10.0,
        )
        self.assertTrue(metrics["calibrationAvailable"])
        self.assertEqual(metrics["numeralHeightMm"]["netQty"], 2.0)
        self.assertEqual(metrics["numeralHeightMm"]["rsp"], 2.0)
        self.assertFalse(metrics["quantityDeclarationSurroundingAreaHasPrintedInfo"])


if __name__ == "__main__":
    unittest.main()
