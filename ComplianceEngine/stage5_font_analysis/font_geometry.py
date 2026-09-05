"""Numeral font geometry measurement per Legal Metrology Rule 7.

Isolates digit contours within declaration bounding boxes (e.g. Net Quantity
and MRP) using OpenCV computer vision to extract true numeral height and width
in physical millimeters, verifying Rule 7(3) proportion (width >= 1/3 height).
"""

from __future__ import annotations

import logging
import re
from typing import Any, Dict, List, Optional, Tuple

import cv2
import numpy as np

logger = logging.getLogger("stage5.font_geometry")

# Characters exempt from the 1/3 aspect ratio requirement per Rule 7(3) proviso
EXEMPT_CHARACTERS = {"1", "i", "I", "l"}


def isolate_numeral_contours(
    image: np.ndarray,
    bbox: List[List[float]],
) -> Dict[str, Any]:
    """Isolate individual numeral digit contours from the cropped text region.
    
    Returns:
        Dict with numeral_height_px, numeral_width_px, and contour details.
    """
    if image is None or image.size == 0 or not bbox:
        return {"numeral_height_px": None, "numeral_width_px": None, "digit_count": 0}

    arr = np.asarray(bbox, dtype=float).reshape(-1, 2)
    x_min, y_min = np.min(arr, axis=0)
    x_max, y_max = np.max(arr, axis=0)

    img_h, img_w = image.shape[:2]
    y1 = max(0, int(y_min))
    y2 = min(img_h, int(y_max))
    x1 = max(0, int(x_min))
    x2 = min(img_w, int(x_max))

    crop = image[y1:y2, x1:x2]
    if crop.size == 0 or crop.shape[0] < 4 or crop.shape[1] < 4:
        # Fallback to bbox height
        h = float(y_max - y_min)
        w = float(x_max - x_min)
        return {"numeral_height_px": h, "numeral_width_px": h * 0.45, "digit_count": 0}

    # Preprocessing for contour extraction
    gray = cv2.cvtColor(crop, cv2.COLOR_BGR2GRAY)
    blurred = cv2.GaussianBlur(gray, (3, 3), 0)
    _, binary = cv2.threshold(blurred, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)

    # If borders are mostly white, invert binary so characters are white on black
    border = np.concatenate([binary[0, :], binary[-1, :], binary[:, 0], binary[:, -1]])
    if np.mean(border) > 127:
        binary = cv2.bitwise_not(binary)

    contours, _ = cv2.findContours(binary, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    crop_h = crop.shape[0]

    digit_heights = []
    digit_widths = []

    for c in contours:
        cx, cy, cw, ch = cv2.boundingRect(c)
        # Filter noise, small specks, and horizontal underlines
        if ch >= crop_h * 0.35 and cw >= 2 and (ch / max(1, cw)) < 8.0:
            digit_heights.append(float(ch))
            digit_widths.append(float(cw))

    if digit_heights:
        # Medians provide robust character height/width resistant to outliers
        h_px = round(float(np.median(digit_heights)), 2)
        w_px = round(float(np.median(digit_widths)), 2)
        count = len(digit_heights)
    else:
        # Fallback: estimate from bounding box
        h_px = round(float(y_max - y_min), 2)
        w_px = round(h_px * 0.45, 2)
        count = 0

    return {
        "numeral_height_px": h_px,
        "numeral_width_px": w_px,
        "digit_count": count,
    }


def measure_declaration_font(
    declaration_line: Optional[Dict[str, Any]],
    image: Optional[np.ndarray],
    pixels_per_mm: Optional[float],
) -> Dict[str, Any]:
    """Measure font geometry for a declaration line (Net Quantity or MRP).
    
    Computes physical millimeters and validates Rule 7(3) proportion.
    """
    if not declaration_line:
        return {
            "present": False,
            "text": "",
            "height_px": None,
            "width_px": None,
            "height_mm": None,
            "width_mm": None,
            "aspect_ratio": None,
            "aspect_ratio_ok": True,
            "is_exempt_character": False,
        }

    text = declaration_line.get("text", "")
    bbox = declaration_line.get("bbox")

    # 1. Measure pixel geometry
    if image is not None and bbox:
        cv_geom = isolate_numeral_contours(image, bbox)
        h_px = cv_geom["numeral_height_px"]
        w_px = cv_geom["numeral_width_px"]
    else:
        h_px = declaration_line.get("pixel_height") or declaration_line.get("heightPx")
        w_px = round(h_px * 0.45, 2) if h_px else None

    # 2. Scale conversion to physical mm
    scale = pixels_per_mm if (pixels_per_mm and pixels_per_mm > 0) else None
    h_mm = round(h_px / scale, 2) if (h_px and scale) else None
    w_mm = round(w_px / scale, 2) if (w_px and scale) else None

    # 3. Rule 7(3) proportion check: width >= 1/3 height
    is_exempt = any(ch in EXEMPT_CHARACTERS for ch in text) and len(re.sub(r"\D", "", text)) == 1
    aspect_ratio = round(w_px / h_px, 2) if (h_px and w_px and h_px > 0) else None
    aspect_ratio_ok = (aspect_ratio >= 0.33) if (aspect_ratio and not is_exempt) else True

    return {
        "present": True,
        "text": text,
        "height_px": h_px,
        "width_px": w_px,
        "height_mm": h_mm,
        "width_mm": w_mm,
        "aspect_ratio": aspect_ratio,
        "aspect_ratio_ok": aspect_ratio_ok,
        "is_exempt_character": is_exempt,
    }
