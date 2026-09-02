import cv2
import numpy as np


def cylindrical_unwrap(image):
    """
    Approximate cylindrical unwrapping for labels
    on curved retail containers.

    The image is transformed from a cylindrical
    surface into a flatter representation.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    h, w = image.shape[:2]

    if w < 2:
        raise ValueError("Image is too narrow.")

    # Approximate cylinder radius.
    # We use image width as a starting estimate
    # rather than assuming a specific bottle size.
    radius = max(w, h) / 2.0

    output = np.zeros_like(image)

    center_x = (w - 1) / 2.0

    for x in range(w):

        normalized_x = (x - center_x) / radius

        # Keep the transformation mathematically valid.
        normalized_x = np.clip(
            normalized_x,
            -0.999,
            0.999
        )

        theta = np.arcsin(normalized_x)

        source_x = (
            radius * theta
            + center_x
        )

        source_x = int(
            np.clip(source_x, 0, w - 1)
        )

        output[:, x] = image[:, source_x]

    return output