"""Rule 7 minimum font-height lookup tables (Legal Metrology (Packaged
Commodities) Rules, 2011).

Table I applies when net quantity is declared by weight or volume.
Table II applies when net quantity is declared by length, area, or number
(keyed to the area of the principal display panel).

All heights in millimetres. Values confirmed against the official rules
text (Rule 7, Second Schedule).
"""

# Table I: (max_quantity_in_grams_or_ml, normal_mm, embossed_mm)
# Bands are upper-inclusive; float('inf') is the open-ended top band.
TABLE_I = [
    (200, 1.0, 2.0),
    (500, 2.0, 4.0),
    (float("inf"), 4.0, 6.0),
]

# Table II: (max_pdp_area_cm2, normal_mm, embossed_mm)
TABLE_II = [
    (100, 1.0, 2.0),
    (500, 2.0, 4.0),
    (2500, 4.0, 6.0),
    (float("inf"), 6.0, 6.0),
]

# General floor from Rule 7(3): applies regardless of table lookup.
MIN_HEIGHT_MM = 1.0
MIN_HEIGHT_EMBOSSED_MM = 2.0
MIN_WIDTH_TO_HEIGHT_RATIO = 1 / 3  # letters other than "1", "i", "I", "l"


def min_height_by_quantity(quantity_value: float, embossed: bool = False) -> float:
    """Minimum numeral height (mm) for a weight/volume declaration (Table I).

    quantity_value must already be normalized to grams (weight) or
    millilitres (volume) before calling this.
    """
    for max_value, normal_mm, embossed_mm in TABLE_I:
        if quantity_value <= max_value:
            return embossed_mm if embossed else normal_mm
    raise ValueError("Quantity value did not match any Table I band")


def min_height_by_pdp_area(area_cm2: float, embossed: bool = False) -> float:
    """Minimum numeral height (mm) for a length/area/number declaration
    (Table II), based on the Principal Display Panel area.
    """
    for max_area, normal_mm, embossed_mm in TABLE_II:
        if area_cm2 <= max_area:
            return embossed_mm if embossed else normal_mm
    raise ValueError("PDP area did not match any Table II band")
