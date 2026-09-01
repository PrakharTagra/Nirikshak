"""
validate_labels.py

Sanity-checks a YOLO-format dataset before you burn a training run on it.
Catches the usual annotation-export mistakes: missing labels, empty label
files, out-of-range coordinates, malformed lines, class ids that don't
exist in data.yaml.

Usage:
    python validate_labels.py --dataset dataset
"""

import argparse
from pathlib import Path

import yaml

IMG_EXTS = {".jpg", ".jpeg", ".png", ".bmp"}


def validate_split(images_dir: Path, labels_dir: Path, num_classes: int, split_name: str):
    errors = []
    images = sorted(p for p in images_dir.iterdir() if p.suffix.lower() in IMG_EXTS)

    if not images:
        errors.append(f"[{split_name}] No images found in {images_dir}")
        return errors

    for img_path in images:
        lbl_path = labels_dir / (img_path.stem + ".txt")
        if not lbl_path.exists():
            errors.append(f"[{split_name}] Missing label file for {img_path.name}")
            continue

        lines = [l.strip() for l in lbl_path.read_text().splitlines() if l.strip()]
        if not lines:
            errors.append(f"[{split_name}] Empty label file: {lbl_path.name}")
            continue

        for i, line in enumerate(lines):
            parts = line.split()
            if len(parts) != 5:
                errors.append(f"[{split_name}] {lbl_path.name} line {i+1}: "
                               f"expected 5 values, got {len(parts)}")
                continue

            cls_id, x, y, w, h = parts
            if not cls_id.isdigit() or int(cls_id) >= num_classes:
                errors.append(f"[{split_name}] {lbl_path.name} line {i+1}: "
                               f"invalid class id '{cls_id}'")

            for name, val in (("x", x), ("y", y), ("w", w), ("h", h)):
                try:
                    v = float(val)
                    if not (0.0 <= v <= 1.0):
                        errors.append(f"[{split_name}] {lbl_path.name} line {i+1}: "
                                       f"{name}={v} out of [0,1] range (not normalized?)")
                except ValueError:
                    errors.append(f"[{split_name}] {lbl_path.name} line {i+1}: "
                                   f"'{name}' value '{val}' is not a number")

    return errors


def main(dataset_root: Path):
    data_yaml = dataset_root / "data.yaml"
    if not data_yaml.exists():
        raise SystemExit(f"data.yaml not found at {data_yaml}")

    config = yaml.safe_load(data_yaml.read_text())
    num_classes = len(config["names"])
    print(f"Classes ({num_classes}): {config['names']}")

    all_errors = []
    for split in ("train", "val"):
        images_dir = dataset_root / "images" / split
        labels_dir = dataset_root / "labels" / split
        if not images_dir.exists():
            all_errors.append(f"Missing folder: {images_dir}")
            continue
        all_errors.extend(validate_split(images_dir, labels_dir, num_classes, split))

    if all_errors:
        print(f"\n{len(all_errors)} issue(s) found:\n")
        for e in all_errors:
            print(" -", e)
        raise SystemExit(1)
    else:
        print("\nAll good — dataset looks valid for training.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--dataset", type=Path, default=Path("dataset"),
                         help="Dataset root containing data.yaml, images/, labels/")
    args = parser.parse_args()
    main(args.dataset)
