# """
# Stage 2 — Image Preprocessing pipeline for the Legal Metrology compliance system.

# Given a raw package/label photo, this module produces a cleaned, deskewed,
# tightly-cropped image suitable for Stage 3 (PDP/label detection) and
# Stage 4 (OCR), plus a metadata report describing what was done and whether
# the image is usable.

# Pipeline order:
#     1. Decode + basic sanity checks
#     2. Label/package boundary detection -> 4-point perspective warp
#        (this does deskew + crop in a single, robust step; falls back to a
#        simple rotation-only deskew if no clean quadrilateral is found)
#     3. Denoising
#     4. Contrast / brightness normalization (CLAHE)
#     5. Glare / specular-highlight removal (inpainting)
#     6. Resolution / sharpness usability check
# """

# from __future__ import annotations

# import cv2
# import numpy as np
# from dataclasses import dataclass, field, asdict
# from typing import Optional


# # ---------------------------------------------------------------------------
# # Config — tune these thresholds against real field-inspector photos.
# # ---------------------------------------------------------------------------

# @dataclass
# class PreprocessConfig:
#     # Boundary detection
#     resize_width_for_detection: int = 1000     # working width for contour search
#     canny_low: int = 50
#     canny_high: int = 150
#     dilate_kernel: int = 5
#     min_contour_area_frac: float = 0.15         # boundary must cover >=15% of frame
#     approx_poly_epsilon_frac: float = 0.02

#     # Denoising
#     denoise_h: float = 7.0                      # luminance filter strength
#     denoise_h_color: float = 7.0
#     denoise_template_window: int = 7
#     denoise_search_window: int = 21

#     # CLAHE contrast normalization
#     clahe_clip_limit: float = 2.5
#     clahe_tile_grid: int = 8

#     # Glare removal
#     glare_value_thresh: int = 235               # V channel threshold (HSV, 0-255)
#     glare_sat_thresh: int = 60                   # low saturation + high value = specular
#     glare_min_area_px: int = 25                  # ignore tiny speckles
#     inpaint_radius: int = 7

#     # Usability / resolution gate
#     min_output_width: int = 600
#     min_output_height: int = 400
#     min_sharpness_score: float = 60.0            # variance of Laplacian
#     max_glare_area_frac: float = 0.25            # >25% glare => flag for recapture


# @dataclass
# class PreprocessMetadata:
#     original_width: int
#     original_height: int
#     output_width: int
#     output_height: int
#     boundary_detected: bool
#     deskew_method: str                # "perspective_warp" | "rotation_only" | "none"
#     rotation_angle_deg: float
#     sharpness_score: float
#     glare_area_fraction: float
#     usable: bool
#     reject_reasons: list = field(default_factory=list)

#     def to_dict(self) -> dict:
#         return asdict(self)


# class PreprocessingError(Exception):
#     pass


# # ---------------------------------------------------------------------------
# # Step 1: decode
# # ---------------------------------------------------------------------------

# def decode_image(image_bytes: bytes) -> np.ndarray:
#     arr = np.frombuffer(image_bytes, dtype=np.uint8)
#     img = cv2.imdecode(arr, cv2.IMREAD_COLOR)
#     if img is None:
#         raise PreprocessingError("Could not decode image — unsupported format or corrupt file.")
#     return img


# # ---------------------------------------------------------------------------
# # Step 2: boundary detection -> deskew + crop
# # ---------------------------------------------------------------------------

# def _order_points(pts: np.ndarray) -> np.ndarray:
#     """Order 4 points as top-left, top-right, bottom-right, bottom-left."""
#     rect = np.zeros((4, 2), dtype="float32")
#     s = pts.sum(axis=1)
#     rect[0] = pts[np.argmin(s)]   # top-left: smallest sum
#     rect[2] = pts[np.argmax(s)]   # bottom-right: largest sum
#     diff = np.diff(pts, axis=1)
#     rect[1] = pts[np.argmin(diff)]  # top-right: smallest diff
#     rect[3] = pts[np.argmax(diff)]  # bottom-left: largest diff
#     return rect


# def _find_boundary_quad(img: np.ndarray, cfg: PreprocessConfig) -> Optional[np.ndarray]:
#     """Try to find a 4-point contour representing the package/label boundary.
#     Returns points in the ORIGINAL image's coordinate scale, or None."""
#     h, w = img.shape[:2]
#     scale = cfg.resize_width_for_detection / w
#     small = cv2.resize(img, (cfg.resize_width_for_detection, int(h * scale)))

#     gray = cv2.cvtColor(small, cv2.COLOR_BGR2GRAY)
#     gray = cv2.GaussianBlur(gray, (5, 5), 0)
#     edges = cv2.Canny(gray, cfg.canny_low, cfg.canny_high)
#     kernel = np.ones((cfg.dilate_kernel, cfg.dilate_kernel), np.uint8)
#     edges = cv2.dilate(edges, kernel, iterations=1)

#     contours, _ = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
#     if not contours:
#         return None

#     small_area = small.shape[0] * small.shape[1]
#     contours = sorted(contours, key=cv2.contourArea, reverse=True)[:8]

#     for c in contours:
#         area = cv2.contourArea(c)
#         if area < cfg.min_contour_area_frac * small_area:
#             continue
#         peri = cv2.arcLength(c, True)
#         approx = cv2.approxPolyDP(c, cfg.approx_poly_epsilon_frac * peri, True)
#         if len(approx) == 4 and cv2.isContourConvex(approx):
#             pts = approx.reshape(4, 2).astype("float32") / scale  # back to original scale
#             return _order_points(pts)

#     return None


# def _rotation_only_deskew(img: np.ndarray, cfg: PreprocessConfig):
#     """Fallback: estimate a single skew angle via minAreaRect over the
#     largest foreground contour and rotate to correct it (no crop)."""
#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#     thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)[1]
#     coords = cv2.findNonZero(thresh)
#     if coords is None:
#         return img, 0.0

#     angle = cv2.minAreaRect(coords)[-1]
#     # cv2.minAreaRect angle convention varies by version; normalize to [-45, 45]
#     if angle < -45:
#         angle = 90 + angle
#     if abs(angle) < 0.1:
#         return img, 0.0

#     (h, w) = img.shape[:2]
#     center = (w // 2, h // 2)
#     M = cv2.getRotationMatrix2D(center, angle, 1.0)
#     rotated = cv2.warpAffine(img, M, (w, h), flags=cv2.INTER_CUBIC,
#                               borderMode=cv2.BORDER_REPLICATE)
#     return rotated, float(angle)


# def deskew_and_crop(img: np.ndarray, cfg: PreprocessConfig):
#     """Returns (processed_img, boundary_detected, method, angle)."""
#     quad = _find_boundary_quad(img, cfg)
#     if quad is not None:
#         (tl, tr, br, bl) = quad
#         widthA = np.linalg.norm(br - bl)
#         widthB = np.linalg.norm(tr - tl)
#         maxWidth = max(int(widthA), int(widthB))

#         heightA = np.linalg.norm(tr - br)
#         heightB = np.linalg.norm(tl - bl)
#         maxHeight = max(int(heightA), int(heightB))

#         if maxWidth < 10 or maxHeight < 10:
#             rotated, angle = _rotation_only_deskew(img, cfg)
#             return rotated, False, "rotation_only", angle

#         dst = np.array([
#             [0, 0],
#             [maxWidth - 1, 0],
#             [maxWidth - 1, maxHeight - 1],
#             [0, maxHeight - 1]], dtype="float32")

#         M = cv2.getPerspectiveTransform(quad, dst)
#         warped = cv2.warpPerspective(img, M, (maxWidth, maxHeight))
#         return warped, True, "perspective_warp", 0.0

#     rotated, angle = _rotation_only_deskew(img, cfg)
#     return rotated, False, "rotation_only", angle


# # ---------------------------------------------------------------------------
# # Step 3: denoise
# # ---------------------------------------------------------------------------

# def denoise(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
#     return cv2.fastNlMeansDenoisingColored(
#         img, None,
#         h=cfg.denoise_h,
#         hColor=cfg.denoise_h_color,
#         templateWindowSize=cfg.denoise_template_window,
#         searchWindowSize=cfg.denoise_search_window,
#     )


# # ---------------------------------------------------------------------------
# # Step 4: contrast normalization (CLAHE on L channel of LAB)
# # ---------------------------------------------------------------------------

# def normalize_contrast(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
#     lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
#     l, a, b = cv2.split(lab)
#     clahe = cv2.createCLAHE(clipLimit=cfg.clahe_clip_limit,
#                              tileGridSize=(cfg.clahe_tile_grid, cfg.clahe_tile_grid))
#     l2 = clahe.apply(l)
#     merged = cv2.merge((l2, a, b))
#     return cv2.cvtColor(merged, cv2.COLOR_LAB2BGR)


# # ---------------------------------------------------------------------------
# # Step 5: glare removal
# # ---------------------------------------------------------------------------

# def remove_glare(img: np.ndarray, cfg: PreprocessConfig):
#     """Detects specular highlight regions and inpaints them.

#     Glare is a LOCAL brightness outlier — a spot much brighter than its
#     immediate surroundings — which is what the top-hat transform below
#     isolates. But that test alone also fires on small white TEXT on a dark
#     background (e.g. white print on a navy label), which is also a local
#     brightness outlier. Inpainting over text destroys exactly the
#     declarations this system needs to read, which is worse than leaving
#     real glare in place.

#     To tell them apart we use two extra, shape/context-based gates that
#     real specular highlights pass and text does not:

#     1. SHAPE — a highlight is a soft, roughly convex blob. A run of text
#        is a dense cluster of thin, jagged strokes, so its contours have a
#        low "solidity" (contour area / convex-hull area) and are long and
#        thin (large bounding-box aspect ratio relative to their area).
#     2. LOCAL EDGE DENSITY — a highlight sits on an otherwise smooth
#        surface. Text sits inside a neighbourhood packed with other
#        strokes/edges (other characters on the same line). We reject any
#        candidate blob whose surrounding neighbourhood has high edge
#        density, since that's a signature of a text region, not a clean
#        glossy surface.

#     Only candidates that are bright local outliers AND blob-shaped AND
#     NOT sitting inside a text-dense neighbourhood are treated as glare.
#     """
#     hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
#     h, s, v = cv2.split(hsv)

#     # Kernel must be larger than the widest glare blob we expect to catch —
#     # opening only erases features SMALLER than the kernel, so a kernel that's
#     # too small (tuned to character-stroke scale) lets broad diffuse glare
#     # blend into the "baseline" and escape detection entirely, while still
#     # flagging small text strokes as outliers. Scale to a fraction of the
#     # shorter image dimension instead of a stroke-scale constant.
#     k = max(51, min(v.shape[:2]) // 6)
#     if k % 2 == 0:
#         k += 1
#     kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (k, k))
#     local_baseline = cv2.morphologyEx(v, cv2.MORPH_OPEN, kernel)
#     top_hat = cv2.subtract(v, local_baseline)  # how much brighter than local surroundings

#     candidate_mask = (
#         (v >= cfg.glare_value_thresh)
#         & (s <= cfg.glare_sat_thresh)
#         & (top_hat >= 30)
#     ).astype(np.uint8) * 255

#     # Local edge/text density map: blur a binary edge map over a
#     # character-scale window so each pixel carries "how much stroke
#     # activity is near me" — high in text blocks, low on clean surfaces.
#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#     edges = cv2.Canny(gray, 40, 120)
#     text_density = cv2.boxFilter(edges.astype(np.float32) / 255.0, ddepth=-1, ksize=(25, 25))

#     contours, _ = cv2.findContours(candidate_mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
#     clean_mask = np.zeros_like(candidate_mask)
#     for c in contours:
#         area = cv2.contourArea(c)
#         if area < cfg.glare_min_area_px:
#             continue

#         hull = cv2.convexHull(c)
#         hull_area = cv2.contourArea(hull)
#         solidity = area / hull_area if hull_area > 0 else 0
#         x, y, bw, bh = cv2.boundingRect(c)
#         aspect = max(bw, bh) / max(1, min(bw, bh))

#         if solidity < 0.55 or aspect > 6:
#             continue  # too jagged / stroke-like to be a smooth highlight

#         # sample local text density under this blob's bounding box
#         region_density = text_density[y:y + bh, x:x + bw]
#         if region_density.size and float(region_density.mean()) > 0.06:
#             continue  # sitting inside a text-dense neighbourhood — skip

#         cv2.drawContours(clean_mask, [c], -1, 255, thickness=cv2.FILLED)

#     glare_area_frac = float(np.count_nonzero(clean_mask)) / float(clean_mask.size)

#     if glare_area_frac == 0:
#         return img, 0.0

#     clean_mask = cv2.dilate(clean_mask, np.ones((3, 3), np.uint8), iterations=1)
#     result = cv2.inpaint(img, clean_mask, cfg.inpaint_radius, cv2.INPAINT_TELEA)
#     return result, glare_area_frac


# # ---------------------------------------------------------------------------
# # Step 6: usability check
# # ---------------------------------------------------------------------------

# def sharpness_score(img: np.ndarray) -> float:
#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#     return float(cv2.Laplacian(gray, cv2.CV_64F).var())


# # ---------------------------------------------------------------------------
# # Orchestration
# # ---------------------------------------------------------------------------

# def preprocess(image_bytes: bytes, cfg: Optional[PreprocessConfig] = None):
#     """Runs the full Stage 2 pipeline.

#     Returns (output_bgr_image: np.ndarray, metadata: PreprocessMetadata).
#     """
#     cfg = cfg or PreprocessConfig()

#     img = decode_image(image_bytes)
#     orig_h, orig_w = img.shape[:2]

#     warped, boundary_detected, method, angle = deskew_and_crop(img, cfg)
#     denoised = denoise(warped, cfg)
#     contrast_fixed = normalize_contrast(denoised, cfg)
#     deglared, glare_frac = remove_glare(contrast_fixed, cfg)

#     out_h, out_w = deglared.shape[:2]
#     sharpness = sharpness_score(deglared)

#     reasons = []
#     if out_w < cfg.min_output_width or out_h < cfg.min_output_height:
#         reasons.append(
#             f"Resolution too low ({out_w}x{out_h}); minimum is "
#             f"{cfg.min_output_width}x{cfg.min_output_height}. Re-capture closer to the label."
#         )
#     if sharpness < cfg.min_sharpness_score:
#         reasons.append(
#             f"Image too blurry (sharpness={sharpness:.1f}, minimum={cfg.min_sharpness_score}). "
#             "Hold the camera steady and re-capture."
#         )
#     if glare_frac > cfg.max_glare_area_frac:
#         reasons.append(
#             f"Excessive glare ({glare_frac * 100:.1f}% of frame). Reposition to avoid reflections "
#             "and re-capture."
#         )
#     if not boundary_detected:
#         reasons.append(
#             "Package/label boundary could not be confidently detected; only rotation-based "
#             "deskew was applied. Consider re-capturing with the full label in frame against a "
#             "contrasting background."
#         )

#     metadata = PreprocessMetadata(
#         original_width=orig_w,
#         original_height=orig_h,
#         output_width=out_w,
#         output_height=out_h,
#         boundary_detected=boundary_detected,
#         deskew_method=method,
#         rotation_angle_deg=round(angle, 3),
#         sharpness_score=round(sharpness, 2),
#         glare_area_fraction=round(glare_frac, 4),
#         usable=len([r for r in reasons if "boundary" not in r]) == 0,
#         reject_reasons=reasons,
#     )

#     return deglared, metadata
"""
Stage 2 — Image Preprocessing pipeline for the Legal Metrology compliance system.

Given a raw package/label photo, this module produces a cleaned, deskewed,
tightly-cropped image suitable for Stage 3 (PDP/label detection) and
Stage 4 (OCR), plus a metadata report describing what was done and whether
the image is usable.

Pipeline order:

    1. Decode + basic sanity checks
    2. Label/package boundary detection -> 4-point perspective warp
       (does deskew + crop in a single robust step; falls back to a
       simple rotation-only deskew if no clean quadrilateral is found)
    3. Mild denoising
    4. Glare / specular-highlight removal
    5. Mild contrast / brightness normalization (CLAHE)
    6. Resolution / sharpness usability check

Important:
    The pipeline intentionally avoids aggressive enhancement.

    The objective is to preserve the original printed text and package
    appearance rather than making the image visually "sharper" or
    artificially increasing character thickness.
"""

from __future__ import annotations

import cv2
import numpy as np

from dataclasses import dataclass, field, asdict
from typing import Optional


# ---------------------------------------------------------------------------
# Config
# ---------------------------------------------------------------------------

@dataclass
class PreprocessConfig:

    # -----------------------------------------------------------------------
    # Boundary detection
    # -----------------------------------------------------------------------

    resize_width_for_detection: int = 1000

    canny_low: int = 50
    canny_high: int = 150

    dilate_kernel: int = 5

    # Boundary must cover at least 15% of the frame
    min_contour_area_frac: float = 0.15

    # Approximation tolerance for quadrilateral detection
    approx_poly_epsilon_frac: float = 0.02


    # -----------------------------------------------------------------------
    # Mild denoising
    #
    # Lower values are intentional.
    # Aggressive denoising can make printed characters look unnaturally
    # smooth / bold after subsequent contrast enhancement.
    # -----------------------------------------------------------------------

    denoise_h: float = 3.0
    denoise_h_color: float = 3.0

    denoise_template_window: int = 7
    denoise_search_window: int = 21


    # -----------------------------------------------------------------------
    # Mild CLAHE contrast normalization
    #
    # CLAHE is deliberately weak.
    #
    # It is applied AFTER glare removal so that reflections are not
    # amplified before the glare detector sees them.
    # -----------------------------------------------------------------------

    clahe_clip_limit: float = 1.2
    clahe_tile_grid: int = 8


    # -----------------------------------------------------------------------
    # Conservative glare removal
    #
    # High value + low saturation identifies potential specular highlights.
    #
    # The threshold is deliberately high so normal white printed text
    # is not automatically considered glare.
    # -----------------------------------------------------------------------

    glare_value_thresh: int = 242

    # Low saturation + high brightness
    glare_sat_thresh: int = 55

    # Ignore very small bright regions
    glare_min_area_px: int = 40

    # Smaller radius avoids excessive artificial reconstruction
    inpaint_radius: int = 3


    # -----------------------------------------------------------------------
    # Usability / resolution gate
    # -----------------------------------------------------------------------

    min_output_width: int = 600
    min_output_height: int = 400

    # Variance of Laplacian
    min_sharpness_score: float = 60.0

    # If more than 25% of the image is identified as glare,
    # request a recapture.
    max_glare_area_frac: float = 0.25


# ---------------------------------------------------------------------------
# Metadata
# ---------------------------------------------------------------------------

@dataclass
class PreprocessMetadata:

    original_width: int
    original_height: int

    output_width: int
    output_height: int

    boundary_detected: bool

    # "perspective_warp" | "rotation_only" | "none"
    deskew_method: str

    rotation_angle_deg: float

    sharpness_score: float

    glare_area_fraction: float

    usable: bool

    reject_reasons: list = field(default_factory=list)

    def to_dict(self) -> dict:
        return asdict(self)


# ---------------------------------------------------------------------------
# Exceptions
# ---------------------------------------------------------------------------

class PreprocessingError(Exception):
    pass


# ---------------------------------------------------------------------------
# Step 1: Decode
# ---------------------------------------------------------------------------

def decode_image(image_bytes: bytes) -> np.ndarray:
    """
    Decode image bytes into an OpenCV BGR image.
    """

    if not image_bytes:
        raise PreprocessingError(
            "Image data is empty."
        )

    arr = np.frombuffer(
        image_bytes,
        dtype=np.uint8
    )

    img = cv2.imdecode(
        arr,
        cv2.IMREAD_COLOR
    )

    if img is None:
        raise PreprocessingError(
            "Could not decode image — unsupported format or corrupt file."
        )

    return img


# ---------------------------------------------------------------------------
# Step 2: Boundary detection -> deskew + crop
# ---------------------------------------------------------------------------

def _order_points(pts: np.ndarray) -> np.ndarray:
    """
    Order four points as:

        top-left
        top-right
        bottom-right
        bottom-left
    """

    rect = np.zeros(
        (4, 2),
        dtype="float32"
    )

    # Sum of coordinates
    # Smallest -> top-left
    # Largest  -> bottom-right

    s = pts.sum(axis=1)

    rect[0] = pts[np.argmin(s)]
    rect[2] = pts[np.argmax(s)]

    # Difference between x and y
    #
    # Smallest -> top-right
    # Largest  -> bottom-left

    diff = np.diff(
        pts,
        axis=1
    )

    rect[1] = pts[np.argmin(diff)]
    rect[3] = pts[np.argmax(diff)]

    return rect


def _find_boundary_quad(
    img: np.ndarray,
    cfg: PreprocessConfig
) -> Optional[np.ndarray]:
    """
    Try to find a 4-point contour representing the package/label boundary.

    Returns:
        Four points in ORIGINAL image coordinates,
        ordered TL, TR, BR, BL.

        Returns None if no suitable quadrilateral is found.
    """

    h, w = img.shape[:2]

    # Avoid invalid scaling
    if w <= 0 or h <= 0:
        return None

    scale = cfg.resize_width_for_detection / float(w)

    small_width = cfg.resize_width_for_detection
    small_height = max(
        1,
        int(h * scale)
    )

    small = cv2.resize(
        img,
        (small_width, small_height),
        interpolation=cv2.INTER_AREA
    )

    # -----------------------------------------------------------------------
    # Convert to grayscale
    # -----------------------------------------------------------------------

    gray = cv2.cvtColor(
        small,
        cv2.COLOR_BGR2GRAY
    )

    # Mild blur before edge detection
    gray = cv2.GaussianBlur(
        gray,
        (5, 5),
        0
    )

    # -----------------------------------------------------------------------
    # Edge detection
    # -----------------------------------------------------------------------

    edges = cv2.Canny(
        gray,
        cfg.canny_low,
        cfg.canny_high
    )

    # Connect broken boundary edges
    kernel = np.ones(
        (
            cfg.dilate_kernel,
            cfg.dilate_kernel
        ),
        np.uint8
    )

    edges = cv2.dilate(
        edges,
        kernel,
        iterations=1
    )

    # -----------------------------------------------------------------------
    # Find contours
    # -----------------------------------------------------------------------

    contours, _ = cv2.findContours(
        edges,
        cv2.RETR_LIST,
        cv2.CHAIN_APPROX_SIMPLE
    )

    if not contours:
        return None

    small_area = (
        small.shape[0] *
        small.shape[1]
    )

    # Only inspect largest contours
    contours = sorted(
        contours,
        key=cv2.contourArea,
        reverse=True
    )[:8]

    # -----------------------------------------------------------------------
    # Search for quadrilateral
    # -----------------------------------------------------------------------

    for c in contours:

        area = cv2.contourArea(c)

        # Ignore tiny contours
        if area < cfg.min_contour_area_frac * small_area:
            continue

        perimeter = cv2.arcLength(
            c,
            True
        )

        approx = cv2.approxPolyDP(
            c,
            cfg.approx_poly_epsilon_frac * perimeter,
            True
        )

        if (
            len(approx) == 4
            and cv2.isContourConvex(approx)
        ):

            pts = (
                approx
                .reshape(4, 2)
                .astype("float32")
                / scale
            )

            return _order_points(pts)

    return None


def _rotation_only_deskew(
    img: np.ndarray,
    cfg: PreprocessConfig
):
    """
    Fallback deskew method.

    Estimates a single skew angle using minAreaRect over the foreground
    and rotates the image.

    No crop is performed here.
    """

    gray = cv2.cvtColor(
        img,
        cv2.COLOR_BGR2GRAY
    )

    # Binary foreground
    thresh = cv2.threshold(
        gray,
        0,
        255,
        cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU
    )[1]

    coords = cv2.findNonZero(
        thresh
    )

    if coords is None:
        return img, 0.0

    angle = cv2.minAreaRect(
        coords
    )[-1]

    # Normalize OpenCV's angle convention
    if angle < -45:
        angle = 90 + angle

    # Don't rotate if effectively straight
    if abs(angle) < 0.1:
        return img, 0.0

    h, w = img.shape[:2]

    center = (
        w // 2,
        h // 2
    )

    M = cv2.getRotationMatrix2D(
        center,
        angle,
        1.0
    )

    rotated = cv2.warpAffine(
        img,
        M,
        (w, h),
        flags=cv2.INTER_CUBIC,
        borderMode=cv2.BORDER_REPLICATE
    )

    return rotated, float(angle)


def deskew_and_crop(
    img: np.ndarray,
    cfg: PreprocessConfig
):
    """
    Perform:

        boundary detection
        +
        perspective correction
        +
        crop

    Returns:

        processed_img,
        boundary_detected,
        deskew_method,
        angle
    """

    quad = _find_boundary_quad(
        img,
        cfg
    )

    # -----------------------------------------------------------------------
    # Preferred method: perspective warp
    # -----------------------------------------------------------------------

    if quad is not None:

        (
            tl,
            tr,
            br,
            bl
        ) = quad

        # Width
        width_a = np.linalg.norm(
            br - bl
        )

        width_b = np.linalg.norm(
            tr - tl
        )

        max_width = max(
            int(width_a),
            int(width_b)
        )

        # Height
        height_a = np.linalg.norm(
            tr - br
        )

        height_b = np.linalg.norm(
            tl - bl
        )

        max_height = max(
            int(height_a),
            int(height_b)
        )

        # Sanity check
        if (
            max_width < 10
            or max_height < 10
        ):
            rotated, angle = _rotation_only_deskew(
                img,
                cfg
            )

            return (
                rotated,
                False,
                "rotation_only",
                angle
            )

        # -------------------------------------------------------------------
        # Destination rectangle
        # -------------------------------------------------------------------

        dst = np.array(
            [
                [0, 0],
                [max_width - 1, 0],
                [max_width - 1, max_height - 1],
                [0, max_height - 1]
            ],
            dtype="float32"
        )

        # -------------------------------------------------------------------
        # Perspective transform
        # -------------------------------------------------------------------

        M = cv2.getPerspectiveTransform(
            quad,
            dst
        )

        warped = cv2.warpPerspective(
            img,
            M,
            (
                max_width,
                max_height
            ),
            flags=cv2.INTER_CUBIC,
            borderMode=cv2.BORDER_REPLICATE
        )

        return (
            warped,
            True,
            "perspective_warp",
            0.0
        )

    # -----------------------------------------------------------------------
    # Fallback
    # -----------------------------------------------------------------------

    rotated, angle = _rotation_only_deskew(
        img,
        cfg
    )

    return (
        rotated,
        False,
        "rotation_only",
        angle
    )


# ---------------------------------------------------------------------------
# Step 3: Mild denoising
# ---------------------------------------------------------------------------

def denoise(
    img: np.ndarray,
    cfg: PreprocessConfig
) -> np.ndarray:
    """
    Apply conservative non-local means denoising.

    The parameters are intentionally mild to preserve printed character
    geometry and avoid making text appear unnaturally thick.
    """

    return cv2.fastNlMeansDenoisingColored(
        img,
        None,
        h=cfg.denoise_h,
        hColor=cfg.denoise_h_color,
        templateWindowSize=cfg.denoise_template_window,
        searchWindowSize=cfg.denoise_search_window
    )


# ---------------------------------------------------------------------------
# Step 4: Glare removal
# ---------------------------------------------------------------------------

def remove_glare(
    img: np.ndarray,
    cfg: PreprocessConfig
):
    """
    Detect and remove strong specular highlights.

    Important design principle:

        Do NOT treat every bright white region as glare.

    White printed text on dark packaging is also bright and can therefore
    look like a glare candidate.

    To protect text, a candidate must satisfy several conditions:

        1. High brightness
        2. Low saturation
        3. Strong local brightness difference
        4. Blob-like geometry
        5. Not located inside a text-dense neighbourhood

    Only candidates satisfying these conditions are inpainted.

    Returns:

        result_image,
        glare_area_fraction
    """

    # -----------------------------------------------------------------------
    # HSV representation
    # -----------------------------------------------------------------------

    hsv = cv2.cvtColor(
        img,
        cv2.COLOR_BGR2HSV
    )

    h, s, v = cv2.split(
        hsv
    )

    # -----------------------------------------------------------------------
    # Local brightness baseline
    #
    # Morphological opening estimates the broad local background.
    #
    # The kernel is intentionally large enough to detect broad reflections,
    # rather than character-sized features.
    # -----------------------------------------------------------------------

    min_dimension = min(
        v.shape[:2]
    )

    k = max(
        51,
        min_dimension // 6
    )

    # Kernel size must be odd
    if k % 2 == 0:
        k += 1

    kernel = cv2.getStructuringElement(
        cv2.MORPH_ELLIPSE,
        (k, k)
    )

    local_baseline = cv2.morphologyEx(
        v,
        cv2.MORPH_OPEN,
        kernel
    )

    # Difference from local surroundings
    top_hat = cv2.subtract(
        v,
        local_baseline
    )

    # -----------------------------------------------------------------------
    # Initial glare candidate mask
    # -----------------------------------------------------------------------

    candidate_mask = (
        (v >= cfg.glare_value_thresh)
        &
        (s <= cfg.glare_sat_thresh)
        &
        (top_hat >= 30)
    ).astype(
        np.uint8
    ) * 255

    # -----------------------------------------------------------------------
    # Text density estimation
    #
    # White text produces many nearby edges.
    #
    # A broad smooth reflection generally produces much lower local edge
    # density.
    # -----------------------------------------------------------------------

    gray = cv2.cvtColor(
        img,
        cv2.COLOR_BGR2GRAY
    )

    edges = cv2.Canny(
        gray,
        40,
        120
    )

    text_density = cv2.boxFilter(
        edges.astype(np.float32) / 255.0,
        ddepth=-1,
        ksize=(25, 25)
    )

    # -----------------------------------------------------------------------
    # Inspect glare candidates
    # -----------------------------------------------------------------------

    contours, _ = cv2.findContours(
        candidate_mask,
        cv2.RETR_EXTERNAL,
        cv2.CHAIN_APPROX_SIMPLE
    )

    clean_mask = np.zeros_like(
        candidate_mask
    )

    for c in contours:

        area = cv2.contourArea(
            c
        )

        # Ignore tiny bright speckles
        if area < cfg.glare_min_area_px:
            continue

        # -------------------------------------------------------------------
        # Shape analysis
        # -------------------------------------------------------------------

        hull = cv2.convexHull(
            c
        )

        hull_area = cv2.contourArea(
            hull
        )

        if hull_area <= 0:
            continue

        solidity = (
            area /
            hull_area
        )

        x, y, bw, bh = cv2.boundingRect(
            c
        )

        aspect = (
            max(bw, bh) /
            max(
                1,
                min(bw, bh)
            )
        )

        # -------------------------------------------------------------------
        # Text protection
        #
        # Text strokes are generally:
        #
        #   - jagged
        #   - fragmented
        #   - elongated
        #
        # A broad reflection is generally:
        #
        #   - smoother
        #   - more compact
        #   - more convex
        # -------------------------------------------------------------------

        if solidity < 0.55:
            continue

        if aspect > 6:
            continue

        # -------------------------------------------------------------------
        # Local text density
        # -------------------------------------------------------------------

        region_density = text_density[
            y:y + bh,
            x:x + bw
        ]

        if (
            region_density.size
            and float(region_density.mean()) > 0.08
        ):
            # This region contains too many nearby edges.
            #
            # Treat it as likely text rather than glare.
            continue

        # -------------------------------------------------------------------
        # Candidate passed all filters
        # -------------------------------------------------------------------

        cv2.drawContours(
            clean_mask,
            [c],
            -1,
            255,
            thickness=cv2.FILLED
        )

    # -----------------------------------------------------------------------
    # Calculate glare fraction BEFORE dilation
    # -----------------------------------------------------------------------

    glare_area_frac = (
        float(
            np.count_nonzero(
                clean_mask
            )
        )
        /
        float(
            clean_mask.size
        )
    )

    # No glare detected
    if glare_area_frac == 0:
        return (
            img,
            0.0
        )

    # -----------------------------------------------------------------------
    # Slight mask expansion
    #
    # Only 3x3 is used to avoid destroying surrounding text.
    # -----------------------------------------------------------------------

    mask_kernel = np.ones(
        (3, 3),
        np.uint8
    )

    clean_mask = cv2.dilate(
        clean_mask,
        mask_kernel,
        iterations=1
    )

    # -----------------------------------------------------------------------
    # Inpaint
    # -----------------------------------------------------------------------

    result = cv2.inpaint(
        img,
        clean_mask,
        cfg.inpaint_radius,
        cv2.INPAINT_TELEA
    )

    return (
        result,
        glare_area_frac
    )


# ---------------------------------------------------------------------------
# Step 5: Mild contrast normalization
# ---------------------------------------------------------------------------

def normalize_contrast(
    img: np.ndarray,
    cfg: PreprocessConfig
) -> np.ndarray:
    """
    Apply mild CLAHE to the L channel of LAB.

    CLAHE is deliberately weak.

    It is performed AFTER glare removal so that specular highlights are not
    amplified before glare detection.
    """

    lab = cv2.cvtColor(
        img,
        cv2.COLOR_BGR2LAB
    )

    l, a, b = cv2.split(
        lab
    )

    clahe = cv2.createCLAHE(
        clipLimit=cfg.clahe_clip_limit,
        tileGridSize=(
            cfg.clahe_tile_grid,
            cfg.clahe_tile_grid
        )
    )

    l2 = clahe.apply(
        l
    )

    merged = cv2.merge(
        (
            l2,
            a,
            b
        )
    )

    return cv2.cvtColor(
        merged,
        cv2.COLOR_LAB2BGR
    )


# ---------------------------------------------------------------------------
# Step 6: Sharpness
# ---------------------------------------------------------------------------

def sharpness_score(
    img: np.ndarray
) -> float:
    """
    Calculate image sharpness using variance of Laplacian.
    """

    gray = cv2.cvtColor(
        img,
        cv2.COLOR_BGR2GRAY
    )

    return float(
        cv2.Laplacian(
            gray,
            cv2.CV_64F
        ).var()
    )


# ---------------------------------------------------------------------------
# Step 7: Full preprocessing pipeline
# ---------------------------------------------------------------------------

def preprocess(
    image_bytes: bytes,
    cfg: Optional[PreprocessConfig] = None
):
    """
    Run the complete Stage 2 preprocessing pipeline.

    Pipeline:

        Raw bytes
            ↓
        Decode
            ↓
        Boundary detection
            ↓
        Perspective correction / deskew
            ↓
        Mild denoising
            ↓
        Glare removal
            ↓
        Mild CLAHE
            ↓
        Quality checks

    Returns:

        (
            output_bgr_image,
            metadata
        )

    where:

        output_bgr_image -> np.ndarray
        metadata         -> PreprocessMetadata
    """

    cfg = cfg or PreprocessConfig()

    # -----------------------------------------------------------------------
    # 1. Decode
    # -----------------------------------------------------------------------

    img = decode_image(
        image_bytes
    )

    orig_h, orig_w = img.shape[:2]

    # -----------------------------------------------------------------------
    # 2. Boundary detection + perspective correction
    # -----------------------------------------------------------------------

    warped, boundary_detected, method, angle = deskew_and_crop(
        img,
        cfg
    )

    # -----------------------------------------------------------------------
    # 3. Mild denoising
    # -----------------------------------------------------------------------

    denoised = denoise(
        warped,
        cfg
    )

    # -----------------------------------------------------------------------
    # 4. Glare removal
    #
    # IMPORTANT:
    #
    # Glare removal happens BEFORE CLAHE.
    #
    # This prevents CLAHE from amplifying reflections before they are
    # detected.
    # -----------------------------------------------------------------------

    deglared, glare_frac = remove_glare(
        denoised,
        cfg
    )

    # -----------------------------------------------------------------------
    # 5. Mild contrast normalization
    # -----------------------------------------------------------------------

    contrast_fixed = normalize_contrast(
        deglared,
        cfg
    )

    # -----------------------------------------------------------------------
    # 6. Output dimensions
    # -----------------------------------------------------------------------

    out_h, out_w = contrast_fixed.shape[:2]

    # -----------------------------------------------------------------------
    # 7. Sharpness
    # -----------------------------------------------------------------------

    sharpness = sharpness_score(
        contrast_fixed
    )

    # -----------------------------------------------------------------------
    # 8. Quality / usability checks
    # -----------------------------------------------------------------------

    reasons = []

    # -----------------------------------------------------------------------
    # Resolution
    # -----------------------------------------------------------------------

    if (
        out_w < cfg.min_output_width
        or
        out_h < cfg.min_output_height
    ):

        reasons.append(
            f"Resolution too low ({out_w}x{out_h}); "
            f"minimum is "
            f"{cfg.min_output_width}x"
            f"{cfg.min_output_height}. "
            f"Re-capture closer to the label."
        )

    # -----------------------------------------------------------------------
    # Sharpness
    # -----------------------------------------------------------------------

    if sharpness < cfg.min_sharpness_score:

        reasons.append(
            f"Image too blurry "
            f"(sharpness={sharpness:.1f}, "
            f"minimum={cfg.min_sharpness_score}). "
            f"Hold the camera steady and re-capture."
        )

    # -----------------------------------------------------------------------
    # Excessive glare
    # -----------------------------------------------------------------------

    if glare_frac > cfg.max_glare_area_frac:

        reasons.append(
            f"Excessive glare "
            f"({glare_frac * 100:.1f}% of frame). "
            f"Reposition to avoid reflections and re-capture."
        )

    # -----------------------------------------------------------------------
    # Boundary detection
    # -----------------------------------------------------------------------

    if not boundary_detected:

        reasons.append(
            "Package/label boundary could not be confidently detected; "
            "only rotation-based deskew was applied. "
            "Consider re-capturing with the full label in frame against "
            "a contrasting background."
        )

    # -----------------------------------------------------------------------
    # Usability
    #
    # Boundary failure is currently a warning rather than a hard rejection.
    # Resolution, blur and excessive glare are hard rejection conditions.
    # -----------------------------------------------------------------------

    usable = len([
        r
        for r in reasons
        if "boundary" not in r
    ]) == 0

    # -----------------------------------------------------------------------
    # Metadata
    # -----------------------------------------------------------------------

    metadata = PreprocessMetadata(

        original_width=orig_w,

        original_height=orig_h,

        output_width=out_w,

        output_height=out_h,

        boundary_detected=boundary_detected,

        deskew_method=method,

        rotation_angle_deg=round(
            angle,
            3
        ),

        sharpness_score=round(
            sharpness,
            2
        ),

        glare_area_fraction=round(
            glare_frac,
            4
        ),

        usable=usable,

        reject_reasons=reasons
    )

    # -----------------------------------------------------------------------
    # Final output
    # -----------------------------------------------------------------------

    return (
        contrast_fixed,
        metadata
    )