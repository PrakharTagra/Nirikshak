"""
split_dataset.py

Once you've annotated your Stage-2-preprocessed images (e.g. via Roboflow or
LabelImg, exported in YOLO format: one image + one matching .txt file per
image), dump ALL of them into a single folder pair:

    raw_annotated/
        images/   <- all your .jpg/.png images
        labels/   <- matching .txt files (same filename, .txt extension)

Then run this script to split them into the dataset/images/{train,val} and
dataset/labels/{train,val} structure that YOLOv8 expects.

Usage:
    python split_dataset.py --src raw_annotated --dst dataset --val-ratio 0.15
"""

import argparse
import random
import shutil
from pathlib import Path

IMG_EXTS = {".jpg", ".jpeg", ".png", ".bmp"}


def split_dataset(src: Path, dst: Path, val_ratio: float, seed: int = 42):
    img_dir = src / "images"
    lbl_dir = src / "labels"

    images = sorted(p for p in img_dir.iterdir() if p.suffix.lower() in IMG_EXTS)
    if not images:
        raise SystemExit(f"No images found in {img_dir}")

    # Keep only images that have a matching label file — warn about the rest
    paired = []
    missing_labels = []
    for img_path in images:
        lbl_path = lbl_dir / (img_path.stem + ".txt")
        if lbl_path.exists():
            paired.append((img_path, lbl_path))
        else:
            missing_labels.append(img_path.name)

    if missing_labels:
        print(f"WARNING: {len(missing_labels)} image(s) have no matching label "
              f"file and will be skipped, e.g.: {missing_labels[:5]}")

    random.seed(seed)
    random.shuffle(paired)

    n_val = max(1, int(len(paired) * val_ratio))
    val_set = paired[:n_val]
    train_set = paired[n_val:]

    for split_name, split_data in (("train", train_set), ("val", val_set)):
        img_out = dst / "images" / split_name
        lbl_out = dst / "labels" / split_name
        img_out.mkdir(parents=True, exist_ok=True)
        lbl_out.mkdir(parents=True, exist_ok=True)
        for img_path, lbl_path in split_data:
            shutil.copy2(img_path, img_out / img_path.name)
            shutil.copy2(lbl_path, lbl_out / lbl_path.name)

    print(f"Done. Train: {len(train_set)} images | Val: {len(val_set)} images")
    print(f"Skipped (no label): {len(missing_labels)} images")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--src", type=Path, required=True,
                         help="Folder containing images/ and labels/ subfolders (unsplit)")
    parser.add_argument("--dst", type=Path, default=Path("dataset"),
                         help="Output dataset root (default: ./dataset)")
    parser.add_argument("--val-ratio", type=float, default=0.15,
                         help="Fraction of data to hold out for validation (default: 0.15)")
    parser.add_argument("--seed", type=int, default=42)
    args = parser.parse_args()

    split_dataset(args.src, args.dst, args.val_ratio, args.seed)
