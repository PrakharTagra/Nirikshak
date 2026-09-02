import cv2
import numpy as np


def classify_geometry(image, corners=None):
    """
    Classify the approximate geometry of a retail product.

    Returns:
        {
            "type": "planar" | "cylindrical" | "unknown",
            "confidence": float
        }
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    # If we have four reliable product corners,
    # the safest assumption is a planar surface.
    if corners is not None and len(corners) == 4:
        return {
            "type": "planar",
            "confidence": 0.90
        }

    return {
        "type": "unknown",
        "confidence": 0.30
    }