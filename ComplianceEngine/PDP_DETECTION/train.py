"""
train.py

Fine-tunes a YOLOv8n model to detect the Principal Display Panel (PDP)
region on packaged-commodity images (Stage 3 of the compliance pipeline).

Run validate_labels.py first to catch dataset issues before burning a
training run on them.

Usage:
    python train.py --data dataset/data.yaml --epochs 100
"""

import argparse

from ultralytics import YOLO


def train(data_yaml: str, epochs: int, imgsz: int, batch: int, model_size: str, name: str):
    # Start from a COCO-pretrained checkpoint — do NOT train from scratch.
    # 'n' (nano) is the right starting point for a single-class detector
    # on a small dataset; only step up to 's'/'m' if accuracy plateaus.
    model = YOLO(f"yolov8{model_size}.pt")

    results = model.train(
        data=data_yaml,
        epochs=epochs,
        imgsz=imgsz,
        batch=batch,
        patience=20,          # early stop if val loss plateaus for 20 epochs
        augment=True,         # built-in mosaic/flip/hsv augmentation
        project="pdp_detector_runs",
        name=name,
        exist_ok=True,
    )

    # Run validation on the held-out val split and print key metrics
    metrics = model.val()
    print("\n--- Validation metrics ---")
    print(f"mAP50:    {metrics.box.map50:.4f}")
    print(f"mAP50-95: {metrics.box.map:.4f}")
    print(f"Precision:{metrics.box.mp:.4f}")
    print(f"Recall:   {metrics.box.mr:.4f}")

    best_weights = f"pdp_detector_runs/{name}/weights/best.pt"
    print(f"\nBest weights saved at: {best_weights}")
    print("Use this path with infer.py --weights", best_weights)

    return results


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--data", type=str, default="dataset/data.yaml")
    parser.add_argument("--epochs", type=int, default=100)
    parser.add_argument("--imgsz", type=int, default=640)
    parser.add_argument("--batch", type=int, default=16)
    parser.add_argument("--model-size", type=str, default="n",
                         choices=["n", "s", "m", "l", "x"],
                         help="YOLOv8 model size (default: n / nano)")
    parser.add_argument("--name", type=str, default="v1",
                         help="Run name — outputs go to pdp_detector_runs/<name>/")
    args = parser.parse_args()

    train(args.data, args.epochs, args.imgsz, args.batch, args.model_size, args.name)
