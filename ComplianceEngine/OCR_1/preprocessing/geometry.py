import cv2
import numpy as np


def perspective_correct(image, corners):
    """
    Correct perspective distortion for planar products.

    Args:
        image: Original image.
        corners: Four product corners.

    Returns:
        Perspective-corrected image.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    if corners is None or len(corners) != 4:
        raise ValueError("Exactly four corners are required.")

    corners = np.asarray(
        corners,
        dtype=np.float32
    )

    # Order:
    # top-left, top-right, bottom-right, bottom-left
    total = corners.sum(axis=1)
    difference = np.diff(
        corners,
        axis=1
    ).flatten()

    ordered = np.zeros(
        (4, 2),
        dtype=np.float32
    )

    ordered[0] = corners[np.argmin(total)]
    ordered[2] = corners[np.argmax(total)]
    ordered[1] = corners[np.argmin(difference)]
    ordered[3] = corners[np.argmax(difference)]

    top_width = np.linalg.norm(
        ordered[1] - ordered[0]
    )

    bottom_width = np.linalg.norm(
        ordered[2] - ordered[3]
    )

    left_height = np.linalg.norm(
        ordered[3] - ordered[0]
    )

    right_height = np.linalg.norm(
        ordered[2] - ordered[1]
    )

    width = int(
        max(top_width, bottom_width)
    )

    height = int(
        max(left_height, right_height)
    )

    if width <= 0 or height <= 0:
        raise ValueError(
            "Invalid product dimensions."
        )

    destination = np.array([
        [0, 0],
        [width - 1, 0],
        [width - 1, height - 1],
        [0, height - 1]
    ], dtype=np.float32)

    matrix = cv2.getPerspectiveTransform(
        ordered,
        destination
    )

    corrected = cv2.warpPerspective(
        image,
        matrix,
        (width, height)
    )

    return corrected