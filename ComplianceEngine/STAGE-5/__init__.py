"""Stage 5: Font Size & Readability Analysis Engine."""

from .dimension_resolver import (
    extract_packaging_dimensions,
    resolve_packaging_dimensions,
    calculate_pixels_per_mm,
    parse_dimension_string,
    prompt_user_for_dimensions,
)
from .font_geometry import measure_declaration_font, isolate_numeral_contours
from .clearance_check import evaluate_quantity_clearance
from .readability_analyzer import analyze_font_and_readability

__all__ = [
    "extract_packaging_dimensions",
    "resolve_packaging_dimensions",
    "calculate_pixels_per_mm",
    "parse_dimension_string",
    "prompt_user_for_dimensions",
    "measure_declaration_font",
    "isolate_numeral_contours",
    "evaluate_quantity_clearance",
    "analyze_font_and_readability",
]
