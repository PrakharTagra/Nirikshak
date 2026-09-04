"""
Stage 2 — Image Preprocessing microservice.

POST /preprocess
    multipart/form-data, field "image" -> returns JSON:
    {
      "metadata": {...},
      "image_base64": "..."   # PNG-encoded, deskewed + cropped + cleaned image
    }

POST /preprocess/image
    multipart/form-data, field "image" -> returns the processed image directly
    (image/png), with the metadata JSON in the "X-Preprocess-Metadata" header.
    Convenient for chaining straight into Stage 3.

GET /health
    Basic liveness check.
"""

import base64
import io
import json
import logging
import os
import sys
import time
from pathlib import Path

import cv2
from fastapi import FastAPI, File, HTTPException, UploadFile
from fastapi.responses import JSONResponse, StreamingResponse

from .preprocessing import PreprocessingError, preprocess

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("stage2-preprocessing")

app = FastAPI(
    title="Legal Metrology — Stage 2 Image Preprocessing",
    description="Deskew, crop, denoise, normalize contrast, and remove glare "
                "from field-captured package/label photos.",
    version="1.0.0",
)

MAX_UPLOAD_BYTES = 15 * 1024 * 1024  # 15 MB
ALLOWED_CONTENT_TYPES = {"image/jpeg", "image/png", "image/webp", "image/jpg"}

# All services (STAGE-2, STAGE-4, deployment) share a single output root at
# the project level: ComplianceEngine/output/<service>/product_<n>/
OUTPUT_ROOT = Path(__file__).resolve().parents[2] / "output"
STAGE2_OUTPUT_DIR = OUTPUT_ROOT / "STAGE-2"


def _allocate_product_id() -> int:
    """Cross-platform atomic counter shared with the deployment (Node) service,
    so a scan gets the same product_<n> folder name in every stage's output."""
    OUTPUT_ROOT.mkdir(parents=True, exist_ok=True)
    counter_path = OUTPUT_ROOT / ".product_counter"
    lock_path = OUTPUT_ROOT / ".product_counter.lock"

    while True:
        try:
            fd = os.open(str(lock_path), os.O_CREAT | os.O_EXCL | os.O_RDWR)
            break
        except FileExistsError:
            time.sleep(0.02)
    try:
        current = int(counter_path.read_text().strip()) if counter_path.exists() else 0
        next_id = current + 1
        counter_path.write_text(str(next_id))
    finally:
        os.close(fd)
        os.remove(lock_path)
    return next_id


def _get_ocr_runner():
    """Load Stage 4 lazily so preprocessing can run without OCR installed."""
    stage4_path = Path(__file__).resolve().parents[2] / "STAGE-4"
    if str(stage4_path) not in sys.path:
        sys.path.insert(0, str(stage4_path))

    try:
        from ocr import run_ocr
    except ImportError as exc:
        raise RuntimeError(
            "Stage 4 OCR dependencies are not installed. Run: "
            "python -m pip install -r ../STAGE-4/requirements.txt"
        ) from exc
    return run_ocr


async def _read_and_validate(image: UploadFile) -> bytes:
    if image.content_type not in ALLOWED_CONTENT_TYPES:
        raise HTTPException(
            status_code=415,
            detail=f"Unsupported content type '{image.content_type}'. "
                   f"Allowed: {sorted(ALLOWED_CONTENT_TYPES)}",
        )
    data = await image.read()
    if not data:
        raise HTTPException(status_code=400, detail="Empty file upload.")
    if len(data) > MAX_UPLOAD_BYTES:
        raise HTTPException(
            status_code=413,
            detail=f"File too large ({len(data)} bytes). Max {MAX_UPLOAD_BYTES} bytes.",
        )
    return data


@app.get("/health")
def health():
    return {"status": "ok"}


@app.post("/preprocess")
async def preprocess_json(image: UploadFile = File(...)):
    data = await _read_and_validate(image)
    try:
        out_img, meta = preprocess(data)
    except PreprocessingError as e:
        raise HTTPException(status_code=422, detail=str(e))
    except Exception:
        logger.exception("Unexpected preprocessing failure")
        raise HTTPException(status_code=500, detail="Internal preprocessing error.")

    ok, buf = cv2.imencode(".png", out_img)
    if not ok:
        raise HTTPException(status_code=500, detail="Failed to encode output image.")

    return JSONResponse(
        {
            "metadata": meta.to_dict(),
            "image_base64": base64.b64encode(buf.tobytes()).decode("ascii"),
        }
    )


@app.post("/preprocess/image")
async def preprocess_image(image: UploadFile = File(...)):
    data = await _read_and_validate(image)
    try:
        out_img, meta = preprocess(data)
    except PreprocessingError as e:
        raise HTTPException(status_code=422, detail=str(e))
    except Exception:
        logger.exception("Unexpected preprocessing failure")
        raise HTTPException(status_code=500, detail="Internal preprocessing error.")

    ok, buf = cv2.imencode(".png", out_img)
    if not ok:
        raise HTTPException(status_code=500, detail="Failed to encode output image.")

    headers = {"X-Preprocess-Metadata": json.dumps(meta.to_dict())}
    return StreamingResponse(io.BytesIO(buf.tobytes()), media_type="image/png", headers=headers)


@app.post("/preprocess/ocr")
async def preprocess_and_ocr(image: UploadFile = File(...)):
    """Store Stage 2 output, then pass the same image to Stage 4 OCR."""
    data = await _read_and_validate(image)
    try:
        out_img, meta = preprocess(data)
        ok, buf = cv2.imencode(".png", out_img)
        if not ok:
            raise RuntimeError("Failed to encode preprocessed image.")

        ocr_result = _get_ocr_runner()(out_img)

        # One product folder per scan, shared (by number) across every
        # service's output: output/STAGE-2/product_<n>/
        product_id = _allocate_product_id()
        product_dir = STAGE2_OUTPUT_DIR / f"product_{product_id}"
        product_dir.mkdir(parents=True, exist_ok=True)

        output_path = product_dir / "preprocessed.png"
        output_path.write_bytes(buf.tobytes())

        (product_dir / "raw_extracted_text.txt").write_text(
            ocr_result.get("text", "") or "", encoding="utf-8"
        )

        result_path = product_dir / "mapped.json"
        result_path.write_text(
            json.dumps(
                {
                    "metadata": meta.to_dict(),
                    "declarations": ocr_result.get("declarations", {}),
                },
                indent=2,
            ),
            encoding="utf-8",
        )
    except PreprocessingError as e:
        raise HTTPException(status_code=422, detail=str(e))
    except RuntimeError as e:
        raise HTTPException(status_code=503, detail=str(e))
    except Exception:
        logger.exception("Unexpected preprocessing/OCR failure")
        raise HTTPException(status_code=500, detail="Internal preprocessing/OCR error.")

    return JSONResponse(
        {
            "extracted_text": ocr_result.get("text", ""),
            "metadata": meta.to_dict(),
            "declarations": ocr_result.get("declarations", {}),
            "regions": ocr_result.get("regions", []),
            "product_id": product_id,
            "preprocessed_image": str(output_path),
            "result_json": str(result_path),
            "ocr": ocr_result,
            # Base64 makes the service contract usable when the Node deployment
            # engine runs in a different container/host from Stage 2/4.
            "image_base64": base64.b64encode(buf.tobytes()).decode("ascii"),
        }
    )
