"""
Stage 3 PDP — Packaging Geometry & Statutory Spatial Engine
Legal Metrology (Packaged Commodities) Rules, 2011 (Rules 2(h), 6, 7, 8)
"""

from __future__ import annotations

import math
from typing import Any, Dict, List, Optional, Tuple

import cv2
import numpy as np
from shapely.geometry import Polygon, box


def order_points(pts: np.ndarray) -> np.ndarray:
    """
    Order 4 quadrilateral coordinates clockwise:
    [top-left, top-right, bottom-right, bottom-left].
    Works robustly for arbitrary rotations.
    """
    pts = np.asarray(pts, dtype=np.float32)
    if pts.shape != (4, 2):
        raise ValueError(f"Expected (4, 2) points, got {pts.shape}")

    rect = np.zeros((4, 2), dtype=np.float32)

    # Sum of coordinates: top-left has smallest sum, bottom-right has largest sum
    s = pts.sum(axis=1)
    rect[0] = pts[np.argmin(s)]
    rect[2] = pts[np.argmax(s)]

    # Difference of coordinates (y - x or x - y):
    # top-right has smallest diff (x - y), bottom-left has largest diff (x - y)
    diff = np.diff(pts, axis=1)
    rect[1] = pts[np.argmin(diff)]
    rect[3] = pts[np.argmax(diff)]

    return rect


def four_point_transform(image: np.ndarray, pts: np.ndarray) -> Tuple[np.ndarray, np.ndarray]:
    """
    Perform 4-point perspective warp on image using quadrilateral corners.
    Returns:
        (warped_image, transform_matrix)
    """
    rect = order_points(pts)
    (tl, tr, br, bl) = rect

    # Compute width of new image (max of top and bottom edges)
    width_a = np.hypot(br[0] - bl[0], br[1] - bl[1])
    width_b = np.hypot(tr[0] - tl[0], tr[1] - tl[1])
    max_width = max(int(round(width_a)), int(round(width_b)))

    # Compute height of new image (max of left and right edges)
    height_a = np.hypot(tr[0] - br[0], tr[1] - br[1])
    height_b = np.hypot(tl[0] - bl[0], tl[1] - bl[1])
    max_height = max(int(round(height_a)), int(round(height_b)))

    # Minimum dimension guard to prevent empty crops
    max_width = max(max_width, 10)
    max_height = max(max_height, 10)

    dst = np.array(
        [
            [0, 0],
            [max_width - 1, 0],
            [max_width - 1, max_height - 1],
            [0, max_height - 1],
        ],
        dtype=np.float32,
    )

    m = cv2.getPerspectiveTransform(rect, dst)
    warped = cv2.warpPerspective(
        image,
        m,
        (max_width, max_height),
        flags=cv2.INTER_CUBIC,
        borderMode=cv2.BORDER_REPLICATE,
    )

    return warped, m


def parse_package_dimensions(pkg_dims_str: Optional[str]) -> Optional[Dict[str, float]]:
    """
    Parse packaging dimensions from string (e.g. '120x80x40 mm' or '10 x 5 x 2 cm').
    Returns dict with keys 'length_mm', 'width_mm', 'height_mm', 'shape'.
    """
    if not pkg_dims_str or not isinstance(pkg_dims_str, str):
        return None

    import re
    cleaned = pkg_dims_str.strip().lower()
    
    # Check for unit
    scale = 1.0  # default mm
    if "cm" in cleaned:
        scale = 10.0
    elif "m" in cleaned and "mm" not in cleaned:
        scale = 1000.0

    nums = [float(x) for x in re.findall(r"\d+(?:\.\d+)?", cleaned)]
    if len(nums) == 3:
        return {
            "length_mm": nums[0] * scale,
            "width_mm": nums[1] * scale,
            "height_mm": nums[2] * scale,
            "shape": "rectangular",
        }
    elif len(nums) == 2:
        # Cylindrical: diameter x height
        return {
            "diameter_mm": nums[0] * scale,
            "height_mm": nums[1] * scale,
            "shape": "cylindrical",
        }
    return None


def calculate_pdp_area(
    panel_poly: np.ndarray,
    img_shape: Tuple[int, int],
    pkg_dims: Optional[Dict[str, float]] = None,
) -> Dict[str, Any]:
    """
    Compute pixel surface area and real-world physical area (cm^2) for the PDP
    in accordance with Rule 2(h) and Rule 7 of Legal Metrology Rules, 2011.
    """
    # 1. Pixel area via Shoelace formula
    pts = np.asarray(panel_poly, dtype=np.float32)
    area_px = float(cv2.contourArea(pts.astype(np.int32)))

    # Compute bounding rect dimensions in pixels
    rect = order_points(pts)
    (tl, tr, br, bl) = rect
    width_px = float(max(np.hypot(br[0] - bl[0], br[1] - bl[1]), np.hypot(tr[0] - tl[0], tr[1] - tl[1])))
    height_px = float(max(np.hypot(tr[0] - br[0], tr[1] - br[1]), np.hypot(tl[0] - bl[0], tl[1] - bl[1])))

    # 2. Real physical area calculation if package dimensions are supplied
    area_cm2: Optional[float] = None
    mm_per_pixel: Optional[float] = None

    if pkg_dims:
        shape = pkg_dims.get("shape", "rectangular")
        if shape == "rectangular" and "height_mm" in pkg_dims:
            # Under Rule 7(1)(a): 40% of height x width of the largest side or side displayed
            l = pkg_dims.get("length_mm", 0.0)
            w = pkg_dims.get("width_mm", 0.0)
            h = pkg_dims.get("height_mm", 0.0)
            face_areas_cm2 = [
                (l * w) / 100.0,
                (l * h) / 100.0,
                (w * h) / 100.0,
            ]
            largest_face = max(face_areas_cm2) if face_areas_cm2 else 0.0
            area_cm2 = round(0.40 * largest_face, 2)

            if height_px > 0 and h > 0:
                mm_per_pixel = round(h / height_px, 4)

        elif shape == "cylindrical":
            # Under Rule 7(1)(b): 40% of height x circumference
            d = pkg_dims.get("diameter_mm", 0.0)
            h = pkg_dims.get("height_mm", 0.0)
            circumference = math.pi * d
            total_cyl_area_cm2 = (h * circumference) / 100.0
            area_cm2 = round(0.40 * total_cyl_area_cm2, 2)
            if height_px > 0 and h > 0:
                mm_per_pixel = round(h / height_px, 4)

    return {
        "area_px": round(area_px, 1),
        "width_px": round(width_px, 1),
        "height_px": round(height_px, 1),
        "area_cm2": area_cm2,
        "mm_per_pixel": mm_per_pixel,
    }


def compute_rule7_min_height(
    area_cm2: Optional[float] = None,
    weight_or_vol: Optional[float] = None,
    unit: Optional[str] = None,
    is_blown_or_molded: bool = False,
) -> float:
    """
    Statutory minimum numeral height (in mm) under Rule 7, Table 1
    of the Legal Metrology (Packaged Commodities) Rules, 2011.
    """
    if area_cm2 is not None and area_cm2 > 0:
        if area_cm2 <= 50:
            return 2.0 if is_blown_or_molded else 1.0
        elif area_cm2 <= 100:
            return 3.0 if is_blown_or_molded else 1.5
        elif area_cm2 <= 500:
            return 4.0 if is_blown_or_molded else 2.5
        elif area_cm2 <= 2500:
            return 6.0 if is_blown_or_molded else 4.0
        else:
            return 6.0

    norm_val = weight_or_vol
    if norm_val is not None:
        u = (unit or "").lower()
        if u in ("kg", "l", "liter", "litre"):
            norm_val = norm_val * 1000.0

        if norm_val <= 50:
            return 2.0 if is_blown_or_molded else 1.0
        elif norm_val <= 200:
            return 3.0 if is_blown_or_molded else 2.0
        elif norm_val <= 1000:
            return 4.0 if is_blown_or_molded else 4.0
        else:
            return 6.0

    return 2.0


def compute_rule8_clearance_box(
    net_qty_bbox: List[float],
    numeral_height_px: float,
    all_ocr_boxes: Optional[List[Dict[str, Any]]] = None,
) -> Dict[str, Any]:
    """
    Statutory Exclusion Zone computation under Rule 8(1) of
    Legal Metrology (Packaged Commodities) Rules, 2011:
    - Vertical clearance (top & bottom): At least the height of the numeral (1H)
    - Horizontal clearance (left & right): At least twice the height of numeral (2H)
    """
    xmin, ymin, xmax, ymax = net_qty_bbox
    h = max(numeral_height_px, (ymax - ymin))

    buffer_top = h
    buffer_bottom = h
    buffer_left = 2.0 * h
    buffer_right = 2.0 * h

    exclusion_box = [
        max(0.0, xmin - buffer_left),
        max(0.0, ymin - buffer_top),
        xmax + buffer_right,
        ymax + buffer_bottom,
    ]

    intrusions = []
    has_intrusion = False

    if all_ocr_boxes:
        ex_poly = box(exclusion_box[0], exclusion_box[1], exclusion_box[2], exclusion_box[3])
        nq_poly = box(xmin, ymin, xmax, ymax)

        for b in all_ocr_boxes:
            b_coords = b.get("bbox") or b.get("coordinates")
            if not b_coords or len(b_coords) < 4:
                continue

            if isinstance(b_coords[0], (list, tuple)):
                xs = [p[0] for p in b_coords]
                ys = [p[1] for p in b_coords]
                bx1, by1, bx2, by2 = min(xs), min(ys), max(xs), max(ys)
            else:
                bx1, by1, bx2, by2 = b_coords[:4]

            other_poly = box(bx1, by1, bx2, by2)

            if other_poly.intersection(nq_poly).area / (nq_poly.area + 1e-6) > 0.6:
                continue

            inter_area = ex_poly.intersection(other_poly).area
            if inter_area > 4.0:
                has_intrusion = True
                intrusions.append(
                    {
                        "text": b.get("text", ""),
                        "bbox": [bx1, by1, bx2, by2],
                        "overlap_area": round(inter_area, 1),
                    }
                )

    return {
        "rule8_compliant": not has_intrusion,
        "net_qty_box": [round(c, 1) for c in net_qty_bbox],
        "exclusion_box": [round(c, 1) for c in exclusion_box],
        "numeral_height_px": round(h, 1),
        "intrusions": intrusions,
        "intrusion_count": len(intrusions),
    }
