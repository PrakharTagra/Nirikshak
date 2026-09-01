import cv2

from preprocessing.quality_gate import calculate_blur_score


IMAGE_PATH = "tests/sample.jpg"


image = cv2.imread(IMAGE_PATH)

if image is None:
    raise FileNotFoundError(
        f"Could not load image: {IMAGE_PATH}"
    )

score = calculate_blur_score(image)

print(f"Blur score: {score:.2f}")
