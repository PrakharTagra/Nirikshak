"""Text detection/recognition backend wrapper.

RapidOCR 3.9.x is used because its current release supports Python 3.13 and
ships compact PP-OCRv6 detection/recognition models.  The rest of the project
only sees the normalized result from `detect_and_recognize`.
"""

from __future__ import annotations

from typing import Any


def preprocess_for_ocr(image: Any) -> Any:
    """Sharpen and optimize packaging image for fine print detection."""
    if image is None:
        return None
    try:
        import cv2
        # Unsharp mask: enhances micro-contrast of tiny characters against noisy packaging backgrounds
        blurred = cv2.GaussianBlur(image, (0, 0), 1.0)
        sharpened = cv2.addWeighted(image, 1.6, blurred, -0.6, 0)
        return sharpened
    except Exception:
        return image


def _load_engine(use_medium: bool = False) -> Any:
    try:
        from rapidocr import RapidOCR
        from rapidocr.utils.typings import ModelType
    except ImportError as exc:
        raise RuntimeError(
            "RapidOCR is not installed. Run: "
            "python -m pip install rapidocr==3.9.2 onnxruntime"
        ) from exc

    # Tuned parameters specifically calibrated for fine-print, tiny numeral/date/batch detection,
    # and packaging labels under Legal Metrology standards without aggressive downscaling.
    tuned_params = {
        "Global.text_score": 0.35,      # keep subtle/light font strokes
        "Global.min_height": 6,          # allow tiny text (default was 30px, which drops small text!)
        "Global.min_side_len": 6,        # allow small bounding boxes
        "Global.max_side_len": 3200,     # support high-resolution inputs
        "Det.limit_side_len": 2048,      # prevent downsampling tiny text (default 736)
        "Det.limit_type": "max",
        "Det.thresh": 0.20,              # sensitive threshold for small/faint text
        "Det.box_thresh": 0.35,          # retain small candidate bounding boxes
        "Det.unclip_ratio": 1.85,        # expand box to include full letter ascenders/descenders
        "Det.use_dilation": True,
    }

    if use_medium:
        try:
            tuned_params["Det.model_type"] = ModelType.MEDIUM
            tuned_params["Rec.model_type"] = ModelType.MEDIUM
        except Exception:
            pass

    return RapidOCR(params=tuned_params)


def detect_and_recognize(image: Any, engine: Any = None, preprocess: bool = True) -> Any:
    if image is None:
        raise ValueError("Image could not be loaded.")

    if engine is None:
        engine = _load_engine()

    target = preprocess_for_ocr(image) if preprocess else image
    return engine(target, use_det=True, use_cls=True, use_rec=True)

