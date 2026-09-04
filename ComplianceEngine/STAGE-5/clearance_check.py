"""Surrounding clear space analysis for Net Quantity per Legal Metrology Rule 8(1).

Rule 8(1) proviso:
  The area surrounding the quantity declaration shall not contain any printed information:
  (a) above and below, by a space not less than the height of the numeral; and
  (b) to the left and right, by a space not less than twice the height of the numeral.
"""

from __future__ import annotations

import logging
from typing import Any, Dict, List, Optional, Tuple

import numpy as np

logger = logging.getLogger("stage5.clearance_check")


def evaluate_quantity_clearance(
    quantity_line: Optional[Dict[str, Any]],
    all_lines: List[Dict[str, Any]],
    numeral_height_px: Optional[float] = None,
) -> Dict[str, Any]:
    """Check whether any other OCR text block intrudes into the Rule 8(1) clearance zone.
    
    Returns:
        Dict with clearance_ok, has_printed_info, overlapping_texts, and exclusion_box.
    """
    if not quantity_line:
        return {
            "clearance_ok": True,
            "has_printed_info": False,
            "overlapping_texts": [],
            "overlapping_count": 0,
            "exclusion_box": None,
        }

    qty_bbox = quantity_line.get("bbox")
    if not qty_bbox:
        return {
            "clearance_ok": True,
            "has_printed_info": False,
            "overlapping_texts": [],
            "overlapping_count": 0,
            "exclusion_box": None,
        }

    arr = np.asarray(qty_bbox, dtype=float).reshape(-1, 2)
    qx_min, qy_min = np.min(arr, axis=0)
    qx_max, qy_max = np.max(arr, axis=0)

    # Effective numeral height
    h = numeral_height_px or (qy_max - qy_min)
    if h <= 0:
        h = 10.0

    # Mandatory exclusion boundaries per Rule 8(1)
    # top/bottom: 1x numeral height
    # left/right: 2x numeral height
    ex_x1 = qx_min - 2.0 * h
    ex_x2 = qx_max + 2.0 * h
    ex_y1 = qy_min - 1.0 * h
    ex_y2 = qy_max + 1.0 * h

    overlapping = []

    for line in all_lines:
        line_box = line.get("bbox")
        line_text = str(line.get("text", "")).strip()
        if not line_box or not line_text:
            continue

        l_arr = np.asarray(line_box, dtype=float).reshape(-1, 2)
        lx_min, ly_min = np.min(l_arr, axis=0)
        lx_max, ly_max = np.max(l_arr, axis=0)

        # Ignore the quantity line itself
        if abs(qx_min - lx_min) < 2 and abs(qy_min - ly_min) < 2 and abs(qx_max - lx_max) < 2 and abs(qy_max - ly_max) < 2:
            continue
        if line_text == str(quantity_line.get("text", "")).strip():
            continue

        # Axis-aligned bounding box (AABB) intersection check
        intersect_x = max(0.0, min(ex_x2, lx_max) - max(ex_x1, lx_min))
        intersect_y = max(0.0, min(ex_y2, ly_max) - max(ex_y1, ly_min))

        if intersect_x > 2 and intersect_y > 2:
            overlapping.append({
                "text": line_text,
                "bbox": line_box,
            })

    clearance_ok = (len(overlapping) == 0)

    return {
        "clearance_ok": clearance_ok,
        "has_printed_info": not clearance_ok,
        "overlapping_count": len(overlapping),
        "overlapping_texts": [o["text"] for o in overlapping],
        "exclusion_box": {
            "x1": round(float(ex_x1), 1),
            "y1": round(float(ex_y1), 1),
            "x2": round(float(ex_x2), 1),
            "y2": round(float(ex_y2), 1),
        },
    }
