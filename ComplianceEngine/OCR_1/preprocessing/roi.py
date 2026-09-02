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


def _box_to_corners(box):
    x1, y1, x2, y2 = box

    return np.array([
        [x1, y1],
        [x2 - 1, y1],
        [x2 - 1, y2 - 1],
        [x1, y2 - 1]
    ], dtype=np.float32)


def detect_product_roi(image):
    """
    Detect COMPLETE visible product.

    No PDP detection.
    No text-panel detection.
    No Hough rectangles.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    original_h, original_w = image.shape[:2]

    # --------------------------------------------------------
    # Resize only for faster detection
    # --------------------------------------------------------

    max_dimension = 900

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

    # --------------------------------------------------------
    # GrabCut
    #
    # Product is expected to be reasonably central.
    # We use ONE large rectangle, not individual components.
    # --------------------------------------------------------

    mask = np.zeros(
        (h, w),
        dtype=np.uint8
    )

    rect_x = int(w * 0.14)
    rect_y = int(h * 0.02)

    rect_w = int(w * 0.72)
    rect_h = int(h * 0.96)

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
            (
                rect_x,
                rect_y,
                rect_w,
                rect_h
            ),
            bg_model,
            fg_model,
            4,
            cv2.GC_INIT_WITH_RECT
        )
    except cv2.error:
        return None, None

    # --------------------------------------------------------
    # Foreground
    # --------------------------------------------------------

    foreground = np.where(
        (mask == cv2.GC_FGD) |
        (mask == cv2.GC_PR_FGD),
        255,
        0
    ).astype(np.uint8)

    # --------------------------------------------------------
    # Join broken parts of the SAME product
    # --------------------------------------------------------

    kernel_size = max(
        9,
        int(min(h, w) * 0.02)
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

    # Remove tiny noise
    small_kernel = cv2.getStructuringElement(
        cv2.MORPH_ELLIPSE,
        (5, 5)
    )

    foreground = cv2.morphologyEx(
        foreground,
        cv2.MORPH_OPEN,
        small_kernel,
        iterations=1
    )

    # --------------------------------------------------------
    # IMPORTANT:
    # Do NOT select a connected component.
    #
    # Take ALL foreground points together.
    # --------------------------------------------------------

    points = cv2.findNonZero(foreground)

    if points is None:
        return None, None

    x, y, box_w, box_h = cv2.boundingRect(points)

    if box_w <= 0 or box_h <= 0:
        return None, None

    # --------------------------------------------------------
    # Convert back to original image coordinates
    # --------------------------------------------------------

    if scale < 1.0:
        x = int(x / scale)
        y = int(y / scale)
        box_w = int(box_w / scale)
        box_h = int(box_h / scale)

    # --------------------------------------------------------
    # GENEROUS PADDING
    #
    # Better to keep a little background than cut PDP/product.
    # --------------------------------------------------------

    padding_x = max(
        20,
        int(box_w * 0.08)
    )

    padding_y = max(
        20,
        int(box_h * 0.05)
    )

    box = _clip_box(
        (
            x - padding_x,
            y - padding_y,
            x + box_w + padding_x,
            y + box_h + padding_y
        ),
        original_w,
        original_h
    )

    if box is None:
        return None, None

    x1, y1, x2, y2 = box

    # --------------------------------------------------------
    # Crop from ORIGINAL image
    # --------------------------------------------------------

    roi = image[
        y1:y2,
        x1:x2
    ].copy()

    if roi.size == 0:
        return None, None

    corners = _box_to_corners(box)

    metadata = {
        "corners": corners,
        "geometry": "product",
        "confidence": 0.90,
        "method": "grabcut_full_product"
    }

    return roi, metadata