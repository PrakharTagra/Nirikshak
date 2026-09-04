"""
Stage 2 — Universal Non-Destructive Image Optimization Pipeline
Legal Metrology / Packaged Commodities Compliance System

Optimized for inspector-captured, close-up packaging photographs:
1. Zero Cropping / Full Frame Preservation:
   The inspector captures the package up-close and in-frame. No heuristic
   contours, edge slicing, or perspective warping that could cut off statutory declarations.
2. Zero Artificial Rotation:
   The inspector uses an on-screen leveling guide / scale during capture.
   Natural orientation is preserved without false 90-degree flips or affine blur.
3. Zero Destructive Inpainting:
   No aggressive "glare" filters that misidentify white numerals / text as glare
   and erase them.
4. Universal Multi-Color Dynamic Range & Contrast Optimization:
   Operates in CIELAB color space on the Luminance (L) channel, keeping chrominance
   (a and b) 100% authentic for every packaging color and background.
   - Smooth macro-illumination leveling lifts phone / hand shadows without halos.
   - Controlled CLAHE heightens local text stroke contrast against all backgrounds
     (dark on light, light on dark, and vibrant packaging).
   - Percentile dynamic range stretch ensures optimal exposure.
5. OCR Resolution Normalization:
   Scales images into RapidOCR's sweet spot (max dimension 2048px) so character
   heights are optimal (~25-50px) without thick stroke distortion or inference lag.
"""

from __future__ import annotations

import os
from dataclasses import asdict, dataclass, field
from typing import List, Optional, Tuple

import cv2
import numpy as np


@dataclass
class PreprocessConfig:
    min_output_width: int = 600
    min_output_height: int = 400
    min_dimension_short: int = 250
    min_dimension_long: int = 600
    target_ocr_dim: int = 1800
    max_ocr_dim: int = 2048

    min_sharpness_score: float = 25.0
    max_glare_area_frac: float = 0.50

    clahe_clip_limit: float = 1.8
    clahe_tile_grid: int = 8
    illumination_strength: float = 0.18

    save_intermediate_images: bool = False
    debug_output_dir: str = "preprocessing_debug"


@dataclass
class PreprocessMetadata:
    original_width: int
    original_height: int
    output_width: int
    output_height: int
    boundary_detected: bool
    deskew_method: str
    rotation_angle_deg: float
    sharpness_score: float
    glare_area_fraction: float
    usable: bool
    reject_reasons: List[str] = field(default_factory=list)

    def to_dict(self) -> dict:
        return asdict(self)


class PreprocessingError(Exception):
    pass


def decode_image(image_bytes: bytes) -> np.ndarray:
    if not image_bytes:
        raise PreprocessingError("Image data is empty.")
    arr = np.frombuffer(image_bytes, dtype=np.uint8)
    img = cv2.imdecode(arr, cv2.IMREAD_COLOR)
    if img is None:
        try:
            import io
            from PIL import Image, ImageOps
            import pillow_heif

            pillow_heif.register_heif_opener()
            pil_img = Image.open(io.BytesIO(image_bytes))
            pil_img = ImageOps.exif_transpose(pil_img)
            if pil_img.mode != "RGB":
                pil_img = pil_img.convert("RGB")
            img = cv2.cvtColor(np.array(pil_img), cv2.COLOR_RGB2BGR)
        except Exception as exc:
            raise PreprocessingError(
                f"Could not decode image — unsupported format or corrupt file: {exc}"
            )
    if img is None:
        raise PreprocessingError("Could not decode image — unsupported format or corrupt file.")
    return img


def _normalize_contrast_and_brightness(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
    """
    Universal photometric normalization for all image and packaging colors.
    Operates in CIELAB color space to enhance lightness/contrast while keeping
    authentic packaging colors (a, b channels) intact.
    """
    lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
    l_channel, a_channel, b_channel = cv2.split(lab)
    h, w = l_channel.shape

    # 1. Smooth Macro-Illumination Leveling (Neutralizes phone / hand shadows)
    # Downscale heavily to capture only broad lighting gradients, never text strokes
    thumb_dim = 160
    scale = thumb_dim / max(h, w)
    small_w = max(1, int(w * scale))
    small_h = max(1, int(h * scale))

    small_l = cv2.resize(l_channel.astype(np.float32), (small_w, small_h), interpolation=cv2.INTER_AREA)
    small_bg = cv2.GaussianBlur(small_l, (0, 0), sigmaX=16.0, sigmaY=16.0)
    bg_full = cv2.resize(small_bg, (w, h), interpolation=cv2.INTER_LINEAR)
    bg_full = np.maximum(bg_full, 15.0)

    target_ref = float(np.median(small_bg))
    strength = cfg.illumination_strength

    l_float = l_channel.astype(np.float32)
    leveled = (1.0 - strength) * l_float + strength * np.clip((l_float / bg_full) * target_ref, 0, 255)
    leveled_u8 = np.clip(leveled, 0, 255).astype(np.uint8)

    # 2. Local Text Contrast Enhancement via CLAHE
    # Safe clipLimit (1.8) prevents pixel noise / grain while sharpening faint numerals
    clahe = cv2.createCLAHE(clipLimit=cfg.clahe_clip_limit, tileGridSize=(cfg.clahe_tile_grid, cfg.clahe_tile_grid))
    enhanced_l = clahe.apply(leveled_u8)

    # 3. Dynamic Range Stretch (Prevents underexposed / washed-out text)
    # Clip extreme 0.5% outliers to avoid hot-pixel distortion
    p_low, p_high = np.percentile(enhanced_l, (0.5, 99.5))
    if p_high > p_low + 30:
        stretched_l = np.clip((enhanced_l.astype(np.float32) - p_low) / (p_high - p_low) * 245.0 + 5.0, 0, 255).astype(np.uint8)
    else:
        stretched_l = enhanced_l

    # Recombine enhanced Luminance with original chromatic channels
    return cv2.cvtColor(cv2.merge((stretched_l, a_channel, b_channel)), cv2.COLOR_LAB2BGR)


def _scale_and_refine_for_ocr(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
    """
    Scale image into RapidOCR sweet spot and apply subtle micro-contrast.
    Avoids heavy unsharp masks that cause dark halos or ringing.
    """
    h, w = img.shape[:2]
    long_dim = max(h, w)

    # Scale giant phone captures (e.g. 4000px) down to 2048px for peak OCR recognition & speed
    if long_dim > cfg.max_ocr_dim:
        ratio = float(cfg.max_ocr_dim) / float(long_dim)
        target_w = int(round(w * ratio))
        target_h = int(round(h * ratio))
        img = cv2.resize(img, (target_w, target_h), interpolation=cv2.INTER_AREA)
    # Scale small/low-res captures up so fine print character strokes are well resolved
    elif long_dim < 1200:
        ratio = float(cfg.target_ocr_dim) / float(long_dim)
        target_w = int(round(w * ratio))
        target_h = int(round(h * ratio))
        img = cv2.resize(img, (target_w, target_h), interpolation=cv2.INTER_CUBIC)

    # Gentle, high-fidelity micro-contrast sharpening (1.15 multiplier, subtle and clean)
    blurred = cv2.GaussianBlur(img, (0, 0), 0.8)
    refined = cv2.addWeighted(img, 1.15, blurred, -0.15, 0)
    return refined


def sharpness_score(img: np.ndarray) -> float:
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    return float(cv2.Laplacian(gray, cv2.CV_64F).var())


def _save_debug_image(image: np.ndarray, filename: str, cfg: PreprocessConfig) -> None:
    if not cfg.save_intermediate_images:
        return
    os.makedirs(cfg.debug_output_dir, exist_ok=True)
    cv2.imwrite(os.path.join(cfg.debug_output_dir, filename), image)


def preprocess(
    image_bytes: bytes, cfg: Optional[PreprocessConfig] = None
) -> Tuple[np.ndarray, PreprocessMetadata]:
    """
    Master Stage 2 preprocessing entry point.
    
    Guarantees:
      - Full frame preserved (NO cropping / perspective shearing).
      - Authentic orientation preserved (NO accidental 90-degree rotations).
      - Authentic packaging colors preserved (CIELAB L-channel processing).
      - Text strokes protected (NO inpainting).
      - Optimum contrast, exposure, and scale for RapidOCR.
    """
    cfg = cfg or PreprocessConfig()
    img = decode_image(image_bytes)
    orig_h, orig_w = img.shape[:2]

    _save_debug_image(img, "01_raw.png", cfg)

    # 1. Universal Photometric Normalization (Shadow leveling, CLAHE contrast, dynamic range)
    enhanced = _normalize_contrast_and_brightness(img, cfg)
    _save_debug_image(enhanced, "02_enhanced.png", cfg)

    # 2. Optimal OCR Scale & Clean Micro-Contrast
    final_img = _scale_and_refine_for_ocr(enhanced, cfg)
    _save_debug_image(final_img, "03_final.png", cfg)

    out_h, out_w = final_img.shape[:2]
    sharpness = sharpness_score(final_img)

    reasons = []
    short_dim = min(out_w, out_h)
    long_dim = max(out_w, out_h)

    if short_dim < cfg.min_dimension_short or long_dim < cfg.min_dimension_long:
        reasons.append(
            f"Resolution too low ({out_w}x{out_h}); minimum is {cfg.min_dimension_short}x{cfg.min_dimension_long}."
        )
    if sharpness < cfg.min_sharpness_score:
        reasons.append(
            f"Image blurry (sharpness={sharpness:.1f}, minimum={cfg.min_sharpness_score}). "
            "Hold camera steady and re-capture."
        )

    metadata = PreprocessMetadata(
        original_width=orig_w,
        original_height=orig_h,
        output_width=out_w,
        output_height=out_h,
        boundary_detected=True,
        deskew_method="full_frame",
        rotation_angle_deg=0.0,
        sharpness_score=round(sharpness, 2),
        glare_area_fraction=0.0,
        usable=len(reasons) == 0,
        reject_reasons=reasons,
    )

    return final_img, metadata
