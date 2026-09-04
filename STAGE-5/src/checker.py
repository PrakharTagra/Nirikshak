"""Stage 5 orchestrator: run the Rule 7 / Rule 9(1)(b) checks on a set of
OCR text regions.

Depends on two upstream pieces the execution plan assigns to earlier
stages, which this module takes as plain parameters rather than deriving
itself:
  - px_per_mm: the pixel-to-mm calibration scale (Stage 3)
  - quantity_value_normalized / pdp_area_cm2: comes from knowing the
    declared net quantity (Stage 6 territory) — Stage 5 can't pick the
    right Table I/II row without it, so a minimal net-quantity read has
    to happen before this runs, even if full declaration classification
    comes later.

That means this module is fully testable right now with manually
supplied or mocked values, without waiting on Stage 3/4 to be built.
"""
from dataclasses import dataclass
from typing import Optional

import numpy as np

from .measure import TextRegion, pixel_height_to_mm, check_width_ratio
from .tables import min_height_by_quantity, min_height_by_pdp_area
from .contrast import has_sufficient_contrast


@dataclass
class FontCheckResult:
    label: str
    text: str
    measured_mm: float
    required_mm: float
    passed_height: bool
    passed_width: bool
    passed_contrast: Optional[bool] = None

    @property
    def passed(self) -> bool:
        checks = [self.passed_height, self.passed_width]
        if self.passed_contrast is not None:
            checks.append(self.passed_contrast)
        return all(checks)


def _build_result(region: TextRegion, px_per_mm: float, required_mm: float,
                   image: np.ndarray = None, text_bbox: tuple = None) -> FontCheckResult:
    measured_mm = pixel_height_to_mm(region.height_px, px_per_mm)
    passed_contrast = None
    if image is not None and text_bbox is not None:
        passed_contrast = has_sufficient_contrast(image, text_bbox, region.is_embossed)
    return FontCheckResult(
        label=region.label,
        text=region.text,
        measured_mm=measured_mm,
        required_mm=required_mm,
        passed_height=measured_mm >= required_mm,
        passed_width=check_width_ratio(region),
        passed_contrast=passed_contrast,
    )


def check_by_quantity(region: TextRegion, px_per_mm: float,
                       quantity_value_normalized: float,
                       image: np.ndarray = None, text_bbox: tuple = None) -> FontCheckResult:
    """For MRP / weight-volume declarations — uses Table I."""
    required_mm = min_height_by_quantity(quantity_value_normalized, embossed=region.is_embossed)
    return _build_result(region, px_per_mm, required_mm, image, text_bbox)


def check_by_pdp_area(region: TextRegion, px_per_mm: float,
                       pdp_area_cm2: float,
                       image: np.ndarray = None, text_bbox: tuple = None) -> FontCheckResult:
    """For length/area/number declarations — uses Table II."""
    required_mm = min_height_by_pdp_area(pdp_area_cm2, embossed=region.is_embossed)
    return _build_result(region, px_per_mm, required_mm, image, text_bbox)
