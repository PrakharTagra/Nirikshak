"""
image_handler.py — Image Loading, Validation, and ReportLab Integration
========================================================================
Handles all image-related operations for the compliance report:
  - Loading images with PIL/Pillow
  - Validating existence and readability
  - Computing scaled dimensions to fit PDF page bounds
  - Creating annotated copies (in memory, without modifying originals)
  - Returning ReportLab Image flowables

Legal Methodology Compliance Automation — Stage-9
"""

import io
import os
import copy
import tempfile
from typing import Optional, Tuple, Dict, Any

from PIL import Image as PILImage, ImageDraw, ImageFont
from reportlab.platypus import Image as RLImage
from reportlab.lib.units import mm


# ---------------------------------------------------------------------------
# CONSTANTS
# ---------------------------------------------------------------------------

MAX_IMAGE_WIDTH_MM  = 110   # maximum image width in mm (within content area)
MAX_IMAGE_HEIGHT_MM = 45    # maximum image height in mm (compact, fits cleanly)


def _mm_to_pt(mm_val: float) -> float:
    return mm_val * mm


# ---------------------------------------------------------------------------
# IMAGE LOADING
# ---------------------------------------------------------------------------

def load_image(path: str) -> Optional[PILImage.Image]:
    """
    Load an image from disk using Pillow.

    Returns PIL Image on success, None on failure.
    Never raises; logs to stderr if unavailable.
    """
    if not path:
        return None
    if not os.path.isfile(path):
        return None
    try:
        img = PILImage.open(path)
        img.verify()                      # validates header without fully loading
        img = PILImage.open(path)         # re-open after verify (verify closes file)
        img.load()                        # ensure fully loaded
        return img
    except Exception as exc:
        print(f'  [image_handler] Cannot load {os.path.basename(path)}: {exc}')
        return None


def get_scaled_dimensions(
    img: PILImage.Image,
    max_width_mm:  float = MAX_IMAGE_WIDTH_MM,
    max_height_mm: float = MAX_IMAGE_HEIGHT_MM,
) -> Tuple[float, float]:
    """
    Return (width_pt, height_pt) scaled to fit within max bounds,
    preserving the original aspect ratio.
    """
    orig_w, orig_h = img.size
    if orig_w == 0 or orig_h == 0:
        return _mm_to_pt(max_width_mm), _mm_to_pt(max_height_mm)

    max_w_pt = _mm_to_pt(max_width_mm)
    max_h_pt = _mm_to_pt(max_height_mm)

    # Scale by width
    scale_by_w = max_w_pt / orig_w
    # Scale by height
    scale_by_h = max_h_pt / orig_h

    # Use the smaller scale to fit within both bounds
    scale = min(scale_by_w, scale_by_h)

    return orig_w * scale, orig_h * scale


def image_to_rl_flowable(
    path: str,
    max_width_mm:  float = MAX_IMAGE_WIDTH_MM,
    max_height_mm: float = MAX_IMAGE_HEIGHT_MM,
    hAlign: str = 'CENTER',
) -> Optional[RLImage]:
    """
    Load an image and return a ReportLab Image flowable scaled to fit.

    Returns None if image cannot be loaded.
    """
    img = load_image(path)
    if img is None:
        return None

    # Convert to RGB for safe JPEG/PDF embedding
    if img.mode not in ('RGB', 'L'):
        img = img.convert('RGB')

    w_pt, h_pt = get_scaled_dimensions(img, max_width_mm, max_height_mm)

    # Save to bytes buffer so ReportLab can embed
    buf = io.BytesIO()
    img.save(buf, format='JPEG', quality=85, optimize=True)
    buf.seek(0)

    rl_img = RLImage(buf, width=w_pt, height=h_pt)
    rl_img.hAlign = hAlign
    return rl_img


def bbox_image_to_rl_flowable(
    image_path: str,
    max_width_mm: float = 120,
    max_height_mm: float = 65,
    hAlign: str = 'CENTER',
) -> Optional[RLImage]:
    """
    Specifically prepares net_quantity_bounding_box.png by focusing on the
    package and bounding box while preserving the top banner, so the green/red
    boxes and legal text are clearly legible.
    """
    if not image_path or not os.path.isfile(image_path):
        return None
    try:
        img = PILImage.open(image_path).convert('RGB')
        w, h = img.size
        # The banner is at the top (top ~3.5% of height)
        banner_h = max(35, int(h * 0.038))
        banner = img.crop((0, 0, w, banner_h))

        # The package is typically in the vertical range 32% to 72%
        y1 = int(h * 0.32)
        y2 = int(h * 0.72)
        x1 = int(w * 0.06)
        x2 = int(w * 0.94)
        package = img.crop((x1, y1, x2, y2))

        # Stack banner on top of cropped package
        combined = PILImage.new('RGB', (package.width, banner.height + package.height))
        banner_resized = banner.resize((package.width, banner.height))
        combined.paste(banner_resized, (0, 0))
        combined.paste(package, (0, banner.height))

        buf = io.BytesIO()
        combined.save(buf, format='JPEG', quality=92)
        buf.seek(0)

        c_w, c_h = combined.size
        scale = min((max_width_mm * mm) / c_w, (max_height_mm * mm) / c_h)
        target_w = c_w * scale
        target_h = c_h * scale

        rl_img = RLImage(buf, width=target_w, height=target_h)
        rl_img.hAlign = hAlign
        return rl_img
    except Exception:
        return image_to_rl_flowable(image_path, max_width_mm, max_height_mm, hAlign)


# ---------------------------------------------------------------------------
# ANNOTATION
# ---------------------------------------------------------------------------

# Annotation colours (RGBA for PIL)
_BOX_COLOR    = (220, 50, 50, 200)    # red bounding box
_EXCL_COLOR   = (255, 165, 0, 140)    # orange exclusion zone
_TEXT_BG      = (220, 50, 50, 180)
_TEXT_COLOR   = (255, 255, 255, 255)


def _draw_rectangle(draw: ImageDraw.ImageDraw, box: Dict, color, width=3):
    """Draw a rectangle from a {x1,y1,x2,y2} or {x1,y1,x2,y2} dict."""
    if not box:
        return
    try:
        x1 = int(box.get('x1', 0))
        y1 = int(box.get('y1', 0))
        x2 = int(box.get('x2', 0))
        y2 = int(box.get('y2', 0))
        draw.rectangle([x1, y1, x2, y2], outline=color, width=width)
    except Exception:
        pass


def _draw_label(draw: ImageDraw.ImageDraw, box: Dict, label: str, color=(220, 50, 50)):
    """Draw a small text label above a bounding box."""
    if not box:
        return
    try:
        x1 = int(box.get('x1', 0))
        y1 = int(box.get('y1', 0))
        # Try to draw a small text label
        draw.rectangle([x1, max(0, y1 - 16), x1 + len(label) * 7, y1], fill=color)
        draw.text((x1 + 2, max(0, y1 - 15)), label, fill=(255, 255, 255))
    except Exception:
        pass


def create_annotated_image(
    original_path: str,
    annotation_data: Optional[Dict[str, Any]],
) -> Optional[bytes]:
    """
    Create an annotated copy of the image in memory (as JPEG bytes).

    Draws:
    - Net quantity bounding box (red)
    - Exclusion zone (orange dashed)
    - Intrusion text areas (red hatched)

    NEVER modifies the original file.

    Returns bytes of the annotated JPEG, or None on failure.
    """
    img = load_image(original_path)
    if img is None:
        return None

    if img.mode not in ('RGB', 'RGBA'):
        img = img.convert('RGBA')
    else:
        img = img.copy()

    # Use RGBA for alpha overlays
    if img.mode != 'RGBA':
        img = img.convert('RGBA')

    overlay = PILImage.new('RGBA', img.size, (0, 0, 0, 0))
    draw = ImageDraw.Draw(overlay)

    if annotation_data:
        # Draw net quantity bounding box
        nq_box = annotation_data.get('netQuantityBox')
        if nq_box:
            x1, y1, x2, y2 = nq_box.get('x1',0), nq_box.get('y1',0), \
                               nq_box.get('x2',0), nq_box.get('y2',0)
            draw.rectangle([x1, y1, x2, y2], outline=(220, 50, 50, 230), width=3)
            # Fill with very light red
            draw.rectangle([x1+2, y1+2, x2-2, y2-2], fill=(220, 50, 50, 30))

        # Draw exclusion zone
        excl_box = annotation_data.get('exclusionBox')
        if excl_box:
            x1, y1, x2, y2 = excl_box.get('x1',0), excl_box.get('y1',0), \
                               excl_box.get('x2',0), excl_box.get('y2',0)
            draw.rectangle([x1, y1, x2, y2], outline=(255, 140, 0, 200), width=2)
            draw.rectangle([x1+2, y1+2, x2-2, y2-2], fill=(255, 140, 0, 20))

        # Mark intrusion areas
        intrusions = annotation_data.get('intrusions', [])
        for intr in intrusions:
            pos = intr.get('position', '')
            # We can't easily draw text bbox from intrusion data, so draw an
            # indicator arrow above/below the exclusion zone
            if excl_box:
                mid_x = (excl_box.get('x1', 0) + excl_box.get('x2', 0)) // 2
                if pos == 'above':
                    # Draw down-arrow pointing to the violation zone
                    arrow_y = excl_box.get('y1', 0) - 20
                    draw.polygon(
                        [(mid_x, excl_box.get('y1', 0)),
                         (mid_x - 15, arrow_y),
                         (mid_x + 15, arrow_y)],
                        fill=(220, 50, 50, 180),
                    )
                elif pos == 'below':
                    arrow_y = excl_box.get('y2', 0) + 20
                    draw.polygon(
                        [(mid_x, excl_box.get('y2', 0)),
                         (mid_x - 15, arrow_y),
                         (mid_x + 15, arrow_y)],
                        fill=(220, 50, 50, 180),
                    )

    # Composite
    img = PILImage.alpha_composite(img, overlay).convert('RGB')

    buf = io.BytesIO()
    img.save(buf, format='JPEG', quality=85, optimize=True)
    return buf.getvalue()


def annotated_image_to_rl_flowable(
    original_path: str,
    annotation_data: Optional[Dict[str, Any]],
    max_width_mm:  float = MAX_IMAGE_WIDTH_MM,
    max_height_mm: float = MAX_IMAGE_HEIGHT_MM,
    hAlign: str = 'CENTER',
) -> Optional[RLImage]:
    """
    Create an annotated copy and return it as a ReportLab Image flowable.
    Falls back to the original image if annotation fails.
    """
    ann_bytes = create_annotated_image(original_path, annotation_data)

    if ann_bytes is None:
        # Fallback: use original
        return image_to_rl_flowable(original_path, max_width_mm, max_height_mm, hAlign)

    buf = io.BytesIO(ann_bytes)

    orig_img = load_image(original_path)
    if orig_img:
        w_pt, h_pt = get_scaled_dimensions(orig_img, max_width_mm, max_height_mm)
    else:
        w_pt = _mm_to_pt(max_width_mm)
        h_pt = _mm_to_pt(max_height_mm)

    rl_img = RLImage(buf, width=w_pt, height=h_pt)
    rl_img.hAlign = hAlign
    return rl_img


def unavailable_placeholder_text(evidence_id: str) -> str:
    """Return placeholder text for missing evidence images."""
    return f'Evidence image unavailable — {evidence_id}'
