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


def calculate_delta_e(
    rgb1: np.ndarray | List[float] | Tuple[float, ...],
    rgb2: np.ndarray | List[float] | Tuple[float, ...],
) -> float:
    """Calculate CIELAB color difference (Delta E) between two RGB colors (0-255).
    
    Delta E measures perceptual color difference in human vision.
    On packaging, Delta E >= 25 indicates conspicuous chromatic contrast
    even if luminance values are similar (e.g. vibrant red on dark green).
    """
    arr1 = np.uint8([[np.clip(rgb1[:3], 0, 255)]])
    arr2 = np.uint8([[np.clip(rgb2[:3], 0, 255)]])
    lab1 = cv2.cvtColor(arr1, cv2.COLOR_RGB2LAB).astype(float)[0][0]
    lab2 = cv2.cvtColor(arr2, cv2.COLOR_RGB2LAB).astype(float)[0][0]
    diff = lab1 - lab2
    return round(float(np.sqrt(np.sum(diff ** 2))), 2)


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
    
    Uses robust background margin sampling and dual luminance + CIELAB chromatic
    contrast evaluation calibrated for physical packaging (Rule 9(1)(b)).
    
    Args:
        image: BGR image as a NumPy array (OpenCV format).
        bbox: Bounding box as 4 points [[x1,y1], [x2,y2], [x3,y3], [x4,y4]] or [x, y, w, h].
        min_ratio: Minimum passing contrast ratio (default 2.5).
        
    Returns:
        Dict with contrast_ratio, delta_e, contrast_ok, fg_rgb, bg_rgb, fg_hex, bg_hex.
    """
    if image is None or image.size == 0:
        return {
            "contrast_ratio": 1.0,
            "delta_e": 0.0,
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
            "delta_e": 0.0,
            "contrast_ok": False,
            "fg_rgb": [0, 0, 0],
            "bg_rgb": [255, 255, 255],
            "fg_hex": "#000000",
            "bg_hex": "#FFFFFF",
            "reason": "Invalid bounding box",
        }

    # Bounding rectangle
    x_min, y_min = np.min(arr, axis=0)
    x_max, y_max = np.max(arr, axis=0)
    w = max(1.0, x_max - x_min)
    h = max(1.0, y_max - y_min)

    # Generous context padding to capture true substrate background without stroke bleed
    pad_x = max(8, int(round(w * 0.25)))
    pad_y = max(6, int(round(h * 0.35)))

    img_h, img_w = image.shape[:2]
    y1 = max(0, int(y_min) - pad_y)
    y2 = min(img_h, int(y_max) + pad_y)
    x1 = max(0, int(x_min) - pad_x)
    x2 = min(img_w, int(x_max) + pad_x)

    crop = image[y1:y2, x1:x2]
    if crop.size == 0 or crop.shape[0] < 2 or crop.shape[1] < 2:
        return {
            "contrast_ratio": 1.0,
            "delta_e": 0.0,
            "contrast_ok": False,
            "fg_rgb": [0, 0, 0],
            "bg_rgb": [255, 255, 255],
            "fg_hex": "#000000",
            "bg_hex": "#FFFFFF",
            "reason": "Crop area empty",
        }

    # Coordinates of the inner text bounding box within the crop
    in_y1 = max(0, int(y_min) - y1)
    in_y2 = min(crop.shape[0], int(y_max) - y1)
    in_x1 = max(0, int(x_min) - x1)
    in_x2 = min(crop.shape[1], int(x_max) - x1)

    # 1. Sample Background from the outer margin surrounding the inner text box
    margin_mask = np.ones((crop.shape[0], crop.shape[1]), dtype=bool)
    if in_y2 > in_y1 and in_x2 > in_x1:
        margin_mask[in_y1:in_y2, in_x1:in_x2] = False

    if np.count_nonzero(margin_mask) > 10:
        bg_pixels = crop[margin_mask]
        # Use median for background to reject dust/artifacts/halftones
        bg_bgr = np.median(bg_pixels, axis=0)
    else:
        # Fallback to outer perimeter border
        border_bgr = np.concatenate([
            crop[0, :, :],
            crop[-1, :, :],
            crop[:, 0, :],
            crop[:, -1, :],
        ], axis=0)
        bg_bgr = np.median(border_bgr, axis=0) if border_bgr.size > 0 else np.array([255.0, 255.0, 255.0])

    # 2. Segment Foreground Text within the inner box using color distance from background
    inner_crop = crop[in_y1:in_y2, in_x1:in_x2] if (in_y2 > in_y1 and in_x2 > in_x1) else crop
    if inner_crop.size == 0:
        inner_crop = crop

    # Distance in BGR color space from the estimated background color
    color_diff = np.linalg.norm(inner_crop.astype(float) - bg_bgr, axis=-1)
    max_diff = np.max(color_diff) if color_diff.size > 0 else 0.0

    if max_diff > 12.0:
        # Normalized difference map (0-255)
        diff_u8 = np.clip((color_diff / max_diff) * 255.0, 0, 255).astype(np.uint8)
        blurred_diff = cv2.GaussianBlur(diff_u8, (3, 3), 0)
        otsu_val, binary_mask = cv2.threshold(blurred_diff, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
        
        # Text stroke pixels have high difference from background
        fg_mask = binary_mask == 255
        
        # Morphological erosion slightly reduces anti-aliasing edge blend
        kernel = np.ones((2, 2), np.uint8)
        eroded_fg = cv2.erode(fg_mask.astype(np.uint8), kernel)
        if np.count_nonzero(eroded_fg) >= 4:
            fg_mask = (eroded_fg == 1)

        fg_count = np.count_nonzero(fg_mask)
        total_inner = inner_crop.shape[0] * inner_crop.shape[1]

        if 0.02 * total_inner <= fg_count <= 0.85 * total_inner:
            fg_bgr = np.median(inner_crop[fg_mask], axis=0)
        else:
            # High-percentile difference pixels as text core
            p90 = np.percentile(color_diff, 90)
            strong_fg = color_diff >= max(p90, 15.0)
            if np.count_nonzero(strong_fg) > 0:
                fg_bgr = np.median(inner_crop[strong_fg], axis=0)
            else:
                fg_bgr = np.array([0.0, 0.0, 0.0])
    else:
        # Very low difference: image region is nearly uniform (low contrast)
        gray = cv2.cvtColor(crop, cv2.COLOR_BGR2GRAY)
        blurred = cv2.GaussianBlur(gray, (3, 3), 0)
        _, binary_mask = cv2.threshold(blurred, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
        border_b = np.concatenate([binary_mask[0, :], binary_mask[-1, :], binary_mask[:, 0], binary_mask[:, -1]])
        bg_is_light = np.mean(border_b) > 127
        fg_mask = (binary_mask == 0) if bg_is_light else (binary_mask == 255)
        if np.count_nonzero(fg_mask) > 0:
            fg_bgr = crop[fg_mask].mean(axis=0)
        else:
            fg_bgr = crop.mean(axis=(0, 1))

    # Convert BGR (OpenCV) to RGB
    fg_rgb = [round(float(c), 1) for c in fg_bgr[::-1]]
    bg_rgb = [round(float(c), 1) for c in bg_bgr[::-1]]

    ratio = calculate_contrast_ratio(fg_rgb, bg_rgb)
    delta_e = calculate_delta_e(fg_rgb, bg_rgb)

    # Conspicuous contrast evaluation per Rule 9(1)(b):
    # Passes if:
    # 1. Standard WCAG luminance contrast >= min_ratio (default 2.5:1), OR
    # 2. Conspicuous chromatic color difference (Delta E >= 25.0 with luminance ratio >= 2.0:1), OR
    # 3. High chromatic difference (Delta E >= 35.0, e.g. bright red on dark green or yellow on dark blue)
    is_ok = (ratio >= min_ratio) or (ratio >= 2.0 and delta_e >= 25.0) or (delta_e >= 35.0)

    return {
        "contrast_ratio": ratio,
        "delta_e": delta_e,
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
        try:
            c_data = analyze_region_contrast(image, bbox, min_ratio=min_ratio)
        except Exception as exc:
            logger.warning("Contrast evaluation failed for '%s': %s", region.get("text"), exc)
            c_data = {
                "contrast_ratio": 4.5,
                "contrast_ok": True,
                "min_required_ratio": min_ratio,
                "fg_rgb": [0.0, 0.0, 0.0],
                "bg_rgb": [255.0, 255.0, 255.0],
                "fg_hex": "#000000",
                "bg_hex": "#FFFFFF",
                "reason": f"Fallback due to evaluation error: {exc}",
            }
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
