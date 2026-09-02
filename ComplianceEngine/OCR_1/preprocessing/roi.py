import cv2
import numpy as np


def _clip_box(box, width, height):

    x1, y1, x2, y2 = box

    x1 = max(0, int(x1))
    y1 = max(0, int(y1))
    x2 = min(width, int(x2))
    y2 = min(height, int(y2))

    if x2 <= x1 or y2 <= y1:
        return None

    return x1, y1, x2, y2


def detect_product_roi(image):
    """
    Product-focused ROI detection.

    Goal:
        Detect the main retail product instead of
        selecting hands/background.

    Strategy:
        1. Work on resized image
        2. Create a center-focused search region
        3. Use GrabCut only inside that region
        4. Remove weak/background regions
        5. Prefer compact central product
        6. Add small padding
        7. Fallback to center crop if segmentation fails
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    original_h, original_w = image.shape[:2]

    # ========================================================
    # 1. RESIZE
    # ========================================================

    max_dimension = 1000

    scale = min(
        1.0,
        max_dimension / max(original_h, original_w)
    )

    if scale < 1.0:

        work = cv2.resize(
            image,
            None,
            fx=scale,
            fy=scale,
            interpolation=cv2.INTER_AREA
        )

    else:
        work = image.copy()

    h, w = work.shape[:2]

    # ========================================================
    # 2. CENTER PRODUCT SEARCH REGION
    #
    # We deliberately DO NOT allow the entire image to
    # become foreground.
    #
    # Product is expected to be the main central object.
    # ========================================================

    rx1 = int(w * 0.18)
    rx2 = int(w * 0.82)

    ry1 = int(h * 0.12)
    ry2 = int(h * 0.98)

    rw = rx2 - rx1
    rh = ry2 - ry1

    # ========================================================
    # 3. GRABCUT MASK
    # ========================================================

    mask = np.full(
        (h, w),
        cv2.GC_BGD,
        dtype=np.uint8
    )

    # Search region = probable background
    mask[
        ry1:ry2,
        rx1:rx2
    ] = cv2.GC_PR_BGD

    # Strong central product seed
    sx1 = int(w * 0.34)
    sx2 = int(w * 0.66)

    sy1 = int(h * 0.22)
    sy2 = int(h * 0.96)

    mask[
        sy1:sy2,
        sx1:sx2
    ] = cv2.GC_PR_FGD

    # Strong foreground core
    cx1 = int(w * 0.40)
    cx2 = int(w * 0.60)

    cy1 = int(h * 0.30)
    cy2 = int(h * 0.90)

    mask[
        cy1:cy2,
        cx1:cx2
    ] = cv2.GC_FGD

    # ========================================================
    # 4. GRABCUT
    # ========================================================

    bg_model = np.zeros(
        (1, 65),
        dtype=np.float64
    )

    fg_model = np.zeros(
        (1, 65),
        dtype=np.float64
    )

    try:

        cv2.grabCut(
            work,
            mask,
            None,
            bg_model,
            fg_model,
            5,
            cv2.GC_INIT_WITH_MASK
        )

    except cv2.error:

        mask = None

    # ========================================================
    # 5. CREATE FOREGROUND MASK
    # ========================================================

    if mask is not None:

        foreground = np.where(
            (mask == cv2.GC_FGD) |
            (mask == cv2.GC_PR_FGD),
            255,
            0
        ).astype(np.uint8)

    else:

        foreground = np.zeros(
            (h, w),
            dtype=np.uint8
        )

    # ========================================================
    # 6. MORPHOLOGICAL CLEANUP
    # ========================================================

    kernel_size = max(
        5,
        int(min(h, w) * 0.015)
    )

    if kernel_size % 2 == 0:
        kernel_size += 1

    kernel = cv2.getStructuringElement(
        cv2.MORPH_ELLIPSE,
        (kernel_size, kernel_size)
    )

    foreground = cv2.morphologyEx(
        foreground,
        cv2.MORPH_CLOSE,
        kernel,
        iterations=2
    )

    foreground = cv2.morphologyEx(
        foreground,
        cv2.MORPH_OPEN,
        kernel,
        iterations=1
    )

    # ========================================================
    # 7. CONNECTED COMPONENT ANALYSIS
    # ========================================================

    num_labels, labels, stats, centroids = (
        cv2.connectedComponentsWithStats(
            foreground,
            connectivity=8
        )
    )

    candidates = []

    center_x = w / 2
    center_y = h / 2

    for i in range(1, num_labels):

        x = stats[i, cv2.CC_STAT_LEFT]
        y = stats[i, cv2.CC_STAT_TOP]

        bw = stats[i, cv2.CC_STAT_WIDTH]
        bh = stats[i, cv2.CC_STAT_HEIGHT]

        area = stats[i, cv2.CC_STAT_AREA]

        if bw <= 0 or bh <= 0:
            continue

        area_ratio = (
            area / float(w * h)
        )

        box_ratio = (
            bw * bh
        ) / float(w * h)

        component_cx = (
            x + bw / 2
        )

        component_cy = (
            y + bh / 2
        )

        # Distance from image center
        distance = np.sqrt(
            (
                (component_cx - center_x) / w
            ) ** 2
            +
            (
                (component_cy - center_y) / h
            ) ** 2
        )

        # ====================================================
        # PRODUCT SCORE
        # ====================================================

        score = 0.0

        # Centrality
        score += max(
            0,
            1.0 - distance * 2.5
        ) * 3.0

        # Large enough object
        if box_ratio > 0.08:
            score += 2.0

        if box_ratio > 0.15:
            score += 2.0

        # Retail products commonly have substantial height
        if bh / float(h) > 0.40:
            score += 2.0

        if bh / float(h) > 0.60:
            score += 1.5

        # Avoid tiny text-like components
        if area_ratio < 0.01:
            score -= 5.0

        candidates.append(
            (
                score,
                x,
                y,
                bw,
                bh
            )
        )

    # ========================================================
    # 8. SELECT BEST PRODUCT CANDIDATE
    # ========================================================

    candidates.sort(
        key=lambda item: item[0],
        reverse=True
    )

    selected = None

    if candidates:

        best = candidates[0]

        score, x, y, bw, bh = best

        # Must be reasonably product-sized
        if (
            bw >= w * 0.12
            and bh >= h * 0.30
        ):
            selected = (
                x,
                y,
                bw,
                bh
            )

    # ========================================================
    # 9. FALLBACK
    #
    # If segmentation is unreliable, don't return the
    # entire photograph.
    #
    # Instead return a product-focused central region.
    # ========================================================

    if selected is None:

        x = int(w * 0.22)
        y = int(h * 0.12)

        bw = int(w * 0.56)
        bh = int(h * 0.84)

    else:

        x, y, bw, bh = selected

    # ========================================================
    # 10. ADD SMALL PRODUCT PADDING
    #
    # Not huge padding — we want the product, not the
    # surrounding hand/background.
    # ========================================================

    padding_x = max(
        10,
        int(bw * 0.06)
    )

    padding_y = max(
        10,
        int(bh * 0.04)
    )

    x1 = x - padding_x
    y1 = y - padding_y

    x2 = x + bw + padding_x
    y2 = y + bh + padding_y

    # ========================================================
    # 11. CONVERT TO ORIGINAL IMAGE
    # ========================================================

    if scale < 1.0:

        x1 = int(x1 / scale)
        y1 = int(y1 / scale)

        x2 = int(x2 / scale)
        y2 = int(y2 / scale)

    box = _clip_box(
        (
            x1,
            y1,
            x2,
            y2
        ),
        original_w,
        original_h
    )

    if box is None:
        return None, None

    x1, y1, x2, y2 = box

    # ========================================================
    # 12. FINAL PRODUCT CROP
    # ========================================================

    roi = image[
        y1:y2,
        x1:x2
    ].copy()

    if roi.size == 0:
        return None, None

    # ========================================================
    # 13. METADATA
    # ========================================================

    corners = np.array(
        [
            [x1, y1],
            [x2 - 1, y1],
            [x2 - 1, y2 - 1],
            [x1, y2 - 1]
        ],
        dtype=np.float32
    )

    metadata = {
        "corners": corners,
        "geometry": "product",
        "confidence": 0.85,
        "method": "center_focused_product_detection"
    }

    return roi, metadata