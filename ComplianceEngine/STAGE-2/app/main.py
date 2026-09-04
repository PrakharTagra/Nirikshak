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

import asyncio
import base64
import io
import json
import logging
import os
import sys
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

import cv2
from fastapi import FastAPI, File, HTTPException, UploadFile
from fastapi.responses import JSONResponse, StreamingResponse

from .preprocessing import PreprocessingError, preprocess

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("stage2-preprocessing")

_EXECUTOR = ThreadPoolExecutor(max_workers=min(32, (os.cpu_count() or 1) + 4))

app = FastAPI(
    title="Legal Metrology — Stage 2 Image Preprocessing",
    description="Deskew, crop, denoise, normalize contrast, and remove glare "
                "from field-captured package/label photos.",
    version="1.0.0",
)

MAX_UPLOAD_BYTES = 15 * 1024 * 1024  # 15 MB
ALLOWED_CONTENT_TYPES = {
    "image/jpeg",
    "image/png",
    "image/webp",
    "image/jpg",
    "image/heic",
    "image/heif",
    "image/heic-sequence",
    "image/heif-sequence",
    "application/octet-stream",
}
ALLOWED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".webp", ".heic", ".heif"}

# All services (STAGE-2, STAGE-4, deployment) share one flat output root:
# ComplianceEngine/output/product_<n>/ -- no per-service subfolders.
OUTPUT_ROOT = Path(__file__).resolve().parents[2] / "output"


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
    ext = Path(image.filename or "").suffix.lower()
    if image.content_type not in ALLOWED_CONTENT_TYPES and ext not in ALLOWED_EXTENSIONS:
        raise HTTPException(
            status_code=415,
            detail=f"Unsupported content type '{image.content_type}' and extension '{ext}'. "
                   f"Allowed: {sorted(ALLOWED_CONTENT_TYPES)} or extensions {sorted(ALLOWED_EXTENSIONS)}",
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


def _process_image_sync(data: bytes, filename: str, index: int) -> dict:
    """Synchronous worker function to preprocess and run OCR on one image in thread pool."""
    out_img, meta = preprocess(data)
    ok, buf = cv2.imencode(".png", out_img)
    if not ok:
        raise RuntimeError(f"Failed to encode preprocessed image for {filename}.")

    ocr_runner = _get_ocr_runner()
    ocr_result = ocr_runner(out_img)

    return {
        "index": index,
        "filename": filename,
        "meta": meta.to_dict(),
        "buf": buf.tobytes(),
        "ocr_result": ocr_result,
        "image_base64": base64.b64encode(buf.tobytes()).decode("ascii"),
    }


@app.post("/preprocess/ocr")
async def preprocess_and_ocr(image: UploadFile = File(...)):
    """Store Stage 2 output, then pass the same image to Stage 4 OCR."""
    data = await _read_and_validate(image)
    try:
        loop = asyncio.get_running_loop()
        res = await loop.run_in_executor(
            _EXECUTOR, _process_image_sync, data, image.filename or "image.png", 0
        )

        product_id = _allocate_product_id()
        product_dir = OUTPUT_ROOT / f"product_{product_id}"
        product_dir.mkdir(parents=True, exist_ok=True)

        output_path = product_dir / "preprocessed.png"
        output_path.write_bytes(res["buf"])

        ocr_result = res["ocr_result"]
        (product_dir / "raw_extracted_text.txt").write_text(
            ocr_result.get("text", "") or "", encoding="utf-8"
        )

        result_path = product_dir / "mapped.json"
        result_path.write_text(
            json.dumps(
                {
                    "metadata": res["meta"],
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
            "metadata": res["meta"],
            "declarations": ocr_result.get("declarations", {}),
            "regions": ocr_result.get("regions", []),
            "product_id": product_id,
            "preprocessed_image": str(output_path),
            "result_json": str(result_path),
            "ocr": ocr_result,
            "image_base64": res["image_base64"],
        }
    )


@app.post("/preprocess/ocr/batch")
async def preprocess_and_ocr_batch(images: list[UploadFile] = File(...)):
    """Preprocess and OCR multiple images (multiple panels/stamps of a package) concurrently."""
    if not images:
        raise HTTPException(status_code=400, detail="No images uploaded.")

    # Read and validate all incoming files
    validated = []
    for idx, img in enumerate(images):
        data = await _read_and_validate(img)
        validated.append((data, img.filename or f"panel_{idx + 1}.png", idx))

    loop = asyncio.get_running_loop()
    tasks = [
        loop.run_in_executor(_EXECUTOR, _process_image_sync, data, fn, idx)
        for data, fn, idx in validated
    ]

    try:
        processed_items = await asyncio.gather(*tasks)
    except PreprocessingError as e:
        raise HTTPException(status_code=422, detail=str(e))
    except RuntimeError as e:
        raise HTTPException(status_code=503, detail=str(e))
    except Exception:
        logger.exception("Unexpected failure during batch preprocessing/OCR")
        raise HTTPException(status_code=500, detail="Internal batch preprocessing/OCR error.")

    processed_items.sort(key=lambda x: x["index"])

    # Allocate ONE product ID for the multi-panel product inspection
    product_id = _allocate_product_id()
    product_dir = OUTPUT_ROOT / f"product_{product_id}"
    product_dir.mkdir(parents=True, exist_ok=True)

    items_output = []
    combined_regions = []
    text_blocks = []
    merged_declarations = {}

    for item in processed_items:
        idx = item["index"]
        fn = item["filename"]
        buf = item["buf"]
        ocr_result = item["ocr_result"]
        meta = item["meta"]

        out_name = f"preprocessed_{idx + 1}.png" if len(processed_items) > 1 else "preprocessed.png"
        output_path = product_dir / out_name
        output_path.write_bytes(buf)

        raw_txt = ocr_result.get("text", "") or ""
        text_blocks.append(f"--- [Panel/Image {idx + 1}: {fn}] ---\n{raw_txt}")

        for r in ocr_result.get("regions", []):
            r_copy = dict(r)
            r_copy["image_index"] = idx
            r_copy["source_image"] = fn
            combined_regions.append(r_copy)

        decls = ocr_result.get("declarations", {})
        for k, v in decls.items():
            if k not in merged_declarations or (not merged_declarations[k].get("present") and v.get("present")):
                merged_declarations[k] = v

        items_output.append({
            "image_index": idx,
            "filename": fn,
            "metadata": meta,
            "extracted_text": raw_txt,
            "regions": ocr_result.get("regions", []),
            "preprocessed_image": str(output_path),
            "declarations": decls,
            "ocr": ocr_result,
            "image_base64": item["image_base64"],
        })

    combined_text = "\n\n".join(text_blocks)
    (product_dir / "raw_extracted_text.txt").write_text(combined_text, encoding="utf-8")

    result_path = product_dir / "mapped.json"
    result_path.write_text(
        json.dumps(
            {
                "product_id": product_id,
                "items": [
                    {
                        "image_index": it["image_index"],
                        "filename": it["filename"],
                        "metadata": it["metadata"],
                        "extracted_text": it["extracted_text"],
                        "declarations": it["declarations"],
                    }
                    for it in items_output
                ],
                "declarations": merged_declarations,
            },
            indent=2,
        ),
        encoding="utf-8",
    )

    return JSONResponse({
        "product_id": product_id,
        "items": items_output,
        "combined_text": combined_text,
        "combined_regions": combined_regions,
        "declarations": merged_declarations,
        "result_json": str(result_path),
    })
