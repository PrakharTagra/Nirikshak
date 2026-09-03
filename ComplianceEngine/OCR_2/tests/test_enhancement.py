import sys
import cv2

from preprocessing.enhancement import enhance_image
from preprocessing.quality_gate import quality_gate


if len(sys.argv) != 2:

    print(
        "Usage:\n"
        'python -m tests.test_enhancement "C:\\path\\to\\image.jpg"'
    )

    sys.exit(1)


IMAGE_PATH = sys.argv[1]

image = cv2.imread(
    IMAGE_PATH
)

if image is None:

    raise FileNotFoundError(
        f"Could not load image: {IMAGE_PATH}"
    )


print("\n================================")
print("      ORIGINAL IMAGE")
print("================================")

original_quality = quality_gate(
    image
)

print(original_quality)


# --------------------------------------------
# Enhancement
# --------------------------------------------

result = enhance_image(
    image,
    original_quality
)

enhanced = result["image"]


print("\n================================")
print("       ENHANCEMENT")
print("================================")

print(
    "Operations applied:"
)

for operation in result["operations"]:

    print(
        f"  ✓ {operation}"
    )


print("\nMetrics:")

print(
    result["metrics"]
)


# --------------------------------------------
# Re-check quality
# --------------------------------------------

enhanced_quality = quality_gate(
    enhanced
)


print("\n================================")
print("     ENHANCED IMAGE")
print("================================")

print(
    enhanced_quality
)


# --------------------------------------------
# Save output
# --------------------------------------------

output_path = (
    "tests/enhanced.jpeg"
)

cv2.imwrite(
    output_path,
    enhanced
)


print(
    f"\n✅ Enhanced image saved:"
)

print(
    f"   {output_path}"
)