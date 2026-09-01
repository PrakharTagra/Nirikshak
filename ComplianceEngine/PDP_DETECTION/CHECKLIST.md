# Checklist — After Adding ~300 Images

Once your ~300 annotated images are in `raw-annotated/images/` and their
matching YOLO-format `.txt` files are in `raw-annotated/labels/` (same
filename stem, e.g. `product042.png` ↔ `product042.txt`), run the
following in order.

---

## 1. Split into train/val

```cmd
python split_dataset.py --src raw-annotated --dst dataset --val-ratio 0.15
```

Check the printed summary — `Skipped (no label): N images` should be `0`.
If it's not, some images don't have a matching label file; find and fix
those before continuing (mismatched filenames are the usual cause).

---

## 2. Validate before training

```cmd
python validate_labels.py --dataset dataset
```

Fix anything it reports (missing labels, empty label files, out-of-range
coordinates, bad class ids) before moving on — don't skip this at 300
images, a handful of bad annotations can silently hurt accuracy in ways
that are hard to trace back later.

---

## 3. Train (full run — not the earlier smoke-test epoch count)

```cmd
python train.py --data dataset/data.yaml --epochs 100
```

This will take meaningfully longer than the earlier 2-image test — minutes
to an hour-plus on CPU depending on image count/resolution. Let it run to
completion. It ends with a validation metrics block (`mAP50`, `mAP50-95`,
`Precision`, `Recall`) and prints the path to `best.pt`.

---

## 4. Confirm where the weights actually saved

Ultralytics resolves the `project=` folder relative to its own global
`runs_dir` setting, not necessarily your project folder. Check it once:

```cmd
yolo settings
```

Your trained weights will be at:
```
<runs_dir>\detect\pdp_detector_runs\v1\weights\best.pt
```

(Optional, fixes this permanently so weights land inside your repo:)
```cmd
yolo settings runs_dir="<your PDP_DETECTION folder>\runs"
```

---

## 5. Check the output — two ways

**A. Full pipeline — cropped PDP regions + JSON manifest**
(this is what Stage 4/OCR will consume downstream)
```cmd
python infer.py --weights <path-to-best.pt> --source raw-annotated/images/<some_test_image>.png --conf 0.4 --out-dir crops_v2
dir crops_v2
type crops_v2\pdp_regions_manifest.json
```

**B. Quick visual check — box drawn directly on the full image**
(fastest way to eyeball whether the box lands on the right region)
```cmd
yolo predict model=<path-to-best.pt> source=<image_path> conf=0.4 save=True
```
Open the output from `runs\detect\predict*\` in File Explorer.

To test true generalization, run either of these on an image the model
has **never seen** during training — run it through Stage 2 preprocessing
first so it matches the distribution the model was trained on.

---

## 6. What to actually look for in the metrics

At 300 real, diverse images, expect `mAP50` to land meaningfully above the
~0.02 seen in the 2-image smoke test. If it's still near-zero:
- Check label quality first (mismatched pairs, bad boxes) — re-run
  `validate_labels.py` and spot-check a few boxes visually via
  `labels.jpg` (written automatically to the training run folder).
- Check dataset diversity — 300 images of very similar package types/
  angles/lighting will underperform a smaller but more varied set.

`Precision`/`Recall` in the 0.5+ range is a reasonable "this is starting
to work" bar for a single-class detector at this data scale — don't
expect production-grade numbers yet; that's a v2 problem once more real
field data flows in.
