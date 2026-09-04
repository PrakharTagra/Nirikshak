"""End-to-end OCR stage for the Nirikshak pipeline."""

from __future__ import annotations

from typing import Any, Dict, Optional

from .contrast import analyze_image_declarations_contrast
from .detector import detect_and_recognize
from .postprocess import extract_declarations
from .recognizer import normalize_ocr_result


_ENGINE = None


def _get_engine():
    global _ENGINE
    if _ENGINE is None:
        from .detector import _load_engine
        _ENGINE = _load_engine()
    return _ENGINE


def run_ocr(image: Any, engine: Optional[Any] = None) -> Dict[str, Any]:
    if image is None:
        raise ValueError("Image could not be loaded.")

    result = detect_and_recognize(image, engine=engine or _get_engine())
    regions = normalize_ocr_result(result)
    contrast_summary = analyze_image_declarations_contrast(image, regions)
    declarations = extract_declarations(regions)

    return {
        "success": bool(regions),
        "text": "\n".join(r["text"] for r in regions),
        "regions": regions,
        "declarations": declarations,
        "contrast_analysis": contrast_summary,
        "engine": "RapidOCR",
        "timing": {
            "total_seconds": getattr(result, "elapse", None),
            "stages_seconds": getattr(result, "elapse_list", None),
        },
    }

