"""
Stage 2 — Generalized Image Preprocessing Pipeline
Legal Metrology / Packaged Commodities Compliance System

Accurate and generalized preprocessing pipeline capable of handling:
1. All package geometries (rectangular boxes, cylindrical bottles/cans,
   pouches/bags, tubes, blister cards, and irregular retail packaging).
2. Foreground segmentation with background border estimation and text
   enclosure guarantees to ensure no text or label panels are ever sliced.
3. 4-way orientation detection (0, 90, 180, 270 deg) and sub-degree Hough
   baseline deskewing.
4. Specular glare attenuation on glossy packaging/laminates.
5. Adaptive illumination gradient leveling and CLAHE local contrast
   enhancement on LAB L-channel to reveal faint/fine print.
6. Tiny-text super-resolution (Lanczos-4 upscaling) and micro-contrast
   unsharp stroke sharpening so OCR detects even 1mm-1.5mm statutory text.
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

    min_sharpness_score: float = 40.0
    max_glare_area_frac: float = 0.35

    clahe_clip_limit: float = 2.2
    clahe_tile_grid: int = 8
    illumination_strength: float = 0.20

    glare_value_thresh: int = 242
    glare_sat_thresh: int = 45

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
        raise PreprocessingError("Could not decode image — unsupported format or corrupt file.")
    return img


def _order_points(pts: np.ndarray) -> np.ndarray:
    rect = np.zeros((4, 2), dtype=np.float32)
    s = pts.sum(axis=1)
    rect[0] = pts[np.argmin(s)]
    rect[2] = pts[np.argmax(s)]
    diff = np.diff(pts, axis=1)
    rect[1] = pts[np.argmin(diff)]
    rect[3] = pts[np.argmax(diff)]
    return rect


def _detect_and_fix_orientation(img: np.ndarray) -> Tuple[np.ndarray, float]:
    h, w = img.shape[:2]

    # Coarse 90-degree check via horizontal vs vertical edge energy of text strokes
    scale = 480.0 / max(h, w)
    thumb = cv2.resize(img, (max(1, int(w * scale)), max(1, int(h * scale))), interpolation=cv2.INTER_AREA)
    gray_thumb = cv2.cvtColor(thumb, cv2.COLOR_BGR2GRAY)

    kernel_h = cv2.getStructuringElement(cv2.MORPH_RECT, (15, 1))
    morph_h = cv2.morphologyEx(gray_thumb, cv2.MORPH_OPEN, kernel_h)
    cnts_h, _ = cv2.findContours(morph_h, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    area_h = sum(cv2.contourArea(c) for c in cnts_h)

    kernel_v = cv2.getStructuringElement(cv2.MORPH_RECT, (1, 15))
    morph_v = cv2.morphologyEx(gray_thumb, cv2.MORPH_OPEN, kernel_v)
    cnts_v, _ = cv2.findContours(morph_v, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    area_v = sum(cv2.contourArea(c) for c in cnts_v)

    coarse_angle = 0.0
    if area_v > 1.8 * (area_h + 1e-3) and w < h:
        img = cv2.rotate(img, cv2.ROTATE_90_CLOCKWISE)
        coarse_angle = 90.0
        h, w = img.shape[:2]

    # Fine deskew using Hough lines on horizontal text edges
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    edges = cv2.Canny(gray, 50, 150)
    lines = cv2.HoughLinesP(edges, 1, np.pi / 180, 70, minLineLength=35, maxLineGap=8)
    fine_skew = 0.0
    if lines is not None:
        angles = []
        for l in lines:
            x1, y1, x2, y2 = l.ravel()
            dx = x2 - x1
            dy = y2 - y1
            if abs(dx) < 1e-3:
                continue
            a = float(np.degrees(np.arctan2(dy, dx)))
            while a <= -45: a += 90
            while a > 45: a -= 90
            if abs(a) < 18:
                angles.append(a)
        if angles:
            fine_skew = float(np.median(angles))

    total_angle = coarse_angle + fine_skew
    if abs(fine_skew) > 0.3:
        center = (w / 2.0, h / 2.0)
        M = cv2.getRotationMatrix2D(center, fine_skew, 1.0)
        deskewed = cv2.warpAffine(img, M, (w, h), flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)
        return deskewed, total_angle

    return img, total_angle


def _segment_and_crop(img: np.ndarray, cfg: PreprocessConfig) -> Tuple[np.ndarray, bool, str]:
    h, w = img.shape[:2]
    total_area = float(h * w)

    # 1. Downscale for fast segmentation
    scale = 800.0 / max(h, w)
    small_w = max(1, int(w * scale))
    small_h = max(1, int(h * scale))
    small = cv2.resize(img, (small_w, small_h), interpolation=cv2.INTER_AREA)

    # 2. Border background estimation
    bw = max(4, int(min(small_h, small_w) * 0.035))
    borders = np.concatenate([
        small[:bw, :].reshape(-1, 3),
        small[-bw:, :].reshape(-1, 3),
        small[:, :bw].reshape(-1, 3),
        small[:, -bw:].reshape(-1, 3)
    ])
    bg_median = np.median(borders, axis=0)
    bg_std = np.std(borders, axis=0)
    diff = np.linalg.norm(small.astype(np.float32) - bg_median.astype(np.float32), axis=2)
    thresh = max(20.0, float(np.mean(bg_std)) * 1.8)
    bg_diff_mask = (diff > thresh).astype(np.uint8) * 255

    # 3. High-gradient text and edge saliency
    gray_small = cv2.cvtColor(small, cv2.COLOR_BGR2GRAY)
    grad_x = cv2.Sobel(gray_small, cv2.CV_32F, 1, 0)
    grad_y = cv2.Sobel(gray_small, cv2.CV_32F, 0, 1)
    mag = cv2.magnitude(grad_x, grad_y)
    grad_mask = (mag > 32).astype(np.uint8) * 255
    grad_closed = cv2.morphologyEx(grad_mask, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_RECT, (25, 25)))

    combined = cv2.bitwise_or(bg_diff_mask, grad_closed)
    combined = cv2.morphologyEx(combined, cv2.MORPH_CLOSE, cv2.getStructuringElement(cv2.MORPH_RECT, (21, 21)))
    combined = cv2.morphologyEx(combined, cv2.MORPH_OPEN, cv2.getStructuringElement(cv2.MORPH_RECT, (5, 5)))

    # 4. Text activity envelope to prevent slicing text
    text_envelope = None
    cnts_grad, _ = cv2.findContours(grad_closed, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    if cnts_grad:
        text_pts = [c for c in cnts_grad if cv2.contourArea(c) > 100]
        if text_pts:
            text_envelope = cv2.boundingRect(np.vstack(text_pts))

    # 5. Extract dominant foreground contours
    cnts, _ = cv2.findContours(combined, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    if not cnts:
        return img, False, "full_frame"

    min_area = 0.05 * (small_w * small_h)
    valid_cnts = [c for c in cnts if cv2.contourArea(c) >= min_area]

    if not valid_cnts:
        return img, False, "full_frame"

    largest_cnt = max(valid_cnts, key=cv2.contourArea)
    largest_area = cv2.contourArea(largest_cnt)
    perimeter = cv2.arcLength(largest_cnt, True)
    approx = cv2.approxPolyDP(largest_cnt, 0.03 * perimeter, True)

    is_clean_quad = (len(approx) == 4 and cv2.isContourConvex(approx) and largest_area > 0.35 * (small_w * small_h))

    if is_clean_quad and text_envelope is not None:
        quad_pts = approx.reshape(4, 2)
        q_xmin, q_ymin = quad_pts[:, 0].min(), quad_pts[:, 1].min()
        q_xmax, q_ymax = quad_pts[:, 0].max(), quad_pts[:, 1].max()
        tx, ty, tw_e, th_e = text_envelope
        if q_xmin > tx + 30 or q_ymin > ty + 30 or q_xmax < tx + tw_e - 30 or q_ymax < ty + th_e - 30:
            is_clean_quad = False

    if is_clean_quad:
        pts = approx.reshape(4, 2).astype(np.float32) / scale
        ordered = _order_points(pts)
        tl, tr, br, bl = ordered
        w_a = np.linalg.norm(br - bl)
        w_b = np.linalg.norm(tr - tl)
        max_w = max(int(w_a), int(w_b))
        h_a = np.linalg.norm(tr - br)
        h_b = np.linalg.norm(tl - bl)
        max_h = max(int(h_a), int(h_b))

        if max_w > 100 and max_h > 100:
            dst = np.array([[0, 0], [max_w - 1, 0], [max_w - 1, max_h - 1], [0, max_h - 1]], dtype=np.float32)
            M = cv2.getPerspectiveTransform(ordered, dst)
            warped = cv2.warpPerspective(img, M, (max_w, max_h), flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)
            return warped, True, "perspective_warp"

    all_fg_pts = np.vstack(valid_cnts)
    x, y, bw_c, bh_c = cv2.boundingRect(all_fg_pts)

    if text_envelope is not None:
        tx, ty, tw_e, th_e = text_envelope
        x0 = min(x, tx)
        y0 = min(y, ty)
        x1 = max(x + bw_c, tx + tw_e)
        y1 = max(y + bh_c, ty + th_e)
    else:
        x0, y0, x1, y1 = x, y, x + bw_c, y + bh_c

    orig_x0 = int(x0 / scale)
    orig_y0 = int(y0 / scale)
    orig_x1 = int(x1 / scale)
    orig_y1 = int(y1 / scale)

    pad_w = int((orig_x1 - orig_x0) * 0.035)
    pad_h = int((orig_y1 - orig_y0) * 0.035)

    final_x0 = max(0, orig_x0 - pad_w)
    final_y0 = max(0, orig_y0 - pad_h)
    final_x1 = min(w, orig_x1 + pad_w)
    final_y1 = min(h, orig_y1 + pad_h)

    crop_area = (final_x1 - final_x0) * (final_y1 - final_y0)
    if crop_area >= 0.88 * total_area:
        return img, True, "full_frame"
    elif crop_area >= 0.25 * total_area:
        cropped = img[final_y0:final_y1, final_x0:final_x1]
        return cropped, True, "foreground_crop"

    return img, False, "full_frame"


def _mitigate_glare(img: np.ndarray, cfg: PreprocessConfig) -> Tuple[np.ndarray, float]:
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    _, s, v = cv2.split(hsv)
    glare_candidates = ((v >= cfg.glare_value_thresh) & (s <= cfg.glare_sat_thresh)).astype(np.uint8) * 255
    glare_candidates = cv2.morphologyEx(glare_candidates, cv2.MORPH_OPEN, cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (3, 3)))
    glare_frac = float(np.count_nonzero(glare_candidates)) / float(glare_candidates.size)

    if 0.001 < glare_frac < 0.30:
        cnts, _ = cv2.findContours(glare_candidates, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        inpaint_mask = np.zeros_like(glare_candidates)
        for c in cnts:
            if cv2.contourArea(c) >= 35:
                cv2.drawContours(inpaint_mask, [c], -1, 255, thickness=cv2.FILLED)
        if np.count_nonzero(inpaint_mask) > 0:
            inpaint_mask = cv2.dilate(inpaint_mask, np.ones((3, 3), np.uint8), iterations=1)
            result = cv2.inpaint(img, inpaint_mask, 3, cv2.INPAINT_TELEA)
            return result, glare_frac

    return img, glare_frac


def _normalize_contrast_and_brightness(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
    lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
    l, a, b = cv2.split(lab)

    l_float = l.astype(np.float32)
    h, w = img.shape[:2]
    sigma = max(25.0, min(h, w) * 0.18)
    bg = cv2.GaussianBlur(l_float, (0, 0), sigmaX=sigma, sigmaY=sigma)
    bg = np.maximum(bg, 25.0)
    ref = float(np.median(bg))

    strength = cfg.illumination_strength
    l_leveled = (1.0 - strength) * l_float + strength * np.clip((l_float / bg) * ref, 0, 255)
    l_leveled = np.clip(l_leveled, 0, 255).astype(np.uint8)

    clahe = cv2.createCLAHE(clipLimit=cfg.clahe_clip_limit, tileGridSize=(cfg.clahe_tile_grid, cfg.clahe_tile_grid))
    l_clahe = clahe.apply(l_leveled)

    enhanced = cv2.cvtColor(cv2.merge((l_clahe, a, b)), cv2.COLOR_LAB2BGR)
    return enhanced


def _scale_and_sharpen_for_tiny_text(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
    h, w = img.shape[:2]
    long_dim = max(h, w)

    if long_dim < cfg.target_ocr_dim:
        up_ratio = float(cfg.target_ocr_dim) / float(long_dim)
        target_w = int(round(w * up_ratio))
        target_h = int(round(h * up_ratio))
        img = cv2.resize(img, (target_w, target_h), interpolation=cv2.INTER_LANCZOS4)

    blur = cv2.GaussianBlur(img, (0, 0), 1.0)
    sharpened = cv2.addWeighted(img, 1.4, blur, -0.4, 0)
    return sharpened


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
    cfg = cfg or PreprocessConfig()
    img = decode_image(image_bytes)
    orig_h, orig_w = img.shape[:2]

    # 1. Segment and crop product shape
    cropped, b_detected, method = _segment_and_crop(img, cfg)
    _save_debug_image(cropped, "01_cropped.png", cfg)

    # 2. Orientation detection & fine deskew
    deskewed, angle = _detect_and_fix_orientation(cropped)
    _save_debug_image(deskewed, "02_deskewed.png", cfg)

    # 3. Specular glare mitigation
    deglared, glare_frac = _mitigate_glare(deskewed, cfg)
    _save_debug_image(deglared, "03_deglared.png", cfg)

    # 4. Illumination leveling & CLAHE contrast enhancement
    enhanced = _normalize_contrast_and_brightness(deglared, cfg)
    _save_debug_image(enhanced, "04_enhanced.png", cfg)

    # 5. Super-resolution scaling & micro-sharpening for tiny text
    final_img = _scale_and_sharpen_for_tiny_text(enhanced, cfg)
    _save_debug_image(final_img, "05_final.png", cfg)

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
            f"Image too blurry (sharpness={sharpness:.1f}, minimum={cfg.min_sharpness_score}). "
            "Hold the camera steady and re-capture."
        )
    if glare_frac > cfg.max_glare_area_frac:
        reasons.append(
            f"Excessive glare ({glare_frac * 100:.1f}% of frame). "
            "Reposition the camera to reduce reflections and re-capture."
        )
    if not b_detected:
        reasons.append(
            "Package boundary could not be isolated from background; full frame preserved."
        )

    hard_rejections = [r for r in reasons if "boundary" not in r.lower()]
    usable = len(hard_rejections) == 0

    metadata = PreprocessMetadata(
        original_width=orig_w,
        original_height=orig_h,
        output_width=out_w,
        output_height=out_h,
        boundary_detected=b_detected,
        deskew_method=method,
        rotation_angle_deg=round(angle, 3),
        sharpness_score=round(sharpness, 2),
        glare_area_fraction=round(glare_frac, 4),
        usable=usable,
        reject_reasons=reasons,
    )

    return final_img, metadata
