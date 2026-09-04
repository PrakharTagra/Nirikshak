"""Master Stage 5 Font & Readability Analyzer.

Coordinates:
  1. Packaging dimension resolution (label detection or interactive user prompt)
  2. Physical scale calibration (pixels_per_mm)
  3. True numeral font geometry measurement (Rule 7)
  4. Net quantity surrounding clearance zone verification (Rule 8(1))
  5. Contrast & color readability evaluation (Rule 9(1)(b))
"""

from __future__ import annotations

import json
import logging
import re
import sys
from typing import Any, Dict, List, Optional

import cv2
import numpy as np

from .clearance_check import evaluate_quantity_clearance
from .dimension_resolver import calculate_pixels_per_mm, resolve_packaging_dimensions
from .font_geometry import measure_declaration_font

logger = logging.getLogger("stage5.readability_analyzer")


def _find_line(lines: List[Dict[str, Any]], patterns: List[str]) -> Optional[Dict[str, Any]]:
    for pat in patterns:
        rx = re.compile(pat, re.I)
        for l in lines:
            if rx.search(str(l.get("text", ""))):
                return l
    return None


def analyze_font_and_readability(
    ocr_result: Dict[str, Any],
    image: Optional[np.ndarray] = None,
    user_dimensions: Optional[str | Dict[str, Any]] = None,
    allow_user_prompt: bool = True,
    pixels_per_mm_override: Optional[float] = None,
    min_contrast_ratio: float = 2.5,
) -> Dict[str, Any]:
    """Execute complete Stage 5 Font and Readability analysis.
    
    Args:
        ocr_result: Dictionary containing 'lines', 'regions', and optional 'contrast_analysis'.
        image: BGR NumPy array of the packaging image (optional).
        user_dimensions: Explicit dimensions string or dict (e.g. "120x80x40 mm").
        allow_user_prompt: If True, interactively prompt user if packaging dimensions missing.
        pixels_per_mm_override: Pre-configured calibration scale if available.
        min_contrast_ratio: Minimum passing contrast ratio (default 2.5).
        
    Returns:
        Structured labelMetrics dict ready for rule engine consumption.
    """
    lines = ocr_result.get("lines") or ocr_result.get("regions") or []

    # 1. Locate Net Quantity and MRP declaration lines
    qty_line = _find_line(
        lines,
        [
            r"\bnet\s*(?:wt|weight|qty|quantity)\b",
            r"\bcontents?\b",
            r"\b\d+(?:\.\d+)?\s*(?:kg|g|gm|ml|l|unit|units|n\b|u\b|pieces?)\b",
        ],
    )
    mrp_line = _find_line(
        lines,
        [
            r"\bm\.?r\.?p\.?\b",
            r"maximum\s+retail\s+price",
            r"max\.?\s*retail\s*price",
        ],
    )

    # 2. Packaging Dimension Resolution & Physical Calibration
    pkg_dims = resolve_packaging_dimensions(
        lines,
        user_dimensions=user_dimensions,
        allow_prompt=allow_user_prompt,
    )

    if pixels_per_mm_override and pixels_per_mm_override > 0:
        pixels_per_mm = pixels_per_mm_override
        calibration_source = "override"
    elif pkg_dims and image is not None:
        pixels_per_mm = calculate_pixels_per_mm(image.shape[:2], pkg_dims)
        calibration_source = pkg_dims.get("source", "packaging_dimensions")
    elif pkg_dims and lines:
        # Fallback: estimate image bounds from maximum bounding coordinates
        all_pts = [pt for l in lines for pt in (l.get("bbox") or [])]
        if all_pts:
            max_x = max(p[0] for p in all_pts)
            max_y = max(p[1] for p in all_pts)
            pixels_per_mm = calculate_pixels_per_mm((int(max_y), int(max_x)), pkg_dims)
            calibration_source = pkg_dims.get("source", "packaging_dimensions")
        else:
            pixels_per_mm = None
            calibration_source = "unavailable"
    else:
        pixels_per_mm = None
        calibration_source = "unavailable"

    # 3. True Numeral Font Geometry (Rule 7)
    qty_font = measure_declaration_font(qty_line, image, pixels_per_mm)
    mrp_font = measure_declaration_font(mrp_line, image, pixels_per_mm)

    numeral_height_mm = {
        "netQty": qty_font["height_mm"],
        "rsp": mrp_font["height_mm"],
    }
    numeral_width_mm = {
        "netQty": qty_font["width_mm"],
        "rsp": mrp_font["width_mm"],
    }

    # 4. Surrounding Clear Space Analysis (Rule 8(1))
    clearance_data = evaluate_quantity_clearance(
        qty_line,
        lines,
        numeral_height_px=qty_font.get("height_px"),
    )

    # 5. Contrast and Color Readability Evaluation (Rule 9(1)(b))
    contrast_summary = ocr_result.get("contrast_analysis") or ocr_result.get("contrastAnalysis") or {}
    failing_lines = [l for l in lines if l.get("contrast", {}).get("contrast_ok") is False]

    qty_contrast = (qty_line or {}).get("contrast")
    mrp_contrast = (mrp_line or {}).get("contrast")

    qty_contrast_ok = qty_contrast.get("contrast_ok", True) if qty_contrast else True
    mrp_contrast_ok = mrp_contrast.get("contrast_ok", True) if mrp_contrast else True
    overall_contrast_ok = contrast_summary.get("overall_contrast_ok", len(failing_lines) == 0)

    has_contrast_data = bool(qty_contrast or mrp_contrast or contrast_summary or failing_lines)
    contrast_ok = (qty_contrast_ok and mrp_contrast_ok and overall_contrast_ok) if has_contrast_data else True

    evaluated_ratios = [
        qty_contrast.get("contrast_ratio") if qty_contrast else None,
        mrp_contrast.get("contrast_ratio") if mrp_contrast else None,
        contrast_summary.get("min_contrast_ratio"),
        *[l.get("contrast", {}).get("contrast_ratio") for l in failing_lines],
    ]
    valid_ratios = [r for r in evaluated_ratios if r is not None]
    lowest_contrast_ratio = min(valid_ratios) if valid_ratios else None

    failing_declarations = []
    if qty_contrast and not qty_contrast.get("contrast_ok"):
        failing_declarations.append("Net Quantity")
    if mrp_contrast and not mrp_contrast.get("contrast_ok"):
        failing_declarations.append("MRP")
    if not failing_declarations and failing_lines:
        for fl in failing_lines[:3]:
            failing_declarations.append(f"\"{fl.get('text', '')[:25]}...\"")

    languages = list({l.get("language") for l in lines if l.get("language")})
    if not any("english" in lang.lower() for lang in languages):
        languages.append("English")

    return {
        "numeralHeightMm": numeral_height_mm,
        "numeralWidthMm": numeral_width_mm,
        "calibrationAvailable": bool(pixels_per_mm and pixels_per_mm > 0),
        "pixelsPerMm": pixels_per_mm,
        "calibrationSource": calibration_source,
        "packagingDimensions": pkg_dims,
        "pdpAreaCm2": None,
        "contrastOk": contrast_ok,
        "contrastRatio": lowest_contrast_ratio,
        "minRequiredRatio": min_contrast_ratio,
        "failingDeclarations": failing_declarations,
        "quantityDeclarationSurroundingAreaHasPrintedInfo": clearance_data["has_printed_info"],
        "clearanceExclusionZone": clearance_data["exclusion_box"],
        "clearanceOverlappingTexts": clearance_data["overlapping_texts"],
        "isExemptCharacterShape": bool(qty_font.get("is_exempt_character")),
        "isBlownFormedMoldedEmbossedOrPerforated": False,
        "isBlownFormedMoldedOnGlassOrPlastic": False,
        "isHandwrittenOrHandScript: ": False,
        "handwritingIsClearUnambiguousLegible": False,
        "legibilityIssue": False,
        "declarationOnlyReadableThroughLiquid": False,
        "rspOnCrownCapOrBottle": False,
        "wrapperTransparentAndDeclarationsReadableThrough": False,
        "innerPackageHasNoOuterCoverDeclaration": False,
        "outerContainerHasAllDeclarations": False,
        "languageUsed": languages,
        "details": {
            "netQuantityFont": qty_font,
            "mrpFont": mrp_font,
            "clearance": clearance_data,
        },
    }


def main():
    """CLI runner for Stage 5 readability analysis."""
    import argparse
    parser = argparse.ArgumentParser(description="Nirikshak Stage 5 Font & Readability Analyzer")
    parser.add_argument("--ocr-json", help="Path to OCR output JSON (from Stage 4)")
    parser.add_argument("--image", help="Path to preprocessed image")
    parser.add_argument("--dimensions", help="Packaging dimensions (e.g. '120x80x40 mm')")
    parser.add_argument("--scale", type=float, help="Explicit pixels per mm scale")
    args = parser.parse_args()

    ocr_data = {}
    if args.ocr_json:
        with open(args.ocr_json, "r", encoding="utf-8") as f:
            ocr_data = json.load(f)

    img = cv2.imread(args.image) if args.image else None

    result = analyze_font_and_readability(
        ocr_result=ocr_data,
        image=img,
        user_dimensions=args.dimensions,
        pixels_per_mm_override=args.scale,
    )

    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
