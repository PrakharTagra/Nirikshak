"""Text detection/recognition backend wrapper using PaddleOCR.

Supports out-of-the-box pretrained and fine-tuned PaddleOCR detection,
recognition, and angle classification models. The rest of the project
only sees the normalized result from `detect_and_recognize`.
"""

from __future__ import annotations

import logging
import os
from typing import Any, Optional

logger = logging.getLogger("ocr.detector")


def preprocess_for_ocr(image: Any) -> Any:
    """Safe pre-OCR check. Keeps text strokes clean and uncorrupted."""
    if image is None:
        return None
    try:
        import cv2
        h, w = image.shape[:2]
        # Cap excessively giant images (e.g. > 2400px) so CNN detection runs at optimal receptive field
        if max(h, w) > 2400:
            scale = 2048.0 / float(max(h, w))
            image = cv2.resize(image, None, fx=scale, fy=scale, interpolation=cv2.INTER_AREA)
        return image
    except Exception:
        return image


def _ensure_runtime_compatibility():
    """Ensure Windows C++ runtime DLLs and oneDNN execute cleanly."""
    # 1. Preemptively import torch if present to avoid Windows OpenMP/shm.dll symbol conflicts
    try:
        import torch  # noqa: F401
    except Exception:
        pass

    # 2. Patch Paddle Inference Config on Windows CPU to prevent oneDNN PIR ConvertPirAttribute2RuntimeAttribute errors
    try:
        import paddle
        if hasattr(paddle, "inference") and hasattr(paddle.inference, "create_predictor"):
            orig_create_predictor = paddle.inference.create_predictor
            if not getattr(orig_create_predictor, "_nirikshak_patched", False):
                def safe_create_predictor(config):
                    if hasattr(config, "disable_onednn"):
                        config.disable_onednn()
                    if hasattr(config, "disable_mkldnn"):
                        config.disable_mkldnn()
                    return orig_create_predictor(config)
                safe_create_predictor._nirikshak_patched = True
                paddle.inference.create_predictor = safe_create_predictor
    except Exception as exc:
        logger.debug("Paddle inference patch note: %s", exc)


def _load_engine(
    det_model_dir: Optional[str] = None,
    rec_model_dir: Optional[str] = None,
    cls_model_dir: Optional[str] = None,
    rec_char_dict_path: Optional[str] = None,
    lang: Optional[str] = None,
    ocr_version: Optional[str] = None,
    use_gpu: Optional[bool] = None,
    **extra_kwargs,
) -> Any:
    """Initialize PaddleOCR engine with optional fine-tuned model directories.

    Fine-tuned model paths can be provided as parameters or configured via
    environment variables:
      - `PADDLEOCR_DET_MODEL_DIR`: Directory with custom fine-tuned detection model.
      - `PADDLEOCR_REC_MODEL_DIR`: Directory with custom fine-tuned recognition model.
      - `PADDLEOCR_CLS_MODEL_DIR`: Directory with custom angle classification model.
      - `PADDLEOCR_REC_CHAR_DICT_PATH`: Custom character dictionary path.
      - `PADDLEOCR_LANG`: Language code (defaults to 'en').
      - `PADDLEOCR_VERSION`: PaddleOCR model version (defaults to 'PP-OCRv4').
      - `PADDLEOCR_USE_GPU`: 'true' / '1' to enable GPU execution.
    """
    _ensure_runtime_compatibility()

    try:
        from paddleocr import PaddleOCR
    except ImportError as exc:
        raise RuntimeError(
            "PaddleOCR is not installed. Run: "
            "python -m pip install paddlepaddle>=3.0.0 paddleocr>=2.8.0"
        ) from exc

    # Resolve fine-tuned or custom model paths
    det_dir = det_model_dir or os.getenv("PADDLEOCR_DET_MODEL_DIR")
    rec_dir = rec_model_dir or os.getenv("PADDLEOCR_REC_MODEL_DIR")
    cls_dir = cls_model_dir or os.getenv("PADDLEOCR_CLS_MODEL_DIR")
    dict_path = rec_char_dict_path or os.getenv("PADDLEOCR_REC_CHAR_DICT_PATH")
    ocr_ver = ocr_version or os.getenv("PADDLEOCR_VERSION", "PP-OCRv4")
    language = lang or os.getenv("PADDLEOCR_LANG", "en")

    if use_gpu is None:
        env_gpu = os.getenv("PADDLEOCR_USE_GPU", "").strip().lower()
        use_gpu = env_gpu in {"1", "true", "yes"}

    # Base calibrated parameters for fine packaging print and Legal Metrology rules
    params: dict[str, Any] = {
        "use_doc_unwarping": False,            # Stage 2 already deskews/unwarps cleanly
        "use_doc_orientation_classify": False,  # Preserve Stage 2 verified orientation
        "use_textline_orientation": True,      # Angle classifier for rotated text lines
        "ocr_version": ocr_ver,
        "lang": language,
        "text_det_thresh": 0.20,               # Sensitive threshold for tiny numerals/dates
        "text_det_box_thresh": 0.30,           # Retain small candidate boxes
        "text_det_unclip_ratio": 1.60,         # Prevent merging close fine-print lines
        "text_det_limit_side_len": 2048,       # Full resolution processing without downsampling
        "enable_mkldnn": False,
    }

    if det_dir and os.path.exists(det_dir):
        logger.info("Using fine-tuned text detection model from: %s", det_dir)
        params["text_detection_model_dir"] = det_dir

    if rec_dir and os.path.exists(rec_dir):
        logger.info("Using fine-tuned text recognition model from: %s", rec_dir)
        params["text_recognition_model_dir"] = rec_dir

    if cls_dir and os.path.exists(cls_dir):
        logger.info("Using fine-tuned textline orientation model from: %s", cls_dir)
        params["textline_orientation_model_dir"] = cls_dir

    if dict_path and os.path.exists(dict_path):
        logger.info("Using custom character dictionary from: %s", dict_path)
        params["rec_char_dict_path"] = dict_path

    if use_gpu:
        params["device"] = "gpu"

    # Merge any extra user-supplied keyword overrides
    params.update(extra_kwargs)

    return PaddleOCR(**params)


def detect_and_recognize(image: Any, engine: Any = None, preprocess: bool = True) -> Any:
    """Run PaddleOCR on the input image."""
    if image is None:
        raise ValueError("Image could not be loaded.")

    if engine is None:
        engine = _load_engine()

    target = preprocess_for_ocr(image) if preprocess else image

    # Support PaddleOCR predict / ocr API
    if hasattr(engine, "predict"):
        return engine.predict(target)
    elif hasattr(engine, "ocr"):
        return engine.ocr(target)
    elif callable(engine):
        return engine(target)
    else:
        raise TypeError(f"Unsupported OCR engine instance: {type(engine)}")
