"""
Stage 3 PDP Package — Principal Display Panel Detection, Unwarping & Spatial Metrology
Legal Metrology (Packaged Commodities) Rules, 2011
"""

from .classifier import DualStreamPDPClassifier
from .geometry import (
    calculate_pdp_area,
    compute_rule7_min_height,
    compute_rule8_clearance_box,
    four_point_transform,
    order_points,
    parse_package_dimensions,
)
from .pdp_detector import PDPDetector
from .pipeline import run_pdp_stage

__all__ = [
    "run_pdp_stage",
    "PDPDetector",
    "DualStreamPDPClassifier",
    "order_points",
    "four_point_transform",
    "calculate_pdp_area",
    "compute_rule7_min_height",
    "compute_rule8_clearance_box",
    "parse_package_dimensions",
]
