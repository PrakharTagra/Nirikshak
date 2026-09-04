# # # # """
# # # # Stage 2 — Image Preprocessing pipeline for the Legal Metrology compliance system.

# # # # Given a raw package/label photo, this module produces a cleaned, deskewed,
# # # # tightly-cropped image suitable for Stage 3 (PDP/label detection) and
# # # # Stage 4 (OCR), plus a metadata report describing what was done and whether
# # # # the image is usable.

# # # # Pipeline order:
# # # #     1. Decode + basic sanity checks
# # # #     2. Label/package boundary detection -> 4-point perspective warp
# # # #        (this does deskew + crop in a single, robust step; falls back to a
# # # #        simple rotation-only deskew if no clean quadrilateral is found)
# # # #     3. Denoising
# # # #     4. Contrast / brightness normalization (CLAHE)
# # # #     5. Glare / specular-highlight removal (inpainting)
# # # #     6. Resolution / sharpness usability check
# # # # """

# # # # from __future__ import annotations

# # # # import cv2
# # # # import numpy as np
# # # # from dataclasses import dataclass, field, asdict
# # # # from typing import Optional


# # # # # ---------------------------------------------------------------------------
# # # # # Config — tune these thresholds against real field-inspector photos.
# # # # # ---------------------------------------------------------------------------

# # # # @dataclass
# # # # class PreprocessConfig:
# # # #     # Boundary detection
# # # #     resize_width_for_detection: int = 1000     # working width for contour search
# # # #     canny_low: int = 50
# # # #     canny_high: int = 150
# # # #     dilate_kernel: int = 5
# # # #     min_contour_area_frac: float = 0.15         # boundary must cover >=15% of frame
# # # #     approx_poly_epsilon_frac: float = 0.02

# # # #     # Denoising
# # # #     denoise_h: float = 7.0                      # luminance filter strength
# # # #     denoise_h_color: float = 7.0
# # # #     denoise_template_window: int = 7
# # # #     denoise_search_window: int = 21

# # # #     # CLAHE contrast normalization
# # # #     clahe_clip_limit: float = 2.5
# # # #     clahe_tile_grid: int = 8

# # # #     # Glare removal
# # # #     glare_value_thresh: int = 235               # V channel threshold (HSV, 0-255)
# # # #     glare_sat_thresh: int = 60                   # low saturation + high value = specular
# # # #     glare_min_area_px: int = 25                  # ignore tiny speckles
# # # #     inpaint_radius: int = 7

# # # #     # Usability / resolution gate
# # # #     min_output_width: int = 600
# # # #     min_output_height: int = 400
# # # #     min_sharpness_score: float = 60.0            # variance of Laplacian
# # # #     max_glare_area_frac: float = 0.25            # >25% glare => flag for recapture


# # # # @dataclass
# # # # class PreprocessMetadata:
# # # #     original_width: int
# # # #     original_height: int
# # # #     output_width: int
# # # #     output_height: int
# # # #     boundary_detected: bool
# # # #     deskew_method: str                # "perspective_warp" | "rotation_only" | "none"
# # # #     rotation_angle_deg: float
# # # #     sharpness_score: float
# # # #     glare_area_fraction: float
# # # #     usable: bool
# # # #     reject_reasons: list = field(default_factory=list)

# # # #     def to_dict(self) -> dict:
# # # #         return asdict(self)


# # # # class PreprocessingError(Exception):
# # # #     pass


# # # # # ---------------------------------------------------------------------------
# # # # # Step 1: decode
# # # # # ---------------------------------------------------------------------------

# # # # def decode_image(image_bytes: bytes) -> np.ndarray:
# # # #     arr = np.frombuffer(image_bytes, dtype=np.uint8)
# # # #     img = cv2.imdecode(arr, cv2.IMREAD_COLOR)
# # # #     if img is None:
# # # #         raise PreprocessingError("Could not decode image — unsupported format or corrupt file.")
# # # #     return img


# # # # # ---------------------------------------------------------------------------
# # # # # Step 2: boundary detection -> deskew + crop
# # # # # ---------------------------------------------------------------------------

# # # # def _order_points(pts: np.ndarray) -> np.ndarray:
# # # #     """Order 4 points as top-left, top-right, bottom-right, bottom-left."""
# # # #     rect = np.zeros((4, 2), dtype="float32")
# # # #     s = pts.sum(axis=1)
# # # #     rect[0] = pts[np.argmin(s)]   # top-left: smallest sum
# # # #     rect[2] = pts[np.argmax(s)]   # bottom-right: largest sum
# # # #     diff = np.diff(pts, axis=1)
# # # #     rect[1] = pts[np.argmin(diff)]  # top-right: smallest diff
# # # #     rect[3] = pts[np.argmax(diff)]  # bottom-left: largest diff
# # # #     return rect


# # # # def _find_boundary_quad(img: np.ndarray, cfg: PreprocessConfig) -> Optional[np.ndarray]:
# # # #     """Try to find a 4-point contour representing the package/label boundary.
# # # #     Returns points in the ORIGINAL image's coordinate scale, or None."""
# # # #     h, w = img.shape[:2]
# # # #     scale = cfg.resize_width_for_detection / w
# # # #     small = cv2.resize(img, (cfg.resize_width_for_detection, int(h * scale)))

# # # #     gray = cv2.cvtColor(small, cv2.COLOR_BGR2GRAY)
# # # #     gray = cv2.GaussianBlur(gray, (5, 5), 0)
# # # #     edges = cv2.Canny(gray, cfg.canny_low, cfg.canny_high)
# # # #     kernel = np.ones((cfg.dilate_kernel, cfg.dilate_kernel), np.uint8)
# # # #     edges = cv2.dilate(edges, kernel, iterations=1)

# # # #     contours, _ = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
# # # #     if not contours:
# # # #         return None

# # # #     small_area = small.shape[0] * small.shape[1]
# # # #     contours = sorted(contours, key=cv2.contourArea, reverse=True)[:8]

# # # #     for c in contours:
# # # #         area = cv2.contourArea(c)
# # # #         if area < cfg.min_contour_area_frac * small_area:
# # # #             continue
# # # #         peri = cv2.arcLength(c, True)
# # # #         approx = cv2.approxPolyDP(c, cfg.approx_poly_epsilon_frac * peri, True)
# # # #         if len(approx) == 4 and cv2.isContourConvex(approx):
# # # #             pts = approx.reshape(4, 2).astype("float32") / scale  # back to original scale
# # # #             return _order_points(pts)

# # # #     return None


# # # # def _rotation_only_deskew(img: np.ndarray, cfg: PreprocessConfig):
# # # #     """Fallback: estimate a single skew angle via minAreaRect over the
# # # #     largest foreground contour and rotate to correct it (no crop)."""
# # # #     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# # # #     thresh = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)[1]
# # # #     coords = cv2.findNonZero(thresh)
# # # #     if coords is None:
# # # #         return img, 0.0

# # # #     angle = cv2.minAreaRect(coords)[-1]
# # # #     # cv2.minAreaRect angle convention varies by version; normalize to [-45, 45]
# # # #     if angle < -45:
# # # #         angle = 90 + angle
# # # #     if abs(angle) < 0.1:
# # # #         return img, 0.0

# # # #     (h, w) = img.shape[:2]
# # # #     center = (w // 2, h // 2)
# # # #     M = cv2.getRotationMatrix2D(center, angle, 1.0)
# # # #     rotated = cv2.warpAffine(img, M, (w, h), flags=cv2.INTER_CUBIC,
# # # #                               borderMode=cv2.BORDER_REPLICATE)
# # # #     return rotated, float(angle)


# # # # def deskew_and_crop(img: np.ndarray, cfg: PreprocessConfig):
# # # #     """Returns (processed_img, boundary_detected, method, angle)."""
# # # #     quad = _find_boundary_quad(img, cfg)
# # # #     if quad is not None:
# # # #         (tl, tr, br, bl) = quad
# # # #         widthA = np.linalg.norm(br - bl)
# # # #         widthB = np.linalg.norm(tr - tl)
# # # #         maxWidth = max(int(widthA), int(widthB))

# # # #         heightA = np.linalg.norm(tr - br)
# # # #         heightB = np.linalg.norm(tl - bl)
# # # #         maxHeight = max(int(heightA), int(heightB))

# # # #         if maxWidth < 10 or maxHeight < 10:
# # # #             rotated, angle = _rotation_only_deskew(img, cfg)
# # # #             return rotated, False, "rotation_only", angle

# # # #         dst = np.array([
# # # #             [0, 0],
# # # #             [maxWidth - 1, 0],
# # # #             [maxWidth - 1, maxHeight - 1],
# # # #             [0, maxHeight - 1]], dtype="float32")

# # # #         M = cv2.getPerspectiveTransform(quad, dst)
# # # #         warped = cv2.warpPerspective(img, M, (maxWidth, maxHeight))
# # # #         return warped, True, "perspective_warp", 0.0

# # # #     rotated, angle = _rotation_only_deskew(img, cfg)
# # # #     return rotated, False, "rotation_only", angle


# # # # # ---------------------------------------------------------------------------
# # # # # Step 3: denoise
# # # # # ---------------------------------------------------------------------------

# # # # def denoise(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
# # # #     return cv2.fastNlMeansDenoisingColored(
# # # #         img, None,
# # # #         h=cfg.denoise_h,
# # # #         hColor=cfg.denoise_h_color,
# # # #         templateWindowSize=cfg.denoise_template_window,
# # # #         searchWindowSize=cfg.denoise_search_window,
# # # #     )


# # # # # ---------------------------------------------------------------------------
# # # # # Step 4: contrast normalization (CLAHE on L channel of LAB)
# # # # # ---------------------------------------------------------------------------

# # # # def normalize_contrast(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:
# # # #     lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)
# # # #     l, a, b = cv2.split(lab)
# # # #     clahe = cv2.createCLAHE(clipLimit=cfg.clahe_clip_limit,
# # # #                              tileGridSize=(cfg.clahe_tile_grid, cfg.clahe_tile_grid))
# # # #     l2 = clahe.apply(l)
# # # #     merged = cv2.merge((l2, a, b))
# # # #     return cv2.cvtColor(merged, cv2.COLOR_LAB2BGR)


# # # # # ---------------------------------------------------------------------------
# # # # # Step 5: glare removal
# # # # # ---------------------------------------------------------------------------

# # # # def remove_glare(img: np.ndarray, cfg: PreprocessConfig):
# # # #     """Detects specular highlight regions and inpaints them.

# # # #     Glare is a LOCAL brightness outlier — a spot much brighter than its
# # # #     immediate surroundings — which is what the top-hat transform below
# # # #     isolates. But that test alone also fires on small white TEXT on a dark
# # # #     background (e.g. white print on a navy label), which is also a local
# # # #     brightness outlier. Inpainting over text destroys exactly the
# # # #     declarations this system needs to read, which is worse than leaving
# # # #     real glare in place.

# # # #     To tell them apart we use two extra, shape/context-based gates that
# # # #     real specular highlights pass and text does not:

# # # #     1. SHAPE — a highlight is a soft, roughly convex blob. A run of text
# # # #        is a dense cluster of thin, jagged strokes, so its contours have a
# # # #        low "solidity" (contour area / convex-hull area) and are long and
# # # #        thin (large bounding-box aspect ratio relative to their area).
# # # #     2. LOCAL EDGE DENSITY — a highlight sits on an otherwise smooth
# # # #        surface. Text sits inside a neighbourhood packed with other
# # # #        strokes/edges (other characters on the same line). We reject any
# # # #        candidate blob whose surrounding neighbourhood has high edge
# # # #        density, since that's a signature of a text region, not a clean
# # # #        glossy surface.

# # # #     Only candidates that are bright local outliers AND blob-shaped AND
# # # #     NOT sitting inside a text-dense neighbourhood are treated as glare.
# # # #     """
# # # #     hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
# # # #     h, s, v = cv2.split(hsv)

# # # #     # Kernel must be larger than the widest glare blob we expect to catch —
# # # #     # opening only erases features SMALLER than the kernel, so a kernel that's
# # # #     # too small (tuned to character-stroke scale) lets broad diffuse glare
# # # #     # blend into the "baseline" and escape detection entirely, while still
# # # #     # flagging small text strokes as outliers. Scale to a fraction of the
# # # #     # shorter image dimension instead of a stroke-scale constant.
# # # #     k = max(51, min(v.shape[:2]) // 6)
# # # #     if k % 2 == 0:
# # # #         k += 1
# # # #     kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (k, k))
# # # #     local_baseline = cv2.morphologyEx(v, cv2.MORPH_OPEN, kernel)
# # # #     top_hat = cv2.subtract(v, local_baseline)  # how much brighter than local surroundings

# # # #     candidate_mask = (
# # # #         (v >= cfg.glare_value_thresh)
# # # #         & (s <= cfg.glare_sat_thresh)
# # # #         & (top_hat >= 30)
# # # #     ).astype(np.uint8) * 255

# # # #     # Local edge/text density map: blur a binary edge map over a
# # # #     # character-scale window so each pixel carries "how much stroke
# # # #     # activity is near me" — high in text blocks, low on clean surfaces.
# # # #     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# # # #     edges = cv2.Canny(gray, 40, 120)
# # # #     text_density = cv2.boxFilter(edges.astype(np.float32) / 255.0, ddepth=-1, ksize=(25, 25))

# # # #     contours, _ = cv2.findContours(candidate_mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
# # # #     clean_mask = np.zeros_like(candidate_mask)
# # # #     for c in contours:
# # # #         area = cv2.contourArea(c)
# # # #         if area < cfg.glare_min_area_px:
# # # #             continue

# # # #         hull = cv2.convexHull(c)
# # # #         hull_area = cv2.contourArea(hull)
# # # #         solidity = area / hull_area if hull_area > 0 else 0
# # # #         x, y, bw, bh = cv2.boundingRect(c)
# # # #         aspect = max(bw, bh) / max(1, min(bw, bh))

# # # #         if solidity < 0.55 or aspect > 6:
# # # #             continue  # too jagged / stroke-like to be a smooth highlight

# # # #         # sample local text density under this blob's bounding box
# # # #         region_density = text_density[y:y + bh, x:x + bw]
# # # #         if region_density.size and float(region_density.mean()) > 0.06:
# # # #             continue  # sitting inside a text-dense neighbourhood — skip

# # # #         cv2.drawContours(clean_mask, [c], -1, 255, thickness=cv2.FILLED)

# # # #     glare_area_frac = float(np.count_nonzero(clean_mask)) / float(clean_mask.size)

# # # #     if glare_area_frac == 0:
# # # #         return img, 0.0

# # # #     clean_mask = cv2.dilate(clean_mask, np.ones((3, 3), np.uint8), iterations=1)
# # # #     result = cv2.inpaint(img, clean_mask, cfg.inpaint_radius, cv2.INPAINT_TELEA)
# # # #     return result, glare_area_frac


# # # # # ---------------------------------------------------------------------------
# # # # # Step 6: usability check
# # # # # ---------------------------------------------------------------------------

# # # # def sharpness_score(img: np.ndarray) -> float:
# # # #     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# # # #     return float(cv2.Laplacian(gray, cv2.CV_64F).var())


# # # # # ---------------------------------------------------------------------------
# # # # # Orchestration
# # # # # ---------------------------------------------------------------------------

# # # # def preprocess(image_bytes: bytes, cfg: Optional[PreprocessConfig] = None):
# # # #     """Runs the full Stage 2 pipeline.

# # # #     Returns (output_bgr_image: np.ndarray, metadata: PreprocessMetadata).
# # # #     """
# # # #     cfg = cfg or PreprocessConfig()

# # # #     img = decode_image(image_bytes)
# # # #     orig_h, orig_w = img.shape[:2]

# # # #     warped, boundary_detected, method, angle = deskew_and_crop(img, cfg)
# # # #     denoised = denoise(warped, cfg)
# # # #     contrast_fixed = normalize_contrast(denoised, cfg)
# # # #     deglared, glare_frac = remove_glare(contrast_fixed, cfg)

# # # #     out_h, out_w = deglared.shape[:2]
# # # #     sharpness = sharpness_score(deglared)

# # # #     reasons = []
# # # #     if out_w < cfg.min_output_width or out_h < cfg.min_output_height:
# # # #         reasons.append(
# # # #             f"Resolution too low ({out_w}x{out_h}); minimum is "
# # # #             f"{cfg.min_output_width}x{cfg.min_output_height}. Re-capture closer to the label."
# # # #         )
# # # #     if sharpness < cfg.min_sharpness_score:
# # # #         reasons.append(
# # # #             f"Image too blurry (sharpness={sharpness:.1f}, minimum={cfg.min_sharpness_score}). "
# # # #             "Hold the camera steady and re-capture."
# # # #         )
# # # #     if glare_frac > cfg.max_glare_area_frac:
# # # #         reasons.append(
# # # #             f"Excessive glare ({glare_frac * 100:.1f}% of frame). Reposition to avoid reflections "
# # # #             "and re-capture."
# # # #         )
# # # #     if not boundary_detected:
# # # #         reasons.append(
# # # #             "Package/label boundary could not be confidently detected; only rotation-based "
# # # #             "deskew was applied. Consider re-capturing with the full label in frame against a "
# # # #             "contrasting background."
# # # #         )

# # # #     metadata = PreprocessMetadata(
# # # #         original_width=orig_w,
# # # #         original_height=orig_h,
# # # #         output_width=out_w,
# # # #         output_height=out_h,
# # # #         boundary_detected=boundary_detected,
# # # #         deskew_method=method,
# # # #         rotation_angle_deg=round(angle, 3),
# # # #         sharpness_score=round(sharpness, 2),
# # # #         glare_area_fraction=round(glare_frac, 4),
# # # #         usable=len([r for r in reasons if "boundary" not in r]) == 0,
# # # #         reject_reasons=reasons,
# # # #     )

# # # #     return deglared, metadata
# # # """
# # # Stage 2 — Image Preprocessing pipeline for the Legal Metrology compliance system.

# # # Given a raw package/label photo, this module produces a cleaned, deskewed,
# # # tightly-cropped image suitable for Stage 3 (PDP/label detection) and
# # # Stage 4 (OCR), plus a metadata report describing what was done and whether
# # # the image is usable.

# # # Pipeline order:

# # #     1. Decode + basic sanity checks
# # #     2. Label/package boundary detection -> 4-point perspective warp
# # #        (does deskew + crop in a single robust step; falls back to a
# # #        simple rotation-only deskew if no clean quadrilateral is found)
# # #     3. Mild denoising
# # #     4. Glare / specular-highlight removal
# # #     5. Mild contrast / brightness normalization (CLAHE)
# # #     6. Resolution / sharpness usability check

# # # Important:
# # #     The pipeline intentionally avoids aggressive enhancement.

# # #     The objective is to preserve the original printed text and package
# # #     appearance rather than making the image visually "sharper" or
# # #     artificially increasing character thickness.
# # # """

# # # from __future__ import annotations

# # # import cv2
# # # import numpy as np

# # # from dataclasses import dataclass, field, asdict
# # # from typing import Optional


# # # # ---------------------------------------------------------------------------
# # # # Config
# # # # ---------------------------------------------------------------------------

# # # @dataclass
# # # class PreprocessConfig:

# # #     # -----------------------------------------------------------------------
# # #     # Boundary detection
# # #     # -----------------------------------------------------------------------

# # #     resize_width_for_detection: int = 1000

# # #     canny_low: int = 50
# # #     canny_high: int = 150

# # #     dilate_kernel: int = 5

# # #     # Boundary must cover at least 15% of the frame
# # #     min_contour_area_frac: float = 0.15

# # #     # Approximation tolerance for quadrilateral detection
# # #     approx_poly_epsilon_frac: float = 0.02


# # #     # -----------------------------------------------------------------------
# # #     # Mild denoising
# # #     #
# # #     # Lower values are intentional.
# # #     # Aggressive denoising can make printed characters look unnaturally
# # #     # smooth / bold after subsequent contrast enhancement.
# # #     # -----------------------------------------------------------------------

# # #     denoise_h: float = 3.0
# # #     denoise_h_color: float = 3.0

# # #     denoise_template_window: int = 7
# # #     denoise_search_window: int = 21


# # #     # -----------------------------------------------------------------------
# # #     # Mild CLAHE contrast normalization
# # #     #
# # #     # CLAHE is deliberately weak.
# # #     #
# # #     # It is applied AFTER glare removal so that reflections are not
# # #     # amplified before the glare detector sees them.
# # #     # -----------------------------------------------------------------------

# # #     clahe_clip_limit: float = 1.2
# # #     clahe_tile_grid: int = 8


# # #     # -----------------------------------------------------------------------
# # #     # Conservative glare removal
# # #     #
# # #     # High value + low saturation identifies potential specular highlights.
# # #     #
# # #     # The threshold is deliberately high so normal white printed text
# # #     # is not automatically considered glare.
# # #     # -----------------------------------------------------------------------

# # #     glare_value_thresh: int = 242

# # #     # Low saturation + high brightness
# # #     glare_sat_thresh: int = 55

# # #     # Ignore very small bright regions
# # #     glare_min_area_px: int = 40

# # #     # Smaller radius avoids excessive artificial reconstruction
# # #     inpaint_radius: int = 3


# # #     # -----------------------------------------------------------------------
# # #     # Usability / resolution gate
# # #     # -----------------------------------------------------------------------

# # #     min_output_width: int = 600
# # #     min_output_height: int = 400

# # #     # Variance of Laplacian
# # #     min_sharpness_score: float = 60.0

# # #     # If more than 25% of the image is identified as glare,
# # #     # request a recapture.
# # #     max_glare_area_frac: float = 0.25


# # # # ---------------------------------------------------------------------------
# # # # Metadata
# # # # ---------------------------------------------------------------------------

# # # @dataclass
# # # class PreprocessMetadata:

# # #     original_width: int
# # #     original_height: int

# # #     output_width: int
# # #     output_height: int

# # #     boundary_detected: bool

# # #     # "perspective_warp" | "rotation_only" | "none"
# # #     deskew_method: str

# # #     rotation_angle_deg: float

# # #     sharpness_score: float

# # #     glare_area_fraction: float

# # #     usable: bool

# # #     reject_reasons: list = field(default_factory=list)

# # #     def to_dict(self) -> dict:
# # #         return asdict(self)


# # # # ---------------------------------------------------------------------------
# # # # Exceptions
# # # # ---------------------------------------------------------------------------

# # # class PreprocessingError(Exception):
# # #     pass


# # # # ---------------------------------------------------------------------------
# # # # Step 1: Decode
# # # # ---------------------------------------------------------------------------

# # # def decode_image(image_bytes: bytes) -> np.ndarray:
# # #     """
# # #     Decode image bytes into an OpenCV BGR image.
# # #     """

# # #     if not image_bytes:
# # #         raise PreprocessingError(
# # #             "Image data is empty."
# # #         )

# # #     arr = np.frombuffer(
# # #         image_bytes,
# # #         dtype=np.uint8
# # #     )

# # #     img = cv2.imdecode(
# # #         arr,
# # #         cv2.IMREAD_COLOR
# # #     )

# # #     if img is None:
# # #         raise PreprocessingError(
# # #             "Could not decode image — unsupported format or corrupt file."
# # #         )

# # #     return img


# # # # ---------------------------------------------------------------------------
# # # # Step 2: Boundary detection -> deskew + crop
# # # # ---------------------------------------------------------------------------

# # # def _order_points(pts: np.ndarray) -> np.ndarray:
# # #     """
# # #     Order four points as:

# # #         top-left
# # #         top-right
# # #         bottom-right
# # #         bottom-left
# # #     """

# # #     rect = np.zeros(
# # #         (4, 2),
# # #         dtype="float32"
# # #     )

# # #     # Sum of coordinates
# # #     # Smallest -> top-left
# # #     # Largest  -> bottom-right

# # #     s = pts.sum(axis=1)

# # #     rect[0] = pts[np.argmin(s)]
# # #     rect[2] = pts[np.argmax(s)]

# # #     # Difference between x and y
# # #     #
# # #     # Smallest -> top-right
# # #     # Largest  -> bottom-left

# # #     diff = np.diff(
# # #         pts,
# # #         axis=1
# # #     )

# # #     rect[1] = pts[np.argmin(diff)]
# # #     rect[3] = pts[np.argmax(diff)]

# # #     return rect


# # # def _find_boundary_quad(
# # #     img: np.ndarray,
# # #     cfg: PreprocessConfig
# # # ) -> Optional[np.ndarray]:
# # #     """
# # #     Try to find a 4-point contour representing the package/label boundary.

# # #     Returns:
# # #         Four points in ORIGINAL image coordinates,
# # #         ordered TL, TR, BR, BL.

# # #         Returns None if no suitable quadrilateral is found.
# # #     """

# # #     h, w = img.shape[:2]

# # #     # Avoid invalid scaling
# # #     if w <= 0 or h <= 0:
# # #         return None

# # #     scale = cfg.resize_width_for_detection / float(w)

# # #     small_width = cfg.resize_width_for_detection
# # #     small_height = max(
# # #         1,
# # #         int(h * scale)
# # #     )

# # #     small = cv2.resize(
# # #         img,
# # #         (small_width, small_height),
# # #         interpolation=cv2.INTER_AREA
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Convert to grayscale
# # #     # -----------------------------------------------------------------------

# # #     gray = cv2.cvtColor(
# # #         small,
# # #         cv2.COLOR_BGR2GRAY
# # #     )

# # #     # Mild blur before edge detection
# # #     gray = cv2.GaussianBlur(
# # #         gray,
# # #         (5, 5),
# # #         0
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Edge detection
# # #     # -----------------------------------------------------------------------

# # #     edges = cv2.Canny(
# # #         gray,
# # #         cfg.canny_low,
# # #         cfg.canny_high
# # #     )

# # #     # Connect broken boundary edges
# # #     kernel = np.ones(
# # #         (
# # #             cfg.dilate_kernel,
# # #             cfg.dilate_kernel
# # #         ),
# # #         np.uint8
# # #     )

# # #     edges = cv2.dilate(
# # #         edges,
# # #         kernel,
# # #         iterations=1
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Find contours
# # #     # -----------------------------------------------------------------------

# # #     contours, _ = cv2.findContours(
# # #         edges,
# # #         cv2.RETR_LIST,
# # #         cv2.CHAIN_APPROX_SIMPLE
# # #     )

# # #     if not contours:
# # #         return None

# # #     small_area = (
# # #         small.shape[0] *
# # #         small.shape[1]
# # #     )

# # #     # Only inspect largest contours
# # #     contours = sorted(
# # #         contours,
# # #         key=cv2.contourArea,
# # #         reverse=True
# # #     )[:8]

# # #     # -----------------------------------------------------------------------
# # #     # Search for quadrilateral
# # #     # -----------------------------------------------------------------------

# # #     for c in contours:

# # #         area = cv2.contourArea(c)

# # #         # Ignore tiny contours
# # #         if area < cfg.min_contour_area_frac * small_area:
# # #             continue

# # #         perimeter = cv2.arcLength(
# # #             c,
# # #             True
# # #         )

# # #         approx = cv2.approxPolyDP(
# # #             c,
# # #             cfg.approx_poly_epsilon_frac * perimeter,
# # #             True
# # #         )

# # #         if (
# # #             len(approx) == 4
# # #             and cv2.isContourConvex(approx)
# # #         ):

# # #             pts = (
# # #                 approx
# # #                 .reshape(4, 2)
# # #                 .astype("float32")
# # #                 / scale
# # #             )

# # #             return _order_points(pts)

# # #     return None


# # # def _rotation_only_deskew(
# # #     img: np.ndarray,
# # #     cfg: PreprocessConfig
# # # ):
# # #     """
# # #     Fallback deskew method.

# # #     Estimates a single skew angle using minAreaRect over the foreground
# # #     and rotates the image.

# # #     No crop is performed here.
# # #     """

# # #     gray = cv2.cvtColor(
# # #         img,
# # #         cv2.COLOR_BGR2GRAY
# # #     )

# # #     # Binary foreground
# # #     thresh = cv2.threshold(
# # #         gray,
# # #         0,
# # #         255,
# # #         cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU
# # #     )[1]

# # #     coords = cv2.findNonZero(
# # #         thresh
# # #     )

# # #     if coords is None:
# # #         return img, 0.0

# # #     angle = cv2.minAreaRect(
# # #         coords
# # #     )[-1]

# # #     # Normalize OpenCV's angle convention
# # #     if angle < -45:
# # #         angle = 90 + angle

# # #     # Don't rotate if effectively straight
# # #     if abs(angle) < 0.1:
# # #         return img, 0.0

# # #     h, w = img.shape[:2]

# # #     center = (
# # #         w // 2,
# # #         h // 2
# # #     )

# # #     M = cv2.getRotationMatrix2D(
# # #         center,
# # #         angle,
# # #         1.0
# # #     )

# # #     rotated = cv2.warpAffine(
# # #         img,
# # #         M,
# # #         (w, h),
# # #         flags=cv2.INTER_CUBIC,
# # #         borderMode=cv2.BORDER_REPLICATE
# # #     )

# # #     return rotated, float(angle)


# # # def deskew_and_crop(
# # #     img: np.ndarray,
# # #     cfg: PreprocessConfig
# # # ):
# # #     """
# # #     Perform:

# # #         boundary detection
# # #         +
# # #         perspective correction
# # #         +
# # #         crop

# # #     Returns:

# # #         processed_img,
# # #         boundary_detected,
# # #         deskew_method,
# # #         angle
# # #     """

# # #     quad = _find_boundary_quad(
# # #         img,
# # #         cfg
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Preferred method: perspective warp
# # #     # -----------------------------------------------------------------------

# # #     if quad is not None:

# # #         (
# # #             tl,
# # #             tr,
# # #             br,
# # #             bl
# # #         ) = quad

# # #         # Width
# # #         width_a = np.linalg.norm(
# # #             br - bl
# # #         )

# # #         width_b = np.linalg.norm(
# # #             tr - tl
# # #         )

# # #         max_width = max(
# # #             int(width_a),
# # #             int(width_b)
# # #         )

# # #         # Height
# # #         height_a = np.linalg.norm(
# # #             tr - br
# # #         )

# # #         height_b = np.linalg.norm(
# # #             tl - bl
# # #         )

# # #         max_height = max(
# # #             int(height_a),
# # #             int(height_b)
# # #         )

# # #         # Sanity check
# # #         if (
# # #             max_width < 10
# # #             or max_height < 10
# # #         ):
# # #             rotated, angle = _rotation_only_deskew(
# # #                 img,
# # #                 cfg
# # #             )

# # #             return (
# # #                 rotated,
# # #                 False,
# # #                 "rotation_only",
# # #                 angle
# # #             )

# # #         # -------------------------------------------------------------------
# # #         # Destination rectangle
# # #         # -------------------------------------------------------------------

# # #         dst = np.array(
# # #             [
# # #                 [0, 0],
# # #                 [max_width - 1, 0],
# # #                 [max_width - 1, max_height - 1],
# # #                 [0, max_height - 1]
# # #             ],
# # #             dtype="float32"
# # #         )

# # #         # -------------------------------------------------------------------
# # #         # Perspective transform
# # #         # -------------------------------------------------------------------

# # #         M = cv2.getPerspectiveTransform(
# # #             quad,
# # #             dst
# # #         )

# # #         warped = cv2.warpPerspective(
# # #             img,
# # #             M,
# # #             (
# # #                 max_width,
# # #                 max_height
# # #             ),
# # #             flags=cv2.INTER_CUBIC,
# # #             borderMode=cv2.BORDER_REPLICATE
# # #         )

# # #         return (
# # #             warped,
# # #             True,
# # #             "perspective_warp",
# # #             0.0
# # #         )

# # #     # -----------------------------------------------------------------------
# # #     # Fallback
# # #     # -----------------------------------------------------------------------

# # #     rotated, angle = _rotation_only_deskew(
# # #         img,
# # #         cfg
# # #     )

# # #     return (
# # #         rotated,
# # #         False,
# # #         "rotation_only",
# # #         angle
# # #     )


# # # # ---------------------------------------------------------------------------
# # # # Step 3: Mild denoising
# # # # ---------------------------------------------------------------------------

# # # def denoise(
# # #     img: np.ndarray,
# # #     cfg: PreprocessConfig
# # # ) -> np.ndarray:
# # #     """
# # #     Apply conservative non-local means denoising.

# # #     The parameters are intentionally mild to preserve printed character
# # #     geometry and avoid making text appear unnaturally thick.
# # #     """

# # #     return cv2.fastNlMeansDenoisingColored(
# # #         img,
# # #         None,
# # #         h=cfg.denoise_h,
# # #         hColor=cfg.denoise_h_color,
# # #         templateWindowSize=cfg.denoise_template_window,
# # #         searchWindowSize=cfg.denoise_search_window
# # #     )


# # # # ---------------------------------------------------------------------------
# # # # Step 4: Glare removal
# # # # ---------------------------------------------------------------------------

# # # def remove_glare(
# # #     img: np.ndarray,
# # #     cfg: PreprocessConfig
# # # ):
# # #     """
# # #     Detect and remove strong specular highlights.

# # #     Important design principle:

# # #         Do NOT treat every bright white region as glare.

# # #     White printed text on dark packaging is also bright and can therefore
# # #     look like a glare candidate.

# # #     To protect text, a candidate must satisfy several conditions:

# # #         1. High brightness
# # #         2. Low saturation
# # #         3. Strong local brightness difference
# # #         4. Blob-like geometry
# # #         5. Not located inside a text-dense neighbourhood

# # #     Only candidates satisfying these conditions are inpainted.

# # #     Returns:

# # #         result_image,
# # #         glare_area_fraction
# # #     """

# # #     # -----------------------------------------------------------------------
# # #     # HSV representation
# # #     # -----------------------------------------------------------------------

# # #     hsv = cv2.cvtColor(
# # #         img,
# # #         cv2.COLOR_BGR2HSV
# # #     )

# # #     h, s, v = cv2.split(
# # #         hsv
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Local brightness baseline
# # #     #
# # #     # Morphological opening estimates the broad local background.
# # #     #
# # #     # The kernel is intentionally large enough to detect broad reflections,
# # #     # rather than character-sized features.
# # #     # -----------------------------------------------------------------------

# # #     min_dimension = min(
# # #         v.shape[:2]
# # #     )

# # #     k = max(
# # #         51,
# # #         min_dimension // 6
# # #     )

# # #     # Kernel size must be odd
# # #     if k % 2 == 0:
# # #         k += 1

# # #     kernel = cv2.getStructuringElement(
# # #         cv2.MORPH_ELLIPSE,
# # #         (k, k)
# # #     )

# # #     local_baseline = cv2.morphologyEx(
# # #         v,
# # #         cv2.MORPH_OPEN,
# # #         kernel
# # #     )

# # #     # Difference from local surroundings
# # #     top_hat = cv2.subtract(
# # #         v,
# # #         local_baseline
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Initial glare candidate mask
# # #     # -----------------------------------------------------------------------

# # #     candidate_mask = (
# # #         (v >= cfg.glare_value_thresh)
# # #         &
# # #         (s <= cfg.glare_sat_thresh)
# # #         &
# # #         (top_hat >= 30)
# # #     ).astype(
# # #         np.uint8
# # #     ) * 255

# # #     # -----------------------------------------------------------------------
# # #     # Text density estimation
# # #     #
# # #     # White text produces many nearby edges.
# # #     #
# # #     # A broad smooth reflection generally produces much lower local edge
# # #     # density.
# # #     # -----------------------------------------------------------------------

# # #     gray = cv2.cvtColor(
# # #         img,
# # #         cv2.COLOR_BGR2GRAY
# # #     )

# # #     edges = cv2.Canny(
# # #         gray,
# # #         40,
# # #         120
# # #     )

# # #     text_density = cv2.boxFilter(
# # #         edges.astype(np.float32) / 255.0,
# # #         ddepth=-1,
# # #         ksize=(25, 25)
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Inspect glare candidates
# # #     # -----------------------------------------------------------------------

# # #     contours, _ = cv2.findContours(
# # #         candidate_mask,
# # #         cv2.RETR_EXTERNAL,
# # #         cv2.CHAIN_APPROX_SIMPLE
# # #     )

# # #     clean_mask = np.zeros_like(
# # #         candidate_mask
# # #     )

# # #     for c in contours:

# # #         area = cv2.contourArea(
# # #             c
# # #         )

# # #         # Ignore tiny bright speckles
# # #         if area < cfg.glare_min_area_px:
# # #             continue

# # #         # -------------------------------------------------------------------
# # #         # Shape analysis
# # #         # -------------------------------------------------------------------

# # #         hull = cv2.convexHull(
# # #             c
# # #         )

# # #         hull_area = cv2.contourArea(
# # #             hull
# # #         )

# # #         if hull_area <= 0:
# # #             continue

# # #         solidity = (
# # #             area /
# # #             hull_area
# # #         )

# # #         x, y, bw, bh = cv2.boundingRect(
# # #             c
# # #         )

# # #         aspect = (
# # #             max(bw, bh) /
# # #             max(
# # #                 1,
# # #                 min(bw, bh)
# # #             )
# # #         )

# # #         # -------------------------------------------------------------------
# # #         # Text protection
# # #         #
# # #         # Text strokes are generally:
# # #         #
# # #         #   - jagged
# # #         #   - fragmented
# # #         #   - elongated
# # #         #
# # #         # A broad reflection is generally:
# # #         #
# # #         #   - smoother
# # #         #   - more compact
# # #         #   - more convex
# # #         # -------------------------------------------------------------------

# # #         if solidity < 0.55:
# # #             continue

# # #         if aspect > 6:
# # #             continue

# # #         # -------------------------------------------------------------------
# # #         # Local text density
# # #         # -------------------------------------------------------------------

# # #         region_density = text_density[
# # #             y:y + bh,
# # #             x:x + bw
# # #         ]

# # #         if (
# # #             region_density.size
# # #             and float(region_density.mean()) > 0.08
# # #         ):
# # #             # This region contains too many nearby edges.
# # #             #
# # #             # Treat it as likely text rather than glare.
# # #             continue

# # #         # -------------------------------------------------------------------
# # #         # Candidate passed all filters
# # #         # -------------------------------------------------------------------

# # #         cv2.drawContours(
# # #             clean_mask,
# # #             [c],
# # #             -1,
# # #             255,
# # #             thickness=cv2.FILLED
# # #         )

# # #     # -----------------------------------------------------------------------
# # #     # Calculate glare fraction BEFORE dilation
# # #     # -----------------------------------------------------------------------

# # #     glare_area_frac = (
# # #         float(
# # #             np.count_nonzero(
# # #                 clean_mask
# # #             )
# # #         )
# # #         /
# # #         float(
# # #             clean_mask.size
# # #         )
# # #     )

# # #     # No glare detected
# # #     if glare_area_frac == 0:
# # #         return (
# # #             img,
# # #             0.0
# # #         )

# # #     # -----------------------------------------------------------------------
# # #     # Slight mask expansion
# # #     #
# # #     # Only 3x3 is used to avoid destroying surrounding text.
# # #     # -----------------------------------------------------------------------

# # #     mask_kernel = np.ones(
# # #         (3, 3),
# # #         np.uint8
# # #     )

# # #     clean_mask = cv2.dilate(
# # #         clean_mask,
# # #         mask_kernel,
# # #         iterations=1
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Inpaint
# # #     # -----------------------------------------------------------------------

# # #     result = cv2.inpaint(
# # #         img,
# # #         clean_mask,
# # #         cfg.inpaint_radius,
# # #         cv2.INPAINT_TELEA
# # #     )

# # #     return (
# # #         result,
# # #         glare_area_frac
# # #     )


# # # # ---------------------------------------------------------------------------
# # # # Step 5: Mild contrast normalization
# # # # ---------------------------------------------------------------------------

# # # def normalize_contrast(
# # #     img: np.ndarray,
# # #     cfg: PreprocessConfig
# # # ) -> np.ndarray:
# # #     """
# # #     Apply mild CLAHE to the L channel of LAB.

# # #     CLAHE is deliberately weak.

# # #     It is performed AFTER glare removal so that specular highlights are not
# # #     amplified before glare detection.
# # #     """

# # #     lab = cv2.cvtColor(
# # #         img,
# # #         cv2.COLOR_BGR2LAB
# # #     )

# # #     l, a, b = cv2.split(
# # #         lab
# # #     )

# # #     clahe = cv2.createCLAHE(
# # #         clipLimit=cfg.clahe_clip_limit,
# # #         tileGridSize=(
# # #             cfg.clahe_tile_grid,
# # #             cfg.clahe_tile_grid
# # #         )
# # #     )

# # #     l2 = clahe.apply(
# # #         l
# # #     )

# # #     merged = cv2.merge(
# # #         (
# # #             l2,
# # #             a,
# # #             b
# # #         )
# # #     )

# # #     return cv2.cvtColor(
# # #         merged,
# # #         cv2.COLOR_LAB2BGR
# # #     )


# # # # ---------------------------------------------------------------------------
# # # # Step 6: Sharpness
# # # # ---------------------------------------------------------------------------

# # # def sharpness_score(
# # #     img: np.ndarray
# # # ) -> float:
# # #     """
# # #     Calculate image sharpness using variance of Laplacian.
# # #     """

# # #     gray = cv2.cvtColor(
# # #         img,
# # #         cv2.COLOR_BGR2GRAY
# # #     )

# # #     return float(
# # #         cv2.Laplacian(
# # #             gray,
# # #             cv2.CV_64F
# # #         ).var()
# # #     )


# # # # ---------------------------------------------------------------------------
# # # # Step 7: Full preprocessing pipeline
# # # # ---------------------------------------------------------------------------

# # # def preprocess(
# # #     image_bytes: bytes,
# # #     cfg: Optional[PreprocessConfig] = None
# # # ):
# # #     """
# # #     Run the complete Stage 2 preprocessing pipeline.

# # #     Pipeline:

# # #         Raw bytes
# # #             ↓
# # #         Decode
# # #             ↓
# # #         Boundary detection
# # #             ↓
# # #         Perspective correction / deskew
# # #             ↓
# # #         Mild denoising
# # #             ↓
# # #         Glare removal
# # #             ↓
# # #         Mild CLAHE
# # #             ↓
# # #         Quality checks

# # #     Returns:

# # #         (
# # #             output_bgr_image,
# # #             metadata
# # #         )

# # #     where:

# # #         output_bgr_image -> np.ndarray
# # #         metadata         -> PreprocessMetadata
# # #     """

# # #     cfg = cfg or PreprocessConfig()

# # #     # -----------------------------------------------------------------------
# # #     # 1. Decode
# # #     # -----------------------------------------------------------------------

# # #     img = decode_image(
# # #         image_bytes
# # #     )

# # #     orig_h, orig_w = img.shape[:2]

# # #     # -----------------------------------------------------------------------
# # #     # 2. Boundary detection + perspective correction
# # #     # -----------------------------------------------------------------------

# # #     warped, boundary_detected, method, angle = deskew_and_crop(
# # #         img,
# # #         cfg
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # 3. Mild denoising
# # #     # -----------------------------------------------------------------------

# # #     denoised = denoise(
# # #         warped,
# # #         cfg
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # 4. Glare removal
# # #     #
# # #     # IMPORTANT:
# # #     #
# # #     # Glare removal happens BEFORE CLAHE.
# # #     #
# # #     # This prevents CLAHE from amplifying reflections before they are
# # #     # detected.
# # #     # -----------------------------------------------------------------------

# # #     deglared, glare_frac = remove_glare(
# # #         denoised,
# # #         cfg
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # 5. Mild contrast normalization
# # #     # -----------------------------------------------------------------------

# # #     contrast_fixed = normalize_contrast(
# # #         deglared,
# # #         cfg
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # 6. Output dimensions
# # #     # -----------------------------------------------------------------------

# # #     out_h, out_w = contrast_fixed.shape[:2]

# # #     # -----------------------------------------------------------------------
# # #     # 7. Sharpness
# # #     # -----------------------------------------------------------------------

# # #     sharpness = sharpness_score(
# # #         contrast_fixed
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # 8. Quality / usability checks
# # #     # -----------------------------------------------------------------------

# # #     reasons = []

# # #     # -----------------------------------------------------------------------
# # #     # Resolution
# # #     # -----------------------------------------------------------------------

# # #     if (
# # #         out_w < cfg.min_output_width
# # #         or
# # #         out_h < cfg.min_output_height
# # #     ):

# # #         reasons.append(
# # #             f"Resolution too low ({out_w}x{out_h}); "
# # #             f"minimum is "
# # #             f"{cfg.min_output_width}x"
# # #             f"{cfg.min_output_height}. "
# # #             f"Re-capture closer to the label."
# # #         )

# # #     # -----------------------------------------------------------------------
# # #     # Sharpness
# # #     # -----------------------------------------------------------------------

# # #     if sharpness < cfg.min_sharpness_score:

# # #         reasons.append(
# # #             f"Image too blurry "
# # #             f"(sharpness={sharpness:.1f}, "
# # #             f"minimum={cfg.min_sharpness_score}). "
# # #             f"Hold the camera steady and re-capture."
# # #         )

# # #     # -----------------------------------------------------------------------
# # #     # Excessive glare
# # #     # -----------------------------------------------------------------------

# # #     if glare_frac > cfg.max_glare_area_frac:

# # #         reasons.append(
# # #             f"Excessive glare "
# # #             f"({glare_frac * 100:.1f}% of frame). "
# # #             f"Reposition to avoid reflections and re-capture."
# # #         )

# # #     # -----------------------------------------------------------------------
# # #     # Boundary detection
# # #     # -----------------------------------------------------------------------

# # #     if not boundary_detected:

# # #         reasons.append(
# # #             "Package/label boundary could not be confidently detected; "
# # #             "only rotation-based deskew was applied. "
# # #             "Consider re-capturing with the full label in frame against "
# # #             "a contrasting background."
# # #         )

# # #     # -----------------------------------------------------------------------
# # #     # Usability
# # #     #
# # #     # Boundary failure is currently a warning rather than a hard rejection.
# # #     # Resolution, blur and excessive glare are hard rejection conditions.
# # #     # -----------------------------------------------------------------------

# # #     usable = len([
# # #         r
# # #         for r in reasons
# # #         if "boundary" not in r
# # #     ]) == 0

# # #     # -----------------------------------------------------------------------
# # #     # Metadata
# # #     # -----------------------------------------------------------------------

# # #     metadata = PreprocessMetadata(

# # #         original_width=orig_w,

# # #         original_height=orig_h,

# # #         output_width=out_w,

# # #         output_height=out_h,

# # #         boundary_detected=boundary_detected,

# # #         deskew_method=method,

# # #         rotation_angle_deg=round(
# # #             angle,
# # #             3
# # #         ),

# # #         sharpness_score=round(
# # #             sharpness,
# # #             2
# # #         ),

# # #         glare_area_fraction=round(
# # #             glare_frac,
# # #             4
# # #         ),

# # #         usable=usable,

# # #         reject_reasons=reasons
# # #     )

# # #     # -----------------------------------------------------------------------
# # #     # Final output
# # #     # -----------------------------------------------------------------------

# # #     return (
# # #         contrast_fixed,
# # #         metadata
# # #     )
# # """
# # Stage 2 — Image Preprocessing Pipeline
# # Legal Metrology / Packaged Commodities Compliance System

# # Purpose
# # -------
# # Given a raw package / label photograph, this module:

# #     1. Decodes the image
# #     2. Detects the package / label boundary
# #     3. Performs perspective correction and crop
# #     4. Applies very mild denoising
# #     5. Corrects uneven illumination
# #     6. Measures glare without destroying image information
# #     7. Performs resolution / sharpness quality checks

# # IMPORTANT
# # ---------
# # This stage intentionally preserves the original appearance.

# # It does NOT:
# #     - aggressively sharpen text
# #     - apply strong CLAHE
# #     - threshold the image
# #     - binarize text
# #     - use aggressive glare inpainting
# #     - artificially thicken characters

# # OCR-specific preprocessing should be performed separately in Stage 4.
# # """


# # from __future__ import annotations

# # import os

# # import cv2
# # import numpy as np

# # from dataclasses import dataclass, field, asdict
# # from typing import Optional


# # # ============================================================================
# # # CONFIGURATION
# # # ============================================================================

# # @dataclass
# # class PreprocessConfig:

# #     # ------------------------------------------------------------------------
# #     # Boundary detection
# #     # ------------------------------------------------------------------------

# #     resize_width_for_detection: int = 1000

# #     canny_low: int = 50
# #     canny_high: int = 150

# #     dilate_kernel: int = 5

# #     # Minimum contour area relative to image area
# #     min_contour_area_frac: float = 0.15

# #     # Polygon approximation tolerance
# #     approx_poly_epsilon_frac: float = 0.02


# #     # ------------------------------------------------------------------------
# #     # Mild denoising
# #     # ------------------------------------------------------------------------

# #     # Intentionally low.
# #     #
# #     # Strong denoising can alter the shape of printed characters.
# #     denoise_h: float = 3.0
# #     denoise_h_color: float = 3.0

# #     denoise_template_window: int = 7
# #     denoise_search_window: int = 21


# #     # ------------------------------------------------------------------------
# #     # Illumination correction
# #     # ------------------------------------------------------------------------

# #     # Amount of illumination correction.
# #     #
# #     # 0.0 = no correction
# #     # 1.0 = full correction
# #     #
# #     # Starting around 0.45 keeps the result natural.
# #     illumination_strength: float = 0.45

# #     # Gaussian blur size is calculated dynamically from image size.
# #     #
# #     # This controls the scale of illumination being estimated.
# #     illumination_sigma_fraction: float = 0.08

# #     # Prevent very small background values from causing extreme division.
# #     illumination_min_background: float = 20.0


# #     # ------------------------------------------------------------------------
# #     # Glare detection
# #     # ------------------------------------------------------------------------
# #     #
# #     # IMPORTANT:
# #     #
# #     # Glare is ONLY detected and measured.
# #     #
# #     # We do NOT inpaint it.
# #     #
# #     # This prevents the system from destroying white printed text.
# #     # ------------------------------------------------------------------------

# #     glare_value_thresh: int = 245
# #     glare_sat_thresh: int = 45

# #     glare_min_area_px: int = 40


# #     # ------------------------------------------------------------------------
# #     # Quality gate
# #     # ------------------------------------------------------------------------

# #     min_output_width: int = 600
# #     min_output_height: int = 400

# #     min_sharpness_score: float = 60.0

# #     # If measured glare exceeds this percentage, flag image.
# #     max_glare_area_frac: float = 0.25


# #     # ------------------------------------------------------------------------
# #     # Optional debug output
# #     # ------------------------------------------------------------------------

# #     # Set to True when tuning the pipeline.
# #     #
# #     # It will save:
# #     #
# #     #   01_warped.png
# #     #   02_denoised.png
# #     #   03_illumination_corrected.png
# #     #   04_final.png
# #     #   05_glare_mask.png
# #     #
# #     save_intermediate_images: bool = False

# #     debug_output_dir: str = "preprocessing_debug"


# # # ============================================================================
# # # METADATA
# # # ============================================================================

# # @dataclass
# # class PreprocessMetadata:

# #     original_width: int
# #     original_height: int

# #     output_width: int
# #     output_height: int

# #     boundary_detected: bool

# #     # "perspective_warp"
# #     # "rotation_only"
# #     # "none"
# #     deskew_method: str

# #     rotation_angle_deg: float

# #     sharpness_score: float

# #     glare_area_fraction: float

# #     usable: bool

# #     reject_reasons: list = field(default_factory=list)

# #     def to_dict(self) -> dict:
# #         return asdict(self)


# # # ============================================================================
# # # EXCEPTION
# # # ============================================================================

# # class PreprocessingError(Exception):
# #     pass


# # # ============================================================================
# # # STEP 1 — IMAGE DECODING
# # # ============================================================================

# # def decode_image(image_bytes: bytes) -> np.ndarray:
# #     """
# #     Decode raw image bytes into an OpenCV BGR image.
# #     """

# #     if not image_bytes:
# #         raise PreprocessingError(
# #             "Image data is empty."
# #         )

# #     arr = np.frombuffer(
# #         image_bytes,
# #         dtype=np.uint8
# #     )

# #     img = cv2.imdecode(
# #         arr,
# #         cv2.IMREAD_COLOR
# #     )

# #     if img is None:
# #         raise PreprocessingError(
# #             "Could not decode image — unsupported format or corrupt file."
# #         )

# #     return img


# # # ============================================================================
# # # STEP 2 — POINT ORDERING
# # # ============================================================================

# # def _order_points(
# #     pts: np.ndarray
# # ) -> np.ndarray:
# #     """
# #     Order four points as:

# #         top-left
# #         top-right
# #         bottom-right
# #         bottom-left
# #     """

# #     rect = np.zeros(
# #         (4, 2),
# #         dtype=np.float32
# #     )

# #     s = pts.sum(axis=1)

# #     rect[0] = pts[np.argmin(s)]
# #     rect[2] = pts[np.argmax(s)]

# #     diff = np.diff(
# #         pts,
# #         axis=1
# #     )

# #     rect[1] = pts[np.argmin(diff)]
# #     rect[3] = pts[np.argmax(diff)]

# #     return rect


# # # ============================================================================
# # # STEP 2A — PACKAGE / LABEL BOUNDARY DETECTION
# # # ============================================================================

# # def _find_boundary_quad(
# #     img: np.ndarray,
# #     cfg: PreprocessConfig
# # ) -> Optional[np.ndarray]:
# #     """
# #     Find a quadrilateral corresponding to the package / label boundary.

# #     Returns
# #     -------
# #     np.ndarray
# #         Four points in original-image coordinates.

# #     None
# #         If no suitable quadrilateral is found.
# #     """

# #     h, w = img.shape[:2]

# #     if w <= 0 or h <= 0:
# #         return None

# #     # ------------------------------------------------------------------------
# #     # Resize only for contour detection.
# #     # ------------------------------------------------------------------------

# #     scale = (
# #         cfg.resize_width_for_detection /
# #         float(w)
# #     )

# #     small_width = cfg.resize_width_for_detection

# #     small_height = max(
# #         1,
# #         int(h * scale)
# #     )

# #     small = cv2.resize(
# #         img,
# #         (
# #             small_width,
# #             small_height
# #         ),
# #         interpolation=cv2.INTER_AREA
# #     )

# #     # ------------------------------------------------------------------------
# #     # Grayscale
# #     # ------------------------------------------------------------------------

# #     gray = cv2.cvtColor(
# #         small,
# #         cv2.COLOR_BGR2GRAY
# #     )

# #     # Mild smoothing for stable edges
# #     gray = cv2.GaussianBlur(
# #         gray,
# #         (5, 5),
# #         0
# #     )

# #     # ------------------------------------------------------------------------
# #     # Edge detection
# #     # ------------------------------------------------------------------------

# #     edges = cv2.Canny(
# #         gray,
# #         cfg.canny_low,
# #         cfg.canny_high
# #     )

# #     # Connect boundary fragments
# #     kernel = np.ones(
# #         (
# #             cfg.dilate_kernel,
# #             cfg.dilate_kernel
# #         ),
# #         dtype=np.uint8
# #     )

# #     edges = cv2.dilate(
# #         edges,
# #         kernel,
# #         iterations=1
# #     )

# #     # ------------------------------------------------------------------------
# #     # Contours
# #     # ------------------------------------------------------------------------

# #     contours, _ = cv2.findContours(
# #         edges,
# #         cv2.RETR_LIST,
# #         cv2.CHAIN_APPROX_SIMPLE
# #     )

# #     if not contours:
# #         return None

# #     small_area = (
# #         small.shape[0] *
# #         small.shape[1]
# #     )

# #     contours = sorted(
# #         contours,
# #         key=cv2.contourArea,
# #         reverse=True
# #     )[:10]

# #     # ------------------------------------------------------------------------
# #     # Find quadrilateral
# #     # ------------------------------------------------------------------------

# #     for contour in contours:

# #         area = cv2.contourArea(
# #             contour
# #         )

# #         if area < (
# #             cfg.min_contour_area_frac *
# #             small_area
# #         ):
# #             continue

# #         perimeter = cv2.arcLength(
# #             contour,
# #             True
# #         )

# #         approx = cv2.approxPolyDP(
# #             contour,
# #             cfg.approx_poly_epsilon_frac * perimeter,
# #             True
# #         )

# #         if (
# #             len(approx) == 4
# #             and cv2.isContourConvex(approx)
# #         ):

# #             points = (
# #                 approx
# #                 .reshape(4, 2)
# #                 .astype(np.float32)
# #             )

# #             # Convert back to original image coordinates
# #             points /= scale

# #             return _order_points(
# #                 points
# #             )

# #     return None


# # # ============================================================================
# # # STEP 2B — ROTATION-ONLY FALLBACK
# # # ============================================================================

# # def _rotation_only_deskew(
# #     img: np.ndarray,
# #     cfg: PreprocessConfig
# # ):
# #     """
# #     Fallback deskew when a clean package quadrilateral cannot be detected.

# #     Uses minAreaRect over the foreground.

# #     No crop is performed.
# #     """

# #     gray = cv2.cvtColor(
# #         img,
# #         cv2.COLOR_BGR2GRAY
# #     )

# #     threshold = cv2.threshold(
# #         gray,
# #         0,
# #         255,
# #         cv2.THRESH_BINARY_INV +
# #         cv2.THRESH_OTSU
# #     )[1]

# #     coords = cv2.findNonZero(
# #         threshold
# #     )

# #     if coords is None:
# #         return img, 0.0

# #     angle = cv2.minAreaRect(
# #         coords
# #     )[-1]

# #     if angle < -45:
# #         angle = 90 + angle

# #     if abs(angle) < 0.1:
# #         return img, 0.0

# #     h, w = img.shape[:2]

# #     center = (
# #         w // 2,
# #         h // 2
# #     )

# #     matrix = cv2.getRotationMatrix2D(
# #         center,
# #         angle,
# #         1.0
# #     )

# #     rotated = cv2.warpAffine(
# #         img,
# #         matrix,
# #         (
# #             w,
# #             h
# #         ),
# #         flags=cv2.INTER_CUBIC,
# #         borderMode=cv2.BORDER_REPLICATE
# #     )

# #     return (
# #         rotated,
# #         float(angle)
# #     )


# # # ============================================================================
# # # STEP 2C — PERSPECTIVE CORRECTION + CROP
# # # ============================================================================

# # def deskew_and_crop(
# #     img: np.ndarray,
# #     cfg: PreprocessConfig
# # ):
# #     """
# #     Detect package boundary and perform perspective correction.

# #     Returns
# #     -------
# #     processed_img
# #     boundary_detected
# #     method
# #     angle
# #     """

# #     quad = _find_boundary_quad(
# #         img,
# #         cfg
# #     )

# #     # ------------------------------------------------------------------------
# #     # Perspective warp
# #     # ------------------------------------------------------------------------

# #     if quad is not None:

# #         tl, tr, br, bl = quad

# #         width_a = np.linalg.norm(
# #             br - bl
# #         )

# #         width_b = np.linalg.norm(
# #             tr - tl
# #         )

# #         max_width = max(
# #             int(width_a),
# #             int(width_b)
# #         )

# #         height_a = np.linalg.norm(
# #             tr - br
# #         )

# #         height_b = np.linalg.norm(
# #             tl - bl
# #         )

# #         max_height = max(
# #             int(height_a),
# #             int(height_b)
# #         )

# #         if (
# #             max_width < 10
# #             or max_height < 10
# #         ):

# #             rotated, angle = _rotation_only_deskew(
# #                 img,
# #                 cfg
# #             )

# #             return (
# #                 rotated,
# #                 False,
# #                 "rotation_only",
# #                 angle
# #             )

# #         destination = np.array(
# #             [
# #                 [0, 0],
# #                 [max_width - 1, 0],
# #                 [max_width - 1, max_height - 1],
# #                 [0, max_height - 1]
# #             ],
# #             dtype=np.float32
# #         )

# #         matrix = cv2.getPerspectiveTransform(
# #             quad,
# #             destination
# #         )

# #         warped = cv2.warpPerspective(
# #             img,
# #             matrix,
# #             (
# #                 max_width,
# #                 max_height
# #             ),
# #             flags=cv2.INTER_CUBIC,
# #             borderMode=cv2.BORDER_REPLICATE
# #         )

# #         return (
# #             warped,
# #             True,
# #             "perspective_warp",
# #             0.0
# #         )

# #     # ------------------------------------------------------------------------
# #     # Fallback
# #     # ------------------------------------------------------------------------

# #     rotated, angle = _rotation_only_deskew(
# #         img,
# #         cfg
# #     )

# #     return (
# #         rotated,
# #         False,
# #         "rotation_only",
# #         angle
# #     )


# # # ============================================================================
# # # STEP 3 — MILD DENOISING
# # # ============================================================================

# # def denoise(
# #     img: np.ndarray,
# #     cfg: PreprocessConfig
# # ) -> np.ndarray:
# #     """
# #     Very mild denoising.

# #     The goal is to remove sensor/compression noise while preserving
# #     printed character boundaries.
# #     """

# #     return cv2.fastNlMeansDenoisingColored(
# #         img,
# #         None,
# #         h=cfg.denoise_h,
# #         hColor=cfg.denoise_h_color,
# #         templateWindowSize=cfg.denoise_template_window,
# #         searchWindowSize=cfg.denoise_search_window
# #     )


# # # ============================================================================
# # # STEP 4 — ILLUMINATION ESTIMATION
# # # ============================================================================

# # def _estimate_illumination(
# #     luminance: np.ndarray,
# #     cfg: PreprocessConfig
# # ) -> np.ndarray:
# #     """
# #     Estimate the broad illumination field.

# #     The idea is:

# #         observed image =
# #             surface/detail * illumination

# #     We estimate illumination using a large Gaussian blur.

# #     Because the blur is much larger than individual characters,
# #     small printed details are mostly preserved outside the illumination
# #     estimate.
# #     """

# #     h, w = luminance.shape[:2]

# #     min_dimension = min(
# #         h,
# #         w
# #     )

# #     sigma = max(
# #         15.0,
# #         min_dimension *
# #         cfg.illumination_sigma_fraction
# #     )

# #     background = cv2.GaussianBlur(
# #         luminance,
# #         (
# #             0,
# #             0
# #         ),
# #         sigmaX=sigma,
# #         sigmaY=sigma
# #     )

# #     # Avoid division by very small values.
# #     background = np.maximum(
# #         background,
# #         cfg.illumination_min_background
# #     )

# #     return background


# # # ============================================================================
# # # STEP 4A — ILLUMINATION CORRECTION
# # # ============================================================================

# # def correct_illumination(
# #     img: np.ndarray,
# #     cfg: PreprocessConfig
# # ) -> np.ndarray:
# #     """
# #     Correct broad uneven lighting while keeping the image natural.

# #     This replaces aggressive CLAHE + glare inpainting.

# #     The correction is intentionally blended with the original luminance.
# #     """

# #     # ------------------------------------------------------------------------
# #     # LAB separates luminance from color reasonably well.
# #     # ------------------------------------------------------------------------

# #     lab = cv2.cvtColor(
# #         img,
# #         cv2.COLOR_BGR2LAB
# #     )

# #     l, a, b = cv2.split(
# #         lab
# #     )

# #     # Convert to float
# #     l_float = l.astype(
# #         np.float32
# #     )

# #     # ------------------------------------------------------------------------
# #     # Estimate broad illumination field
# #     # ------------------------------------------------------------------------

# #     background = _estimate_illumination(
# #         l_float,
# #         cfg
# #     )

# #     # ------------------------------------------------------------------------
# #     # Determine a stable reference brightness.
# #     #
# #     # Median is more robust than mean because bright printed text and
# #     # reflections should not dominate the value.
# #     # ------------------------------------------------------------------------

# #     reference = float(
# #         np.median(
# #             background
# #         )
# #     )

# #     reference = max(
# #         reference,
# #         cfg.illumination_min_background
# #     )

# #     # ------------------------------------------------------------------------
# #     # Division-based illumination normalization
# #     # ------------------------------------------------------------------------

# #     normalized = (
# #         l_float /
# #         background
# #     ) * reference

# #     normalized = np.clip(
# #         normalized,
# #         0,
# #         255
# #     )

# #     # ------------------------------------------------------------------------
# #     # Blend with original.
# #     #
# #     # This is VERY important.
# #     #
# #     # Full normalization can make an image look unnatural.
# #     # ------------------------------------------------------------------------

# #     strength = np.clip(
# #         cfg.illumination_strength,
# #         0.0,
# #         1.0
# #     )

# #     corrected_l = (
# #         (1.0 - strength) *
# #         l_float
# #         +
# #         strength *
# #         normalized
# #     )

# #     corrected_l = np.clip(
# #         corrected_l,
# #         0,
# #         255
# #     ).astype(
# #         np.uint8
# #     )

# #     # ------------------------------------------------------------------------
# #     # Reconstruct LAB image.
# #     #
# #     # a/b channels remain untouched, so package colors are preserved.
# #     # ------------------------------------------------------------------------

# #     corrected_lab = cv2.merge(
# #         (
# #             corrected_l,
# #             a,
# #             b
# #         )
# #     )

# #     corrected = cv2.cvtColor(
# #         corrected_lab,
# #         cv2.COLOR_LAB2BGR
# #     )

# #     return corrected


# # # ============================================================================
# # # STEP 5 — GLARE DETECTION ONLY
# # # ============================================================================

# # def detect_glare(
# #     img: np.ndarray,
# #     cfg: PreprocessConfig
# # ):
# #     """
# #     Detect obvious specular highlights.

# #     IMPORTANT:
# #         This function DOES NOT alter the image.

# #     It only returns:

# #         glare_area_fraction
# #         glare_mask

# #     This is intentional.

# #     A white printed declaration and a specular reflection can both contain
# #     very bright pixels. Automatically inpainting these regions risks
# #     destroying the actual legal declarations.
# #     """

# #     hsv = cv2.cvtColor(
# #         img,
# #         cv2.COLOR_BGR2HSV
# #     )

# #     _, saturation, value = cv2.split(
# #         hsv
# #     )

# #     # ------------------------------------------------------------------------
# #     # Candidate highlight mask
# #     # ------------------------------------------------------------------------

# #     mask = (
# #         (value >= cfg.glare_value_thresh)
# #         &
# #         (saturation <= cfg.glare_sat_thresh)
# #     ).astype(
# #         np.uint8
# #     ) * 255

# #     # ------------------------------------------------------------------------
# #     # Remove tiny isolated pixels
# #     # ------------------------------------------------------------------------

# #     kernel = cv2.getStructuringElement(
# #         cv2.MORPH_ELLIPSE,
# #         (5, 5)
# #     )

# #     mask = cv2.morphologyEx(
# #         mask,
# #         cv2.MORPH_OPEN,
# #         kernel
# #     )

# #     # ------------------------------------------------------------------------
# #     # Keep only meaningful connected components.
# #     # ------------------------------------------------------------------------

# #     contours, _ = cv2.findContours(
# #         mask,
# #         cv2.RETR_EXTERNAL,
# #         cv2.CHAIN_APPROX_SIMPLE
# #     )

# #     clean_mask = np.zeros_like(
# #         mask
# #     )

# #     for contour in contours:

# #         area = cv2.contourArea(
# #             contour
# #         )

# #         if area < cfg.glare_min_area_px:
# #             continue

# #         cv2.drawContours(
# #             clean_mask,
# #             [contour],
# #             -1,
# #             255,
# #             thickness=cv2.FILLED
# #         )

# #     glare_fraction = (
# #         float(
# #             np.count_nonzero(
# #                 clean_mask
# #             )
# #         )
# #         /
# #         float(
# #             clean_mask.size
# #         )
# #     )

# #     return (
# #         glare_fraction,
# #         clean_mask
# #     )


# # # ============================================================================
# # # STEP 6 — SHARPNESS
# # # ============================================================================

# # def sharpness_score(
# #     img: np.ndarray
# # ) -> float:
# #     """
# #     Calculate sharpness using variance of Laplacian.
# #     """

# #     gray = cv2.cvtColor(
# #         img,
# #         cv2.COLOR_BGR2GRAY
# #     )

# #     return float(
# #         cv2.Laplacian(
# #             gray,
# #             cv2.CV_64F
# #         ).var()
# #     )


# # # ============================================================================
# # # OPTIONAL DEBUG IMAGE SAVING
# # # ============================================================================

# # def _save_debug_image(
# #     image: np.ndarray,
# #     filename: str,
# #     cfg: PreprocessConfig
# # ):
# #     """
# #     Save an intermediate image when debugging is enabled.
# #     """

# #     if not cfg.save_intermediate_images:
# #         return

# #     os.makedirs(
# #         cfg.debug_output_dir,
# #         exist_ok=True
# #     )

# #     path = os.path.join(
# #         cfg.debug_output_dir,
# #         filename
# #     )

# #     success = cv2.imwrite(
# #         path,
# #         image
# #     )

# #     if not success:
# #         raise PreprocessingError(
# #             f"Could not save debug image: {path}"
# #         )


# # # ============================================================================
# # # COMPLETE PIPELINE
# # # ============================================================================

# # def preprocess(
# #     image_bytes: bytes,
# #     cfg: Optional[PreprocessConfig] = None
# # ):
# #     """
# #     Execute the complete Stage 2 preprocessing pipeline.

# #     Pipeline
# #     --------

# #         Raw image
# #              |
# #              v
# #         Decode
# #              |
# #              v
# #         Boundary detection
# #              |
# #              v
# #         Perspective correction
# #              |
# #              v
# #         Mild denoising
# #              |
# #              v
# #         Illumination correction
# #              |
# #              v
# #         Glare measurement
# #              |
# #              v
# #         Quality gate
# #              |
# #              v
# #         Final Stage 2 image

# #     Returns
# #     -------

# #         output_bgr_image
# #         metadata
# #     """

# #     cfg = cfg or PreprocessConfig()

# #     # ========================================================================
# #     # 1. DECODE
# #     # ========================================================================

# #     img = decode_image(
# #         image_bytes
# #     )

# #     original_height, original_width = img.shape[:2]

# #     # ========================================================================
# #     # 2. BOUNDARY DETECTION + PERSPECTIVE CORRECTION
# #     # ========================================================================

# #     warped, boundary_detected, method, angle = deskew_and_crop(
# #         img,
# #         cfg
# #     )

# #     _save_debug_image(
# #         warped,
# #         "01_warped.png",
# #         cfg
# #     )

# #     # ========================================================================
# #     # 3. MILD DENOISING
# #     # ========================================================================

# #     denoised = denoise(
# #         warped,
# #         cfg
# #     )

# #     _save_debug_image(
# #         denoised,
# #         "02_denoised.png",
# #         cfg
# #     )

# #     # ========================================================================
# #     # 4. ILLUMINATION CORRECTION
# #     # ========================================================================

# #     illumination_corrected = correct_illumination(
# #         denoised,
# #         cfg
# #     )

# #     _save_debug_image(
# #         illumination_corrected,
# #         "03_illumination_corrected.png",
# #         cfg
# #     )

# #     # ========================================================================
# #     # 5. GLARE DETECTION
# #     #
# #     # IMPORTANT:
# #     #
# #     # We only measure glare.
# #     #
# #     # We do NOT modify the image.
# #     # ========================================================================

# #     glare_fraction, glare_mask = detect_glare(
# #         illumination_corrected,
# #         cfg
# #     )

# #     _save_debug_image(
# #         glare_mask,
# #         "05_glare_mask.png",
# #         cfg
# #     )

# #     # ========================================================================
# #     # 6. FINAL OUTPUT
# #     # ========================================================================

# #     final_image = illumination_corrected

# #     _save_debug_image(
# #         final_image,
# #         "04_final.png",
# #         cfg
# #     )

# #     # ========================================================================
# #     # 7. OUTPUT DIMENSIONS
# #     # ========================================================================

# #     output_height, output_width = final_image.shape[:2]

# #     # ========================================================================
# #     # 8. SHARPNESS
# #     # ========================================================================

# #     sharpness = sharpness_score(
# #         final_image
# #     )

# #     # ========================================================================
# #     # 9. QUALITY CHECKS
# #     # ========================================================================

# #     reasons = []

# #     # ------------------------------------------------------------------------
# #     # Resolution
# #     # ------------------------------------------------------------------------

# #     if (
# #         output_width < cfg.min_output_width
# #         or
# #         output_height < cfg.min_output_height
# #     ):

# #         reasons.append(
# #             f"Resolution too low "
# #             f"({output_width}x{output_height}); "
# #             f"minimum is "
# #             f"{cfg.min_output_width}x"
# #             f"{cfg.min_output_height}. "
# #             f"Re-capture closer to the label."
# #         )

# #     # ------------------------------------------------------------------------
# #     # Sharpness
# #     # ------------------------------------------------------------------------

# #     if sharpness < cfg.min_sharpness_score:

# #         reasons.append(
# #             f"Image too blurry "
# #             f"(sharpness={sharpness:.1f}, "
# #             f"minimum={cfg.min_sharpness_score}). "
# #             f"Hold the camera steady and re-capture."
# #         )

# #     # ------------------------------------------------------------------------
# #     # Glare
# #     # ------------------------------------------------------------------------

# #     if glare_fraction > cfg.max_glare_area_frac:

# #         reasons.append(
# #             f"Excessive glare "
# #             f"({glare_fraction * 100:.1f}% of frame). "
# #             f"Reposition the camera to reduce reflections "
# #             f"and re-capture."
# #         )

# #     # ------------------------------------------------------------------------
# #     # Boundary detection
# #     # ------------------------------------------------------------------------

# #     if not boundary_detected:

# #         reasons.append(
# #             "Package/label boundary could not be confidently detected; "
# #             "only rotation-based deskew was applied. "
# #             "Consider re-capturing with the full label in frame against "
# #             "a contrasting background."
# #         )

# #     # ========================================================================
# #     # 10. USABILITY
# #     #
# #     # Boundary failure is treated as a warning.
# #     #
# #     # Resolution, blur and excessive glare are hard rejection conditions.
# #     # ========================================================================

# #     hard_rejection_reasons = [
# #         reason
# #         for reason in reasons
# #         if "boundary" not in reason.lower()
# #     ]

# #     usable = (
# #         len(hard_rejection_reasons) == 0
# #     )

# #     # ========================================================================
# #     # 11. METADATA
# #     # ========================================================================

# #     metadata = PreprocessMetadata(

# #         original_width=original_width,

# #         original_height=original_height,

# #         output_width=output_width,

# #         output_height=output_height,

# #         boundary_detected=boundary_detected,

# #         deskew_method=method,

# #         rotation_angle_deg=round(
# #             angle,
# #             3
# #         ),

# #         sharpness_score=round(
# #             sharpness,
# #             2
# #         ),

# #         glare_area_fraction=round(
# #             glare_fraction,
# #             4
# #         ),

# #         usable=usable,

# #         reject_reasons=reasons
# #     )

# #     # ========================================================================
# #     # 12. RETURN
# #     # ========================================================================

# #     return (
# #         final_image,
# #         metadata
# #     )
# """
# Stage 2 — Image Preprocessing Pipeline
# Legal Metrology / Packaged Commodities Compliance System
# """


# from __future__ import annotations

# import os

# import cv2
# import numpy as np

# from dataclasses import dataclass, field, asdict
# from typing import Optional


# @dataclass
# class PreprocessConfig:

#     resize_width_for_detection: int = 1000

#     canny_low: int = 50
#     canny_high: int = 150

#     dilate_kernel: int = 5

#     min_contour_area_frac: float = 0.15

#     approx_poly_epsilon_frac: float = 0.02

#     denoise_h: float = 3.0
#     denoise_h_color: float = 3.0

#     denoise_template_window: int = 7
#     denoise_search_window: int = 21

#     illumination_strength: float = 0.45

#     illumination_sigma_fraction: float = 0.08

#     illumination_min_background: float = 20.0

#     glare_value_thresh: int = 245
#     glare_sat_thresh: int = 45

#     glare_min_area_px: int = 40

#     min_output_width: int = 600
#     min_output_height: int = 400

#     min_sharpness_score: float = 60.0

#     max_glare_area_frac: float = 0.25

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

#     reject_reasons: list = field(default_factory=list)

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
#         raise PreprocessingError("Could not decode image — unsupported format or corrupt file.")

#     return img


# def _order_points(pts: np.ndarray) -> np.ndarray:

#     rect = np.zeros((4, 2), dtype=np.float32)

#     s = pts.sum(axis=1)

#     rect[0] = pts[np.argmin(s)]
#     rect[2] = pts[np.argmax(s)]

#     diff = np.diff(pts, axis=1)

#     rect[1] = pts[np.argmin(diff)]
#     rect[3] = pts[np.argmax(diff)]

#     return rect


# def _line_intersection(p1, p2, p3, p4) -> Optional[np.ndarray]:
#     """
#     Intersect line (p1,p2) with line (p3,p4). Returns None if parallel.
#     """

#     x1, y1 = p1
#     x2, y2 = p2
#     x3, y3 = p3
#     x4, y4 = p4

#     denom = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)

#     if abs(denom) < 1e-6:
#         return None

#     px = ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / denom
#     py = ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / denom

#     return np.array([px, py], dtype=np.float32)


# def _refine_edge_line(
#     gray: np.ndarray,
#     p1: np.ndarray,
#     p2: np.ndarray,
#     band_half_width: int = 20,
#     margin_frac: float = 0.1,
#     min_contrast: float = 15.0
# ):
#     """
#     Refine a coarse edge (p1 -> p2, e.g. from a downscaled quad) by locating
#     the true intensity edge along the local normal direction at points sampled
#     along the edge, then fitting a straight line through those sub-pixel edge
#     locations.

#     This corrects the systematic error introduced by detecting the boundary
#     on a downscaled image and rescaling the quad back to full resolution,
#     which otherwise leaves background/adjacent-surface pixels inside the crop.

#     Falls back to the original (p1, p2) if there isn't enough confident
#     edge evidence.
#     """

#     h, w = gray.shape[:2]

#     p1 = np.asarray(p1, dtype=np.float32)
#     p2 = np.asarray(p2, dtype=np.float32)

#     edge_vec = p2 - p1
#     length = float(np.linalg.norm(edge_vec))

#     if length < 5:
#         return p1, p2

#     unit = edge_vec / length
#     normal = np.array([-unit[1], unit[0]], dtype=np.float32)

#     margin = length * margin_frac
#     length_eff = length - 2 * margin

#     if length_eff < 5:
#         margin = 0.0
#         length_eff = length

#     num_samples = max(20, int(length_eff))
#     ts = np.linspace(margin, margin + length_eff, num_samples)

#     offs = np.arange(-band_half_width, band_half_width + 1)

#     sample_ts = []
#     sample_offsets = []

#     for t in ts:

#         center = p1 + unit * t

#         best_off = None
#         best_grad = -1.0

#         for off in offs:

#             pt_a = center + normal * (off - 1)
#             pt_b = center + normal * (off + 1)

#             xa, ya = int(round(pt_a[0])), int(round(pt_a[1]))
#             xb, yb = int(round(pt_b[0])), int(round(pt_b[1]))

#             if xa < 0 or ya < 0 or xa >= w or ya >= h:
#                 continue
#             if xb < 0 or yb < 0 or xb >= w or yb >= h:
#                 continue

#             grad = abs(int(gray[yb, xb]) - int(gray[ya, xa]))

#             if grad > best_grad:
#                 best_grad = grad
#                 best_off = off

#         if best_off is not None and best_grad >= min_contrast:
#             sample_ts.append(t)
#             sample_offsets.append(best_off)

#     # Not enough confident edge evidence — keep the original coarse edge.
#     if len(sample_ts) < max(6, int(0.2 * num_samples)):
#         return p1, p2

#     sample_ts = np.array(sample_ts, dtype=np.float32)
#     sample_offsets = np.array(sample_offsets, dtype=np.float32)

#     # Robust outlier rejection (median absolute deviation) before the fit.
#     med = np.median(sample_offsets)
#     mad = np.median(np.abs(sample_offsets - med)) + 1e-6

#     keep = np.abs(sample_offsets - med) < 4 * mad

#     if keep.sum() < max(6, int(0.2 * num_samples)):
#         return p1, p2

#     sample_ts = sample_ts[keep]
#     sample_offsets = sample_offsets[keep]

#     a, b = np.polyfit(sample_ts, sample_offsets, 1)

#     t0, t1 = margin, margin + length_eff

#     q1 = p1 + unit * t0 + normal * (a * t0 + b)
#     q2 = p1 + unit * t1 + normal * (a * t1 + b)

#     return q1, q2


# def _refine_quad_corners(
#     img: np.ndarray,
#     quad: np.ndarray,
#     max_corner_shift: float = 60.0
# ) -> np.ndarray:
#     """
#     Refine the four coarse corners of a boundary quad by fitting straight
#     lines to each of the four edges (using the full-resolution image) and
#     re-intersecting adjacent edges.

#     This replaces trusting the four corner points directly, which are
#     imprecise because the initial quad was found on a downscaled image.

#     Each refined corner is sanity-clamped to max_corner_shift pixels from
#     its original position; if refinement pushes a corner further than that,
#     the original corner is kept instead.
#     """

#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#     gray = cv2.GaussianBlur(gray, (3, 3), 0)

#     tl, tr, br, bl = quad

#     top1, top2 = _refine_edge_line(gray, tl, tr)
#     right1, right2 = _refine_edge_line(gray, tr, br)
#     bottom1, bottom2 = _refine_edge_line(gray, br, bl)
#     left1, left2 = _refine_edge_line(gray, bl, tl)

#     candidates = {
#         "tl": (_line_intersection(left1, left2, top1, top2), tl),
#         "tr": (_line_intersection(top1, top2, right1, right2), tr),
#         "br": (_line_intersection(right1, right2, bottom1, bottom2), br),
#         "bl": (_line_intersection(bottom1, bottom2, left1, left2), bl),
#     }

#     refined = []

#     for key in ("tl", "tr", "br", "bl"):

#         candidate, original = candidates[key]

#         if candidate is None:
#             refined.append(original)
#             continue

#         if np.linalg.norm(candidate - original) > max_corner_shift:
#             refined.append(original)
#             continue

#         refined.append(candidate)

#     refined = np.array(refined, dtype=np.float32)

#     # ------------------------------------------------------------------------
#     # Defensive inward safety margin.
#     #
#     # On damaged/torn packaging (frayed cardboard corners, dented edges)
#     # there is no single well-defined "true" edge for the line fit above to
#     # lock onto — on this kind of package the refinement can end up landing
#     # on the true outer edge of the box (including frayed material) rather
#     # than tightening the crop, or in rarer cases can drift toward a nearby
#     # stronger edge such as the tabletop. Shrinking every corner slightly
#     # toward the quad's centroid costs a small amount of the package's own
#     # (normally blank) border margin, but reliably trades that off against
#     # the much costlier failure mode of background/adjacent-surface bleeding
#     # into the crop.
#     # ------------------------------------------------------------------------

#     centroid = refined.mean(axis=0)
#     safety_shrink_frac = 0.012
#     refined = refined + (centroid - refined) * safety_shrink_frac

#     return refined


# def _find_boundary_quad(img: np.ndarray, cfg: PreprocessConfig) -> Optional[np.ndarray]:

#     h, w = img.shape[:2]

#     if w <= 0 or h <= 0:
#         return None

#     scale = cfg.resize_width_for_detection / float(w)

#     small_width = cfg.resize_width_for_detection

#     small_height = max(1, int(h * scale))

#     small = cv2.resize(img, (small_width, small_height), interpolation=cv2.INTER_AREA)

#     gray = cv2.cvtColor(small, cv2.COLOR_BGR2GRAY)

#     gray = cv2.GaussianBlur(gray, (5, 5), 0)

#     edges = cv2.Canny(gray, cfg.canny_low, cfg.canny_high)

#     kernel = np.ones((cfg.dilate_kernel, cfg.dilate_kernel), dtype=np.uint8)

#     edges = cv2.dilate(edges, kernel, iterations=1)

#     contours, _ = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

#     if not contours:
#         return None

#     small_area = small.shape[0] * small.shape[1]

#     contours = sorted(contours, key=cv2.contourArea, reverse=True)[:10]

#     for contour in contours:

#         area = cv2.contourArea(contour)

#         if area < (cfg.min_contour_area_frac * small_area):
#             continue

#         perimeter = cv2.arcLength(contour, True)

#         approx = cv2.approxPolyDP(contour, cfg.approx_poly_epsilon_frac * perimeter, True)

#         if len(approx) == 4 and cv2.isContourConvex(approx):

#             points = approx.reshape(4, 2).astype(np.float32)

#             points /= scale

#             return _order_points(points)

#     return None


# def _rotation_only_deskew(img: np.ndarray, cfg: PreprocessConfig):

#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

#     threshold = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)[1]

#     coords = cv2.findNonZero(threshold)

#     if coords is None:
#         return img, 0.0

#     angle = cv2.minAreaRect(coords)[-1]

#     if angle < -45:
#         angle = 90 + angle

#     if abs(angle) < 0.1:
#         return img, 0.0

#     h, w = img.shape[:2]

#     center = (w // 2, h // 2)

#     matrix = cv2.getRotationMatrix2D(center, angle, 1.0)

#     rotated = cv2.warpAffine(img, matrix, (w, h), flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)

#     return rotated, float(angle)


# def deskew_and_crop(img: np.ndarray, cfg: PreprocessConfig):

#     quad = _find_boundary_quad(img, cfg)

#     if quad is not None:

#         # The quad above was found on a downscaled copy and rescaled back up,
#         # which leaves a systematic corner error (background/adjacent-surface
#         # bleed into the crop). Refine each edge against the full-resolution
#         # image before warping.
#         quad = _refine_quad_corners(img, quad)

#         tl, tr, br, bl = quad

#         width_a = np.linalg.norm(br - bl)
#         width_b = np.linalg.norm(tr - tl)

#         max_width = max(int(width_a), int(width_b))

#         height_a = np.linalg.norm(tr - br)
#         height_b = np.linalg.norm(tl - bl)

#         max_height = max(int(height_a), int(height_b))

#         if max_width < 10 or max_height < 10:

#             rotated, angle = _rotation_only_deskew(img, cfg)

#             return rotated, False, "rotation_only", angle

#         destination = np.array(
#             [
#                 [0, 0],
#                 [max_width - 1, 0],
#                 [max_width - 1, max_height - 1],
#                 [0, max_height - 1]
#             ],
#             dtype=np.float32
#         )

#         matrix = cv2.getPerspectiveTransform(quad, destination)

#         warped = cv2.warpPerspective(
#             img, matrix, (max_width, max_height),
#             flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE
#         )

#         return warped, True, "perspective_warp", 0.0

#     rotated, angle = _rotation_only_deskew(img, cfg)

#     return rotated, False, "rotation_only", angle


# def denoise(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:

#     return cv2.fastNlMeansDenoisingColored(
#         img, None, h=cfg.denoise_h, hColor=cfg.denoise_h_color,
#         templateWindowSize=cfg.denoise_template_window,
#         searchWindowSize=cfg.denoise_search_window
#     )


# def _estimate_illumination(luminance: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:

#     h, w = luminance.shape[:2]

#     min_dimension = min(h, w)

#     sigma = max(15.0, min_dimension * cfg.illumination_sigma_fraction)

#     background = cv2.GaussianBlur(luminance, (0, 0), sigmaX=sigma, sigmaY=sigma)

#     background = np.maximum(background, cfg.illumination_min_background)

#     return background


# def correct_illumination(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:

#     lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)

#     l, a, b = cv2.split(lab)

#     l_float = l.astype(np.float32)

#     background = _estimate_illumination(l_float, cfg)

#     reference = float(np.median(background))

#     reference = max(reference, cfg.illumination_min_background)

#     normalized = (l_float / background) * reference

#     normalized = np.clip(normalized, 0, 255)

#     strength = np.clip(cfg.illumination_strength, 0.0, 1.0)

#     corrected_l = (1.0 - strength) * l_float + strength * normalized

#     corrected_l = np.clip(corrected_l, 0, 255).astype(np.uint8)

#     corrected_lab = cv2.merge((corrected_l, a, b))

#     corrected = cv2.cvtColor(corrected_lab, cv2.COLOR_LAB2BGR)

#     return corrected


# def detect_glare(img: np.ndarray, cfg: PreprocessConfig):

#     hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

#     _, saturation, value = cv2.split(hsv)

#     raw_mask = ((value >= cfg.glare_value_thresh) & (saturation <= cfg.glare_sat_thresh)).astype(np.uint8) * 255

#     # Glossy plastic/laminate packaging produces pinpoint specular glints
#     # only 1-3px wide. A 5x5 open erases those entirely before they're ever
#     # counted, silently zeroing glare_area_fraction even on a visibly
#     # speckled label. A 2x2 open still removes true single-pixel sensor
#     # noise while preserving genuine small glints.
#     denoise_kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (2, 2))

#     raw_mask = cv2.morphologyEx(raw_mask, cv2.MORPH_OPEN, denoise_kernel)

#     # glare_area_fraction (used for the quality gate) is measured from this
#     # lightly-denoised mask, so it reflects ALL candidate glare pixels —
#     # including scattered pinpoints — not just large contiguous blobs.
#     glare_fraction = float(np.count_nonzero(raw_mask)) / float(raw_mask.size)

#     # A separate blob mask (sizeable contiguous regions only, via the
#     # original min-area filter) is still built for visualization/debugging,
#     # then unioned with the raw pinpoints so the debug overlay also shows
#     # glints that never formed a 40px+ blob.
#     kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))

#     opened_for_blobs = cv2.morphologyEx(raw_mask, cv2.MORPH_OPEN, kernel)

#     contours, _ = cv2.findContours(opened_for_blobs, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

#     clean_mask = np.zeros_like(raw_mask)

#     for contour in contours:

#         area = cv2.contourArea(contour)

#         if area < cfg.glare_min_area_px:
#             continue

#         cv2.drawContours(clean_mask, [contour], -1, 255, thickness=cv2.FILLED)

#     clean_mask = cv2.bitwise_or(clean_mask, raw_mask)

#     return glare_fraction, clean_mask


# def sharpness_score(img: np.ndarray) -> float:

#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

#     return float(cv2.Laplacian(gray, cv2.CV_64F).var())


# def _save_debug_image(image: np.ndarray, filename: str, cfg: PreprocessConfig):

#     if not cfg.save_intermediate_images:
#         return

#     os.makedirs(cfg.debug_output_dir, exist_ok=True)

#     path = os.path.join(cfg.debug_output_dir, filename)

#     success = cv2.imwrite(path, image)

#     if not success:
#         raise PreprocessingError(f"Could not save debug image: {path}")


# def preprocess(image_bytes: bytes, cfg: Optional[PreprocessConfig] = None):

#     cfg = cfg or PreprocessConfig()

#     img = decode_image(image_bytes)

#     original_height, original_width = img.shape[:2]

#     warped, boundary_detected, method, angle = deskew_and_crop(img, cfg)

#     _save_debug_image(warped, "01_warped.png", cfg)

#     denoised = denoise(warped, cfg)

#     _save_debug_image(denoised, "02_denoised.png", cfg)

#     illumination_corrected = correct_illumination(denoised, cfg)

#     _save_debug_image(illumination_corrected, "03_illumination_corrected.png", cfg)

#     glare_fraction, glare_mask = detect_glare(illumination_corrected, cfg)

#     _save_debug_image(glare_mask, "05_glare_mask.png", cfg)

#     final_image = illumination_corrected

#     _save_debug_image(final_image, "04_final.png", cfg)

#     output_height, output_width = final_image.shape[:2]

#     sharpness = sharpness_score(final_image)

#     reasons = []

#     if output_width < cfg.min_output_width or output_height < cfg.min_output_height:
#         reasons.append(
#             f"Resolution too low ({output_width}x{output_height}); "
#             f"minimum is {cfg.min_output_width}x{cfg.min_output_height}. Re-capture closer to the label."
#         )

#     if sharpness < cfg.min_sharpness_score:
#         reasons.append(
#             f"Image too blurry (sharpness={sharpness:.1f}, minimum={cfg.min_sharpness_score}). "
#             f"Hold the camera steady and re-capture."
#         )

#     if glare_fraction > cfg.max_glare_area_frac:
#         reasons.append(
#             f"Excessive glare ({glare_fraction * 100:.1f}% of frame). "
#             f"Reposition the camera to reduce reflections and re-capture."
#         )

#     if not boundary_detected:
#         reasons.append(
#             "Package/label boundary could not be confidently detected; only rotation-based deskew was applied. "
#             "Consider re-capturing with the full label in frame against a contrasting background."
#         )

#     hard_rejection_reasons = [r for r in reasons if "boundary" not in r.lower()]

#     usable = len(hard_rejection_reasons) == 0

#     metadata = PreprocessMetadata(
#         original_width=original_width,
#         original_height=original_height,
#         output_width=output_width,
#         output_height=output_height,
#         boundary_detected=boundary_detected,
#         deskew_method=method,
#         rotation_angle_deg=round(angle, 3),
#         sharpness_score=round(sharpness, 2),
#         glare_area_fraction=round(glare_fraction, 4),
#         usable=usable,
#         reject_reasons=reasons
#     )

#     return final_image, metadata
"""
Stage 2 — Image Preprocessing Pipeline
Legal Metrology / Packaged Commodities Compliance System
"""


from __future__ import annotations

import os

import cv2
import numpy as np

from dataclasses import dataclass, field, asdict
from typing import Optional


@dataclass
class PreprocessConfig:

    resize_width_for_detection: int = 1000

    canny_low: int = 50
    canny_high: int = 150

    dilate_kernel: int = 5

    min_contour_area_frac: float = 0.15

    approx_poly_epsilon_frac: float = 0.02

    denoise_h: float = 3.0
    denoise_h_color: float = 3.0

    denoise_template_window: int = 7
    denoise_search_window: int = 21

    # Lowered from 0.45: at the old default this measurably washed out
    # navy-vs-white text contrast (confirmed via Laplacian-variance sharpness
    # dropping ~29% at this stage alone on a real test photo) whenever the
    # "illumination" being corrected was actually partly the text pattern
    # itself (see illumination_sigma_fraction below). 0.15 keeps genuine
    # large-scale lighting gradients softened without hurting legibility.
    illumination_strength: float = 0.15

    # Raised from 0.08: at 0.08 the background-estimation blur radius
    # (~8% of the shorter image dimension) was close to the scale of the
    # printed text lines themselves, so the "background" map partly
    # captured the text pattern instead of pure illumination. 0.15 keeps
    # the blur comfortably larger than typical label text rows.
    illumination_sigma_fraction: float = 0.15

    illumination_min_background: float = 20.0

    glare_value_thresh: int = 245
    glare_sat_thresh: int = 45

    glare_min_area_px: int = 40

    min_output_width: int = 600
    min_output_height: int = 400

    min_sharpness_score: float = 60.0

    max_glare_area_frac: float = 0.25

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

    reject_reasons: list = field(default_factory=list)

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


def _line_intersection(p1, p2, p3, p4) -> Optional[np.ndarray]:
    """
    Intersect line (p1,p2) with line (p3,p4). Returns None if parallel.
    """

    x1, y1 = p1
    x2, y2 = p2
    x3, y3 = p3
    x4, y4 = p4

    denom = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)

    if abs(denom) < 1e-6:
        return None

    px = ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / denom
    py = ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / denom

    return np.array([px, py], dtype=np.float32)


def _refine_edge_line(
    gray: np.ndarray,
    p1: np.ndarray,
    p2: np.ndarray,
    band_half_width: int = 20,
    margin_frac: float = 0.1,
    min_contrast: float = 15.0
):
    """
    Refine a coarse edge (p1 -> p2, e.g. from a downscaled quad) by locating
    the true intensity edge along the local normal direction at points sampled
    along the edge, then fitting a straight line through those sub-pixel edge
    locations.

    This corrects the systematic error introduced by detecting the boundary
    on a downscaled image and rescaling the quad back to full resolution,
    which otherwise leaves background/adjacent-surface pixels inside the crop.

    Falls back to the original (p1, p2) if there isn't enough confident
    edge evidence.
    """

    h, w = gray.shape[:2]

    p1 = np.asarray(p1, dtype=np.float32)
    p2 = np.asarray(p2, dtype=np.float32)

    edge_vec = p2 - p1
    length = float(np.linalg.norm(edge_vec))

    if length < 5:
        return p1, p2

    unit = edge_vec / length
    normal = np.array([-unit[1], unit[0]], dtype=np.float32)

    margin = length * margin_frac
    length_eff = length - 2 * margin

    if length_eff < 5:
        margin = 0.0
        length_eff = length

    num_samples = max(20, int(length_eff))
    ts = np.linspace(margin, margin + length_eff, num_samples)

    offs = np.arange(-band_half_width, band_half_width + 1)

    sample_ts = []
    sample_offsets = []

    for t in ts:

        center = p1 + unit * t

        best_off = None
        best_grad = -1.0

        for off in offs:

            pt_a = center + normal * (off - 1)
            pt_b = center + normal * (off + 1)

            xa, ya = int(round(pt_a[0])), int(round(pt_a[1]))
            xb, yb = int(round(pt_b[0])), int(round(pt_b[1]))

            if xa < 0 or ya < 0 or xa >= w or ya >= h:
                continue
            if xb < 0 or yb < 0 or xb >= w or yb >= h:
                continue

            grad = abs(int(gray[yb, xb]) - int(gray[ya, xa]))

            if grad > best_grad:
                best_grad = grad
                best_off = off

        if best_off is not None and best_grad >= min_contrast:
            sample_ts.append(t)
            sample_offsets.append(best_off)

    # Not enough confident edge evidence — keep the original coarse edge.
    if len(sample_ts) < max(6, int(0.2 * num_samples)):
        return p1, p2

    sample_ts = np.array(sample_ts, dtype=np.float32)
    sample_offsets = np.array(sample_offsets, dtype=np.float32)

    # Robust outlier rejection (median absolute deviation) before the fit.
    med = np.median(sample_offsets)
    mad = np.median(np.abs(sample_offsets - med)) + 1e-6

    keep = np.abs(sample_offsets - med) < 4 * mad

    if keep.sum() < max(6, int(0.2 * num_samples)):
        return p1, p2

    sample_ts = sample_ts[keep]
    sample_offsets = sample_offsets[keep]

    a, b = np.polyfit(sample_ts, sample_offsets, 1)

    t0, t1 = margin, margin + length_eff

    q1 = p1 + unit * t0 + normal * (a * t0 + b)
    q2 = p1 + unit * t1 + normal * (a * t1 + b)

    return q1, q2


def _refine_quad_corners(
    img: np.ndarray,
    quad: np.ndarray,
    max_corner_shift: float = 60.0
) -> np.ndarray:
    """
    Refine the four coarse corners of a boundary quad by fitting straight
    lines to each of the four edges (using the full-resolution image) and
    re-intersecting adjacent edges.

    This replaces trusting the four corner points directly, which are
    imprecise because the initial quad was found on a downscaled image.

    Each refined corner is sanity-clamped to max_corner_shift pixels from
    its original position; if refinement pushes a corner further than that,
    the original corner is kept instead.
    """

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    gray = cv2.GaussianBlur(gray, (3, 3), 0)

    tl, tr, br, bl = quad

    top1, top2 = _refine_edge_line(gray, tl, tr)
    right1, right2 = _refine_edge_line(gray, tr, br)
    bottom1, bottom2 = _refine_edge_line(gray, br, bl)
    left1, left2 = _refine_edge_line(gray, bl, tl)

    candidates = {
        "tl": (_line_intersection(left1, left2, top1, top2), tl),
        "tr": (_line_intersection(top1, top2, right1, right2), tr),
        "br": (_line_intersection(right1, right2, bottom1, bottom2), br),
        "bl": (_line_intersection(bottom1, bottom2, left1, left2), bl),
    }

    refined = []

    for key in ("tl", "tr", "br", "bl"):

        candidate, original = candidates[key]

        if candidate is None:
            refined.append(original)
            continue

        if np.linalg.norm(candidate - original) > max_corner_shift:
            refined.append(original)
            continue

        refined.append(candidate)

    refined = np.array(refined, dtype=np.float32)

    # ------------------------------------------------------------------------
    # Defensive inward safety margin.
    #
    # On damaged/torn packaging (frayed cardboard corners, dented edges)
    # there is no single well-defined "true" edge for the line fit above to
    # lock onto — on this kind of package the refinement can end up landing
    # on the true outer edge of the box (including frayed material) rather
    # than tightening the crop, or in rarer cases can drift toward a nearby
    # stronger edge such as the tabletop. Shrinking every corner slightly
    # toward the quad's centroid costs a small amount of the package's own
    # (normally blank) border margin, but reliably trades that off against
    # the much costlier failure mode of background/adjacent-surface bleeding
    # into the crop.
    # ------------------------------------------------------------------------

    centroid = refined.mean(axis=0)
    safety_shrink_frac = 0.012
    refined = refined + (centroid - refined) * safety_shrink_frac

    return refined


def _find_boundary_quad(img: np.ndarray, cfg: PreprocessConfig) -> Optional[np.ndarray]:

    h, w = img.shape[:2]

    if w <= 0 or h <= 0:
        return None

    scale = cfg.resize_width_for_detection / float(w)

    small_width = cfg.resize_width_for_detection

    small_height = max(1, int(h * scale))

    small = cv2.resize(img, (small_width, small_height), interpolation=cv2.INTER_AREA)

    gray = cv2.cvtColor(small, cv2.COLOR_BGR2GRAY)

    gray = cv2.GaussianBlur(gray, (5, 5), 0)

    edges = cv2.Canny(gray, cfg.canny_low, cfg.canny_high)

    kernel = np.ones((cfg.dilate_kernel, cfg.dilate_kernel), dtype=np.uint8)

    edges = cv2.dilate(edges, kernel, iterations=1)

    contours, _ = cv2.findContours(edges, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)

    if not contours:
        return None

    small_area = small.shape[0] * small.shape[1]

    contours = sorted(contours, key=cv2.contourArea, reverse=True)[:10]

    for contour in contours:

        area = cv2.contourArea(contour)

        if area < (cfg.min_contour_area_frac * small_area):
            continue

        perimeter = cv2.arcLength(contour, True)

        approx = cv2.approxPolyDP(contour, cfg.approx_poly_epsilon_frac * perimeter, True)

        if len(approx) == 4 and cv2.isContourConvex(approx):

            points = approx.reshape(4, 2).astype(np.float32)

            points /= scale

            return _order_points(points)

    return None


def _rotation_only_deskew(img: np.ndarray, cfg: PreprocessConfig):

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    threshold = cv2.threshold(gray, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)[1]

    coords = cv2.findNonZero(threshold)

    if coords is None:
        return img, 0.0

    angle = cv2.minAreaRect(coords)[-1]

    if angle < -45:
        angle = 90 + angle

    if abs(angle) < 0.1:
        return img, 0.0

    h, w = img.shape[:2]

    center = (w // 2, h // 2)

    matrix = cv2.getRotationMatrix2D(center, angle, 1.0)

    rotated = cv2.warpAffine(img, matrix, (w, h), flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE)

    return rotated, float(angle)


def deskew_and_crop(img: np.ndarray, cfg: PreprocessConfig):

    quad = _find_boundary_quad(img, cfg)

    if quad is not None:

        # The quad above was found on a downscaled copy and rescaled back up,
        # which leaves a systematic corner error (background/adjacent-surface
        # bleed into the crop). Refine each edge against the full-resolution
        # image before warping.
        quad = _refine_quad_corners(img, quad)

        tl, tr, br, bl = quad

        width_a = np.linalg.norm(br - bl)
        width_b = np.linalg.norm(tr - tl)

        max_width = max(int(width_a), int(width_b))

        height_a = np.linalg.norm(tr - br)
        height_b = np.linalg.norm(tl - bl)

        max_height = max(int(height_a), int(height_b))

        if max_width < 10 or max_height < 10:

            rotated, angle = _rotation_only_deskew(img, cfg)

            return rotated, False, "rotation_only", angle

        destination = np.array(
            [
                [0, 0],
                [max_width - 1, 0],
                [max_width - 1, max_height - 1],
                [0, max_height - 1]
            ],
            dtype=np.float32
        )

        matrix = cv2.getPerspectiveTransform(quad, destination)

        warped = cv2.warpPerspective(
            img, matrix, (max_width, max_height),
            flags=cv2.INTER_CUBIC, borderMode=cv2.BORDER_REPLICATE
        )

        return warped, True, "perspective_warp", 0.0

    rotated, angle = _rotation_only_deskew(img, cfg)

    return rotated, False, "rotation_only", angle


def denoise(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:

    return cv2.fastNlMeansDenoisingColored(
        img, None, h=cfg.denoise_h, hColor=cfg.denoise_h_color,
        templateWindowSize=cfg.denoise_template_window,
        searchWindowSize=cfg.denoise_search_window
    )


def _estimate_illumination(luminance: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:

    h, w = luminance.shape[:2]

    min_dimension = min(h, w)

    sigma = max(15.0, min_dimension * cfg.illumination_sigma_fraction)

    background = cv2.GaussianBlur(luminance, (0, 0), sigmaX=sigma, sigmaY=sigma)

    background = np.maximum(background, cfg.illumination_min_background)

    return background


def correct_illumination(img: np.ndarray, cfg: PreprocessConfig) -> np.ndarray:

    lab = cv2.cvtColor(img, cv2.COLOR_BGR2LAB)

    l, a, b = cv2.split(lab)

    l_float = l.astype(np.float32)

    background = _estimate_illumination(l_float, cfg)

    reference = float(np.median(background))

    reference = max(reference, cfg.illumination_min_background)

    normalized = (l_float / background) * reference

    normalized = np.clip(normalized, 0, 255)

    strength = np.clip(cfg.illumination_strength, 0.0, 1.0)

    corrected_l = (1.0 - strength) * l_float + strength * normalized

    corrected_l = np.clip(corrected_l, 0, 255).astype(np.uint8)

    corrected_lab = cv2.merge((corrected_l, a, b))

    corrected = cv2.cvtColor(corrected_lab, cv2.COLOR_LAB2BGR)

    return corrected


def detect_glare(img: np.ndarray, cfg: PreprocessConfig):

    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)

    _, saturation, value = cv2.split(hsv)

    raw_mask = ((value >= cfg.glare_value_thresh) & (saturation <= cfg.glare_sat_thresh)).astype(np.uint8) * 255

    # Glossy plastic/laminate packaging produces pinpoint specular glints
    # only 1-3px wide. A 5x5 open erases those entirely before they're ever
    # counted, silently zeroing glare_area_fraction even on a visibly
    # speckled label. A 2x2 open still removes true single-pixel sensor
    # noise while preserving genuine small glints.
    denoise_kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (2, 2))

    raw_mask = cv2.morphologyEx(raw_mask, cv2.MORPH_OPEN, denoise_kernel)

    # glare_area_fraction (used for the quality gate) is measured from this
    # lightly-denoised mask, so it reflects ALL candidate glare pixels —
    # including scattered pinpoints — not just large contiguous blobs.
    glare_fraction = float(np.count_nonzero(raw_mask)) / float(raw_mask.size)

    # A separate blob mask (sizeable contiguous regions only, via the
    # original min-area filter) is still built for visualization/debugging,
    # then unioned with the raw pinpoints so the debug overlay also shows
    # glints that never formed a 40px+ blob.
    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))

    opened_for_blobs = cv2.morphologyEx(raw_mask, cv2.MORPH_OPEN, kernel)

    contours, _ = cv2.findContours(opened_for_blobs, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    clean_mask = np.zeros_like(raw_mask)

    for contour in contours:

        area = cv2.contourArea(contour)

        if area < cfg.glare_min_area_px:
            continue

        cv2.drawContours(clean_mask, [contour], -1, 255, thickness=cv2.FILLED)

    clean_mask = cv2.bitwise_or(clean_mask, raw_mask)

    return glare_fraction, clean_mask


def sharpness_score(img: np.ndarray) -> float:

    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    return float(cv2.Laplacian(gray, cv2.CV_64F).var())


def _save_debug_image(image: np.ndarray, filename: str, cfg: PreprocessConfig):

    if not cfg.save_intermediate_images:
        return

    os.makedirs(cfg.debug_output_dir, exist_ok=True)

    path = os.path.join(cfg.debug_output_dir, filename)

    success = cv2.imwrite(path, image)

    if not success:
        raise PreprocessingError(f"Could not save debug image: {path}")


def preprocess(image_bytes: bytes, cfg: Optional[PreprocessConfig] = None):

    cfg = cfg or PreprocessConfig()

    img = decode_image(image_bytes)

    original_height, original_width = img.shape[:2]

    warped, boundary_detected, method, angle = deskew_and_crop(img, cfg)

    _save_debug_image(warped, "01_warped.png", cfg)

    denoised = denoise(warped, cfg)

    _save_debug_image(denoised, "02_denoised.png", cfg)

    illumination_corrected = correct_illumination(denoised, cfg)

    _save_debug_image(illumination_corrected, "03_illumination_corrected.png", cfg)

    glare_fraction, glare_mask = detect_glare(illumination_corrected, cfg)

    _save_debug_image(glare_mask, "05_glare_mask.png", cfg)

    final_image = illumination_corrected

    _save_debug_image(final_image, "04_final.png", cfg)

    output_height, output_width = final_image.shape[:2]

    sharpness = sharpness_score(final_image)

    reasons = []

    if output_width < cfg.min_output_width or output_height < cfg.min_output_height:
        reasons.append(
            f"Resolution too low ({output_width}x{output_height}); "
            f"minimum is {cfg.min_output_width}x{cfg.min_output_height}. Re-capture closer to the label."
        )

    if sharpness < cfg.min_sharpness_score:
        reasons.append(
            f"Image too blurry (sharpness={sharpness:.1f}, minimum={cfg.min_sharpness_score}). "
            f"Hold the camera steady and re-capture."
        )

    if glare_fraction > cfg.max_glare_area_frac:
        reasons.append(
            f"Excessive glare ({glare_fraction * 100:.1f}% of frame). "
            f"Reposition the camera to reduce reflections and re-capture."
        )

    if not boundary_detected:
        reasons.append(
            "Package/label boundary could not be confidently detected; only rotation-based deskew was applied. "
            "Consider re-capturing with the full label in frame against a contrasting background."
        )

    hard_rejection_reasons = [r for r in reasons if "boundary" not in r.lower()]

    usable = len(hard_rejection_reasons) == 0

    metadata = PreprocessMetadata(
        original_width=original_width,
        original_height=original_height,
        output_width=output_width,
        output_height=output_height,
        boundary_detected=boundary_detected,
        deskew_method=method,
        rotation_angle_deg=round(angle, 3),
        sharpness_score=round(sharpness, 2),
        glare_area_fraction=round(glare_fraction, 4),
        usable=usable,
        reject_reasons=reasons
    )

    return final_image, metadata