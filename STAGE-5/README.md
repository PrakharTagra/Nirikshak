# Stage 5 — Font Size & Readability Analysis

Rule 7 / Rule 9(1)(b) compliance checks: numeral height, letter width
ratio, and contrast, run against a set of OCR text regions.

## Structure

- `src/tables.py` — Rule 7 Table I (weight/volume) and Table II
  (length/area/number, keyed to PDP area) minimum-height lookups
- `src/measure.py` — pixel-to-mm conversion + width ratio check
- `src/contrast.py` — Rule 9(1)(b) contrast check, with the embossed-text
  exemption built in
- `src/checker.py` — orchestrates all three checks into one result per
  declaration
- `tests/test_checker.py` — sanity tests with synthetic values

## Important: this stage doesn't stand alone

Stage 5 needs two inputs it does not produce itself:

1. **px_per_mm** — the pixel-to-mm calibration scale, which the
   execution plan assigns to Stage 3 (reference object in frame, or
   known package dimensions).
2. **The declared net quantity value** — needed to pick the right
   Table I/II row, which is technically Stage 6's job (declaration
   classification). In practice, extracting *just* the net-quantity
   value has to happen before Stage 5 can run, even if full
   classification of every other field comes later.

Both are passed in as plain parameters (see `checker.py`), so this
module is fully testable now, independent of whether Stage 3/4 exist
yet. Swap in real values once they do.

## Setup

```
pip install -r requirements.txt
PYTHONPATH=. python3 tests/test_checker.py
```
