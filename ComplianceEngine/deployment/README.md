# Legal Metrology Compliance — Deployment Engine

The deployment pipeline now uses the real Python **Stage 2 Image Preprocessing** and **Stage 4 RapidOCR** implementation from `ComplianceEngine`.

## Updated architecture

```text
Original Image
    |
    v
Stage 2 — OpenCV preprocessing (Python)
    |
    v
Stage 4 — RapidOCR directly on preprocessed image (Python)
    |
    +----------------------+
    |                      |
    v                      v
Stage 5                Stage 6
Font/geometry          Groq declaration extraction
analysis               |
    |                  |
    +---------+--------+
              v
       Stage 7 Rule Engine
              |
              v
       Stage 8 PDF Report
```

**Stage 3 — PDP/label detection has been intentionally removed.** OCR runs directly on the Stage-2 preprocessed image.

## Stage 2 + Stage 4 integration

The Node deployment engine calls:

```text
POST http://127.0.0.1:8000/preprocess/ocr
```

from the Python service in `ComplianceEngine/STAGE-2`.

That endpoint:

1. receives the original image;
2. runs the real OpenCV preprocessing;
3. stores the preprocessed PNG;
4. passes the same OpenCV image directly to `ComplianceEngine/STAGE-4` RapidOCR;
5. returns OCR regions including text, confidence, bounding boxes and pixel heights;
6. returns the preprocessed image as base64 so the Node engine can save it even when the services run in different containers.

## Run the Python service

From `ComplianceEngine/STAGE-2`:

```bash
python -m pip install -r requirements.txt
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000
```

Install Stage 4 dependencies too:

```bash
python -m pip install -r ../STAGE-4/requirements.txt
```

## Run the deployment engine

```bash
cd deployment-engine
npm install
copy .env.example .env
```

Set:

```env
PREPROCESSOR_URL=http://127.0.0.1:8000
EXTRACTION_PROVIDER=groq
GROQ_API_KEY=your_key
GROQ_MODEL=openai/gpt-oss-20b
GROQ_FALLBACK_TO_REGEX=true
```

Then:

```bash
# Multi-image product inspection (e.g. Front PDP + bottom rubber stamp):
node src/cli.js path/to/front.jpg path/to/crimp_or_bottom.jpg

# Or explicitly:
node src/cli.js --product path/to/pdp.jpg path/to/stamp.jpg

# Independent products in concurrent batch:
node src/cli.js --batch productA.jpg productB.jpg
```

## Important calibration note

Because PDP detection was removed, the deployment engine does **not** invent a pixel-to-mm scale. OCR pixel heights are retained. Set `PIXELS_PER_MM` only when the capture setup provides a known physical calibration. Otherwise Rule 7 physical-height checks are skipped rather than producing a fabricated measurement.

## Stage 6 declaration extraction

Groq receives the normalized OCR lines and returns the exact declaration object consumed by the rule engine. It is an extraction layer only; it does not decide compliance. If Groq fails and `GROQ_FALLBACK_TO_REGEX=true`, deterministic regex extraction is used.
