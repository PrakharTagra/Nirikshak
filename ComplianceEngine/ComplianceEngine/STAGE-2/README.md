# Stage 2 — Image Preprocessing Service

Takes a raw field-inspector or e-commerce package photo and returns a
deskewed, tightly-cropped, denoised, contrast-normalized image with glare
removed — ready for Stage 3 (PDP/label detection) and Stage 4 (OCR).

## What it does

1. **Boundary detection → deskew + crop.** Finds the package/label's
   4-sided boundary in the photo and applies a perspective warp, which
   straightens *and* crops in one step (handles skew from any angle, not
   just simple rotation). Falls back to rotation-only correction if no
   clean quadrilateral is found (e.g. curved/irregular packaging).
2. **Denoising** — `fastNlMeansDenoisingColored`.
3. **Contrast normalization** — CLAHE on the L channel (LAB colour space),
   so faint print or uneven lighting doesn't defeat OCR downstream.
4. **Glare removal** — detects specular highlights as *local* brightness
   outliers (a white top-hat transform), not just "bright pixels," so it
   doesn't misfire on plain white/light label backgrounds. Inpaints
   detected glare spots.
5. **Usability gate** — flags the image as unusable (with specific reasons)
   if output resolution, sharpness, or glare fraction fail configurable
   thresholds, so the mobile app can prompt an immediate re-capture instead
   of the bad photo silently flowing downstream.

## Run it

```bash
pip install -r requirements.txt
uvicorn app.main:app --host 0.0.0.0 --port 8000
```

Or with Docker:

```bash
docker build -t stage2-preprocessing .
docker run -p 8000:8000 stage2-preprocessing
```

## API

### `POST /preprocess`
`multipart/form-data`, field `image` (jpeg/png/webp, ≤15 MB).

Returns:
```json
{
  "metadata": {
    "original_width": 1200,
    "original_height": 900,
    "output_width": 762,
    "output_height": 427,
    "boundary_detected": true,
    "deskew_method": "perspective_warp",
    "rotation_angle_deg": 0.0,
    "sharpness_score": 457.47,
    "glare_area_fraction": 0.0408,
    "usable": true,
    "reject_reasons": []
  },
  "image_base64": "..."
}
```

### `POST /preprocess/image`
Same input. Returns the processed image directly as `image/png`, with the
same metadata JSON in the `X-Preprocess-Metadata` response header — use
this to pipe straight into Stage 3 without a base64 round-trip.

### `POST /preprocess/ocr`
Runs Stage 2 preprocessing and passes the processed image directly to the
Stage 4 OCR package. Returns both `preprocess_metadata` and the Stage 4 OCR
result in one JSON response. The processed PNG is stored in
`outputs/preprocessed/` before OCR runs, and its path is returned as
`preprocessed_image`. A formatted copy of the complete result is saved in
`outputs/ocr_results/`, with its path returned as `result_json`. The response
also exposes `extracted_text`, `metadata`, `declarations`, and `regions` at
the top level; the original nested `ocr` object is retained for compatibility.
Install the dependencies from this directory's `requirements.txt` before
using this endpoint.

### `GET /health`
Liveness check.

## Tuning

All thresholds (Canny edges, CLAHE clip limit, glare sensitivity, minimum
resolution/sharpness for the usability gate, etc.) live in
`PreprocessConfig` in `app/preprocessing.py`. These are reasonable
starting points, not calibrated values — tune `min_sharpness_score`,
`min_output_width/height`, and the glare thresholds against a batch of
real field-inspector photos before relying on the `usable` flag in
production; camera quality and typical shooting distance will shift these.

## Notes for integration with Stage 3

- The perspective-warp crop already isolates the package roughly to its
  boundary, which should make Stage 3's PDP-region detection easier, but
  it is not a substitute for it — Stage 2 crops to the *whole package*
  boundary it detects, not specifically the PDP.
- Consider having the mobile app call `/preprocess` synchronously right
  after capture and show `usable=false` + `reject_reasons` to the
  inspector immediately, before upload — this avoids wasting a scan
  record and inspector time on unusable photos.
