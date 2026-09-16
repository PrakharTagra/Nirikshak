"""
Stage 3 PDP — Principal Display Panel Detector & Segmenter
Supports YOLO-OBB Deep Learning Model with Algorithmic Contour & Homography Fallback
"""

from __future__ import annotations

import logging
import os
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

import cv2
import numpy as np

from .classifier import DualStreamPDPClassifier
from .geometry import (
    calculate_pdp_area,
    compute_rule7_min_height,
    compute_rule8_clearance_box,
    four_point_transform,
    order_points,
    parse_package_dimensions,
)

logger = logging.getLogger("stage3-pdp")

# Optional location for trained YOLO-OBB weights
DEFAULT_MODEL_PATHS = [
    Path(__file__).resolve().parent / "models" / "pdp_obb_best.pt",
    Path(__file__).resolve().parents[1] / "models" / "pdp_obb_best.pt",
]


class PDPDetector:
    """
    Detects, segments, unwarps, and analyzes the Principal Display Panel (PDP)
    on packaged goods.
    """

    def __init__(self, model_path: Optional[str] = None):
        self.classifier = DualStreamPDPClassifier()
        self.model = None
        self.use_yolo = False

        # Check if custom fine-tuned weights exist
        resolved_path = None
        if model_path and Path(model_path).is_file():
            resolved_path = Path(model_path)
        else:
            for candidate in DEFAULT_MODEL_PATHS:
                if candidate.is_file():
                    resolved_path = candidate
                    break

        if resolved_path:
            try:
                from ultralytics import YOLO

                self.model = YOLO(str(resolved_path))
                self.use_yolo = True
                logger.info("Loaded YOLO-OBB PDP model from: %s", resolved_path)
            except Exception as exc:
                logger.warning("Could not load YOLO model (%s). Using algorithmic fallback.", exc)

    def detect_panel_contour(self, image: np.ndarray) -> Optional[np.ndarray]:
        """
        Algorithmic fallback: Detects packaging boundary using gradient thresholding,
        morphological filtering, and convex polygon approximation.
        Returns (4, 2) corner points or None if whole frame is the package.
        """
        if image is None or image.size == 0:
            return None

        h, w = image.shape[:2]
        # Downscale for stable edge detection
        scale = 800.0 / max(h, w) if max(h, w) > 800 else 1.0
        if scale < 1.0:
            small = cv2.resize(image, None, fx=scale, fy=scale, interpolation=cv2.INTER_AREA)
        else:
            small = image.copy()

        sh, sw = small.shape[:2]
        gray = cv2.cvtColor(small, cv2.COLOR_BGR2GRAY)

        # Bilateral filter preserves sharp package edges while smoothing texture
        blurred = cv2.bilateralFilter(gray, 7, 50, 50)

        # Multi-scale edge detection
        edges = cv2.Canny(blurred, 30, 120)
        kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (5, 5))
        closed = cv2.morphologyEx(edges, cv2.MORPH_CLOSE, kernel, iterations=2)

        contours, _ = cv2.findContours(closed, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        if not contours:
            return None

        # Filter contours by minimum area (must occupy at least 15% of frame)
        min_area = (sw * sh) * 0.15
        valid_contours = [c for c in contours if cv2.contourArea(c) >= min_area]
        if not valid_contours:
            return None

        # Sort by area descending
        valid_contours.sort(key=cv2.contourArea, reverse=True)
        largest = valid_contours[0]

        # 1. Try approxPolyDP to find 4 corners
        peri = cv2.arcLength(largest, True)
        approx = cv2.approxPolyDP(largest, 0.03 * peri, True)

        if len(approx) == 4:
            pts = approx.reshape(4, 2).astype(np.float32)
        else:
            # 2. Minimum area rotated rectangle
            rect = cv2.minAreaRect(largest)
            box_pts = cv2.boxPoints(rect)
            pts = box_pts.astype(np.float32)

        # Scale coordinates back to original image resolution
        if scale < 1.0:
            pts = pts / scale

        # Clip within image boundaries
        pts[:, 0] = np.clip(pts[:, 0], 0, w - 1)
        pts[:, 1] = np.clip(pts[:, 1], 0, h - 1)

        return order_points(pts)

    def process(
        self,
        image: np.ndarray,
        ocr_regions: Optional[List[Dict[str, Any]]] = None,
        pkg_dimensions: Optional[str] = None,
    ) -> Dict[str, Any]:
        """
        Execute full Stage 3 PDP detection, unwarping, area calculation,
        and statutory classification.
        """
        if image is None or image.size == 0:
            raise ValueError("Input image is invalid or empty.")

        h, w = image.shape[:2]
        parsed_dims = parse_package_dimensions(pkg_dimensions)

        # Extract text lines if ocr_regions provided
        text_lines = []
        if ocr_regions:
            for r in ocr_regions:
                t = r.get("text", "")
                if t:
                    text_lines.append(t)

        detected_pts = None
        detection_source = "full_frame"
        confidence = 0.85

        # 1. Deep learning YOLO-OBB inference if weights are loaded
        if self.use_yolo and self.model is not None:
            try:
                results = self.model(image, verbose=False)
                if results and len(results[0].obb) > 0:
                    best_obb = results[0].obb[0]
                    # Format: xyxyxyxy coordinates
                    coords = best_obb.xyxyxyxy[0].cpu().numpy()
                    detected_pts = order_points(coords)
                    detection_source = "yolo_obb"
                    confidence = float(best_obb.conf[0].cpu().numpy())
            except Exception as exc:
                logger.debug("YOLO inference failed: %s. Falling back to contour.", exc)

        # 2. Algorithmic contour segmentation fallback
        if detected_pts is None:
            contour_pts = self.detect_panel_contour(image)
            if contour_pts is not None:
                detected_pts = contour_pts
                detection_source = "contour_segmentation"
                confidence = 0.80

        # 3. Default to full frame if package fills the screen (common in close-up scans)
        if detected_pts is None:
            detected_pts = np.array(
                [[0, 0], [w - 1, 0], [w - 1, h - 1], [0, h - 1]],
                dtype=np.float32,
            )
            detection_source = "full_frame_default"
            confidence = 0.75

        # 4. Perform 4-point perspective warp/crop
        cropped_img, transform_matrix = four_point_transform(image, detected_pts)

        # 5. Calculate physical surface area & Rule 7 statutory numeral heights
        area_metrics = calculate_pdp_area(detected_pts, (h, w), parsed_dims)
        min_numeral_height_mm = compute_rule7_min_height(
            area_cm2=area_metrics.get("area_cm2"),
            weight_or_vol=None,
        )

        # 6. Run Dual-Stream Classification (Visual artwork + Textual anchors)
        classification = self.classifier.classify_panel(cropped_img, text_lines)

        return {
            "pdp_detected": True,
            "detection_source": detection_source,
            "detection_confidence": round(confidence, 3),
            "panel_polygon": detected_pts.tolist(),
            "unwarped_shape": [int(cropped_img.shape[1]), int(cropped_img.shape[0])],  # [width, height]
            "cropped_image": cropped_img,
            "area_metrics": area_metrics,
            "statutory_min_numeral_height_mm": min_numeral_height_mm,
            "classification": classification,
            "transform_matrix": transform_matrix.tolist(),
        }
