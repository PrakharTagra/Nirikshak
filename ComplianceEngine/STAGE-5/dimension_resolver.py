"""Packaging dimension resolution and physical scale calibration.

Extracts box/carton/packaging dimensions if labelled on the packaging
(explicitly ignoring inner product item dimensions such as sheets or wipes).
If packaging dimensions are not present on the label, prompts the user to
input them interactively or accepts user-supplied dimensions.
"""

from __future__ import annotations

import logging
import re
import sys
from typing import Any, Dict, List, Optional, Tuple

logger = logging.getLogger("stage5.dimension_resolver")

# Patterns indicating inner product items rather than outer packaging
INNER_PRODUCT_KEYWORDS = [
    r"\bsheets?\b",
    r"\bwipes?\b",
    r"\btissues?\b",
    r"\bnapkins?\b",
    r"\btablets?\b",
    r"\bcapsules?\b",
    r"\btiles?\b",
    r"\bbiscuits?\b",
    r"\bsoap\s*bar\b",
    r"\binner\b",
    r"\beach\s*piece\b",
    r"\bper\s*piece\b",
    r"\bitem\s*size\b",
]

# Patterns specifically indicating the box/packaging/carton
PACKAGING_KEYWORDS = [
    r"\bbox\b",
    r"\bpack(?:ag(?:e|ing))?\b",
    r"\bcarton\b",
    r"\bouter\b",
    r"\bcontainer\b",
    r"\bcase\b",
    r"\bpack\s*dim(?:ension)?s?\b",
    r"\bbox\s*dim(?:ension)?s?\b",
    r"\bdimensions?\b",
    r"\bsize\b",
]

# Regex matching 2D or 3D dimension strings:
# e.g. "120 x 80 x 40 mm", "10 cm x 5 cm x 15 cm", "85x14x85mm", "200mm X 100mm"
DIMENSION_REGEX = re.compile(
    r"(?:(\d+(?:\.\d+)?)\s*(mm|cm|m|inch(?:es)?|in)?\s*[xX*×]\s*)"
    r"(\d+(?:\.\d+)?)\s*(mm|cm|m|inch(?:es)?|in)?"
    r"(?:\s*[xX*×]\s*(\d+(?:\.\d+)?)\s*(mm|cm|m|inch(?:es)?|in)?)?",
    re.IGNORECASE,
)


def _convert_to_mm(value: float, unit: str) -> float:
    """Normalize linear unit to millimeters."""
    u = (unit or "").lower().strip()
    if u == "cm":
        return value * 10.0
    if u == "m":
        return value * 1000.0
    if u in {"inch", "inches", "in"}:
        return value * 25.4
    return value  # Default assumes mm


def parse_dimension_string(text: str) -> Optional[Dict[str, Any]]:
    """Parse a dimension string into normalized mm values."""
    if not text:
        return None
    match = DIMENSION_REGEX.search(text)
    if not match:
        return None

    val1 = float(match.group(1))
    unit1 = match.group(2)
    val2 = float(match.group(3))
    unit2 = match.group(4)
    val3 = float(match.group(5)) if match.group(5) else None
    unit3 = match.group(6)

    # Determine default unit (falls back to mm if omitted)
    fallback_unit = unit3 or unit2 or unit1 or "mm"

    l_mm = _convert_to_mm(val1, unit1 or fallback_unit)
    w_mm = _convert_to_mm(val2, unit2 or fallback_unit)
    h_mm = _convert_to_mm(val3, unit3 or fallback_unit) if val3 is not None else None

    dims = [l_mm, w_mm]
    if h_mm is not None:
        dims.append(h_mm)

    return {
        "raw_text": match.group(0),
        "length_mm": l_mm,
        "width_mm": w_mm,
        "height_mm": h_mm,
        "all_dimensions_mm": dims,
        "is_3d": len(dims) >= 3,
    }


def is_inner_product_dimension(text: str) -> bool:
    """Check if the text refers to inner product items rather than packaging."""
    lower = text.lower()
    for kw in INNER_PRODUCT_KEYWORDS:
        if re.search(kw, lower, re.I):
            return True
    return False


def extract_packaging_dimensions(lines: List[Dict[str, Any]]) -> Optional[Dict[str, Any]]:
    """Extract packaging/box dimensions from OCR lines.
    
    Explicitly ignores inner product item dimensions.
    """
    candidate = None

    for line in lines:
        text = str(line.get("text", "")).strip()
        if not text:
            continue

        # Reject inner product dimensions
        if is_inner_product_dimension(text):
            continue

        parsed = parse_dimension_string(text)
        if not parsed:
            continue

        # Check if line explicitly mentions packaging keywords
        has_packaging_kw = any(re.search(kw, text, re.I) for kw in PACKAGING_KEYWORDS)
        if has_packaging_kw:
            return {
                **parsed,
                "source": "packaging_label",
                "matched_text": text,
                "confidence": "high",
            }

        if candidate is None:
            candidate = {
                **parsed,
                "source": "packaging_label",
                "matched_text": text,
                "confidence": "medium",
            }

    return candidate


def prompt_user_for_dimensions() -> Optional[Dict[str, Any]]:
    """Interactive fallback prompting user for packaging dimensions via CLI."""
    print("\n" + "=" * 65)
    print(" [STAGE 5] Packaging dimensions not found on package label.")
    print(" Rule 7 font-size analysis requires the physical package dimensions.")
    print(" Format required: Length * Width * Height (e.g., '120x80x40 mm')")
    print("=" * 65)
    sys.stdout.flush()

    try:
        user_input = input(
            "Enter box/packaging dimensions in Length*Width*Height format (e.g., '120x80x40 mm' or '12x8x4 cm'): "
        ).strip()
    except (EOFError, KeyboardInterrupt):
        return None

    parsed = parse_dimension_string(user_input)
    if parsed:
        parsed["source"] = "user_input"
        parsed["matched_text"] = user_input
        parsed["confidence"] = "user_verified"
        print(f"-> Verified packaging dimensions: {parsed['length_mm']} x {parsed['width_mm']}" +
              (f" x {parsed['height_mm']}" if parsed['height_mm'] else "") + " mm\n")
        return parsed

    print("Invalid dimension format provided. Proceeding without physical scale.")
    return None


def resolve_packaging_dimensions(
    ocr_lines: List[Dict[str, Any]],
    user_dimensions: Optional[str | Dict[str, Any]] = None,
    allow_prompt: bool = True,
) -> Optional[Dict[str, Any]]:
    """Resolve packaging dimensions:
    
    1. Check user_dimensions parameter/argument first.
    2. Check OCR text for declared packaging dimensions.
    3. If not found and allow_prompt=True, interactively prompt the user.
    """
    if user_dimensions:
        if isinstance(user_dimensions, dict) and "all_dimensions_mm" in user_dimensions:
            return user_dimensions
        if isinstance(user_dimensions, str):
            parsed = parse_dimension_string(user_dimensions)
            if parsed:
                parsed["source"] = "user_argument"
                return parsed

    detected = extract_packaging_dimensions(ocr_lines)
    if detected:
        logger.info(f"Detected packaging dimensions on label: {detected['raw_text']}")
        return detected

    if allow_prompt and sys.stdin.isatty():
        return prompt_user_for_dimensions()

    return None


def calculate_pixels_per_mm(
    image_shape: Tuple[int, int],
    package_dims: Dict[str, Any],
    package_bbox: Optional[List[List[float]]] = None,
) -> float:
    """Calculate the physical scale (pixels per mm).
    
    Maps the visible 2D package bounding box to the largest physical dimensions.
    """
    if not package_dims or "all_dimensions_mm" not in package_dims:
        return 0.0

    img_h, img_w = image_shape[:2]

    if package_bbox:
        arr = package_bbox
        x_min, y_min = min(p[0] for p in arr), min(p[1] for p in arr)
        x_max, y_max = max(p[0] for p in arr), max(p[1] for p in arr)
        box_w = max(1.0, float(x_max - x_min))
        box_h = max(1.0, float(y_max - y_min))
    else:
        box_w = float(img_w)
        box_h = float(img_h)

    # In a 2D package view, the visible panel corresponds to the largest dimensions
    dims_mm = package_dims["all_dimensions_mm"]
    sorted_dims = sorted(dims_mm, reverse=True)
    dim_long_mm = sorted_dims[0]
    dim_short_mm = sorted_dims[1] if len(sorted_dims) > 1 else sorted_dims[0]

    box_long_px = max(box_w, box_h)
    box_short_px = min(box_w, box_h)

    scale_long = box_long_px / dim_long_mm if dim_long_mm > 0 else 0.0
    scale_short = box_short_px / dim_short_mm if dim_short_mm > 0 else 0.0

    # Average consistent scale across axes
    if scale_long > 0 and scale_short > 0:
        pixels_per_mm = (scale_long + scale_short) / 2.0
    else:
        pixels_per_mm = max(scale_long, scale_short)

    return round(float(pixels_per_mm), 3)
