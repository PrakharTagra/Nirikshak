# PDP Detector (Stage 3)

YOLOv8n-based detector for locating the Principal Display Panel (PDP) on
packaged-commodity images, as part of the Legal Metrology compliance
pipeline (SIH 26034).

## Setup

```bash
pip install -r requirements.txt
```

## Workflow

1. **Preprocess** your images through Stage 2 (the pipeline's preprocessing
   step) before annotating — the model should train on the exact same kind
   of image it will see at inference time.

2. **Annotate** the preprocessed images in Roboflow or LabelImg, drawing a
   box around the PDP region on each. Export in YOLO format (class `pdp` =
   id `0`). Dump all images + matching `.txt` label files into:
   ```
   raw_annotated/
       images/
       labels/
   ```

3. **Split** into train/val:
   ```bash
   python split_dataset.py --src raw_annotated --dst dataset --val-ratio 0.15
   ```

4. **Validate** the dataset before training:
   ```bash
   python validate_labels.py --dataset dataset
   ```

5. **Train**:
   ```bash
   python train.py --data dataset/data.yaml --epochs 100
   ```
   Best weights land at `pdp_detector_runs/v1/weights/best.pt`.

6. **Run inference** on new images and get cropped PDP regions + a JSON
   manifest (crop offsets, confidence — feeds directly into Stage 4/OCR):
   ```bash
   python infer.py --weights pdp_detector_runs/v1/weights/best.pt --source path/to/images --out-dir crops
   ```

## Notes

- `yolov8n` (nano) is the default model size — appropriate for a
  single-class detector on a small (150-500 image) dataset. Only move up to
  `s`/`m` if accuracy plateaus (`--model-size s`).
- `infer.py` pads each detected box by 8% per side before cropping, and
  writes the crop offset alongside each crop — needed later to map OCR
  boxes back to full-image coordinates and to keep the pixel-to-mm
  calibration scale valid post-crop.
- If a low-confidence or no-detection case comes up often in testing,
  pair this with a heuristic (OCR-text-density-clustering) fallback rather
  than relying on the trained model alone.
