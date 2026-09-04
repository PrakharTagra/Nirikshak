"""Generalized extraction of declaration fields from OCR text.

No coordinates or product-specific strings are hard-coded.  Extraction is
based on label vocabulary, regular expressions and nearby OCR lines.
"""

from __future__ import annotations

import re
from typing import Any, Dict, List, Optional, Tuple


MONTH_NAMES = r"(?:jan(?:uary)?|feb(?:ruary)?|mar(?:ch)?|apr(?:il)?|may|jun(?:e)?|jul(?:y)?|aug(?:ust)?|sep(?:tember)?|oct(?:ober)?|nov(?:ember)?|dec(?:ember)?)"

DATE_RE = re.compile(
    rf"\b(?:0?[1-9]|[12]\d|3[01])\s*[-/.]\s*(?:0?[1-9]|1[0-2])\s*[-/.]\s*(?:\d{{2}}|\d{{4}})\b"
    rf"|\b(?:0?[1-9]|1[0-2])\s*[-/.]\s*(?:\d{{2}}|\d{{4}})\b"
    rf"|\b{MONTH_NAMES}\s*[-/.]?,?\s*(?:\d{{2}}|\d{{4}})\b"
    rf"|\b(?:0?[1-9]|[12]\d|3[01])\s+{MONTH_NAMES}\s+(?:\d{{2}}|\d{{4}})\b",
    re.I,
)

PIN_RE = re.compile(r"\b[1-9][0-9]{5}\b")

MONEY_RE = re.compile(
    r"(?:₹|rs\.?|inr)?\s*\d+(?:,\d{3})*(?:\.\d{1,2})?",
    re.I,
)

QUANTITY_RE = re.compile(
    r"\b(\d+(?:\.\d+)?)\s*(kg|kgs|kilograms?|g|gm|gms|grams?|l|litres?|liters?|ml|millilit(?:re|er)s?|u|unit|units|n|no|nos|number|numbers|pc|pcs|piece|pieces)\b",
    re.I,
)


def _norm(text: str) -> str:
    return re.sub(r"\s+", " ", text).strip()


def _find_line(lines: List[Dict[str, Any]], pattern: str) -> Optional[Dict[str, Any]]:
    rx = re.compile(pattern, re.I)
    for line in lines:
        if rx.search(line["text"]):
            return line
    return None


def _find_nearby(lines: List[Dict[str, Any]], index: int, keywords: List[str], window: int = 2):
    for j in range(max(0, index - window), min(len(lines), index + window + 1)):
        if any(re.search(k, lines[j]["text"], re.I) for k in keywords):
            return lines[j]
    return None


def _line_index(lines: List[Dict[str, Any]], line: Optional[Dict[str, Any]]) -> int:
    if line is None:
        return -1
    for i, item in enumerate(lines):
        if item is line:
            return i
    return -1


def _first_match(lines: List[Dict[str, Any]], patterns: List[str]) -> Optional[Dict[str, Any]]:
    for pattern in patterns:
        line = _find_line(lines, pattern)
        if line:
            return line
    return None


def _extract_quantity(line: Optional[Dict[str, Any]]) -> Tuple[Optional[float], Optional[str], str]:
    if not line:
        return None, None, ""
    m = QUANTITY_RE.search(line["text"])
    if not m:
        return None, None, line["text"]
    value = float(m.group(1))
    unit_raw = m.group(2).lower()
    if unit_raw.startswith("kg") or unit_raw.startswith("kilogram"):
        unit = "kg"
    elif unit_raw in {"g", "gm", "gms"} or unit_raw.startswith("gram"):
        unit = "g"
    elif unit_raw.startswith("l") or unit_raw.startswith("lit"):
        unit = "l"
    elif unit_raw.startswith("ml"):
        unit = "ml"
    elif unit_raw in {"unit", "units", "u", "n", "no", "nos", "pc", "pcs", "piece", "pieces", "number", "numbers"}:
        unit = "unit"
    else:
        unit = unit_raw
    return value, unit, line["text"]


def _extract_money(line: Optional[Dict[str, Any]]) -> Optional[float]:
    if not line:
        return None
    matches = MONEY_RE.findall(line["text"])
    if not matches:
        return None
    # Use the final amount on an MRP line; this handles a crossed-out old MRP
    # followed by the current printed MRP.
    raw = matches[-1]
    # Remove currency text without removing the decimal point.
    raw = re.sub(r"(?:₹|rs\.?|inr)\s*", "", raw, flags=re.I)
    raw = raw.replace(",", "").strip()
    try:
        return float(raw)
    except ValueError:
        return None


def extract_declarations(lines: List[Dict[str, Any]]) -> Dict[str, Any]:
    """Extract only OCR-observable declarations.

    Fields that cannot be supported by the OCR evidence remain null/false;
    this layer never invents compliance facts.
    """

    clean_lines = [dict(x, text=_norm(str(x["text"]))) for x in lines if _norm(str(x.get("text", "")))]

    manufacturer_line = _first_match(
        clean_lines,
        [
            r"\bmanufactur(?:ed|er)\b",
            r"\bmfg\.?\s*(?:by|at)\b",
            r"\bmarketed\s+(?:and\s+supported\s+by|by)\b",
            r"\bmanufactured\s*&?\s*marketed\s+by\b",
            r"\bimported\s+by\b",
            r"\bpacked\s+by\b",
        ],
    )

    name_line = _first_match(
        clean_lines,
        [
            r"\b(?:item|generic|product)\s*name\s*:\s*(.+)",
            r"\bmodel\s*no\.?\s*:\s*(.+)",
        ],
    )
    if name_line is None:
        name_words = r"bottle|cream|lotion|shampoo|oil|soap|detergent|powder|spray|liquid|food|drink|juice|snack|biscuits?|tablet|capsule|charger|adapter|paste|gel|tube|pack"
        for line in clean_lines[: max(8, len(clean_lines) // 3)]:
            text = line["text"]
            if 2 <= len(text.split()) <= 10 and re.search(name_words, text, re.I):
                name_line = line
                break

    quantity_line = _first_match(clean_lines, [r"\bnet\s*(?:qty|quantity|weight|wt)\b", r"\bcontents?\b"])
    if quantity_line is None:
        for line in clean_lines:
            if QUANTITY_RE.search(line["text"]):
                quantity_line = line
                break

    mfg_line = _first_match(
        clean_lines,
        [
            r"\bmonth\s*(&|and)?\s*year\s+of\s+manufactur\w*",
            r"\bdate\s+of\s+manufactur\w*",
            r"\bmfg\.?\s*(?:date|dt)\b",
            r"\bmanufactur(?:ed|ing)\s+date\b",
            r"\bmfg\b",
            r"\bpkd\b",
            r"\bpacked\b",
            r"\bpacking\s+date\b",
        ],
    )
    if mfg_line is None:
        for line in clean_lines:
            if re.search(r"\bmfg\b|\bmanufacturing\b|\bpacked\b|\bpkd\b", line["text"], re.I) and DATE_RE.search(line["text"]):
                mfg_line = line
                break

    mrp_line = _first_match(clean_lines, [r"\bmrp\b", r"maximum\s+retail\s+price"])
    care_line = _first_match(clean_lines, [r"consumer\s*care", r"customer\s*care", r"customer\s*service", r"helpline", r"toll[- ]?free"])
    standard_line = _first_match(clean_lines, [r"standard\s+pack", r"std\.?\s+pack"])

    qty_value, qty_unit, qty_raw = _extract_quantity(quantity_line)

    if manufacturer_line:
        idx = _line_index(clean_lines, manufacturer_line)
        has_address = False
        mfg_display_text = manufacturer_line["text"]
        if idx + 1 < len(clean_lines) and re.match(r"^(?:marketed|manufactured|supported|imported|packed)\b.*:$", mfg_display_text, re.I):
            mfg_display_text = clean_lines[idx + 1]["text"]

        for j in range(idx, min(len(clean_lines), idx + 6)):
            ltext = clean_lines[j]["text"]
            if PIN_RE.search(ltext) or re.search(r"address\s*:|\bindia\b|\broad\b|\bsector\b|\barea\b|\bphase\b|\bdelhi\b|\bmumbai\b|\bchennai\b|\bkolkata\b", ltext, re.I):
                has_address = True
                break
        manufacturer_address = has_address
    else:
        mfg_display_text = None
        manufacturer_address = False

    mfg_date = None
    if mfg_line:
        match = DATE_RE.search(mfg_line["text"])
        mfg_date = match.group(0) if match else mfg_line["text"]

    mrp_value = _extract_money(mrp_line)
    mrp_text = mrp_line["text"] if mrp_line else ""
    tax_pattern = r"incl\.?\s*(?:of\s*)?(?:all\s*)?tax|inclusive\s+of\s+(?:all\s+)?tax"
    inclusive = bool(re.search(tax_pattern, mrp_text, re.I))
    if not inclusive and mrp_line:
        idx = _line_index(clean_lines, mrp_line)
        nearby = _find_nearby(clean_lines, idx, [tax_pattern], window=2)
        inclusive = nearby is not None

    qualified = None
    if quantity_line:
        qualified = bool(re.search(r"when\s+packed|at\s+the\s+time\s+of\s+packing|packed\s+on", quantity_line["text"], re.I))

    unit_kind = "mass" if qty_unit in {"g", "kg"} else "volume" if qty_unit in {"ml", "l"} else "number" if qty_unit == "unit" else None

    return {
        "commodityName": {
            "present": name_line is not None,
            "text": name_line["text"] if name_line else None,
            "bbox": name_line["bbox"] if name_line else None,
            "confidence": name_line["confidence"] if name_line else None,
        },
        "manufacturer": {
            "present": manufacturer_line is not None,
            "text": mfg_display_text if manufacturer_line else None,
            "address": manufacturer_address,
            "bbox": manufacturer_line["bbox"] if manufacturer_line else None,
            "confidence": manufacturer_line["confidence"] if manufacturer_line else None,
        },
        "netQuantity": {
            "present": quantity_line is not None,
            "rawText": qty_raw if quantity_line else "",
            "value": qty_value,
            "unit": qty_unit,
            "unitKind": unit_kind,
            "qualifiedWhenPacked": qualified,
            "bbox": quantity_line["bbox"] if quantity_line else None,
            "pixel_height": quantity_line["pixel_height"] if quantity_line else None,
        },
        "mfgDate": {
            "present": mfg_line is not None,
            "rawText": mfg_line["text"] if mfg_line else "",
            "date": mfg_date,
            "bbox": mfg_line["bbox"] if mfg_line else None,
        },
        "mrp": {
            "present": mrp_line is not None,
            "rawText": mrp_text,
            "value": mrp_value,
            "inclusiveOfTaxesStated": inclusive,
            "bbox": mrp_line["bbox"] if mrp_line else None,
        },
        "consumerCare": {
            "present": care_line is not None,
            "rawText": care_line["text"] if care_line else "",
            "bbox": care_line["bbox"] if care_line else None,
        },
        "standardPackDeclaration": {
            "present": standard_line is not None,
            "rawText": standard_line["text"] if standard_line else "",
            "bbox": standard_line["bbox"] if standard_line else None,
        },
    }
