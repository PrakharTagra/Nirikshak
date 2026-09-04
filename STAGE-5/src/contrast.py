"""Contrast check between numeral colour and label background (Rule 9(1)(b)).

Blown/formed/molded text (e.g. engraved on a transparent bottle) is
explicitly exempt from this requirement under the Rule 9(1)(b) proviso.
"""
import cv2
import numpy as np


def compute_contrast_diff(image: np.ndarray, text_bbox: tuple[int, int, int, int], padding: int = 10) -> float:
    """Rough contrast estimate: difference in mean brightness between the
    text region and a margin of background around it.

    text_bbox: (x, y, w, h) in pixels.
    Returns a 0-255 scale difference — a relative signal for a pass/fail
    compliance flag, not a precise colorimetric measurement.
    """
    x, y, w, h = text_bbox
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY) if image.ndim == 3 else image

    text_region = gray[y:y + h, x:x + w]
    text_mean = float(np.mean(text_region))

    y0, y1 = max(0, y - padding), min(gray.shape[0], y + h + padding)
    x0, x1 = max(0, x - padding), min(gray.shape[1], x + w + padding)
    surrounding = gray[y0:y1, x0:x1].astype(int).copy()
    # Mask out the text region itself so it doesn't dilute the background sample
    surrounding[y - y0:y - y0 + h, x - x0:x - x0 + w] = -1
    background_pixels = surrounding[surrounding >= 0]
    background_mean = float(np.mean(background_pixels)) if background_pixels.size else text_mean

    return abs(text_mean - background_mean)


def has_sufficient_contrast(
    image: np.ndarray,
    text_bbox: tuple[int, int, int, int],
    is_embossed: bool,
    min_diff: float = 40.0,
) -> bool:
    """Rule 9(1)(b): numerals of MRP and net quantity must contrast
    conspicuously with the background — except when blown/formed/molded
    onto a glass or plastic surface, which is exempt from this check.
    """
    if is_embossed:
        return True  # exempt per Rule 9(1)(b) proviso
    return compute_contrast_diff(image, text_bbox) >= min_diff
