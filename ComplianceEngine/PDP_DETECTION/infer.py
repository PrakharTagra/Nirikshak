"""
infer.py

Runs the fine-tuned PDP detector on one or more (Stage-2-preprocessed)
images, crops each detected PDP region with padding, and writes both the
crop and a JSON record with the crop offset — needed downstream to map
OCR boxes back to the original image and to keep the pixel-to-mm scale
valid after cropping.

Usage:
    # single image
    python infer.py --weights pdp_detector_runs/v1/weights/best.pt --source path/to/image.jpg

    # a whole folder of preprocessed images
    python infer.py --weights pdp_detector_runs/v1/weights/best.pt --source path/to/folder --out-dir crops
"""

import argparse
import json
from pathlib import Path

import cv2
from ultralytics import YOLO

IMG_EXTS = {".jpg", ".jpeg", ".png", ".bmp"}
PAD_RATIO = 0.08  # 8% padding around each detected box, per side


def pad_box(x1, y1, x2, y2, img_w, img_h, pad_ratio=PAD_RATIO):
    pad_x = int((x2 - x1) * pad_ratio)
    pad_y = int((y2 - y1) * pad_ratio)
    x1 = max(0, x1 - pad_x)
    y1 = max(0, y1 - pad_y)
    x2 = min(img_w, x2 + pad_x)
    y2 = min(img_h, y2 + pad_y)
    return x1, y1, x2, y2


def process_image(model, image_path: Path, out_dir: Path, conf_thresh: float):
    image = cv2.imread(str(image_path))
    if image is None:
        print(f"Could not read image: {image_path}")
        return None

    img_h, img_w = image.shape[:2]
    results = model.predict(source=str(image_path), conf=conf_thresh, verbose=False)

    regions = []
    boxes = results[0].boxes
    if boxes is None or len(boxes) == 0:
        print(f"No PDP region detected in {image_path.name} "
              f"(confidence threshold {conf_thresh}) — consider the heuristic fallback.")
        return {"scan_id": image_path.stem, "pdp_regions": []}

    for i, box in enumerate(boxes):
        x1, y1, x2, y2 = [int(v) for v in box.xyxy[0].tolist()]
        confidence = float(box.conf[0])

        x1p, y1p, x2p, y2p = pad_box(x1, y1, x2, y2, img_w, img_h)
        crop = image[y1p:y2p, x1p:x2p]

        region_id = f"pdp_{i+1}"
        crop_filename = f"{image_path.stem}_{region_id}.jpg"
        crop_path = out_dir / crop_filename
        cv2.imwrite(str(crop_path), crop)

        regions.append({
            "region_id": region_id,
            "crop_path": str(crop_path),
            "crop_offset": {"x": x1p, "y": y1p},
            "crop_size": {"width": x2p - x1p, "height": y2p - y1p},
            "confidence": round(confidence, 4),
        })

    record = {"scan_id": image_path.stem, "source_image": str(image_path), "pdp_regions": regions}
    return record


def main(weights: str, source: str, out_dir: str, conf_thresh: float):
    model = YOLO(weights)

    source_path = Path(source)
    out_path = Path(out_dir)
    out_path.mkdir(parents=True, exist_ok=True)

    if source_path.is_dir():
        image_paths = sorted(p for p in source_path.iterdir() if p.suffix.lower() in IMG_EXTS)
    else:
        image_paths = [source_path]

    all_records = []
    for img_path in image_paths:
        record = process_image(model, img_path, out_path, conf_thresh)
        if record:
            all_records.append(record)
            n = len(record["pdp_regions"])
            print(f"{img_path.name}: {n} region(s) detected")

    manifest_path = out_path / "pdp_regions_manifest.json"
    manifest_path.write_text(json.dumps(all_records, indent=2))
    print(f"\nWrote {len(all_records)} record(s) to {manifest_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--weights", type=str, required=True,
                         help="Path to trained weights, e.g. pdp_detector_runs/v1/weights/best.pt")
    parser.add_argument("--source", type=str, required=True,
                         help="Image file or folder of images (Stage-2-preprocessed)")
    parser.add_argument("--out-dir", type=str, default="crops",
                         help="Where to save cropped PDP images + manifest.json")
    parser.add_argument("--conf", type=float, default=0.4,
                         help="Confidence threshold for detections (default: 0.4)")
    args = parser.parse_args()

    main(args.weights, args.source, args.out_dir, args.conf)
