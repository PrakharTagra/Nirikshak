"""OCR recognition and normalization.

The OCR engine is intentionally kept separate from compliance logic. This
module converts an OCR engine result (PaddleOCR, fine-tuned models) into
stable, standardized text-region dictionaries.
"""

from __future__ import annotations

from typing import Any, Dict, List, Tuple

import numpy as np


def _box_to_list(box: Any) -> List[List[float]]:
    arr = np.asarray(box, dtype=float).reshape(-1, 2)
    return [[round(float(x), 2), round(float(y), 2)] for x, y in arr]


def _box_height(box: Any) -> float:
    arr = np.asarray(box, dtype=float).reshape(-1, 2)
    if len(arr) < 4:
        return 0.0
    # Average of left/right edge lengths is more useful than bbox height for
    # slightly rotated text lines.
    left = np.linalg.norm(arr[3] - arr[0])
    right = np.linalg.norm(arr[2] - arr[1])
    return round(float((left + right) / 2.0), 2)


def _extract_boxes_texts_scores(result: Any) -> Tuple[List[Any], List[str], List[float]]:
    """Extract boxes, texts, and confidence scores across PaddleOCR formats."""
    if result is None:
        return [], [], []

    # Case 1: PaddleOCR 3.x / PaddleX format (list of result dicts)
    if isinstance(result, list) and len(result) > 0:
        first = result[0]

        # Check if first item is a dictionary or dictionary-like
        if hasattr(first, "get") or isinstance(first, dict):
            texts = first.get("rec_texts") or first.get("texts") or []
            scores = first.get("rec_scores") or first.get("scores") or []
            boxes = (
                first.get("dt_polys")
                if first.get("dt_polys") is not None
                else first.get("rec_polys")
                if first.get("rec_polys") is not None
                else first.get("dt_boxes")
                if first.get("dt_boxes") is not None
                else first.get("rec_boxes")
                if first.get("rec_boxes") is not None
                else first.get("boxes")
                or []
            )
            return list(boxes), [str(t) for t in texts], [float(s) for s in scores]

        # Case 2: Classic PaddleOCR 2.x format: [[ [box, (text, score)], ... ]]
        if isinstance(first, (list, tuple)):
            boxes, texts, scores = [], [], []
            for entry in first:
                if (
                    isinstance(entry, (list, tuple))
                    and len(entry) >= 2
                    and isinstance(entry[1], (list, tuple))
                    and len(entry[1]) >= 2
                ):
                    boxes.append(entry[0])
                    texts.append(str(entry[1][0]))
                    scores.append(float(entry[1][1]))
                elif hasattr(entry, "box") and hasattr(entry, "text"):
                    boxes.append(entry.box)
                    texts.append(str(entry.text))
                    scores.append(float(getattr(entry, "score", 1.0)))
            return boxes, texts, scores

    # Case 3: Object with attributes (e.g. RapidOCR or custom wrapper)
    boxes = getattr(result, "boxes", None)
    texts = getattr(result, "txts", None) or getattr(result, "texts", None)
    scores = getattr(result, "scores", None)

    if boxes is not None and texts is not None:
        return list(boxes), [str(t) for t in texts], [float(s) for s in (scores or [])]

    return [], [], []


def normalize_ocr_result(result: Any) -> List[Dict[str, Any]]:
    """Normalize PaddleOCR's output into a list of text regions.

    PaddleOCR exposes geometric text boundaries, recognized texts, and confidence
    scores. Keeping the original geometry is essential for Legal Metrology pixel/mm
    calibration and clearance checking.
    """
    if result is None:
        return []

    boxes, texts, scores = _extract_boxes_texts_scores(result)
    if not boxes or not texts:
        return []

    regions: List[Dict[str, Any]] = []
    for idx, (box, text) in enumerate(zip(boxes, texts)):
        text = str(text).strip()
        if not text:
            continue
        # Drop isolated single CJK glyph hallucinations caused by noisy packaging texture
        if len(text) == 1 and "\u4e00" <= text <= "\u9fff":
            continue

        score = scores[idx] if idx < len(scores) else 1.0
        box_list = _box_to_list(box)
        regions.append(
            {
                "text": text,
                "confidence": round(float(score), 4),
                "bbox": box_list,
                "pixel_height": _box_height(box),
            }
        )

    # Stable top-to-bottom, left-to-right order.
    regions.sort(key=lambda r: (min(p[1] for p in r["bbox"]), min(p[0] for p in r["bbox"])))
    return regions
