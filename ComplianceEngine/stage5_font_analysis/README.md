# Stage 5: Font & Readability Analysis Engine

Automated font sizing, character geometry, clearance zone, and readability analysis for Legal Metrology (Packaged Commodities) compliance.

---

## Capabilities

1. **Packaging Dimension Resolution (`dimension_resolver.py`)**:
   - Detects outer box/carton/packaging dimensions (e.g. `120 x 80 x 40 mm`).
   - Rejects inner product item dimensions (e.g. sheets, wipes, tablets).
   - If not present on the label, prompts the user interactively or accepts parameters.
   - Calculates physical scale `pixels_per_mm`.

2. **True Numeral Font Geometry (`font_geometry.py`)**:
   - Isolates digit contours for Net Quantity and MRP using OpenCV.
   - Measures true digit height and width in physical millimeters.
   - Verifies **Rule 7(3)** proportion: $\text{width} \ge \frac{1}{3} \times \text{height}$.

3. **Surrounding Clear Space Analysis (`clearance_check.py`)**:
   - Enforces **Rule 8(1) Proviso**:
     - $\ge 1\times H$ clear space above and below the Net Quantity numeral.
     - $\ge 2\times H$ clear space to the left and right.
   - Flags overlapping printed text.

4. **Contrast & Color Readability**:
   - Integrates WCAG 2.1 relative luminance and contrast ratio checks per **Rule 9(1)(b)**.

---

## Standalone Usage

```bash
python -m ComplianceEngine.STAGE-5.readability_analyzer \
    --ocr-json path/to/ocr.json \
    --image path/to/preprocessed.png \
    --dimensions "120x80x40 mm"
```

## Running Tests

```bash
python -m unittest ComplianceEngine.STAGE-5.test_stage5
```
