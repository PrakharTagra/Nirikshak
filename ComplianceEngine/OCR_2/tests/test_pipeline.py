import sys
import cv2

from preprocessing.pipeline import preprocess_product


if len(sys.argv) != 2:
    print(
        "Usage:\n"
        "python -m tests.test_pipeline "
        "\"C:\\path\\to\\image.jpg\""
    )
    sys.exit(1)


IMAGE_PATH = sys.argv[1]

image = cv2.imread(IMAGE_PATH)

if image is None:
    raise FileNotFoundError(
        f"Could not load image: {IMAGE_PATH}"
    )


result = preprocess_product(image)


print("\n=== PRODUCT PREPROCESSING ===")

print(f"Success: {result['success']}")

print("\nReason:")
print(result["reason"])

print("\nQuality:")
print(result["quality"])

print("\nMetadata:")
print(result["metadata"])


# --------------------------------------------------
# Save detected product with green outline
# --------------------------------------------------

metadata = result["metadata"]

if metadata is not None:

    corners = metadata["corners"]

    visualization = image.copy()

    points = corners.astype(int)

    cv2.polylines(
        visualization,
        [points],
        True,
        (0, 255, 0),
        5
    )

    cv2.imwrite(
        "tests/roi_detection.jpeg",
        visualization
    )

    print(
        "\n🟢 Green product outline saved:"
    )

    print(
        "   tests/roi_detection.jpeg"
    )


# --------------------------------------------------
# Save zoomed/cropped product
# --------------------------------------------------

if result["image"] is not None:

    cv2.imwrite(
        "tests/ocr_ready.jpeg",
        result["image"]
    )

    print(
        "\n🔍 Zoomed product crop saved:"
    )

    print(
        "   tests/ocr_ready.jpeg"
    )


if result["success"]:

    print(
        "\n✅ PRODUCT PREPROCESSING SUCCESSFUL"
    )

else:

    print(
        "\n❌ PRODUCT PREPROCESSING FAILED"
    )