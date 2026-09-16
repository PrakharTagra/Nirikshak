"""
Stage 3 PDP — Public Pipeline Entry Point
"""

from __future__ import annotations

from typing import Any, Dict, List, Optional, Union

import cv2
import numpy as np

from .geometry import compute_rule7_min_height, compute_rule8_clearance_box
from .pdp_detector import PDPDetector

_DETECTOR = None


def get_detector() -> PDPDetector:
    global _DETECTOR
    if _DETECTOR is None:
        _DETECTOR = PDPDetector()
    return _DETECTOR


def run_pdp_stage(
    image: Union[np.ndarray, bytes, str],
    ocr_regions: Optional[List[Dict[str, Any]]] = None,
    pkg_dimensions: Optional[str] = None,
) -> Dict[str, Any]:
    """
    Run the end-to-end PDP detection, unwarping, area measurement,
    and statutory classification stage.

    Parameters:
      image: np.ndarray (BGR), image bytes, or file path.
      ocr_regions: optional OCR regions if already computed or micro-pass.
      pkg_dimensions: optional string, e.g. "120x80x40 mm".

    Returns:
      Dictionary with panel polygon, unwarped crop, area metrics,
      Rule 7 min numeral height, and classification scores.
    """
    if isinstance(image, str):
        img_arr = cv2.imread(image)
        if img_arr is None:
            raise ValueError(f"Could not load image from path: {image}")
    elif isinstance(image, (bytes, bytearray)):
        img_arr = cv2.imdecode(np.frombuffer(image, dtype=np.uint8), cv2.IMREAD_COLOR)
        if img_arr is None:
            raise ValueError("Could not decode image from bytes.")
    elif isinstance(image, np.ndarray):
        img_arr = image
    else:
        raise TypeError(f"Unsupported image type: {type(image)}")

    detector = get_detector()
    return detector.process(img_arr, ocr_regions=ocr_regions, pkg_dimensions=pkg_dimensions)
