import cv2

from preprocessing.quality_gate import (
    quality_gate,
    check_resolution
)

from preprocessing.deskew import deskew_image

from preprocessing.enhancement import (
    enhance_image
)

from preprocessing.roi import (
    detect_product_roi
)


# ============================================================
# IMAGE ORIENTATION
# ============================================================

def make_vertical(image):

    if image is None:
        raise ValueError(
            "Image could not be loaded."
        )

    h, w = image.shape[:2]

    # Landscape image → rotate 90° clockwise
    if w > h:

        return cv2.rotate(
            image,
            cv2.ROTATE_90_CLOCKWISE
        )

    return image.copy()


# ============================================================
# MAIN PREPROCESSING PIPELINE
# ============================================================

def preprocess_product(image):

    if image is None:
        raise ValueError(
            "Image could not be loaded."
        )

    # ========================================================
    # 1. RESOLUTION CHECK
    # ========================================================

    resolution = check_resolution(image)

    if not resolution["passed"]:

        return {
            "success": False,
            "image": None,
            "quality": None,
            "resolution": resolution,
            "deskew": None,
            "enhancement": None,
            "metadata": None,
            "reason": resolution["reason"]
        }

    # ========================================================
    # 2. MAKE IMAGE VERTICAL
    # ========================================================

    image = make_vertical(image)

    # ========================================================
    # 3. ORIGINAL QUALITY CHECK
    # ========================================================

    original_quality = quality_gate(image)

    # ========================================================
    # 4. AUTO DESKEW
    # ========================================================

    deskew_result = deskew_image(image)

    deskewed = deskew_result["image"]

    # ========================================================
    # 5. IMAGE ENHANCEMENT
    # ========================================================

    enhancement = enhance_image(
        deskewed,
        original_quality
    )

    enhanced = enhancement["image"]

    # ========================================================
    # 6. FULL PRODUCT ROI DETECTION
    # ========================================================

    roi, metadata = detect_product_roi(
        enhanced
    )

    if roi is None:

        return {
            "success": False,
            "image": None,
            "quality": original_quality,
            "resolution": resolution,
            "deskew": deskew_result,
            "enhancement": enhancement,
            "metadata": None,
            "reason": "Could not detect product."
        }

    # ========================================================
    # 7. FINAL PRODUCT QUALITY CHECK
    # ========================================================

    product_quality = quality_gate(
        roi
    )

    if not product_quality["passed"]:

        return {
            "success": False,
            "image": roi,
            "quality": product_quality,
            "resolution": resolution,
            "deskew": deskew_result,
            "enhancement": enhancement,
            "metadata": metadata,
            "reason": (
                "Detected product image quality "
                "is too poor."
            )
        }

    # ========================================================
    # 8. FINAL RESULT
    # ========================================================

    return {
        "success": True,
        "image": roi,
        "quality": product_quality,
        "resolution": resolution,
        "deskew": deskew_result,
        "enhancement": enhancement,
        "metadata": metadata,
        "reason": None
    }