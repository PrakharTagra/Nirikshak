"""Unit tests for contrast ratio calculations and packaging region segmentation."""

import unittest
import numpy as np
import cv2

from .contrast import (
    calculate_relative_luminance,
    calculate_contrast_ratio,
    rgb_to_hex,
    analyze_region_contrast,
    analyze_image_declarations_contrast,
)


class TestContrastAnalysis(unittest.TestCase):
    def test_relative_luminance_black_and_white(self):
        self.assertAlmostEqual(calculate_relative_luminance([0, 0, 0]), 0.0, places=3)
        self.assertAlmostEqual(calculate_relative_luminance([255, 255, 255]), 1.0, places=3)

    def test_contrast_ratio_extremes(self):
        # Black on white is the absolute maximum 21.0
        ratio_bw = calculate_contrast_ratio([0, 0, 0], [255, 255, 255])
        self.assertAlmostEqual(ratio_bw, 21.0, places=1)

        # Same color is 1.0
        ratio_same = calculate_contrast_ratio([120, 120, 120], [120, 120, 120])
        self.assertAlmostEqual(ratio_same, 1.0, places=1)

    def test_contrast_ratio_known_pairs(self):
        # Dark navy (#001F3F) on pale yellow (#FFFBEA)
        ratio = calculate_contrast_ratio([0, 31, 63], [255, 251, 234])
        self.assertGreater(ratio, 10.0)

        # Low contrast: medium gray on light gray (#888888 vs #AAAAAA)
        low_ratio = calculate_contrast_ratio([136, 136, 136], [170, 170, 170])
        self.assertLess(low_ratio, 2.0)

    def test_rgb_to_hex(self):
        self.assertEqual(rgb_to_hex([255, 0, 0]), "#FF0000")
        self.assertEqual(rgb_to_hex([0, 255, 0]), "#00FF00")
        self.assertEqual(rgb_to_hex([0, 0, 255]), "#0000FF")

    def test_synthetic_image_region_contrast(self):
        # Create a white image with black text
        img = np.full((100, 200, 3), 255, dtype=np.uint8)
        cv2.putText(img, "NET 500g", (20, 60), cv2.FONT_HERSHEY_SIMPLEX, 1.0, (0, 0, 0), 2)

        bbox = [[20, 30], [180, 30], [180, 70], [20, 70]]
        res = analyze_region_contrast(img, bbox, min_ratio=2.5)
        self.assertTrue(res["contrast_ok"])
        self.assertGreater(res["contrast_ratio"], 5.0)

    def test_low_contrast_image_region_fails(self):
        # Create a light gray image (#EEEEEE) with slightly darker gray text (#CCCCCC)
        img = np.full((100, 200, 3), 238, dtype=np.uint8)  # #EEEEEE
        cv2.putText(img, "NET 500g", (20, 60), cv2.FONT_HERSHEY_SIMPLEX, 1.0, (204, 204, 204), 2)

        bbox = [[20, 30], [180, 30], [180, 70], [20, 70]]
        res = analyze_region_contrast(img, bbox, min_ratio=2.5)
        self.assertFalse(res["contrast_ok"])
        self.assertLess(res["contrast_ratio"], 2.5)


if __name__ == "__main__":
    unittest.main()
