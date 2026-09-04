"""Contrast and color readability analysis for packaging declarations.

Implements WCAG 2.1 relative luminance and contrast ratio calculations
combined with OpenCV computer vision segmentation (Otsu thresholding)
to measure the contrast between printed declarations (e.g. Net Quantity, MRP)
and the packaging background, strictly enforcing Legal Metrology Rule 9(1)(b).
"""

from __future__ import annotations

import logging
from typing import Any, Dict, List, Optional, Tuple

import cv2
import numpy as np

logger = logging.getLogger("ocr.contrast")

# Legal Metrology / WCAG thresholds:
# 2.5:1 is the calibrated minimum for conspicuous packaging numerals (Rule 9(1)(b)).
# 4.5:1 is the standard for normal body text.
DEFAULT_MIN_CONTRAST_RATIO = 2.5


def calculate_relative_luminance(rgb: np.ndarray | List[float] | Tuple[float, ...]) -> float:
    """Calculate WCAG 2.1 relative luminance from sRGB values (0-255).
    
    Formula:
      L = 0.2126 * R' + 0.7152 * G' + 0.0722 * B'
      where C' = C/255 <= 0.03928 ? (C/255)/12.92 : ((C/255 + 0.055)/1.055)^2.4
    """
    srgb = np.asarray(rgb, dtype=float) / 255.0
    linear = np.where(
        srgb <= 0.03928,
        srgb / 12.92,
        ((srgb + 0.055) / 1.055) ** 2.4,
    )
    return float(0.2126 * linear[0] + 0.7152 * linear[1] + 0.0722 * linear[2])


def calculate_contrast_ratio(
    rgb1: np.ndarray | List[float] | Tuple[float, ...],
    rgb2: np.ndarray | List[float] | Tuple[float, ...],
) -> float:
    """Calculate WCAG contrast ratio between two RGB colors (range: 1.0 to 21.0).
    
    CR = (L1 + 0.05) / (L2 + 0.05) where L1 is the lighter of the two colors.
    """
    l1 = calculate_relative_luminance(rgb1)
    l2 = calculate_relative_luminance(rgb2)
    lighter = max(l1, l2)
    darker = min(l1, l2)
    return round(float((lighter + 0.05) / (darker + 0.05)), 2)


def rgb_to_hex(rgb: np.ndarray | List[float] | Tuple[float, ...]) -> str:
    """Convert RGB values to hexadecimal color code."""
    r, g, b = [int(np.clip(round(float(c)), 0, 255)) for c in rgb[:3]]
    return f"#{r:02X}{g:02X}{b:02X}"


def analyze_region_contrast(
    image: np.ndarray,
    bbox: Any,
    min_ratio: float = DEFAULT_MIN_CONTRAST_RATIO,
) -> Dict[str, Any]:
    """Measure the contrast ratio between text strokes and surrounding background.
    
    Args:
        image: BGR image as a NumPy array (OpenCV format).
        bbox: Bounding box as 4 points [[x1,y1], [x2,y2], [x3,y3], [x4,y4]] or [x, y, w, h].
        min_ratio: Minimum passing contrast ratio.
        
    Returns:
        Dict with contrast_ratio, contrast_ok, fg_rgb, bg_rgb, fg_hex, bg_hex.
    """
    if image is None or image.size == 0:
        return {
            "contrast_ratio": 1.0,
            "contrast_ok": False,
            "fg_rgb": [0, 0, 0],
            "bg_rgb": [255, 255, 255],
            "fg_hex": "#000000",
            "bg_hex": "#FFFFFF",
            "reason": "Image not available",
        }

    arr = np.asarray(bbox, dtype=float).reshape(-1, 2)
    if len(arr) < 3:
        return {
            "contrast_ratio": 1.0,
            "contrast_ok": False,
            "fg_rgb": [0, 0, 0],
            "bg_rgb": [255, 255, 255],
            "fg_hex": "#000000",
            "bg_hex": "#FFFFFF",
            "reason": "Invalid bounding box",
        }

    # Bounding rectangle with 15% context padding around the text
    x_min, y_min = np.min(arr, axis=0)
    x_max, y_max = np.max(arr, axis=0)
    w = max(1.0, x_max - x_min)
    h = max(1.0, y_max - y_min)

    pad_x = int(round(w * 0.15))
    pad_y = int(round(h * 0.15))

    img_h, img_w = image.shape[:2]
    y1 = max(0, int(y_min) - pad_y)
    y2 = min(img_h, int(y_max) + pad_y)
    x1 = max(0, int(x_min) - pad_x)
    x2 = min(img_w, int(x_max) + pad_x)

    crop = image[y1:y2, x1:x2]
    if crop.size == 0 or crop.shape[0] < 2 or crop.shape[1] < 2:
        return {
            "contrast_ratio": 1.0,
            "contrast_ok": False,
            "fg_rgb": [0, 0, 0],
            "bg_rgb": [255, 255, 255],
            "fg_hex": "#000000",
            "bg_hex": "#FFFFFF",
            "reason": "Crop area empty",
        }

    # Convert to grayscale and apply slight blur for Otsu thresholding
    gray = cv2.cvtColor(crop, cv2.COLOR_BGR2GRAY)
    blurred = cv2.GaussianBlur(gray, (3, 3), 0)
    _, binary_mask = cv2.threshold(blurred, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)

    # Determine which binary value represents background.
    # Packaging background almost always forms the perimeter of the padded crop box.
    top_edge = binary_mask[0, :]
    bottom_edge = binary_mask[-1, :]
    left_edge = binary_mask[:, 0]
    right_edge = binary_mask[:, -1]
    border_pixels = np.concatenate([top_edge, bottom_edge, left_edge, right_edge])

    # If >50% of border pixels are 255, then 255 is background and 0 is text foreground
    bg_is_light = np.mean(border_pixels) > 127

    if bg_is_light:
        bg_mask = binary_mask == 255
        fg_mask = binary_mask == 0
    else:
        bg_mask = binary_mask == 0
        fg_mask = binary_mask == 255

    # If foreground mask has too few pixels (<1%) or too many (>99%), fall back to
    # central stroke vs perimeter color estimation
    total_pixels = crop.shape[0] * crop.shape[1]
    fg_count = np.count_nonzero(fg_mask)
    if fg_count < total_pixels * 0.01 or fg_count > total_pixels * 0.99:
        border_bgr = np.concatenate([
            crop[0, :, :],
            crop[-1, :, :],
            crop[:, 0, :],
            crop[:, -1, :],
        ], axis=0)
        bg_bgr = border_bgr.mean(axis=0)
        ch, cw = crop.shape[:2]
        center_core = crop[ch // 4 : 3 * ch // 4, cw // 4 : 3 * cw // 4]
        fg_bgr = center_core.mean(axis=0) if center_core.size > 0 else crop.mean(axis=0)
    else:
        fg_bgr = crop[fg_mask].mean(axis=0)
        bg_bgr = crop[bg_mask].mean(axis=0)

    # Convert BGR (OpenCV) to RGB
    fg_rgb = [round(float(c), 1) for c in fg_bgr[::-1]]
    bg_rgb = [round(float(c), 1) for c in bg_bgr[::-1]]

    ratio = calculate_contrast_ratio(fg_rgb, bg_rgb)
    is_ok = ratio >= min_ratio

    return {
        "contrast_ratio": ratio,
        "contrast_ok": is_ok,
        "min_required_ratio": min_ratio,
        "fg_rgb": fg_rgb,
        "bg_rgb": bg_rgb,
        "fg_hex": rgb_to_hex(fg_rgb),
        "bg_hex": rgb_to_hex(bg_rgb),
    }


def analyze_image_declarations_contrast(
    image: np.ndarray,
    regions: List[Dict[str, Any]],
    min_ratio: float = DEFAULT_MIN_CONTRAST_RATIO,
) -> Dict[str, Any]:
    """Measure contrast for all detected text regions and summarize overall packaging contrast.
    
    Mutates regions in place by attaching a `contrast` dictionary to each region.
    """
    if not regions or image is None or image.size == 0:
        return {
            "overall_contrast_ok": True,
            "min_contrast_ratio": None,
            "average_contrast_ratio": None,
            "failing_regions_count": 0,
            "failing_regions": [],
            "total_evaluated": 0,
        }

    ratios = []
    failing_regions = []

    for region in regions:
        bbox = region.get("bbox")
        if not bbox:
            continue
        c_data = analyze_region_contrast(image, bbox, min_ratio=min_ratio)
        region["contrast"] = c_data
        ratios.append(c_data["contrast_ratio"])
        if not c_data["contrast_ok"]:
            failing_regions.append({
                "text": region.get("text", ""),
                "contrast_ratio": c_data["contrast_ratio"],
                "fg_hex": c_data["fg_hex"],
                "bg_hex": c_data["bg_hex"],
                "bbox": bbox,
            })

    min_ratio_observed = min(ratios) if ratios else None
    avg_ratio = round(float(np.mean(ratios)), 2) if ratios else None
    overall_ok = len(failing_regions) == 0

    return {
        "overall_contrast_ok": overall_ok,
        "min_contrast_ratio": min_ratio_observed,
        "average_contrast_ratio": avg_ratio,
        "failing_regions_count": len(failing_regions),
        "failing_regions": failing_regions,
        "total_evaluated": len(ratios),
    }
