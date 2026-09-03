"""Text detection/recognition backend wrapper.

RapidOCR 3.9.x is used because its current release supports Python 3.13 and
ships compact PP-OCRv6 detection/recognition models.  The rest of the project
only sees the normalized result from `detect_and_recognize`.
"""

from __future__ import annotations

from typing import Any


def _load_engine() -> Any:
    try:
        from rapidocr import RapidOCR
    except ImportError as exc:
        raise RuntimeError(
            "RapidOCR is not installed. Run: "
            "python -m pip install rapidocr==3.9.2 onnxruntime"
        ) from exc

    # Let RapidOCR use its default PP-OCRv6 small models and ONNX Runtime.
    return RapidOCR()


def detect_and_recognize(image: Any, engine: Any = None) -> Any:
    if image is None:
        raise ValueError("Image could not be loaded.")

    if engine is None:
        engine = _load_engine()

    # RapidOCR accepts an OpenCV/numpy image directly.
    return engine(image, use_det=True, use_cls=True, use_rec=True)
