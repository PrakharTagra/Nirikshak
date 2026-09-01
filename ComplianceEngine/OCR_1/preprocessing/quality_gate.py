import cv2
import numpy as np


def calculate_blur_score(image):
    """
    Calculate image sharpness using Laplacian variance.

    Higher score = sharper image.
    Lower score = blurrier image.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    score = cv2.Laplacian(
        gray,
        cv2.CV_64F
    ).var()

    return float(score)


def normalize_blur_score(
    score,
    min_score=50.0,
    max_score=500.0
):
    """
    Convert raw Laplacian variance into a 0-1 quality score.

    0.0 = very blurry
    1.0 = sufficiently sharp

    Scores above max_score are capped at 1.
    Scores below min_score are capped at 0.
    """

    normalized = (
        (score - min_score)
        / (max_score - min_score)
    )

    return max(0.0, min(1.0, normalized))

def calculate_glare_score(image):
    """
    Estimate specular glare using brightness and saturation.

    Returns:
        float: fraction of image occupied by glare-like pixels.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    hsv = cv2.cvtColor(
        image,
        cv2.COLOR_BGR2HSV
    )

    _, saturation, value = cv2.split(hsv)

    # Very bright pixels
    bright = value >= 235

    # Specular highlights tend to have low saturation
    low_saturation = saturation <= 50

    glare_mask = (
        bright &
        low_saturation
    ).astype(np.uint8) * 255

    # Remove isolated single-pixel noise
    kernel = cv2.getStructuringElement(
        cv2.MORPH_ELLIPSE,
        (3, 3)
    )

    glare_mask = cv2.morphologyEx(
        glare_mask,
        cv2.MORPH_OPEN,
        kernel
    )

    # Join nearby highlight pixels
    glare_mask = cv2.morphologyEx(
        glare_mask,
        cv2.MORPH_CLOSE,
        kernel
    )

    # -----------------------------------------
    # Remove tiny connected components
    # -----------------------------------------

    num_labels, labels, stats, _ = cv2.connectedComponentsWithStats(
        glare_mask,
        connectivity=8
    )

    filtered_mask = np.zeros_like(glare_mask)

    for i in range(1, num_labels):

        area = stats[i, cv2.CC_STAT_AREA]

        if area >= 20:
            filtered_mask[labels == i] = 255

    glare_pixels = cv2.countNonZero(
        filtered_mask
    )

    return glare_pixels / filtered_mask.size

def calculate_exposure_score(image):
    """
    Calculate an exposure quality score between 0 and 1.

    1.0 = good exposure
    0.0 = severely under/over exposed

    This is an initial heuristic and will be calibrated
    using real bottle images.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Mean brightness: 0 = black, 255 = white
    mean_brightness = gray.mean()

    # Percentage of very dark pixels
    dark_pixels = cv2.countNonZero(
        cv2.inRange(gray, 0, 30)
    )

    # Percentage of very bright pixels
    bright_pixels = cv2.countNonZero(
        cv2.inRange(gray, 225, 255)
    )

    total_pixels = gray.size

    dark_ratio = dark_pixels / total_pixels
    bright_ratio = bright_pixels / total_pixels

    # Start with a neutral score
    score = 1.0

    # Penalize excessive darkness
    if mean_brightness < 60:
        score -= 0.5
    elif mean_brightness < 90:
        score -= 0.25

    # Penalize excessive brightness
    if mean_brightness > 200:
        score -= 0.5
    elif mean_brightness > 180:
        score -= 0.25

    # Penalize excessive clipped regions
    if dark_ratio > 0.20:
        score -= 0.25

    if bright_ratio > 0.20:
        score -= 0.25

    return max(0.0, min(1.0, score))

def estimate_skew(image):
    """
    Estimate the dominant horizontal text/edge angle.

    Returns:
        float: estimated skew angle in degrees.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Detect edges
    edges = cv2.Canny(gray, 50, 150)

    # Detect line segments
    lines = cv2.HoughLinesP(
        edges,
        1,
        np.pi / 180,
        threshold=100,
        minLineLength=50,
        maxLineGap=20
    )

    if lines is None:
        return 0.0

    angles = []

    for line in lines:
        x1, y1, x2, y2 = line.reshape(-1)

        dx = x2 - x1
        dy = y2 - y1

        # Ignore almost vertical lines
        if abs(dx) < 5:
            continue

        angle = np.degrees(
            np.arctan2(dy, dx)
        )

        # We care about near-horizontal lines.
        if -45 <= angle <= 45:
            angles.append(angle)

    if not angles:
        return 0.0

    return float(np.median(angles))

def quality_gate(image):
    """
    Run all pre-OCR image quality checks.

    Returns:
        dict containing individual metrics,
        overall quality score, and pass/fail status.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    # -------------------------
    # Calculate raw metrics
    # -------------------------

    blur_raw = calculate_blur_score(image)
    blur_quality = normalize_blur_score(blur_raw)

    glare_score = calculate_glare_score(image)

    exposure_quality = calculate_exposure_score(image)

    skew_deg = estimate_skew(image)

    # -------------------------
    # Convert skew into quality
    # -------------------------

    abs_skew = abs(skew_deg)

    if abs_skew <= 3:
        skew_quality = 1.0

    elif abs_skew >= 12:
        skew_quality = 0.0

    else:
        skew_quality = (
            (12 - abs_skew)
            / (12 - 3)
        )

    # -------------------------
    # Calculate overall score
    # -------------------------

    final_quality = (
        0.35 * blur_quality
        + 0.25 * (1.0 - glare_score)
        + 0.20 * exposure_quality
        + 0.20 * skew_quality
    )

    # -------------------------
    # Initial acceptance rules
    # -------------------------

    reasons = []

    if blur_quality < 0.50:
        reasons.append("Image is too blurry.")

    if glare_score > 0.10:
        reasons.append("Too much glare detected.")

    if exposure_quality < 0.50:
        reasons.append("Image exposure is poor.")

    if abs_skew > 12:
        reasons.append("Image is too tilted.")

    passed = len(reasons) == 0

    return {
        "passed": passed,

        "final_quality": round(
            final_quality,
            3
        ),

        "blur": {
            "raw_score": round(
                blur_raw,
                2
            ),
            "quality": round(
                blur_quality,
                3
            )
        },

        "glare": {
            "ratio": round(
                glare_score,
                4
            )
        },

        "exposure": {
            "quality": round(
                exposure_quality,
                3
            )
        },

        "skew": {
            "degrees": round(
                skew_deg,
                2
            ),
            "quality": round(
                skew_quality,
                3
            )
        },

        "reasons": reasons
    }