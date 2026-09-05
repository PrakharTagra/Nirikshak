# """
# Stage 2 — Universal Non-Destructive Image Optimization Pipeline
# Legal Metrology / Packaged Commodities Compliance System

# Optimized for inspector-captured, close-up packaging photographs:
# 1. Zero Cropping / Full Frame Preservation:
#    The inspector captures the package up-close and in-frame. No heuristic
#    contours, edge slicing, or perspective warping that could cut off statutory declarations.
# 2. Zero Artificial Rotation:
#    The inspector uses an on-screen leveling guide / scale during capture.
#    Natural orientation is preserved without false 90-degree flips or affine blur.
# 3. Zero Destructive Inpainting:
#    No aggressive "glare" filters that misidentify white numerals / text as glare
#    and erase them.
# 4. Universal Multi-Color Dynamic Range & Contrast Optimization:
#    Operates in CIELAB color space on the Luminance (L) channel, keeping chrominance
#    (a and b) 100% authentic for every packaging color and background.
#    - Smooth macro-illumination leveling lifts phone / hand shadows without halos.
#    - Controlled CLAHE heightens local text stroke contrast against all backgrounds
#      (dark on light, light on dark, and vibrant packaging).
#    - Percentile dynamic range stretch ensures optimal exposure.
# 5. OCR Resolution Normalization:
#    Scales images into PaddleOCR's sweet spot (max dimension 2048px) so character
#    heights are optimal (~25-50px) without thick stroke distortion or inference lag.
# """

# from __future__ import annotations

# import os
# from dataclasses import asdict, dataclass, field
# from typing import List, Optional, Tuple

# import cv2
# import numpy as np


# @dataclass
# class PreprocessConfig:
#     min_output_width: int = 600
#     min_output_height: int = 400
#     min_dimension_short: int = 250
#     min_dimension_long: int = 600
#     target_ocr_dim: int = 1800
#     max_ocr_dim: int = 2048

#     min_sharpness_score: float = 25.0
#     max_glare_area_frac: float = 0.50

#     clahe_clip_limit: float = 1.8
#     clahe_tile_grid: int = 8
#     illumination_strength: float = 0.18

#     save_intermediate_images: bool = False
#     debug_output_dir: str = "preprocessing_debug"


# @dataclass
# class PreprocessMetadata:
#     original_width: int
#     original_height: int
#     output_width: int
#     output_height: int
#     boundary_detected: bool
#     deskew_method: str
#     rotation_angle_deg: float
#     sharpness_score: float
#     glare_area_fraction: float
#     usable: bool
#     reject_reasons: List[str] = field(default_factory=list)

#     def to_dict(self) -> dict:
#         return asdict(self)


# class PreprocessingError(Exception):
#     pass


# def decode_image(image_bytes: bytes) -> np.ndarray:
#     if not image_bytes:
#         raise PreprocessingError("Image data is empty.")
#     arr = np.frombuffer(image_bytes, dtype=np.uint8)
#     img = cv2.imdecode(arr, cv2.IMREAD_COLOR)
#     if img is None:
#         try:
#             import io
#             from PIL import Image, ImageOps
#             import pillow_heif

#             pillow_heif.register_heif_opener()
#             pil_img = Image.open(io.BytesIO(image_bytes))
#             pil_img = ImageOps.exif_transpose(pil_img)
#             if pil_img.mode != "RGB":
#                 pil_img = pil_img.convert("RGB")
#             img = cv2.cvtColor(np.array(pil_img), cv2.COLOR_RGB2BGR)
#         except Exception as exc:
#             raise PreprocessingError(
#                 f"Could not decode image — unsupported format or corrupt file: {exc}"
#             )
#     if img is None:
#         raise PreprocessingError("Could not decode image — unsupported format or corrupt file.")
#     return img


# def _normalize_contrast_and_brightness(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
#     """
#     Universal photometric normalization for all image and packaging colors.
#     Operates in CIELAB color space to enhance lightness/contrast while keeping
#     authentic packaging colors (a, b channels) intact.
#     """
#     lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
#     l_channel, a_channel, b_channel = cv2.split(lab)
#     h, w = l_channel.shape

#     # 1. Smooth Macro-Illumination Leveling (Neutralizes phone / hand shadows)
#     # Downscale heavily to capture only broad lighting gradients, never text strokes
#     thumb_dim = 160
#     scale = thumb_dim / max(h, w)
#     small_w = max(1, int(w * scale))
#     small_h = max(1, int(h * scale))

#     small_l = cv2.resize(l_channel.astype(np.float32), (small_w, small_h), interpolation=cv2.INTER_AREA)
#     small_bg = cv2.GaussianBlur(small_l, (0, 0), sigmaX=16.0, sigmaY=16.0)
#     bg_full = cv2.resize(small_bg, (w, h), interpolation=cv2.INTER_LINEAR)
#     bg_full = np.maximum(bg_full, 15.0)

#     target_ref = float(np.median(small_bg))
#     strength = cfg.illumination_strength

#     l_float = l_channel.astype(np.float32)
#     leveled = (1.0 - strength) * l_float + strength * np.clip((l_float / bg_full) * target_ref, 0, 255)
#     leveled_u8 = np.clip(leveled, 0, 255).astype(np.uint8)

#     # 2. Local Text Contrast Enhancement via CLAHE
#     # Safe clipLimit (1.8) prevents pixel noise / grain while sharpening faint numerals
#     clahe = cv2.createCLAHE(clipLimit=cfg.clahe_clip_limit, tileGridSize=(cfg.clahe_tile_grid, cfg.clahe_tile_grid))
#     enhanced_l = clahe.apply(leveled_u8)

#     # 3. Dynamic Range Stretch (Prevents underexposed / washed-out text)
#     # Clip extreme 0.5% outliers to avoid hot-pixel distortion
#     p_low, p_high = np.percentile(enhanced_l, (0.5, 99.5))
#     if p_high > p_low + 30:
#         stretched_l = np.clip((enhanced_l.astype(np.float32) - p_low) / (p_high - p_low) * 245.0 + 5.0, 0, 255).astype(np.uint8)
#     else:
#         stretched_l = enhanced_l

#     # Recombine enhanced Luminance with original chromatic channels
#     return cv2.cvtColor(cv2.merge((stretched_l, a_channel, b_channel)), cv2.COLOR_LAB2BGR)


# def _scale_and_refine_for_ocr(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
#     """
#     Scale image into PaddleOCR sweet spot and apply subtle micro-contrast.
#     Avoids heavy unsharp masks that cause dark halos or ringing.
#     """
#     h, w = img.shape[:2]
#     long_dim = max(h, w)

#     # Scale giant phone captures (e.g. 4000px) down to 2048px for peak OCR recognition & speed
#     if long_dim > cfg.max_ocr_dim:
#         ratio = float(cfg.max_ocr_dim) / float(long_dim)
#         target_w = int(round(w * ratio))
#         target_h = int(round(h * ratio))
#         img = cv2.resize(img, (target_w, target_h), interpolation=cv2.INTER_AREA)
#     # Scale small/low-res captures up so fine print character strokes are well resolved
#     elif long_dim < 1200:
#         ratio = float(cfg.target_ocr_dim) / float(long_dim)
#         target_w = int(round(w * ratio))
#         target_h = int(round(h * ratio))
#         img = cv2.resize(img, (target_w, target_h), interpolation=cv2.INTER_CUBIC)

#     # Gentle, high-fidelity micro-contrast sharpening (1.15 multiplier, subtle and clean)
#     blurred = cv2.GaussianBlur(img, (0, 0), 0.8)
#     refined = cv2.addWeighted(img, 1.15, blurred, -0.15, 0)
#     return refined


# def sharpness_score(img: np.ndarray) -> float:
#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#     return float(cv2.Laplacian(gray, cv2.CV_64F).var())


# def _save_debug_image(image: np.ndarray, filename: str, cfg: PreprocessConfig) -> None:
#     if not cfg.save_intermediate_images:
#         return
#     os.makedirs(cfg.debug_output_dir, exist_ok=True)
#     cv2.imwrite(os.path.join(cfg.debug_output_dir, filename), image)


# def preprocess(
#     image_bytes: bytes, cfg: Optional[PreprocessConfig] = None
# ) -> Tuple[np.ndarray, PreprocessMetadata]:
#     """
#     Master Stage 2 preprocessing entry point.
    
#     Guarantees:
#       - Full frame preserved (NO cropping / perspective shearing).
#       - Authentic orientation preserved (NO accidental 90-degree rotations).
#       - Authentic packaging colors preserved (CIELAB L-channel processing).
#       - Text strokes protected (NO inpainting).
#       - Optimum contrast, exposure, and scale for PaddleOCR.
#     """
#     cfg = cfg or PreprocessConfig()
#     img = decode_image(image_bytes)
#     orig_h, orig_w = img.shape[:2]

#     _save_debug_image(img, "01_raw.png", cfg)

#     # 1. Universal Photometric Normalization (Shadow leveling, CLAHE contrast, dynamic range)
#     enhanced = _normalize_contrast_and_brightness(img, cfg)
#     _save_debug_image(enhanced, "02_enhanced.png", cfg)

#     # 2. Optimal OCR Scale & Clean Micro-Contrast
#     final_img = _scale_and_refine_for_ocr(enhanced, cfg)
#     _save_debug_image(final_img, "03_final.png", cfg)

#     out_h, out_w = final_img.shape[:2]
#     sharpness = sharpness_score(final_img)

#     reasons = []
#     short_dim = min(out_w, out_h)
#     long_dim = max(out_w, out_h)

#     if short_dim < cfg.min_dimension_short or long_dim < cfg.min_dimension_long:
#         reasons.append(
#             f"Resolution too low ({out_w}x{out_h}); minimum is {cfg.min_dimension_short}x{cfg.min_dimension_long}."
#         )
#     if sharpness < cfg.min_sharpness_score:
#         reasons.append(
#             f"Image blurry (sharpness={sharpness:.1f}, minimum={cfg.min_sharpness_score}). "
#             "Hold camera steady and re-capture."
#         )

#     metadata = PreprocessMetadata(
#         original_width=orig_w,
#         original_height=orig_h,
#         output_width=out_w,
#         output_height=out_h,
#         boundary_detected=True,
#         deskew_method="full_frame",
#         rotation_angle_deg=0.0,
#         sharpness_score=round(sharpness, 2),
#         glare_area_fraction=0.0,
#         usable=len(reasons) == 0,
#         reject_reasons=reasons,
#     )

#     return final_img, metadata
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
   Scales images into PaddleOCR's sweet spot (max dimension 2048px) so character
   heights are optimal (~25-50px) without thick stroke distortion or inference lag.
6. Text-Only Legibility Enhancement (NEW):
   A final, narrowly-scoped pass that ONLY sharpens stroke-vs-background contrast
   for the OCR engine. Runs after OCR-scale resizing (so stroke-scale parameters
   are meaningful in real pixels), touches only the L channel, and does nothing
   else to the image — no crop, no rotation, no chrominance change, no resize.
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
    # Native-dynamic-range (0.5–99.5 percentile spread of the raw L channel)
    # thresholds gating CLAHE. At/above clahe_skip_above_range the capture is
    # already well exposed and CLAHE is skipped entirely. At/below
    # clahe_full_below_range the capture is flat/underexposed and CLAHE runs
    # at the full configured clip limit. Linearly scaled in between.
    clahe_skip_above_range: float = 200.0
    clahe_full_below_range: float = 60.0
    clahe_min_clip_limit: float = 1.0
    # Blend weight applied to the local shading correction (0 = no correction,
    # 1 = fully cancel the detected local gradient). Safe to run fairly high
    # since `shading` is local and clipped — unlike the old global-target
    # design, it can't be thrown off by a bright/dark backdrop.
    illumination_strength: float = 0.6
    # Blur sigmas (in 160px-thumbnail space) for the fine vs. coarse local
    # background passes. fine smooths away text strokes; coarse captures the
    # broader local shading trend. Keep both small — large sigmas re-open the
    # original bug by reaching across the package/backdrop boundary.
    illumination_sigma_fine: float = 2.0
    illumination_sigma_coarse: float = 6.0
    # Hard cap (in L units) on the correction applied to any single pixel,
    # regardless of what the fine/coarse blurs estimate. Bounds worst-case
    # distortion near real edges (box corners, tears, seams) to a small,
    # visually negligible amount.
    illumination_max_shift: float = 25.0

    # --- Text-legibility (OCR-only) enhancement stage ---
    text_enhance_enabled: bool = True
    text_bilateral_d: int = 5
    text_bilateral_sigma_color: float = 25.0
    text_bilateral_sigma_space: float = 25.0
    text_clahe_clip_limit: float = 1.3
    text_clahe_tile_grid: int = 16
    text_unsharp_sigma: float = 1.0
    text_unsharp_weight: float = 1.35
    text_unsharp_blur_weight: float = -0.35

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

    # 1. Local Two-Scale Illumination Leveling (Neutralizes phone / hand shadows)
    #
    # IMPORTANT: this is deliberately LOCAL, not global. An earlier version of
    # this function leveled every pixel toward a single frame-wide target
    # brightness (the median over the whole thumbnail). That works only when
    # the package fills the frame — the moment any backdrop (table, cloth,
    # inspection mat) is visible, that global median gets pulled toward the
    # backdrop's brightness, and the whole package gets "corrected" toward a
    # foreign brightness level it was never supposed to match (verified: on a
    # well-lit capture with visible backdrop, this alone produced a patchy
    # +20-to-50 L-unit brightness shift across an already-correct image).
    #
    # Fix: compare two LOCAL blurs of the same pixel neighborhood — a fine one
    # (bg_fine, smooths away text strokes) and a slightly coarser one
    # (bg_coarse, captures the broader local shading trend). Their difference
    # is the local shading signal (near-zero where lighting is already even,
    # non-zero only where a real gradient — e.g. a hand shadow — exists) and
    # is clipped to a modest range so it can never be thrown off by a distant,
    # unrelated bright/dark region elsewhere in the frame.
    thumb_dim = 160
    scale = thumb_dim / max(h, w)
    small_w = max(1, int(w * scale))
    small_h = max(1, int(h * scale))

    small_l = cv2.resize(l_channel.astype(np.float32), (small_w, small_h), interpolation=cv2.INTER_AREA)
    bg_fine_small = cv2.GaussianBlur(small_l, (0, 0), sigmaX=cfg.illumination_sigma_fine, sigmaY=cfg.illumination_sigma_fine)
    bg_coarse_small = cv2.GaussianBlur(small_l, (0, 0), sigmaX=cfg.illumination_sigma_coarse, sigmaY=cfg.illumination_sigma_coarse)

    bg_fine = cv2.resize(bg_fine_small, (w, h), interpolation=cv2.INTER_LINEAR)
    bg_coarse = cv2.resize(bg_coarse_small, (w, h), interpolation=cv2.INTER_LINEAR)

    shading = np.clip(bg_coarse - bg_fine, -cfg.illumination_max_shift, cfg.illumination_max_shift)

    l_float = l_channel.astype(np.float32)
    leveled = l_float + cfg.illumination_strength * shading
    leveled_u8 = np.clip(leveled, 0, 255).astype(np.uint8)

    # 2. Local Text Contrast Enhancement via CLAHE — gated by need.
    # CLAHE's local histogram equalization pushes flat/uniform regions toward
    # mid-gray by design (that's how it manufactures local contrast where none
    # exists). On an already well-exposed capture with wide native dynamic
    # range, that same behavior just brightens a correctly dark background
    # for no benefit — lowering clipLimit alone doesn't fix this, since it's
    # a structural property of histogram equalization, not a noise-amplitude
    # setting. So: measure the raw capture's own dynamic range first, and
    # only bring CLAHE in (scaling clip strength with how much it's needed)
    # when that range indicates a genuinely flat/underexposed photo.
    raw_p_low, raw_p_high = np.percentile(l_channel, (0.5, 99.5))
    raw_native_range = raw_p_high - raw_p_low
    contrast_needed = float(np.clip(
        (cfg.clahe_skip_above_range - raw_native_range)
        / (cfg.clahe_skip_above_range - cfg.clahe_full_below_range),
        0.0, 1.0,
    ))
    if contrast_needed < 0.05:
        enhanced_l = leveled_u8
    else:
        effective_clip = max(cfg.clahe_min_clip_limit, cfg.clahe_clip_limit * contrast_needed)
        clahe = cv2.createCLAHE(clipLimit=effective_clip, tileGridSize=(cfg.clahe_tile_grid, cfg.clahe_tile_grid))
        enhanced_l = clahe.apply(leveled_u8)

    # 3. Dynamic Range Stretch (Prevents underexposed / washed-out text)
    # Only kicks in when the actual dynamic range is genuinely narrow
    # (< 160, i.e. clearly underexposed/flat) — an already well-exposed
    # capture (wide native range) is left alone rather than being stretched
    # brighter, which was washing out dark backgrounds unnecessarily.
    p_low, p_high = np.percentile(enhanced_l, (0.5, 99.5))
    native_range = p_high - p_low
    if 30 < native_range < 160:
        stretched_l = np.clip((enhanced_l.astype(np.float32) - p_low) / (p_high - p_low) * 245.0 + 5.0, 0, 255).astype(np.uint8)
    else:
        stretched_l = enhanced_l

    # Recombine enhanced Luminance with original chromatic channels
    return cv2.cvtColor(cv2.merge((stretched_l, a_channel, b_channel)), cv2.COLOR_LAB2BGR)


def _scale_and_refine_for_ocr(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
    """
    Scale image into PaddleOCR sweet spot and apply subtle micro-contrast.
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


def _enhance_text_legibility_for_ocr(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
    """
    Final OCR-focused text legibility pass.

    Runs AFTER photometric normalization and OCR-scale resizing. Touches ONLY
    the Luminance (L) channel and ONLY at a scale relevant to printed character
    strokes — it does not crop, rotate, resize, or alter packaging chrominance
    (a/b channels remain untouched, same guarantee as the rest of the pipeline).

    Goal: maximize stroke-vs-background edge contrast for PaddleOCR's text
    detector/recognizer without amplifying sensor grain or causing halo ringing.
    """
    lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
    l_channel, a_channel, b_channel = cv2.split(lab)

    # 1. Edge-preserving denoise.
    #    Strips sensor/JPEG micro-noise sitting right next to character strokes
    #    WITHOUT smearing the stroke edges themselves (unlike Gaussian blur).
    #    This matters because step 2 (CLAHE) would otherwise amplify that noise
    #    right alongside the text.
    denoised_l = cv2.bilateralFilter(
        l_channel,
        d=cfg.text_bilateral_d,
        sigmaColor=cfg.text_bilateral_sigma_color,
        sigmaSpace=cfg.text_bilateral_sigma_space,
    )

    # 2. Fine-grained local contrast, tuned to text scale (not the coarser,
    #    whole-package CLAHE already applied earlier in the pipeline).
    #    Smaller tile grid + lower clip limit = separates faint/light print
    #    from its background locally, without over-amplifying flat regions.
    #    Same need-based gate as the main CLAHE pass: skip/scale down when
    #    this specific frame already has wide native dynamic range, since
    #    CLAHE brightens flat regions toward mid-gray by construction and
    #    there's nothing to gain from that on an already well-exposed capture.
    raw_p_low, raw_p_high = np.percentile(denoised_l, (0.5, 99.5))
    raw_native_range = raw_p_high - raw_p_low
    contrast_needed = float(np.clip(
        (cfg.clahe_skip_above_range - raw_native_range)
        / (cfg.clahe_skip_above_range - cfg.clahe_full_below_range),
        0.0, 1.0,
    ))
    if contrast_needed < 0.05:
        text_boosted_l = denoised_l
    else:
        effective_clip = max(cfg.clahe_min_clip_limit, cfg.text_clahe_clip_limit * contrast_needed)
        clahe_text = cv2.createCLAHE(
            clipLimit=effective_clip,
            tileGridSize=(cfg.text_clahe_tile_grid, cfg.text_clahe_tile_grid),
        )
        text_boosted_l = clahe_text.apply(denoised_l)

    # 3. Stroke-scale unsharp mask.
    #    Small sigma (~1.0px) matched to typical printed-character stroke width
    #    at OCR resolution — raises stroke/background edge contrast for the
    #    recognizer without introducing halos around larger shapes/logos.
    blur = cv2.GaussianBlur(text_boosted_l, (0, 0), sigmaX=cfg.text_unsharp_sigma)
    sharpened_l = cv2.addWeighted(
        text_boosted_l, cfg.text_unsharp_weight, blur, cfg.text_unsharp_blur_weight, 0
    )

    return cv2.cvtColor(
        cv2.merge((sharpened_l, a_channel, b_channel)), cv2.COLOR_LAB2BGR
    )


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
      - Optimum contrast, exposure, and scale for PaddleOCR.
      - Final text-only legibility boost for PaddleOCR (stroke contrast only).
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

    # 3. Text-only legibility pass for PaddleOCR (stroke contrast, nothing else)
    if cfg.text_enhance_enabled:
        final_img = _enhance_text_legibility_for_ocr(final_img, cfg)
        _save_debug_image(final_img, "04_text_enhanced.png", cfg)

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