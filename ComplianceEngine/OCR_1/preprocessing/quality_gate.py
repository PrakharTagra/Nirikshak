import cv2
import numpy as np


def calculate_blur_score(image):
    if image is None:
        raise ValueError("Image could not be loaded.")

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Normalize image size so blur score is more consistent
    max_dim = max(gray.shape)

    if max_dim > 1000:
        scale = 1000 / max_dim
        gray = cv2.resize(gray, None, fx=scale, fy=scale)

    return float(cv2.Laplacian(gray, cv2.CV_64F).var())


def normalize_blur_score(raw_score):
    """
    Convert blur score into a 0-1 quality score.

    This is intentionally tolerant because real phone
    photographs may have moderate blur.
    """

    # Severe blur
    if raw_score <= 15:
        return 0.0

    # Good sharpness
    if raw_score >= 100:
        return 1.0

    return (raw_score - 15) / (100 - 15)


def calculate_glare_score(image):
    if image is None:
        raise ValueError("Image could not be loaded.")

    hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

    _, saturation, value = cv2.split(hsv)

    bright = value >= 235
    low_saturation = saturation <= 50

    glare_mask = (
        bright &
        low_saturation
    ).astype(np.uint8) * 255

    kernel = cv2.getStructuringElement(
        cv2.MORPH_ELLIPSE,
        (3, 3)
    )

    glare_mask = cv2.morphologyEx(
        glare_mask,
        cv2.MORPH_OPEN,
        kernel
    )

    glare_mask = cv2.morphologyEx(
        glare_mask,
        cv2.MORPH_CLOSE,
        kernel
    )

    num_labels, labels, stats, _ = cv2.connectedComponentsWithStats(
        glare_mask,
        connectivity=8
    )

    filtered_mask = np.zeros_like(glare_mask)

    for i in range(1, num_labels):
        area = stats[i, cv2.CC_STAT_AREA]

        if area >= 20:
            filtered_mask[labels == i] = 255

    glare_pixels = cv2.countNonZero(filtered_mask)

    return glare_pixels / filtered_mask.size


def calculate_exposure_score(image):
    if image is None:
        raise ValueError("Image could not be loaded.")

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    mean_brightness = np.mean(gray)

    # Reasonable exposure range
    if 60 <= mean_brightness <= 210:
        return 1.0

    if mean_brightness < 30 or mean_brightness > 245:
        return 0.0

    if mean_brightness < 60:
        return (mean_brightness - 30) / 30

    return (245 - mean_brightness) / 35


def estimate_skew(image):
    """
    Estimate actual image skew while ignoring
    diagonal text, curved edges and random objects.

    Only near-horizontal structural lines are used.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    gray = cv2.cvtColor(
        image,
        cv2.COLOR_BGR2GRAY
    )

    # Resize large images for stable Hough detection
    max_dim = max(gray.shape)

    if max_dim > 1200:
        scale = 1200 / max_dim

        gray = cv2.resize(
            gray,
            None,
            fx=scale,
            fy=scale
        )

    # Smooth small text/noise
    gray = cv2.GaussianBlur(
        gray,
        (5, 5),
        0
    )

    edges = cv2.Canny(
        gray,
        50,
        150
    )

    lines = cv2.HoughLinesP(
        edges,
        1,
        np.pi / 180,
        threshold=80,
        minLineLength=max(
            50,
            int(min(gray.shape[:2]) * 0.15)
        ),
        maxLineGap=25
    )

    if lines is None:
        return 0.0

    candidates = []

    for line in lines:

        x1, y1, x2, y2 = line.reshape(-1)

        dx = x2 - x1
        dy = y2 - y1

        length = np.sqrt(
            dx * dx + dy * dy
        )

        if length < 30:
            continue

        angle = np.degrees(
            np.arctan2(dy, dx)
        )

        # Normalize line orientation to [-90, 90]
        if angle > 90:
            angle -= 180

        if angle < -90:
            angle += 180

        # IMPORTANT:
        # Only near-horizontal lines are useful
        # for estimating camera tilt.
        #
        # This rejects:
        # - diagonal text
        # - random background edges
        # - bottle curvature
        # - vertical bottle boundaries
        if abs(angle) > 12:
            continue

        candidates.append(
            (angle, length)
        )

    if not candidates:
        return 0.0

    # Longer structural lines are more trustworthy.
    candidates.sort(
        key=lambda item: item[1],
        reverse=True
    )

    # Use strongest structural lines.
    selected = candidates[
        :min(20, len(candidates))
    ]

    angles = np.array(
        [item[0] for item in selected],
        dtype=np.float32
    )

    weights = np.array(
        [item[1] for item in selected],
        dtype=np.float32
    )

    if np.sum(weights) == 0:
        return 0.0

    weighted_angle = np.average(
        angles,
        weights=weights
    )

    # Safety clamp.
    if abs(weighted_angle) > 12:
        return 0.0

    return float(weighted_angle)


def quality_gate(image):

    if image is None:
        raise ValueError("Image could not be loaded.")

    blur_raw = calculate_blur_score(image)
    blur_quality = normalize_blur_score(blur_raw)

    glare_score = calculate_glare_score(image)

    exposure_quality = calculate_exposure_score(image)

    skew_deg = estimate_skew(image)
    abs_skew = abs(skew_deg)

    if abs_skew <= 3:
        skew_quality = 1.0

    elif abs_skew >= 12:
        skew_quality = 0.0

    else:
        skew_quality = (
            (12 - abs_skew) /
            (12 - 3)
        )

    final_quality = (
        0.35 * blur_quality
        + 0.25 * (1.0 - glare_score)
        + 0.20 * exposure_quality
        + 0.20 * skew_quality
    )

    reasons = []

    # Only reject genuinely severe blur
    if blur_raw < 15:
        reasons.append("Image is severely blurry.")

    if glare_score > 0.10:
        reasons.append("Too much glare detected.")

    if exposure_quality < 0.50:
        reasons.append("Image exposure is poor.")

    if abs_skew > 12:
        reasons.append("Image is too tilted.")

    passed = len(reasons) == 0

    return {
        "passed": passed,
        "final_quality": round(final_quality, 3),

        "blur": {
            "raw_score": round(blur_raw, 2),
            "quality": round(blur_quality, 3)
        },

        "glare": {
            "ratio": round(glare_score, 4)
        },

        "exposure": {
            "quality": round(exposure_quality, 3)
        },

        "skew": {
            "degrees": round(skew_deg, 2),
            "quality": round(skew_quality, 3)
        },

        "reasons": reasons
    }

def check_resolution(image, min_width=640, min_height=480):
    """
    Check whether image resolution is sufficient
    for product detection and OCR.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    height, width = image.shape[:2]

    passed = (
        width >= min_width
        and height >= min_height
    )

    return {
        "passed": passed,
        "width": width,
        "height": height,
        "minimum_width": min_width,
        "minimum_height": min_height,
        "reason": (
            None
            if passed
            else "Image resolution is too low. Please recapture the image."
        )
    }