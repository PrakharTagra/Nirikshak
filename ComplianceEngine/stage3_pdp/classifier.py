"""
Stage 3 PDP — Dual-Stream Principal Display Panel Classifier
Combines Visual Artwork Prominence with Statutory Semantic Anchors
"""

from __future__ import annotations

import re
from typing import Any, Dict, List, Optional, Tuple

import cv2
import numpy as np


class DualStreamPDPClassifier:
    """
    Classifies packaging panels to identify the Principal Display Panel (PDP)
    versus Statutory/Manufacturer, Nutrition, or Barcode panels.
    """

    # Statutory positive anchors (Mandatory or customary on PDP)
    POSITIVE_PATTERNS = {
        "net_quantity": re.compile(
            r"\b(?:net\s*(?:wt\.?|weight|qty\.?|quantity)|gross\s*wt\.?|volume)?\s*[:\s]*\d+(?:\.\d+)?\s*(?:g|gm|gms|kg|ml|l|liter|litre|u\b|n\b|unit|units|piece|pieces|nos)\b",
            re.IGNORECASE,
        ),
        "front_callouts": re.compile(
            r"\b(?:new|improved|100%|pure|natural|instant|original|premium|classic|extra|max|special)\b",
            re.IGNORECASE,
        ),
    }

    # Statutory negative anchors (indicative of back/side panels, NOT PDP)
    NEGATIVE_PATTERNS = {
        "nutrition": re.compile(
            r"\b(?:nutritional\s*(?:information|facts|values?)|per\s*100\s*(?:g|ml)|energy\s*kcal|carbohydrates?|dietary\s*fiber|proteins?|added\s*sugars?|saturated\s*fat)\b",
            re.IGNORECASE,
        ),
        "ingredients": re.compile(
            r"\b(?:ingredients\s*:|composition\s*:|contains\s*added\s*flavou?r|storage\s*conditions?|keep\s*in\s*a\s*cool|allergen\s*warning)\b",
            re.IGNORECASE,
        ),
        "statutory_mfr": re.compile(
            r"\b(?:mfd\.?\s*by|manufactured\s*(?:by|for)|marketed\s*by|packed\s*by|pkd\.?\s*by|plot\s*no\.?|industrial\s*area|customer\s*care|consumer\s*helpline|toll[\s-]?free)\b",
            re.IGNORECASE,
        ),
        "statutory_lic": re.compile(
            r"\b(?:fssai\s*lic\.?\s*no\.?|licence\s*no\.?|iso\s*\d{4}|batch\s*no\.?|b\.?\s*no\.?|use\s*by\b|expiry\s*date)\b",
            re.IGNORECASE,
        ),
    }

    def __init__(self, visual_weight: float = 0.4, semantic_weight: float = 0.6):
        self.visual_weight = visual_weight
        self.semantic_weight = semantic_weight

    def score_visual_stream(self, image: np.ndarray) -> Dict[str, float]:
        """
        Evaluate artwork prominence, color saturation, and layout contrast.
        PDPs are characterized by bold typography, rich branding colors,
        and high visual contrast rather than uniform dense text paragraphs.
        """
        if image is None or image.size == 0:
            return {"visual_score": 0.0, "saturation": 0.0, "edge_density": 0.0}

        h, w = image.shape[:2]
        # Resize thumbnail for fast sub-millisecond calculation
        thumb = cv2.resize(image, (160, 160), interpolation=cv2.INTER_AREA)

        # 1. Color Saturation & Vibrancy in HSV space
        hsv = cv2.cvtColor(thumb, cv2.COLOR_BGR2HSV)
        s_channel = hsv[:, :, 1]
        mean_saturation = float(np.mean(s_channel)) / 255.0  # [0, 1]

        # 2. Layout & Edge Distribution
        # Front PDPs typically have distinct large silhouettes/logos,
        # while back panels have high-frequency repetitive horizontal lines (dense text).
        gray = cv2.cvtColor(thumb, cv2.COLOR_BGR2GRAY)
        edges = cv2.Canny(gray, 50, 150)
        edge_density = float(np.count_nonzero(edges)) / float(edges.size)

        # Back nutritional panels typically have edge_density > 0.18 with low saturation
        # Front PDPs typically have moderate edge density (0.05 - 0.14) with higher saturation
        text_density_penalty = 1.0
        if edge_density > 0.16 and mean_saturation < 0.20:
            text_density_penalty = 0.4  # Highly likely a dense back table
        elif edge_density < 0.02:
            text_density_penalty = 0.5  # Blank or blurry panel

        # Normalized visual score in [0.0, 1.0]
        visual_score = (0.6 * mean_saturation + 0.4 * (1.0 - abs(edge_density - 0.09) / 0.15)) * text_density_penalty
        visual_score = float(np.clip(visual_score, 0.0, 1.0))

        return {
            "visual_score": round(visual_score, 3),
            "saturation": round(mean_saturation, 3),
            "edge_density": round(edge_density, 3),
        }

    def score_semantic_stream(self, text_lines: List[str]) -> Dict[str, Any]:
        """
        Evaluate presence of statutory PDP anchors (Net Qty, Commodity name)
        vs Back-panel anchors (Nutrition tables, ingredients, manufacturer addresses).
        """
        combined_text = " ".join(text_lines).lower()
        if not combined_text.strip():
            return {
                "semantic_score": 0.5,  # Neutral when no text recognized yet
                "has_net_quantity": False,
                "has_nutrition_table": False,
                "has_ingredients": False,
                "has_statutory_mfr": False,
                "detected_role": "unknown",
            }

        # Check positive anchors
        has_net_qty = bool(self.POSITIVE_PATTERNS["net_quantity"].search(combined_text))
        has_front_callouts = bool(self.POSITIVE_PATTERNS["front_callouts"].search(combined_text))

        # Check negative anchors
        has_nutrition = bool(self.NEGATIVE_PATTERNS["nutrition"].search(combined_text))
        has_ingredients = bool(self.NEGATIVE_PATTERNS["ingredients"].search(combined_text))
        has_statutory_mfr = bool(self.NEGATIVE_PATTERNS["statutory_mfr"].search(combined_text))
        has_statutory_lic = bool(self.NEGATIVE_PATTERNS["statutory_lic"].search(combined_text))

        # Base score 0.5
        score = 0.5

        # Rewards
        if has_net_qty:
            score += 0.35  # Rule 6(1)(c) Net Qty is primary mandate of PDP
        if has_front_callouts:
            score += 0.10

        # Penalties
        if has_nutrition:
            score -= 0.40  # Back panel
        if has_ingredients:
            score -= 0.25
        if has_statutory_mfr:
            score -= 0.25
        if has_statutory_lic:
            score -= 0.15

        # Bound score in [0.0, 1.0]
        score = float(np.clip(score, 0.0, 1.0))

        # Infer panel role
        if has_nutrition and (has_ingredients or has_statutory_mfr):
            role = "statutory_back"
        elif has_net_qty and score >= 0.55:
            role = "pdp_front"
        elif has_statutory_mfr or has_statutory_lic:
            role = "manufacturer_panel"
        elif score > 0.5:
            role = "pdp_front"
        else:
            role = "secondary_panel"

        return {
            "semantic_score": round(score, 3),
            "has_net_quantity": has_net_qty,
            "has_nutrition_table": has_nutrition,
            "has_ingredients": has_ingredients,
            "has_statutory_mfr": has_statutory_mfr,
            "has_statutory_lic": has_statutory_lic,
            "detected_role": role,
        }

    def classify_panel(
        self,
        image: np.ndarray,
        text_lines: Optional[List[str]] = None,
    ) -> Dict[str, Any]:
        """
        Fused classification combining visual and semantic streams.
        Returns composite confidence that this panel is the Principal Display Panel (PDP).
        """
        v_res = self.score_visual_stream(image)
        s_res = self.score_semantic_stream(text_lines or [])

        v_score = v_res["visual_score"]
        s_score = s_res["semantic_score"]

        # If no text available, visual stream carries higher weight
        if not text_lines:
            fused_score = v_score
        else:
            fused_score = (self.visual_weight * v_score) + (self.semantic_weight * s_score)

        fused_score = float(np.clip(fused_score, 0.0, 1.0))
        is_pdp = fused_score >= 0.50 and not s_res["has_nutrition_table"]

        return {
            "is_pdp": is_pdp,
            "pdp_confidence": round(fused_score, 3),
            "visual_metrics": v_res,
            "semantic_metrics": s_res,
            "predicted_panel_role": s_res["detected_role"] if is_pdp else (s_res["detected_role"] or "secondary_panel"),
        }
