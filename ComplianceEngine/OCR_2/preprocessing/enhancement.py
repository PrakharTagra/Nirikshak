import cv2
import numpy as np


def resize_for_processing(image, max_dimension=1600):
    """
    Resize very large images while preserving aspect ratio.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    h, w = image.shape[:2]
    largest = max(h, w)

    if largest <= max_dimension:
        return image.copy()

    scale = max_dimension / largest

    new_width = int(w * scale)
    new_height = int(h * scale)

    return cv2.resize(
        image,
        (new_width, new_height),
        interpolation=cv2.INTER_AREA
    )


def calculate_contrast(image):
    """
    Calculate grayscale contrast using standard deviation.
    """

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    return float(np.std(gray))


def calculate_noise(image):
    """
    Estimate image noise using the Laplacian.
    Higher value generally indicates more high-frequency noise.
    """

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    laplacian = cv2.Laplacian(
        gray,
        cv2.CV_64F
    )

    return float(np.std(laplacian))


def enhance_contrast(image):
    """
    Improve local contrast using CLAHE.
    """

    lab = cv2.cvtColor(
        image,
        cv2.COLOR_BGR2LAB
    )

    l_channel, a_channel, b_channel = cv2.split(lab)

    clahe = cv2.createCLAHE(
        clipLimit=2.0,
        tileGridSize=(8, 8)
    )

    enhanced_l = clahe.apply(l_channel)

    enhanced_lab = cv2.merge(
        (
            enhanced_l,
            a_channel,
            b_channel
        )
    )

    return cv2.cvtColor(
        enhanced_lab,
        cv2.COLOR_LAB2BGR
    )


def reduce_noise(image):
    """
    Mild denoising while preserving text edges.
    """

    return cv2.fastNlMeansDenoisingColored(
        image,
        None,
        h=5,
        hColor=5,
        templateWindowSize=7,
        searchWindowSize=21
    )


def sharpen_image(image):
    """
    Controlled unsharp masking.

    This improves edge definition without applying
    extremely aggressive sharpening.
    """

    blurred = cv2.GaussianBlur(
        image,
        (0, 0),
        1.2
    )

    sharpened = cv2.addWeighted(
        image,
        1.35,
        blurred,
        -0.35,
        0
    )

    return sharpened


def upscale_image(image, scale=1.5):
    """
    Upscale image for small text / OCR.
    """

    h, w = image.shape[:2]

    new_width = int(w * scale)
    new_height = int(h * scale)

    return cv2.resize(
        image,
        (new_width, new_height),
        interpolation=cv2.INTER_CUBIC
    )


def enhance_image(image, quality_result=None):
    """
    Generic adaptive enhancement pipeline.

    The image is not aggressively processed by default.
    Enhancement decisions are based on image quality.

    Returns:
        {
            "image": enhanced image,
            "operations": list of applied operations,
            "metrics": quality-related metrics
        }
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    enhanced = resize_for_processing(image)

    operations = []

    # --------------------------------------------
    # Analyze current image
    # --------------------------------------------

    contrast = calculate_contrast(enhanced)
    noise = calculate_noise(enhanced)

    # --------------------------------------------
    # Contrast enhancement
    # --------------------------------------------

    if contrast < 45:

        enhanced = enhance_contrast(enhanced)

        operations.append(
            "contrast_enhancement"
        )

    # --------------------------------------------
    # Noise reduction
    # --------------------------------------------

    if noise > 25:

        enhanced = reduce_noise(enhanced)

        operations.append(
            "noise_reduction"
        )

    # --------------------------------------------
    # Glare Reduction
    # --------------------------------------------
    glare_ratio = 0.0

    if quality_result is not None:
        glare_ratio = quality_result.get(
        "glare", {}
        ).get(
        "ratio",
        0.0
    )

    if glare_ratio > 0.001:
        enhanced = reduce_glare(enhanced)
        operations.append("glare_reduction")

    # --------------------------------------------
    # Sharpening
    # --------------------------------------------

    blur_score = None

    if quality_result is not None:

        blur_score = quality_result.get(
            "blur",
            {}
        ).get(
            "raw_score"
        )

    if blur_score is not None:

        if 15 <= blur_score < 100:

            enhanced = sharpen_image(
                enhanced
            )

            operations.append(
                "adaptive_sharpening"
            )

    # --------------------------------------------
    # Upscaling
    # --------------------------------------------

    h, w = enhanced.shape[:2]

    # Useful when image is relatively small
    if max(h, w) < 1200:

        enhanced = upscale_image(
            enhanced,
            scale=1.5
        )

        operations.append(
            "upscaling"
        )

    return {
        "image": enhanced,
        "operations": operations,
        "metrics": {
            "initial_contrast": round(
                contrast,
                2
            ),
            "initial_noise": round(
                noise,
                2
            ),
            "initial_blur": (
                round(blur_score, 2)
                if blur_score is not None
                else None
            )
        }
    }

#Glare removal

def reduce_glare(image):
    """
    Reduce small-to-moderate specular glare regions
    while preserving surrounding image information.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    hsv = cv2.cvtColor(
        image,
        cv2.COLOR_BGR2HSV
    )

    h, s, v = cv2.split(hsv)

    # Very bright + low saturation = likely glare
    glare_mask = (
        (v >= 235) &
        (s <= 50)
    ).astype(np.uint8) * 255

    # Clean small isolated regions
    kernel = cv2.getStructuringElement(
        cv2.MORPH_ELLIPSE,
        (5, 5)
    )

    glare_mask = cv2.morphologyEx(
        glare_mask,
        cv2.MORPH_OPEN,
        kernel
    )

    glare_mask = cv2.morphologyEx(
        glare_mask,
        cv2.MORPH_CLOSE,
        kernel
    )

    # If almost no glare exists, don't modify image
    glare_ratio = (
        cv2.countNonZero(glare_mask)
        / glare_mask.size
    )

    if glare_ratio < 0.001:
        return image.copy()

    # Inpaint glare regions
    result = cv2.inpaint(
        image,
        glare_mask,
        5,
        cv2.INPAINT_TELEA
    )

    return result