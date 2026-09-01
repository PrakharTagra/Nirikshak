import cv2
import numpy as np



def perspective_correct(image, corners):
    corners = order_points(corners)

    width_top = np.linalg.norm(corners[1] - corners[0])
    width_bottom = np.linalg.norm(corners[2] - corners[3])

    height_left = np.linalg.norm(corners[3] - corners[0])
    height_right = np.linalg.norm(corners[2] - corners[1])

    output_width = int(max(width_top, width_bottom))
    output_height = int(max(height_left, height_right))

    if output_width <= 0 or output_height <= 0:
        return None

    destination = np.array([
        [0, 0],
        [output_width - 1, 0],
        [output_width - 1, output_height - 1],
        [0, output_height - 1]
    ], dtype=np.float32)

    matrix = cv2.getPerspectiveTransform(
        corners,
        destination
    )

    return cv2.warpPerspective(
        image,
        matrix,
        (output_width, output_height)
    )

def order_points(points):
    """
    Order four points as:
    top-left, top-right, bottom-right, bottom-left
    """

    points = np.asarray(points, dtype=np.float32)

    ordered = np.zeros((4, 2), dtype=np.float32)

    total = points.sum(axis=1)
    difference = np.diff(points, axis=1).flatten()

    ordered[0] = points[np.argmin(total)]       # top-left
    ordered[2] = points[np.argmax(total)]       # bottom-right
    ordered[1] = points[np.argmin(difference)]  # top-right
    ordered[3] = points[np.argmax(difference)]  # bottom-left

    return ordered


def _detect_hough_product(image):
    """
    Detect a tall, narrow package using its dominant
    left and right vertical boundaries.

    Returns:
        roi: perspective-corrected package image
        corners: detected package corners
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    original = image.copy()

    h, w = image.shape[:2]

    gray = cv2.cvtColor(
        image,
        cv2.COLOR_BGR2GRAY
    )

    # Smooth small image noise.
    gray = cv2.GaussianBlur(
        gray,
        (5, 5),
        0
    )

    # Edge detection.
    edges = cv2.Canny(
        gray,
        30,
        100
    )

    # Detect long line segments.
    lines = cv2.HoughLinesP(
        edges,
        1,
        np.pi / 180,
        threshold=80,
        minLineLength=int(h * 0.30),
        maxLineGap=40
    )

    if lines is None:
        return None, None

    vertical_lines = []

    for line in lines:

        x1, y1, x2, y2 = line.reshape(-1)

        dx = x2 - x1
        dy = y2 - y1

        length = np.hypot(dx, dy)

        if length == 0:
            continue

        angle = np.degrees(
            np.arctan2(dy, dx)
        )

        # Vertical lines are around +/-90 degrees.
        vertical_difference = min(
            abs(angle - 90),
            abs(angle + 90)
        )

        if vertical_difference > 12:
            continue

        # Ignore lines too close to the image boundary.
        x_average = (x1 + x2) / 2

        if x_average < w * 0.15:
            continue

        if x_average > w * 0.85:
            continue

        vertical_lines.append(
            {
                "x": x_average,
                "y1": min(y1, y2),
                "y2": max(y1, y2),
                "length": length,
                "angle": angle
            }
        )

    if len(vertical_lines) < 2:
        return None, None

    # ------------------------------------------------
    # Group lines by x position.
    # ------------------------------------------------

    vertical_lines.sort(
        key=lambda line: line["x"]
    )

    groups = []

    for line in vertical_lines:

        if not groups:
            groups.append([line])
            continue

        previous_x = np.mean(
            [item["x"] for item in groups[-1]]
        )

        if abs(line["x"] - previous_x) < 25:
            groups[-1].append(line)
        else:
            groups.append([line])

    # Calculate representative line for each group.
    candidates = []

    for group in groups:

        total_length = sum(
            item["length"]
            for item in group
        )

        x = np.average(
            [item["x"] for item in group],
            weights=[
                item["length"]
                for item in group
            ]
        )

        y1 = min(
            item["y1"]
            for item in group
        )

        y2 = max(
            item["y2"]
            for item in group
        )

        candidates.append(
            {
                "x": x,
                "y1": y1,
                "y2": y2,
                "length": total_length
            }
        )

    # ------------------------------------------------
    # Find the best left/right pair.
    # ------------------------------------------------

    best_pair = None
    best_score = -1

    center_x = w / 2

    for i in range(len(candidates)):

        for j in range(i + 1, len(candidates)):

            left = candidates[i]
            right = candidates[j]

            if left["x"] >= right["x"]:
                continue

            width = right["x"] - left["x"]

            # Package should have a reasonable width.
            if width < w * 0.15:
                continue

            if width > w * 0.60:
                continue

            midpoint = (
                left["x"] + right["x"]
            ) / 2

            center_distance = abs(
                midpoint - center_x
            )

            # Prefer centered packages.
            center_score = max(
                0,
                1 - center_distance / (w * 0.5)
            )

            # Prefer long vertical boundaries.
            length_score = min(
                1,
                (
                    left["length"]
                    + right["length"]
                ) / (2 * h * 0.5)
            )

            score = (
                0.6 * center_score
                + 0.4 * length_score
            )

            if score > best_score:

                best_score = score

                best_pair = (
                    left,
                    right
                )

    if best_pair is None:
        return None, None

    left, right = best_pair

    # ------------------------------------------------
    # Estimate top and bottom of package.
    # ------------------------------------------------

    top_y = max(
        0,
        min(left["y1"], right["y1"])
    )

    bottom_y = min(
        h - 1,
        max(left["y2"], right["y2"])
    )

    # Extend slightly if the detected lines
    # don't cover the complete package.
    top_y = max(
        0,
        int(top_y - h * 0.02)
    )

    bottom_y = min(
        h - 1,
        int(bottom_y + h * 0.02)
    )

    corners = np.array(
        [
            [left["x"], top_y],
            [right["x"], top_y],
            [right["x"], bottom_y],
            [left["x"], bottom_y]
        ],
        dtype=np.float32
    )

    corners = order_points(corners)

    # ------------------------------------------------
    # Perspective correction.
    # ------------------------------------------------

    width_top = np.linalg.norm(
        corners[1] - corners[0]
    )

    width_bottom = np.linalg.norm(
        corners[2] - corners[3]
    )

    height_left = np.linalg.norm(
        corners[3] - corners[0]
    )

    height_right = np.linalg.norm(
        corners[2] - corners[1]
    )

    output_width = int(
        max(
            width_top,
            width_bottom
        )
    )

    output_height = int(
        max(
            height_left,
            height_right
        )
    )

    if output_width <= 0 or output_height <= 0:
        return None, None

    destination = np.array(
        [
            [0, 0],
            [output_width - 1, 0],
            [output_width - 1, output_height - 1],
            [0, output_height - 1]
        ],
        dtype=np.float32
    )

    matrix = cv2.getPerspectiveTransform(
        corners,
        destination
    )

    roi = cv2.warpPerspective(
        original,
        matrix,
        (
            output_width,
            output_height
        )
    )

    return roi, corners

def _detect_quadrilateral_product(image):
    """
    Detect a product using a large quadrilateral contour.

    Useful for:
    - boxes
    - cartons
    - flat packages
    - rectangular labels
    """

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Reduce small texture/noise
    blurred = cv2.GaussianBlur(gray, (5, 5), 0)

    edges = cv2.Canny(blurred, 50, 150)

    # Close small gaps in product boundaries
    kernel = cv2.getStructuringElement(
        cv2.MORPH_RECT,
        (5, 5)
    )

    edges = cv2.morphologyEx(
        edges,
        cv2.MORPH_CLOSE,
        kernel
    )

    contours, _ = cv2.findContours(
        edges,
        cv2.RETR_EXTERNAL,
        cv2.CHAIN_APPROX_SIMPLE
    )

    if not contours:
        return None, None, 0.0

    h, w = image.shape[:2]
    image_area = h * w

    candidates = []

    for contour in contours:

        area = cv2.contourArea(contour)

        # Ignore tiny objects/noise
        if area < image_area * 0.05:
            continue

        perimeter = cv2.arcLength(contour, True)

        if perimeter == 0:
            continue

        approximation = cv2.approxPolyDP(
            contour,
            0.02 * perimeter,
            True
        )

        if len(approximation) != 4:
            continue

        corners = approximation.reshape(4, 2).astype(
            np.float32
        )

        # Make sure the polygon is convex
        if not cv2.isContourConvex(
            approximation
        ):
            continue

        # Product should have reasonable dimensions
        x, y, width, height = cv2.boundingRect(
            approximation
        )

        if width < w * 0.15 or height < h * 0.15:
            continue

        rectangularity = area / (width * height)

        if rectangularity < 0.60:
            continue

        center_x = (x + width / 2) / w
        center_y = (y + height / 2) / h

    center_distance = np.sqrt(
        (center_x - 0.5) ** 2 +
        (center_y - 0.5) ** 2
    )

    position_score = max(
        0.0,
        1.0 - center_distance / 0.707
    )

    area_ratio = area / image_area

    area_score = min(
    area_ratio / 0.5,
    1.0
    )

    aspect_ratio = width / height

    # Avoid extremely thin accidental rectangles
    aspect_score = 1.0

    if aspect_ratio < 0.08 or aspect_ratio > 12:
        aspect_score = 0.3

    candidate_score = (
        0.40 * area_score +
        0.30 * rectangularity +
        0.20 * position_score +
        0.10 * aspect_score
        )

    candidates.append(
    {
        "area": area,
        "corners": corners,
        "rectangularity": rectangularity,
        "score": candidate_score
    }
)

    if not candidates:
        return None, None, 0.0

    # Prefer the largest reasonable product candidate
    best = max(
        candidates,
        key=lambda candidate: candidate["score"]
    )

    corners = order_points(
        best["corners"]
    )

    # roi = _perspective_crop(
    #     image,
    #     corners
    # )
    roi = perspective_correct(
         image,
         corners
     )    

    if roi is None:
        return None, None, 0.0

    # Confidence based on how much of the image
    # the detected product occupies.
    confidence = best["score"]

    return roi, corners, confidence

def detect_product_roi(image):
    """
    General retail product ROI detector.
    """

    if image is None:
        raise ValueError("Image could not be loaded.")

    # Strategy 1: generic quadrilateral detection
    roi, corners, confidence = (
        _detect_quadrilateral_product(image)
    )

    if roi is not None:
        return roi, {
            "corners": corners,
            "geometry": "planar",
            "confidence": round(confidence, 3),
            "method": "quadrilateral"
        }

    # Strategy 2: existing Hough detector
    roi, corners = _detect_hough_product(image)

    if roi is not None:
        return roi, {
            "corners": corners,
            "geometry": "planar",
            "confidence": 0.75,
            "method": "hough"
        }

    return None, None
