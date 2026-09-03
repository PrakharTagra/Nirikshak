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
