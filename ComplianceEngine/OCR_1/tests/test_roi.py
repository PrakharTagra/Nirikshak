import cv2

from preprocessing.roi import detect_product_roi
from preprocessing.quality_gate import quality_gate


IMAGE_PATH = "tests/bottle.jpeg"

image = cv2.imread(IMAGE_PATH)

if image is None:
    raise FileNotFoundError(
        f"Could not load image: {IMAGE_PATH}"
    )


roi, metadata = detect_product_roi(image)


if roi is None:
    print("❌ Could not detect product ROI.")

else:
    print("✅ Product ROI detected.")

    corners = metadata["corners"]

    print("Detected corners:")
    print(corners)

    print(f"ROI dimensions: {roi.shape[1]} x {roi.shape[0]}")

    print("\nGeometry:")
    print(f"  Type: {metadata['geometry']}")
    print(f"  Confidence: {metadata['confidence']}")
    print(f"  Method: {metadata['method']}")

    print("\nRunning quality gate on product ROI...")

    quality_result = quality_gate(roi)

    print("\nProduct Quality Gate:")
    print(quality_result)

    cv2.imwrite(
        "tests/detected_roi.jpeg",
        roi
    )

    visualization = image.copy()

    points = corners.astype(int)

    cv2.polylines(
        visualization,
        [points],
        True,
        (0, 255, 0),
        4
    )

    cv2.imwrite(
        "tests/roi_detection.jpeg",
        visualization
    )

    print("Saved:")
    print("  tests/detected_roi.jpeg")
    print("  tests/roi_detection.jpeg")