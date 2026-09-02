import cv2
import numpy as np


def estimate_skew_angle(image):
    """
    Estimate the dominant horizontal skew angle.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Reduce noise before edge detection
    blurred = cv2.GaussianBlur(
        gray,
        (5, 5),
        0
    )

    edges = cv2.Canny(
        blurred,
        50,
        150
    )

    lines = cv2.HoughLinesP(
        edges,
        1,
        np.pi / 180,
        threshold=80,
        minLineLength=max(40, int(min(image.shape[:2]) * 0.15)),
        maxLineGap=20
    )

    if lines is None:
        return 0.0

    angles = []

    for line in lines:
        x1, y1, x2, y2 = line.reshape(-1)

        dx = x2 - x1
        dy = y2 - y1

        if abs(dx) < 5:
            continue

        angle = np.degrees(
            np.arctan2(dy, dx)
        )

        # Only consider approximately horizontal lines
        if -20 <= angle <= 20:
            angles.append(angle)

    if not angles:
        return 0.0

    return float(np.median(angles))


def deskew_image(image, max_angle=15):
    """
    Automatically rotate an image to correct small tilts.

    Returns:
        {
            "image": corrected image,
            "angle": detected angle,
            "corrected": True/False
        }
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    angle = estimate_skew_angle(image)

    # Ignore negligible tilt
    if abs(angle) < 0.5:
        return {
            "image": image.copy(),
            "angle": round(angle, 2),
            "corrected": False
        }

    # Avoid making extreme/unreliable rotations
    if abs(angle) > max_angle:
        return {
            "image": image.copy(),
            "angle": round(angle, 2),
            "corrected": False
        }

    h, w = image.shape[:2]

    center = (
        w / 2,
        h / 2
    )

    matrix = cv2.getRotationMatrix2D(
        center,
        angle,
        1.0
    )

    corrected = cv2.warpAffine(
        image,
        matrix,
        (w, h),
        flags=cv2.INTER_CUBIC,
        borderMode=cv2.BORDER_REPLICATE
    )

    return {
        "image": corrected,
        "angle": round(angle, 2),
        "corrected": True
    }