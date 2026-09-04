"""OCR recognition and normalization.

The OCR engine is intentionally kept separate from compliance logic.  This
module converts an OCR engine result into stable text-region dictionaries.
"""

from __future__ import annotations

from typing import Any, Dict, List

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


def normalize_ocr_result(result: Any) -> List[Dict[str, Any]]:
    """Normalize RapidOCR's output into a list of text regions.

    RapidOCR exposes `boxes`, `txts` and `scores` for line-level OCR.  Keeping
    the original geometry here is important for later pixel/mm calibration.
    """

    if result is None:
        return []

    boxes = getattr(result, "boxes", None)
    texts = getattr(result, "txts", None)
    scores = getattr(result, "scores", None)

    if boxes is None or texts is None:
        return []

    regions: List[Dict[str, Any]] = []
    for box, text, score in zip(boxes, texts, scores or []):
        text = str(text).strip()
        if not text:
            continue
        # Drop isolated single CJK glyph hallucinations caused by noisy packaging texture
        if len(text) == 1 and '\u4e00' <= text <= '\u9fff':
            continue

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
