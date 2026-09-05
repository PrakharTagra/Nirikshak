"""
styles.py — Master Style Definitions for Statutory Compliance Report Generator
================================================================================
Official Government of India (GoI) Statutory Inspection & Enforcement Memorandum.
Under The Legal Metrology Act, 2009 & The Legal Metrology (Packaged Commodities) Rules, 2011.
"""

from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm
from reportlab.lib.colors import HexColor, white, black
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.enums import TA_LEFT, TA_CENTER, TA_RIGHT, TA_JUSTIFY
from reportlab.lib import colors
from reportlab.platypus import TableStyle as _TS

# ---------------------------------------------------------------------------
# PAGE LAYOUT CONSTANTS
# ---------------------------------------------------------------------------

PAGE_WIDTH, PAGE_HEIGHT = A4          # 595.27 x 841.89 pt

MARGIN_LEFT   = 12 * mm               # 12 mm margins for clean breathing room
MARGIN_RIGHT  = 12 * mm
MARGIN_TOP    = 10 * mm
MARGIN_BOTTOM = 10 * mm

CONTENT_WIDTH  = PAGE_WIDTH  - MARGIN_LEFT - MARGIN_RIGHT
CONTENT_HEIGHT = PAGE_HEIGHT - MARGIN_TOP  - MARGIN_BOTTOM

HEADER_HEIGHT = 14
FOOTER_HEIGHT = 13

# ---------------------------------------------------------------------------
# COLOUR PALETTE — Government of India Official Gazette / Statutory Style
# Minimalist, dignified, ink-efficient, restrained, authoritative.
# ---------------------------------------------------------------------------

C_GOV_NAVY    = HexColor('#0B2545')   # Official Deep Ashoka Navy
C_CHARCOAL    = HexColor('#1A1A1A')   # Formal Off-black text
C_SLATE       = HexColor('#334155')   # Slate 700 for subtitles
C_DARK_GRAY   = HexColor('#1F2937')   # Primary text body
C_MID_GRAY    = HexColor('#4B5563')   # Gray 600 for metadata & captions
C_LIGHT_GRAY  = HexColor('#F8FAFC')   # Subtle alternating row tint
C_WHITE       = white
C_BLACK       = black

# Restrained Statutory Status Indicators (No loud neon blocks)
C_GREEN_DARK  = HexColor('#15803D')   # Official Dark Forest Green
C_GREEN_BG    = HexColor('#F0FDF4')   # Minimalist, very soft green tint
C_RED_DARK    = HexColor('#991B1B')   # Official Deep Crimson
C_RED_BG      = HexColor('#FEF2F2')   # Minimalist, very soft red tint
C_AMBER_DARK  = HexColor('#854D0E')   # Official Deep Amber
C_AMBER_BG    = HexColor('#FFFBEB')   # Minimalist, very soft amber tint

C_TABLE_HEAD  = HexColor('#1E293B')   # Formal Dark Table Header
C_RULE_LINE   = HexColor('#475569')   # Slate 600 crisp dividing line
C_BORDER      = HexColor('#CBD5E1')   # Slate 300 clean gridline
C_SEAL_BORDER = HexColor('#0B2545')   # Official Seal border

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
# PARAGRAPH STYLES — Upgraded font sizes & leading for effortless reading
# ---------------------------------------------------------------------------

_base = getSampleStyleSheet()


def _ps(name, **kwargs) -> ParagraphStyle:
    defaults = dict(
        fontName=FONT_REGULAR,
        fontSize=8.5,
        leading=11.5,
        textColor=C_CHARCOAL,
        spaceAfter=1,
        spaceBefore=1,
        alignment=TA_LEFT,
    )
    defaults.update(kwargs)
    return ParagraphStyle(name, **defaults)


# --- Government Header & Cover Page Styles ---
PS_GOV_HEADER_LARGE = _ps(
    'GovHeaderLarge',
    fontName=FONT_BOLD,
    fontSize=11,
    leading=14,
    textColor=C_GOV_NAVY,
    alignment=TA_LEFT,
    spaceAfter=1,
)

PS_GOV_HEADER = _ps(
    'GovHeader',
    fontName=FONT_BOLD,
    fontSize=9.5,
    leading=12.5,
    textColor=C_GOV_NAVY,
    alignment=TA_LEFT,
    spaceAfter=1,
)

PS_GOV_SUBHEADER = _ps(
    'GovSubheader',
    fontName=FONT_REGULAR,
    fontSize=8.5,
    leading=11.5,
    textColor=C_SLATE,
    alignment=TA_LEFT,
    spaceAfter=1,
)

PS_GOV_SUBHEADER_SMALL = _ps(
    'GovSubheaderSmall',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=10.5,
    textColor=C_MID_GRAY,
    alignment=TA_LEFT,
    spaceAfter=2,
)

PS_COVER_TITLE = _ps(
    'CoverTitle',
    fontName=FONT_BOLD,
    fontSize=15,
    leading=19,
    textColor=C_GOV_NAVY,
    alignment=TA_CENTER,
    spaceAfter=3,
    spaceBefore=3,
)

PS_COVER_SUBTITLE = _ps(
    'CoverSubtitle',
    fontName=FONT_BOLD,
    fontSize=9,
    leading=12.5,
    textColor=C_SLATE,
    alignment=TA_CENTER,
    spaceAfter=5,
)

PS_COVER_LABEL = _ps(
    'CoverLabel',
    fontName=FONT_BOLD,
    fontSize=8.5,
    leading=11.5,
    textColor=C_GOV_NAVY,
    alignment=TA_LEFT,
)

PS_COVER_VALUE = _ps(
    'CoverValue',
    fontName=FONT_REGULAR,
    fontSize=8.5,
    leading=11.5,
    textColor=C_CHARCOAL,
    alignment=TA_LEFT,
)

PS_COVER_FOOTER = _ps(
    'CoverFooter',
    fontName=FONT_BOLD,
    fontSize=7.5,
    leading=10,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
)

# --- Section Headings ---
PS_SECTION_HEADING = _ps(
    'SectionHeading',
    fontName=FONT_BOLD,
    fontSize=10.5,
    leading=14,
    textColor=C_GOV_NAVY,
    spaceBefore=6,
    spaceAfter=2,
)

PS_SUBSECTION_HEADING = _ps(
    'SubsectionHeading',
    fontName=FONT_BOLD,
    fontSize=9,
    leading=12,
    textColor=C_GOV_NAVY,
    spaceBefore=4,
    spaceAfter=1,
)

PS_FINDING_HEADING = _ps(
    'FindingHeading',
    fontName=FONT_BOLD,
    fontSize=9.5,
    leading=12.5,
    textColor=C_RED_DARK,
    spaceBefore=4,
    spaceAfter=2,
)

# --- Body Text ---
PS_BODY = _ps(
    'Body',
    fontName=FONT_REGULAR,
    fontSize=8.5,
    leading=12,
    textColor=C_CHARCOAL,
    spaceBefore=1,
    spaceAfter=1,
)

PS_BODY_BOLD = _ps(
    'BodyBold',
    fontName=FONT_BOLD,
    fontSize=8.5,
    leading=12,
    textColor=C_CHARCOAL,
    spaceBefore=1,
    spaceAfter=1,
)

PS_BODY_JUSTIFIED = _ps(
    'BodyJustified',
    fontName=FONT_REGULAR,
    fontSize=8.5,
    leading=12,
    textColor=C_CHARCOAL,
    alignment=TA_JUSTIFY,
    spaceBefore=1,
    spaceAfter=1,
)

PS_BODY_SMALL = _ps(
    'BodySmall',
    fontName=FONT_REGULAR,
    fontSize=7.5,
    leading=10,
    textColor=C_MID_GRAY,
    spaceBefore=0,
    spaceAfter=1,
)

# --- Table Text Styles ---
PS_TABLE_HEADER = _ps(
    'TableHeader',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=10.5,
    textColor=C_WHITE,
    alignment=TA_CENTER,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_HEADER_LEFT = _ps(
    'TableHeaderLeft',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=10.5,
    textColor=C_WHITE,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY = _ps(
    'TableBody',
    fontName=FONT_REGULAR,
    fontSize=8,
    leading=11,
    textColor=C_CHARCOAL,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY_BOLD = _ps(
    'TableBodyBold',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=11,
    textColor=C_CHARCOAL,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY_CENTER = _ps(
    'TableBodyCenter',
    fontName=FONT_REGULAR,
    fontSize=8,
    leading=11,
    textColor=C_CHARCOAL,
    alignment=TA_CENTER,
    spaceBefore=0,
    spaceAfter=0,
)

PS_DECL_LABEL = _ps(
    'DeclLabel',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=10.5,
    textColor=C_GOV_NAVY,
    alignment=TA_LEFT,
)

PS_DECL_VALUE = _ps(
    'DeclValue',
    fontName=FONT_REGULAR,
    fontSize=8,
    leading=10.5,
    textColor=C_CHARCOAL,
    alignment=TA_LEFT,
)

PS_CAPTION = _ps(
    'Caption',
    fontName=FONT_ITALIC,
    fontSize=7.5,
    leading=9.5,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
    spaceBefore=1,
    spaceAfter=2,
)

PS_EVIDENCE_LABEL = _ps(
    'EvidenceLabel',
    fontName=FONT_BOLD,
    fontSize=8.5,
    leading=11,
    textColor=C_GOV_NAVY,
    spaceBefore=2,
    spaceAfter=1,
)

PS_NOTE = _ps(
    'Note',
    fontName=FONT_ITALIC,
    fontSize=7.5,
    leading=9.5,
    textColor=C_MID_GRAY,
    spaceBefore=2,
    spaceAfter=1,
)

# ---------------------------------------------------------------------------
# TABLE STYLE BUILDERS (With comfortable, uncluttered cell padding)
# ---------------------------------------------------------------------------

_GRID      = colors.HexColor('#CBD5E1')
_DARK_GRID = colors.HexColor('#94A3B8')
_HEAD_BG   = C_TABLE_HEAD
_ALT_ROW   = C_LIGHT_GRAY


def _base_table_style(extra=None):
    cmds = [
        ('FONTNAME',       (0, 0), (-1, 0),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, 0),  8),
        ('BACKGROUND',     (0, 0), (-1, 0),  _HEAD_BG),
        ('TEXTCOLOR',      (0, 0), (-1, 0),  white),
        ('ALIGN',          (0, 0), (-1, 0),  'CENTER'),
        ('VALIGN',         (0, 0), (-1, -1), 'MIDDLE'),
        ('FONTNAME',       (0, 1), (-1, -1), FONT_REGULAR),
        ('FONTSIZE',       (0, 1), (-1, -1), 8),
        ('TEXTCOLOR',      (0, 1), (-1, -1), C_CHARCOAL),
        ('ALIGN',          (0, 1), (-1, -1), 'LEFT'),
        ('GRID',           (0, 0), (-1, -1), 0.4, _GRID),
        ('ROWBACKGROUNDS', (0, 1), (-1, -1), [white, _ALT_ROW]),
        ('LEFTPADDING',    (0, 0), (-1, -1), 4),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 4),
        ('TOPPADDING',     (0, 0), (-1, -1), 3),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 3),
        ('LINEBELOW',      (0, 0), (-1, 0),  1.0, C_GOV_NAVY),
        ('LINEBELOW',      (0, -1), (-1, -1), 0.6, _DARK_GRID),
    ]
    if extra:
        cmds.extend(extra)
    return _TS(cmds)


def compliance_register_style():
    return _base_table_style([
        ('ALIGN',  (0, 1), (0, -1), 'CENTER'),
        ('ALIGN',  (4, 1), (4, -1), 'CENTER'),
        ('FONTNAME', (4, 1), (4, -1), FONT_BOLD),
        ('TOPPADDING', (0, 0), (-1, -1), 3.5),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 3.5),
    ])


def generic_table_style():
    return _base_table_style([
        ('TOPPADDING', (0, 0), (-1, -1), 3.0),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 3.0),
    ])


def document_control_style():
    return _TS([
        ('FONTNAME',       (0, 0), (0, -1),  FONT_BOLD),
        ('FONTNAME',       (2, 0), (2, -1),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, -1), 8),
        ('TEXTCOLOR',      (0, 0), (0, -1),  C_GOV_NAVY),
        ('TEXTCOLOR',      (2, 0), (2, -1),  C_GOV_NAVY),
        ('TEXTCOLOR',      (1, 0), (1, -1),  C_CHARCOAL),
        ('TEXTCOLOR',      (3, 0), (3, -1),  C_CHARCOAL),
        ('BACKGROUND',     (0, 0), (0, -1),  C_LIGHT_GRAY),
        ('BACKGROUND',     (2, 0), (2, -1),  C_LIGHT_GRAY),
        ('GRID',           (0, 0), (-1, -1), 0.4, _GRID),
        ('VALIGN',         (0, 0), (-1, -1), 'MIDDLE'),
        ('LEFTPADDING',    (0, 0), (-1, -1), 5),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 5),
        ('TOPPADDING',     (0, 0), (-1, -1), 3),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 3),
    ])


def declarations_table_style():
    """Clean Government Gazette schedule style for all extracted particulars."""
    return _TS([
        ('FONTNAME',       (0, 0), (0, -1),  FONT_BOLD),
        ('FONTNAME',       (2, 0), (2, -1),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, -1), 8),
        ('TEXTCOLOR',      (0, 0), (0, -1),  C_GOV_NAVY),
        ('TEXTCOLOR',      (2, 0), (2, -1),  C_GOV_NAVY),
        ('TEXTCOLOR',      (1, 0), (1, -1),  C_CHARCOAL),
        ('TEXTCOLOR',      (3, 0), (3, -1),  C_CHARCOAL),
        ('BACKGROUND',     (0, 0), (0, -1),  C_LIGHT_GRAY),
        ('BACKGROUND',     (2, 0), (2, -1),  C_LIGHT_GRAY),
        ('GRID',           (0, 0), (-1, -1), 0.4, _GRID),
        ('VALIGN',         (0, 0), (-1, -1), 'TOP'),
        ('LEFTPADDING',    (0, 0), (-1, -1), 5),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 5),
        ('TOPPADDING',     (0, 0), (-1, -1), 3.5),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 3.5),
    ])


def cover_meta_style():
    return _TS([
        ('FONTNAME',       (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, -1), 8.5),
        ('TEXTCOLOR',      (0, 0), (0, -1),  C_GOV_NAVY),
        ('TEXTCOLOR',      (1, 0), (1, -1),  C_CHARCOAL),
        ('VALIGN',         (0, 0), (-1, -1), 'MIDDLE'),
        ('LEFTPADDING',    (0, 0), (-1, -1), 6),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 6),
        ('TOPPADDING',     (0, 0), (-1, -1), 3.5),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 3.5),
        ('GRID',           (0, 0), (-1, -1), 0.4, _GRID),
        ('BACKGROUND',     (0, 0), (0, -1),  C_LIGHT_GRAY),
    ])


def finding_detail_style():
    return _TS([
        ('FONTNAME',       (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',       (0, 0), (-1, -1), 8),
        ('TEXTCOLOR',      (0, 0), (0, -1),  C_GOV_NAVY),
        ('TEXTCOLOR',      (1, 0), (1, -1),  C_CHARCOAL),
        ('BACKGROUND',     (0, 0), (0, -1),  C_LIGHT_GRAY),
        ('GRID',           (0, 0), (-1, -1), 0.4, _GRID),
        ('VALIGN',         (0, 0), (-1, -1), 'TOP'),
        ('LEFTPADDING',    (0, 0), (-1, -1), 4),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 4),
        ('TOPPADDING',     (0, 0), (-1, -1), 2.5),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 2.5),
    ])


# ---------------------------------------------------------------------------
# STATUS BADGE COLOURS (Subtle, professional, dignified)
# ---------------------------------------------------------------------------

def status_badge_colors(status: str):
    s = (status or '').upper().strip()
    if 'NON' in s or 'NOT COMPLY' in s or 'VIOLATION' in s:
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
