#!/usr/bin/env python3
"""
Nirikshak — Stage 3 PDP YOLO-OBB Training Pipeline
Fine-tunes an Oriented Bounding Box (OBB) model for packaging panel segmentation.

Usage:
    python train_pdp_obb.py [--data dataset.yaml] [--epochs 50] [--model yolo11s-obb.pt] [--export-onnx]
"""

import argparse
import os
import shutil
import sys
from pathlib import Path


def train(args):
    try:
        from ultralytics import YOLO
    except ImportError:
        print("[-] Error: 'ultralytics' is not installed.")
        print("    Install it via: pip install ultralytics")
        sys.exit(1)

    script_dir = Path(__file__).resolve().parent
    data_yaml = Path(args.data).resolve() if args.data else script_dir / "dataset.yaml"

    if not data_yaml.is_file():
        print(f"[-] Error: Dataset config file not found: {data_yaml}")
        print("    Please configure dataset.yaml before launching training.")
        sys.exit(1)

    output_models_dir = script_dir.parent / "models"
    output_models_dir.mkdir(parents=True, exist_ok=True)

    print("====================================================================")
    print(" NIRIKSHAK — STAGE 3 PDP ORIENTED BOUNDING BOX (OBB) TRAINING")
    print(f" Base Model     : {args.model}")
    print(f" Dataset Config : {data_yaml}")
    print(f" Image Size     : {args.imgsz}")
    print(f" Epochs         : {args.epochs}")
    print(f" Batch Size     : {args.batch}")
    print(f" Target Output  : {output_models_dir / 'pdp_obb_best.pt'}")
    print("====================================================================")

    # 1. Initialize base OBB model
    model = YOLO(args.model)

    # 2. Train with packaging-specific augmentations
    # (perspective, rotation degrees, shear, scale jitter)
    results = model.train(
        data=str(data_yaml),
        epochs=args.epochs,
        imgsz=args.imgsz,
        batch=args.batch,
        device=args.device,
        degrees=15.0,        # Handheld tilt variation
        shear=5.0,           # Perspective distortion on angled boxes
        perspective=0.0005,  # Subtle 3D perspective distortion
        flipud=0.0,          # Packaging is rarely inverted upside down
        fliplr=0.5,          # Horizontal reflection
        mosaic=1.0,          # Multi-image mosaic for small token anchors
        mixup=0.1,
        project=str(script_dir / "runs"),
        name="pdp_obb_experiment",
        exist_ok=True,
    )

    # 3. Copy best weights to stage3_pdp/models/
    best_pt = script_dir / "runs" / "pdp_obb_experiment" / "weights" / "best.pt"
    if best_pt.is_file():
        target_pt = output_models_dir / "pdp_obb_best.pt"
        shutil.copyfile(str(best_pt), str(target_pt))
        print(f"\n[+] Training complete! Best weights saved to: {target_pt}")

        # 4. Optional ONNX export for 3x faster production inference
        if args.export_onnx:
            print("[*] Exporting model to ONNX Runtime format...")
            best_model = YOLO(str(target_pt))
            onnx_path = best_model.export(format="onnx", imgsz=args.imgsz, half=False)
            print(f"[+] ONNX export ready: {onnx_path}")
    else:
        print("[!] Warning: Could not locate best.pt in run output directory.")


def main():
    parser = argparse.ArgumentParser(description="Nirikshak PDP OBB Model Trainer")
    parser.add_argument("--data", default="dataset.yaml", help="Path to dataset.yaml")
    parser.add_argument("--model", default="yolo11s-obb.pt", help="Base model (yolo11n-obb.pt, yolo11s-obb.pt)")
    parser.add_argument("--epochs", type=int, default=50, help="Number of training epochs")
    parser.add_argument("--imgsz", type=int, default=1024, help="Input image dimension for training")
    parser.add_argument("--batch", type=int, default=8, help="Batch size")
    parser.add_argument("--device", default="0" if os.environ.get("CUDA_VISIBLE_DEVICES") else "cpu", help="Compute device (0, cpu)")
    parser.add_argument("--export-onnx", action="store_true", help="Export to ONNX format after training")

    args = parser.parse_args()
    train(args)


if __name__ == "__main__":
    main()
