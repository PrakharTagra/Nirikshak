import cv2
import numpy as np


def calculate_blur_score(image):
    """
    Calculate image sharpness using Laplacian variance.

    Higher score  = sharper image
    Lower score   = blurrier image

    Args:
        image: OpenCV image (BGR)

    Returns:
        float: Laplacian variance
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    # Convert BGR image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Calculate Laplacian variance
    score = cv2.Laplacian(gray, cv2.CV_64F).var()

    return float(score)