import cv2

from preprocessing.quality_gate import (
    calculate_blur_score,
    normalize_blur_score,
    calculate_glare_score,
    calculate_exposure_score,
    estimate_skew,
    quality_gate
)


IMAGE_PATH = "tests/sample.jpeg"


image = cv2.imread(IMAGE_PATH)

if image is None:
    raise FileNotFoundError(
        f"Could not load image: {IMAGE_PATH}"
    )


images = {
    "Original": image,
    "Slight": cv2.GaussianBlur(image, (5, 5), 0),
    "Medium": cv2.GaussianBlur(image, (11, 11), 0),
    "Heavy": cv2.GaussianBlur(image, (21, 21), 0),
}


for name, img in images.items():

    raw_score = calculate_blur_score(img)

    quality_score = normalize_blur_score(
        raw_score
    )

    print(
        f"{name:8} | "
        f"Raw: {raw_score:8.2f} | "
        f"Quality: {quality_score:.2f}"
    )

    print("\nGlare test:")

glare_score = calculate_glare_score(image)

print(
    f"Original image glare: "
    f"{glare_score:.4f} "
    f"({glare_score * 100:.2f}%)"
)

import numpy as np

# Create a realistic artificial glare spot
glare_image = image.copy()

h, w = glare_image.shape[:2]

# Create a bright elliptical highlight
cv2.ellipse(
    glare_image,
    (int(w * 0.50), int(h * 0.35)),
    (int(w * 0.08), int(h * 0.04)),
    -15,
    0,
    360,
    (255, 255, 255),
    -1
)

# Slightly blur the highlight to simulate camera glare
glare_image = cv2.GaussianBlur(
    glare_image,
    (11, 11),
    0
)

artificial_glare_score = calculate_glare_score(
    glare_image
)

print(
    f"Realistic artificial glare: "
    f"{artificial_glare_score:.4f} "
    f"({artificial_glare_score * 100:.2f}%)"
)

print("\nExposure test:")

exposure_score = calculate_exposure_score(image)

print(
    f"Exposure quality: "
    f"{exposure_score:.2f}"
)

# Create artificially dark image
dark_image = cv2.convertScaleAbs(
    image,
    alpha=0.25,
    beta=0
)

dark_exposure = calculate_exposure_score(dark_image)

print(
    f"Dark image exposure: "
    f"{dark_exposure:.2f}"
)


# Create artificially overexposed image
bright_image = cv2.convertScaleAbs(
    image,
    alpha=1.8,
    beta=40
)

bright_exposure = calculate_exposure_score(bright_image)

print(
    f"Bright image exposure: "
    f"{bright_exposure:.2f}"
)

print("\nSkew test:")

skew_angle = estimate_skew(image)

print(
    f"Estimated skew: "
    f"{skew_angle:.2f} degrees"
)

def rotate_image(image, angle):
    """
    Rotate an image around its center.
    """

    h, w = image.shape[:2]
    center = (w // 2, h // 2)

    matrix = cv2.getRotationMatrix2D(
        center,
        angle,
        1.0
    )

    rotated = cv2.warpAffine(
        image,
        matrix,
        (w, h),
        borderMode=cv2.BORDER_REPLICATE
    )

    return rotated


print("\nRotated image skew test:")

for angle in [10, -10, 20]:

    rotated = rotate_image(image, angle)

    detected_angle = estimate_skew(rotated)

    print(
        f"Actual rotation: {angle:+}° | "
        f"Detected skew: {detected_angle:+.2f}°"
    )

print("\nComplete Quality Gate:")

result = quality_gate(image)

print(result)