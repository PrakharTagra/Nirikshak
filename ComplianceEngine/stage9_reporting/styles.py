"""
styles.py — Master Style Definitions for Compliance Report Generator
====================================================================
Single source of truth for ALL visual properties used in the PDF.
Authentic Government / Regulatory Legal Inspection Report Style.

Legal Methodology Compliance Automation — Stage-9
"""

from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm
from reportlab.lib.colors import HexColor, white, black
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.enums import TA_LEFT, TA_CENTER, TA_RIGHT, TA_JUSTIFY
from reportlab.lib import colors

# ---------------------------------------------------------------------------
# PAGE LAYOUT CONSTANTS (Strict 5-Page Government Report Format)
# ---------------------------------------------------------------------------

PAGE_WIDTH, PAGE_HEIGHT = A4          # 595.27 x 841.89 pt

MARGIN_LEFT   = 13 * mm               # 13 mm margins
MARGIN_RIGHT  = 13 * mm
MARGIN_TOP    = 10.5 * mm             # 10.5 mm top margin
MARGIN_BOTTOM = 10.5 * mm             # 10.5 mm bottom margin

CONTENT_WIDTH  = PAGE_WIDTH  - MARGIN_LEFT - MARGIN_RIGHT   # ~169 mm
CONTENT_HEIGHT = PAGE_HEIGHT - MARGIN_TOP  - MARGIN_BOTTOM

HEADER_HEIGHT = 14
FOOTER_HEIGHT = 13

# ---------------------------------------------------------------------------
# COLOUR PALETTE — Official Government / Statutory Document
# ---------------------------------------------------------------------------

C_NAVY        = HexColor('#0F172A')   # Slate 900 (primary text & formal header)
C_SLATE       = HexColor('#1E293B')   # Slate 800
C_BLUE        = HexColor('#1E3A8A')   # Navy 900 (statutory rule headers)
C_DARK_GRAY   = HexColor('#111827')   # Black/Dark Gray body
C_MID_GRAY    = HexColor('#4B5563')   # Gray 600
C_LIGHT_GRAY  = HexColor('#F9FAFB')   # Gray 50 (subtle alternating row)
C_WHITE       = white
C_BLACK       = black

# Formal Institutional Status Badges (restrained, non-candy)
C_GREEN_DARK  = HexColor('#14532D')   # Forest Green
C_GREEN_BG    = HexColor('#DCFCE7')   # Soft Green tint
C_RED_DARK    = HexColor('#7F1D1D')   # Deep Crimson
C_RED_BG      = HexColor('#FEE2E2')   # Soft Red tint
C_AMBER_DARK  = HexColor('#78350F')   # Deep Amber
C_AMBER_BG    = HexColor('#FEF3C7')   # Soft Amber tint

C_TABLE_HEAD  = HexColor('#0F172A')   # Formal Dark Table Header
C_RULE_LINE   = HexColor('#94A3B8')   # Slate 400 crisp dividing rule
C_BORDER      = HexColor('#CBD5E1')   # Slate 300 hairline border
C_SEAL_BORDER = HexColor('#475569')   # Seal outline

STATUS_COLORS = {
    'COMPLIANT':           C_GREEN_DARK,
    'NON-COMPLIANT':       C_RED_DARK,
    'PARTIAL':             C_AMBER_DARK,
    'PARTIALLY COMPLIANT': C_AMBER_DARK,
    'NOT APPLICABLE':      C_MID_GRAY,
    'REQUIRES REVIEW':     C_AMBER_DARK,
    'N/A':                 C_MID_GRAY,
}

SEVERITY_COLORS = {
    'critical': C_RED_DARK,
    'high':     C_RED_DARK,
    'major':    C_RED_DARK,
    'medium':   C_AMBER_DARK,
    'minor':    C_AMBER_DARK,
    'low':      C_GREEN_DARK,
    'info':     C_MID_GRAY,
}

# ---------------------------------------------------------------------------
# FONT CONSTANTS
# ---------------------------------------------------------------------------

FONT_REGULAR     = 'Helvetica'
FONT_BOLD        = 'Helvetica-Bold'
FONT_ITALIC      = 'Helvetica-Oblique'
FONT_BOLD_ITALIC = 'Helvetica-BoldOblique'

# ---------------------------------------------------------------------------
# PARAGRAPH STYLES (High-density, official legal document hierarchy)
# ---------------------------------------------------------------------------

_base = getSampleStyleSheet()


def _ps(name, **kwargs) -> ParagraphStyle:
    defaults = dict(
        fontName=FONT_REGULAR,
        fontSize=7.5,
        leading=10,
        textColor=C_DARK_GRAY,
        spaceAfter=1,
        spaceBefore=1,
        alignment=TA_LEFT,
    )
    defaults.update(kwargs)
    return ParagraphStyle(name, **defaults)


# --- Cover page & Header styles ---
PS_GOV_HEADER = _ps(
    'GovHeader',
    fontName=FONT_BOLD,
    fontSize=8.5,
    leading=11.5,
    textColor=C_NAVY,
    alignment=TA_CENTER,
    spaceAfter=1,
)

PS_GOV_SUBHEADER = _ps(
    'GovSubheader',
    fontName=FONT_REGULAR,
    fontSize=7.5,
    leading=10,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
    spaceAfter=3,
)

PS_COVER_TITLE = _ps(
    'CoverTitle',
    fontName=FONT_BOLD,
    fontSize=18,
    leading=22,
    textColor=C_NAVY,
    alignment=TA_CENTER,
    spaceAfter=4,
    spaceBefore=4,
)

PS_COVER_SUBTITLE = _ps(
    'CoverSubtitle',
    fontName=FONT_BOLD,
    fontSize=10,
    leading=13,
    textColor=C_BLUE,
    alignment=TA_CENTER,
    spaceAfter=4,
)

PS_COVER_LABEL = _ps(
    'CoverLabel',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=11,
    textColor=C_NAVY,
    alignment=TA_LEFT,
)

PS_COVER_VALUE = _ps(
    'CoverValue',
    fontName=FONT_REGULAR,
    fontSize=8,
    leading=11,
    textColor=C_DARK_GRAY,
    alignment=TA_LEFT,
)

PS_COVER_FOOTER = _ps(
    'CoverFooter',
    fontName=FONT_ITALIC,
    fontSize=7,
    leading=9.5,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
)

# --- Section headings ---
PS_SECTION_HEADING = _ps(
    'SectionHeading',
    fontName=FONT_BOLD,
    fontSize=9.5,
    leading=12.5,
    textColor=C_NAVY,
    spaceBefore=5,
    spaceAfter=2,
)

PS_SUBSECTION_HEADING = _ps(
    'SubsectionHeading',
    fontName=FONT_BOLD,
    fontSize=8.5,
    leading=11,
    textColor=C_BLUE,
    spaceBefore=3,
    spaceAfter=1,
)

PS_FINDING_HEADING = _ps(
    'FindingHeading',
    fontName=FONT_BOLD,
    fontSize=8.5,
    leading=11,
    textColor=C_RED_DARK,
    spaceBefore=3,
    spaceAfter=1,
)

# --- Body text ---
PS_BODY = _ps(
    'Body',
    fontName=FONT_REGULAR,
    fontSize=7.5,
    leading=10,
    textColor=C_DARK_GRAY,
    spaceBefore=1,
    spaceAfter=1,
)

PS_BODY_JUSTIFIED = _ps(
    'BodyJustified',
    fontName=FONT_REGULAR,
    fontSize=7.5,
    leading=10,
    textColor=C_DARK_GRAY,
    alignment=TA_JUSTIFY,
    spaceBefore=1,
    spaceAfter=1,
)

PS_BODY_SMALL = _ps(
    'BodySmall',
    fontName=FONT_REGULAR,
    fontSize=6.5,
    leading=8.5,
    textColor=C_MID_GRAY,
    spaceBefore=0,
    spaceAfter=1,
)

# --- Table paragraph styles ---
PS_TABLE_HEADER = _ps(
    'TableHeader',
    fontName=FONT_BOLD,
    fontSize=7,
    leading=8.5,
    textColor=C_WHITE,
    alignment=TA_CENTER,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_HEADER_LEFT = _ps(
    'TableHeaderLeft',
    fontName=FONT_BOLD,
    fontSize=7,
    leading=8.5,
    textColor=C_WHITE,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY = _ps(
    'TableBody',
    fontName=FONT_REGULAR,
    fontSize=7,
    leading=8.5,
    textColor=C_DARK_GRAY,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY_BOLD = _ps(
    'TableBodyBold',
    fontName=FONT_BOLD,
    fontSize=7,
    leading=8.5,
    textColor=C_DARK_GRAY,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY_CENTER = _ps(
    'TableBodyCenter',
    fontName=FONT_REGULAR,
    fontSize=7,
    leading=8.5,
    textColor=C_DARK_GRAY,
    alignment=TA_CENTER,
    spaceBefore=0,
    spaceAfter=0,
)

PS_CAPTION = _ps(
    'Caption',
    fontName=FONT_ITALIC,
    fontSize=6.5,
    leading=8.5,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
    spaceBefore=1,
    spaceAfter=3,
)

PS_EVIDENCE_LABEL = _ps(
    'EvidenceLabel',
    fontName=FONT_BOLD,
    fontSize=7.5,
    leading=9.5,
    textColor=C_NAVY,
    spaceBefore=2,
    spaceAfter=1,
)

PS_WARNING_BOX = _ps(
    'WarningBox',
    fontName=FONT_ITALIC,
    fontSize=7,
    leading=9,
    textColor=C_AMBER_DARK,
    spaceBefore=1,
    spaceAfter=1,
)

PS_NOTE = _ps(
    'Note',
    fontName=FONT_ITALIC,
    fontSize=6.5,
    leading=8.5,
    textColor=C_MID_GRAY,
    spaceBefore=2,
    spaceAfter=1,
)

# ---------------------------------------------------------------------------
# TABLE STYLE BUILDERS
# ---------------------------------------------------------------------------

from reportlab.platypus import TableStyle as _TS

_GRID      = colors.HexColor('#CBD5E1')
_DARK_GRID = colors.HexColor('#94A3B8')
_HEAD_BG   = C_TABLE_HEAD
_ALT_ROW   = C_LIGHT_GRAY


def _base_table_style(extra=None):
    cmds = [
        ('FONTNAME',       (0, 0), (-1, 0),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, 0),  7),
        ('BACKGROUND',     (0, 0), (-1, 0),  _HEAD_BG),
        ('TEXTCOLOR',      (0, 0), (-1, 0),  white),
        ('ALIGN',          (0, 0), (-1, 0),  'CENTER'),
        ('VALIGN',         (0, 0), (-1, -1), 'MIDDLE'),
        ('FONTNAME',       (0, 1), (-1, -1), FONT_REGULAR),
        ('FONTSIZE',       (0, 1), (-1, -1), 7),
        ('TEXTCOLOR',      (0, 1), (-1, -1), C_DARK_GRAY),
        ('ALIGN',          (0, 1), (-1, -1), 'LEFT'),
        ('GRID',           (0, 0), (-1, -1), 0.35, _GRID),
        ('ROWBACKGROUNDS', (0, 1), (-1, -1), [white, _ALT_ROW]),
        ('LEFTPADDING',    (0, 0), (-1, -1), 3),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 3),
        ('TOPPADDING',     (0, 0), (-1, -1), 1.5),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 1.5),
        ('LINEBELOW',      (0, 0), (-1, 0),  0.8, C_SLATE),
        ('LINEBELOW',      (0, -1), (-1, -1), 0.6, _DARK_GRID),
    ]
    if extra:
        cmds.extend(extra)
    return _TS(cmds)


def compliance_register_style():
    return _base_table_style([
        ('ALIGN',  (0, 1), (0, -1), 'CENTER'),
        ('ALIGN',  (5, 1), (5, -1), 'CENTER'),
        ('FONTNAME', (5, 1), (5, -1), FONT_BOLD),
    ])


def document_control_style():
    return _TS([
        ('FONTNAME',       (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, -1), 7),
        ('TEXTCOLOR',      (0, 0), (0, -1),  C_NAVY),
        ('TEXTCOLOR',      (1, 0), (1, -1),  C_DARK_GRAY),
        ('BACKGROUND',     (0, 0), (0, -1),  C_LIGHT_GRAY),
        ('GRID',           (0, 0), (-1, -1), 0.35, _GRID),
        ('VALIGN',         (0, 0), (-1, -1), 'MIDDLE'),
        ('LEFTPADDING',    (0, 0), (-1, -1), 4),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 4),
        ('TOPPADDING',     (0, 0), (-1, -1), 2),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 2),
        ('LINEBELOW',      (0, -1), (-1, -1), 0.5, _DARK_GRID),
    ])


def summary_table_style():
    return _base_table_style([
        ('FONTNAME',  (1, 1), (1, -1), FONT_BOLD),
        ('ALIGN',     (1, 0), (1, -1), 'CENTER'),
        ('FONTSIZE',  (1, 1), (1, -1), 7),
    ])


def finding_detail_style():
    return _TS([
        ('FONTNAME',       (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, -1), 7),
        ('TEXTCOLOR',      (0, 0), (0, -1),  C_NAVY),
        ('TEXTCOLOR',      (1, 0), (1, -1),  C_DARK_GRAY),
        ('BACKGROUND',     (0, 0), (0, -1),  C_LIGHT_GRAY),
        ('GRID',           (0, 0), (-1, -1), 0.35, _GRID),
        ('VALIGN',         (0, 0), (-1, -1), 'TOP'),
        ('LEFTPADDING',    (0, 0), (-1, -1), 3.5),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 3.5),
        ('TOPPADDING',     (0, 0), (-1, -1), 2),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 2),
    ])


def cover_meta_style():
    return _TS([
        ('FONTNAME',       (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, -1), 8),
        ('TEXTCOLOR',      (0, 0), (0, -1),  C_NAVY),
        ('TEXTCOLOR',      (1, 0), (1, -1),  C_DARK_GRAY),
        ('VALIGN',         (0, 0), (-1, -1), 'MIDDLE'),
        ('LEFTPADDING',    (0, 0), (-1, -1), 6),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 6),
        ('TOPPADDING',     (0, 0), (-1, -1), 3),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 3),
        ('GRID',           (0, 0), (-1, -1), 0.5, _GRID),
        ('BACKGROUND',     (0, 0), (0, -1),  C_LIGHT_GRAY),
    ])


def generic_table_style():
    return _base_table_style()


# ---------------------------------------------------------------------------
# STATUS BADGE COLOURS
# ---------------------------------------------------------------------------

def status_badge_colors(status: str):
    s = (status or '').upper().strip()
    if 'NON' in s or 'NOT COMPLY' in s:
        return (C_RED_BG, C_RED_DARK)
    if 'PARTIAL' in s:
        return (C_AMBER_BG, C_AMBER_DARK)
    if 'COMPLIANT' in s:
        return (C_GREEN_BG, C_GREEN_DARK)
    if 'NOT APPLICABLE' in s or s == 'N/A':
        return (C_LIGHT_GRAY, C_MID_GRAY)
    if 'REVIEW' in s:
        return (C_AMBER_BG, C_AMBER_DARK)
    return (C_LIGHT_GRAY, C_DARK_GRAY)


def severity_badge_colors(severity: str):
    s = (severity or '').lower().strip()
    if s in ('critical', 'high', 'major'):
        return (C_RED_BG, C_RED_DARK)
    if s in ('medium', 'minor'):
        return (C_AMBER_BG, C_AMBER_DARK)
    if s in ('low', 'info'):
        return (C_GREEN_BG, C_GREEN_DARK)
    return (C_LIGHT_GRAY, C_MID_GRAY)
