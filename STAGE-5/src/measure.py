"""Convert OCR pixel measurements to millimetres and run geometry checks
prescribed by Rule 7.
"""
from dataclasses import dataclass


@dataclass
class TextRegion:
    """A single OCR-detected text region (e.g. one numeral run or line)."""
    label: str            # e.g. "MRP", "net_quantity" — from Stage 6 classification
    text: str              # the OCR'd text itself, for logging/debugging
    height_px: float
    width_px: float
    is_embossed: bool = False  # True for molded/blown/engraved text (e.g. bottle necks)


def pixel_height_to_mm(height_px: float, px_per_mm: float) -> float:
    """Convert a pixel height to millimetres using a known scale factor.

    px_per_mm comes from Stage 3's calibration step (reference object in
    frame, or known package dimensions) — this function only applies the
    scale, it doesn't derive it.
    """
    if px_per_mm <= 0:
        raise ValueError("px_per_mm must be a positive calibration value")
    return height_px / px_per_mm


def check_width_ratio(region: TextRegion) -> bool:
    """Rule 7(3): letter width must be at least 1/3 of its height."""
    return region.width_px >= region.height_px / 3
