"""End-to-end OCR stage for the Nirikshak pipeline using PaddleOCR with multi-core engine pool."""

from __future__ import annotations

import logging
import os
import queue
import threading
import time
from contextlib import contextmanager
from typing import Any, Dict, Optional

from .contrast import analyze_image_declarations_contrast
from .detector import detect_and_recognize
from .postprocess import extract_declarations
from .recognizer import normalize_ocr_result

logger = logging.getLogger("stage4.pipeline")


class OCREnginePool:
    """Thread-safe pool of PaddleOCR engine instances to enable concurrent multi-core inference."""

    def __init__(self, max_size: Optional[int] = None):
        if max_size is None:
            env_size = os.getenv("PADDLEOCR_POOL_SIZE")
            if env_size and env_size.isdigit():
                max_size = max(1, int(env_size))
            else:
                cpu_count = os.cpu_count() or 2
                max_size = min(4, max(1, cpu_count // 2))
        self.max_size = max_size
        self._pool: queue.Queue = queue.Queue(maxsize=self.max_size)
        self._created_count = 0
        self._lock = threading.Lock()
        logger.info("Initialized OCREnginePool (max capacity: %d)", self.max_size)

    def _create_engine(self):
        from .detector import _load_engine
        return _load_engine()

    def get_engine(self, timeout: float = 60.0):
        # 1. Try to get an already loaded engine from the pool
        try:
            return self._pool.get_nowait()
        except queue.Empty:
            pass

        # 2. If under max_size, instantiate a new engine
        with self._lock:
            if self._created_count < self.max_size:
                engine = self._create_engine()
                self._created_count += 1
                return engine

        # 3. Wait for an engine to be returned
        try:
            return self._pool.get(block=True, timeout=timeout)
        except queue.Empty as exc:
            raise TimeoutError("Timed out waiting for available OCR engine in pool.") from exc

    def return_engine(self, engine: Any):
        if engine is not None:
            try:
                self._pool.put_nowait(engine)
            except queue.Full:
                pass

    @contextmanager
    def acquire(self, timeout: float = 60.0):
        engine = self.get_engine(timeout=timeout)
        try:
            yield engine
        finally:
            self.return_engine(engine)


_ENGINE_POOL: Optional[OCREnginePool] = None
_POOL_INIT_LOCK = threading.Lock()


def get_engine_pool() -> OCREnginePool:
    global _ENGINE_POOL
    if _ENGINE_POOL is None:
        with _POOL_INIT_LOCK:
            if _ENGINE_POOL is None:
                _ENGINE_POOL = OCREnginePool()
    return _ENGINE_POOL


def run_ocr(image: Any, engine: Optional[Any] = None) -> Dict[str, Any]:
    """Execute end-to-end PaddleOCR text detection, recognition, and declaration extraction."""
    if image is None:
        raise ValueError("Image could not be loaded.")

    start_time = time.time()
    if engine is not None:
        result = detect_and_recognize(image, engine=engine)
    else:
        pool = get_engine_pool()
        with pool.acquire() as pooled_engine:
            result = detect_and_recognize(image, engine=pooled_engine)

    elapsed = round(time.time() - start_time, 4)

    regions = normalize_ocr_result(result)
    contrast_summary = analyze_image_declarations_contrast(image, regions)
    declarations = extract_declarations(regions)

    return {
        "success": bool(regions),
        "text": "\n".join(r["text"] for r in regions),
        "regions": regions,
        "declarations": declarations,
        "contrast_analysis": contrast_summary,
        "engine": "PaddleOCR",
        "timing": {
            "total_seconds": elapsed,
            "stages_seconds": getattr(result, "elapse_list", None),
        },
    }
