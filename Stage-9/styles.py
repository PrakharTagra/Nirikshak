"""
styles.py — Master Style Definitions for Compliance Report Generator
====================================================================
Single source of truth for ALL visual properties used in the PDF.
No styling logic should appear in pdf_builder.py — only references to
constants and styles defined here.

Legal Methodology Compliance Automation — Stage-9
"""

from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm
from reportlab.lib.colors import HexColor, white, black
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.enums import TA_LEFT, TA_CENTER, TA_RIGHT, TA_JUSTIFY
from reportlab.lib import colors

# ---------------------------------------------------------------------------
# PAGE LAYOUT CONSTANTS
# ---------------------------------------------------------------------------

PAGE_WIDTH, PAGE_HEIGHT = A4          # 595.27 x 841.89 pt

MARGIN_LEFT   = 25 * mm               # 25 mm
MARGIN_RIGHT  = 25 * mm
MARGIN_TOP    = 22 * mm
MARGIN_BOTTOM = 22 * mm

# Usable content area
CONTENT_WIDTH  = PAGE_WIDTH  - MARGIN_LEFT - MARGIN_RIGHT   # ~145 mm
CONTENT_HEIGHT = PAGE_HEIGHT - MARGIN_TOP  - MARGIN_BOTTOM

# Header / footer stripe heights (points)
HEADER_HEIGHT = 18
FOOTER_HEIGHT = 16

# ---------------------------------------------------------------------------
# COLOUR PALETTE  —  government / regulatory document style
# ---------------------------------------------------------------------------

C_NAVY        = HexColor('#1B2A4A')   # Primary heading colour
C_DARK_GRAY   = HexColor('#333333')   # Body text, borders
C_MID_GRAY    = HexColor('#666666')   # Secondary labels
C_LIGHT_GRAY  = HexColor('#F2F2F2')   # Alternate table row
C_WHITE       = white
C_BLACK       = black
C_RED_DARK    = HexColor('#8B0000')   # Critical / non-compliant status
C_ORANGE      = HexColor('#CC5500')   # High severity
C_AMBER       = HexColor('#B8860B')   # Medium / partial
C_GREEN_DARK  = HexColor('#1A5C2A')   # Compliant / green status
C_TABLE_HEAD  = HexColor('#1B2A4A')   # Table header background (navy)
C_TABLE_HEAD2 = HexColor('#2E4070')   # Secondary header (slightly lighter)
C_COVER_BG    = HexColor('#F8F8F8')   # Cover page background tint
C_RULE_LINE   = HexColor('#AAAAAA')   # Horizontal rule colour
C_SECTION_BAR = HexColor('#1B2A4A')   # Solid left-bar for section headings

# Status → colour map
STATUS_COLORS = {
    'COMPLIANT':          C_GREEN_DARK,
    'NON-COMPLIANT':      C_RED_DARK,
    'PARTIAL':            C_AMBER,
    'PARTIALLY COMPLIANT': C_AMBER,
    'NOT APPLICABLE':     C_MID_GRAY,
    'REQUIRES REVIEW':    C_ORANGE,
    'N/A':                C_MID_GRAY,
}

SEVERITY_COLORS = {
    'critical': C_RED_DARK,
    'high':     C_ORANGE,
    'medium':   C_AMBER,
    'minor':    C_AMBER,
    'low':      C_GREEN_DARK,
    'info':     C_MID_GRAY,
}

# ---------------------------------------------------------------------------
# FONT CONSTANTS  —  using ReportLab built-in Helvetica family
# ---------------------------------------------------------------------------

FONT_REGULAR    = 'Helvetica'
FONT_BOLD       = 'Helvetica-Bold'
FONT_ITALIC     = 'Helvetica-Oblique'
FONT_BOLD_ITALIC = 'Helvetica-BoldOblique'

# ---------------------------------------------------------------------------
# PARAGRAPH STYLES
# ---------------------------------------------------------------------------

_base = getSampleStyleSheet()


def _ps(name, **kwargs) -> ParagraphStyle:
    """Helper: create a ParagraphStyle derived from Normal."""
    defaults = dict(
        fontName=FONT_REGULAR,
        fontSize=10,
        leading=14,
        textColor=C_DARK_GRAY,
        spaceAfter=4,
        spaceBefore=2,
        alignment=TA_LEFT,
    )
    defaults.update(kwargs)
    return ParagraphStyle(name, **defaults)


# --- Cover page styles ---
PS_COVER_TITLE = _ps(
    'CoverTitle',
    fontName=FONT_BOLD,
    fontSize=22,
    leading=28,
    textColor=C_NAVY,
    alignment=TA_CENTER,
    spaceAfter=8,
    spaceBefore=0,
)

PS_COVER_SUBTITLE = _ps(
    'CoverSubtitle',
    fontName=FONT_BOLD,
    fontSize=14,
    leading=20,
    textColor=C_NAVY,
    alignment=TA_CENTER,
    spaceAfter=6,
)

PS_COVER_LABEL = _ps(
    'CoverLabel',
    fontName=FONT_BOLD,
    fontSize=9,
    leading=13,
    textColor=C_MID_GRAY,
    alignment=TA_LEFT,
)

PS_COVER_VALUE = _ps(
    'CoverValue',
    fontName=FONT_REGULAR,
    fontSize=9,
    leading=13,
    textColor=C_DARK_GRAY,
    alignment=TA_LEFT,
)

PS_COVER_FOOTER = _ps(
    'CoverFooter',
    fontName=FONT_ITALIC,
    fontSize=8,
    leading=12,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
)

# --- Section headings ---
PS_SECTION_HEADING = _ps(
    'SectionHeading',
    fontName=FONT_BOLD,
    fontSize=14,
    leading=20,
    textColor=C_NAVY,
    spaceBefore=14,
    spaceAfter=6,
    borderPad=4,
)

PS_SUBSECTION_HEADING = _ps(
    'SubsectionHeading',
    fontName=FONT_BOLD,
    fontSize=11,
    leading=16,
    textColor=C_NAVY,
    spaceBefore=10,
    spaceAfter=4,
)

PS_FINDING_HEADING = _ps(
    'FindingHeading',
    fontName=FONT_BOLD,
    fontSize=11,
    leading=16,
    textColor=C_RED_DARK,
    spaceBefore=10,
    spaceAfter=4,
)

# --- Body text ---
PS_BODY = _ps(
    'Body',
    fontName=FONT_REGULAR,
    fontSize=10,
    leading=14,
    textColor=C_DARK_GRAY,
    spaceBefore=2,
    spaceAfter=3,
)

PS_BODY_JUSTIFIED = _ps(
    'BodyJustified',
    fontName=FONT_REGULAR,
    fontSize=10,
    leading=14,
    textColor=C_DARK_GRAY,
    alignment=TA_JUSTIFY,
    spaceBefore=2,
    spaceAfter=3,
)

PS_BODY_SMALL = _ps(
    'BodySmall',
    fontName=FONT_REGULAR,
    fontSize=8,
    leading=11,
    textColor=C_MID_GRAY,
    spaceBefore=1,
    spaceAfter=2,
)

PS_LABEL = _ps(
    'Label',
    fontName=FONT_BOLD,
    fontSize=9,
    leading=13,
    textColor=C_MID_GRAY,
    spaceBefore=1,
    spaceAfter=1,
)

PS_VALUE = _ps(
    'Value',
    fontName=FONT_REGULAR,
    fontSize=10,
    leading=14,
    textColor=C_DARK_GRAY,
    spaceBefore=1,
    spaceAfter=4,
)

PS_VALUE_SMALL = _ps(
    'ValueSmall',
    fontName=FONT_REGULAR,
    fontSize=9,
    leading=12,
    textColor=C_DARK_GRAY,
    spaceBefore=1,
    spaceAfter=2,
)

# --- Table paragraph styles ---
PS_TABLE_HEADER = _ps(
    'TableHeader',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=11,
    textColor=C_WHITE,
    alignment=TA_CENTER,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_HEADER_LEFT = _ps(
    'TableHeaderLeft',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=11,
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
    textColor=C_DARK_GRAY,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY_BOLD = _ps(
    'TableBodyBold',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=11,
    textColor=C_DARK_GRAY,
    alignment=TA_LEFT,
    spaceBefore=0,
    spaceAfter=0,
)

PS_TABLE_BODY_CENTER = _ps(
    'TableBodyCenter',
    fontName=FONT_REGULAR,
    fontSize=8,
    leading=11,
    textColor=C_DARK_GRAY,
    alignment=TA_CENTER,
    spaceBefore=0,
    spaceAfter=0,
)

PS_CAPTION = _ps(
    'Caption',
    fontName=FONT_ITALIC,
    fontSize=8,
    leading=11,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
    spaceBefore=2,
    spaceAfter=6,
)

PS_EVIDENCE_LABEL = _ps(
    'EvidenceLabel',
    fontName=FONT_BOLD,
    fontSize=9,
    leading=13,
    textColor=C_NAVY,
    spaceBefore=4,
    spaceAfter=2,
)

PS_STATUS_COMPLIANT = _ps(
    'StatusCompliant',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=11,
    textColor=C_GREEN_DARK,
    alignment=TA_CENTER,
)

PS_STATUS_NONCOMPLIANT = _ps(
    'StatusNonCompliant',
    fontName=FONT_BOLD,
    fontSize=8,
    leading=11,
    textColor=C_RED_DARK,
    alignment=TA_CENTER,
)

PS_STATUS_NA = _ps(
    'StatusNA',
    fontName=FONT_REGULAR,
    fontSize=8,
    leading=11,
    textColor=C_MID_GRAY,
    alignment=TA_CENTER,
)

PS_WARNING_BOX = _ps(
    'WarningBox',
    fontName=FONT_ITALIC,
    fontSize=8,
    leading=11,
    textColor=C_AMBER,
    spaceBefore=2,
    spaceAfter=2,
)

PS_NOTE = _ps(
    'Note',
    fontName=FONT_ITALIC,
    fontSize=8,
    leading=11,
    textColor=C_MID_GRAY,
    spaceBefore=4,
    spaceAfter=4,
)

# ---------------------------------------------------------------------------
# TABLE STYLE BUILDERS
# ---------------------------------------------------------------------------

from reportlab.platypus import TableStyle as _TS

_GRID       = colors.HexColor('#CCCCCC')
_DARK_GRID  = colors.HexColor('#888888')
_HEAD_BG    = C_TABLE_HEAD
_ALT_ROW    = C_LIGHT_GRAY


def _base_table_style(extra=None):
    """Base style applied to all tables."""
    cmds = [
        ('FONTNAME',    (0, 0), (-1, 0),  FONT_BOLD),
        ('FONTSIZE',    (0, 0), (-1, 0),  8),
        ('BACKGROUND',  (0, 0), (-1, 0),  _HEAD_BG),
        ('TEXTCOLOR',   (0, 0), (-1, 0),  white),
        ('ALIGN',       (0, 0), (-1, 0),  'CENTER'),
        ('VALIGN',      (0, 0), (-1, -1), 'MIDDLE'),
        ('FONTNAME',    (0, 1), (-1, -1), FONT_REGULAR),
        ('FONTSIZE',    (0, 1), (-1, -1), 8),
        ('TEXTCOLOR',   (0, 1), (-1, -1), C_DARK_GRAY),
        ('ALIGN',       (0, 1), (-1, -1), 'LEFT'),
        ('GRID',        (0, 0), (-1, -1), 0.4, _GRID),
        ('ROWBACKGROUNDS', (0, 1), (-1, -1), [white, _ALT_ROW]),
        ('LEFTPADDING',    (0, 0), (-1, -1), 5),
        ('RIGHTPADDING',   (0, 0), (-1, -1), 5),
        ('TOPPADDING',     (0, 0), (-1, -1), 4),
        ('BOTTOMPADDING',  (0, 0), (-1, -1), 4),
        ('LINEBELOW',   (0, 0), (-1, 0),  1.0, C_NAVY),
        ('LINEBELOW',   (0, -1), (-1, -1), 0.8, _DARK_GRID),
    ]
    if extra:
        cmds.extend(extra)
    return _TS(cmds)


def compliance_register_style():
    return _base_table_style([
        ('ALIGN',  (0, 1), (0, -1), 'CENTER'),  # Sr. No.
        ('ALIGN',  (5, 1), (5, -1), 'CENTER'),  # Status
        ('FONTNAME', (5, 1), (5, -1), FONT_BOLD),
    ])


def document_control_style():
    return _TS([
        ('FONTNAME',    (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',    (0, 0), (-1, -1), 9),
        ('TEXTCOLOR',   (0, 0), (0, -1),  C_NAVY),
        ('TEXTCOLOR',   (1, 0), (1, -1),  C_DARK_GRAY),
        ('BACKGROUND',  (0, 0), (0, -1),  C_LIGHT_GRAY),
        ('GRID',        (0, 0), (-1, -1), 0.4, _GRID),
        ('VALIGN',      (0, 0), (-1, -1), 'MIDDLE'),
        ('LEFTPADDING', (0, 0), (-1, -1), 8),
        ('RIGHTPADDING',(0, 0), (-1, -1), 8),
        ('TOPPADDING',  (0, 0), (-1, -1), 5),
        ('BOTTOMPADDING',(0, 0), (-1, -1), 5),
        ('LINEBELOW',   (0, -1), (-1, -1), 0.8, _DARK_GRID),
    ])


def summary_table_style():
    return _base_table_style([
        ('FONTNAME',  (1, 1), (1, -1), FONT_BOLD),
        ('ALIGN',     (1, 0), (1, -1), 'CENTER'),
        ('FONTSIZE',  (1, 1), (1, -1), 9),
    ])


def finding_detail_style():
    return _TS([
        ('FONTNAME',    (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',    (0, 0), (-1, -1), 9),
        ('TEXTCOLOR',   (0, 0), (0, -1),  C_NAVY),
        ('TEXTCOLOR',   (1, 0), (1, -1),  C_DARK_GRAY),
        ('BACKGROUND',  (0, 0), (0, -1),  C_LIGHT_GRAY),
        ('GRID',        (0, 0), (-1, -1), 0.4, _GRID),
        ('VALIGN',      (0, 0), (-1, -1), 'TOP'),
        ('LEFTPADDING', (0, 0), (-1, -1), 6),
        ('RIGHTPADDING',(0, 0), (-1, -1), 6),
        ('TOPPADDING',  (0, 0), (-1, -1), 5),
        ('BOTTOMPADDING',(0, 0), (-1, -1), 5),
    ])


def cover_meta_style():
    return _TS([
        ('FONTNAME',    (0, 0), (0, -1),  FONT_BOLD),
        ('FONTSIZE',    (0, 0), (-1, -1), 9),
        ('TEXTCOLOR',   (0, 0), (0, -1),  C_MID_GRAY),
        ('TEXTCOLOR',   (1, 0), (1, -1),  C_DARK_GRAY),
        ('VALIGN',      (0, 0), (-1, -1), 'MIDDLE'),
        ('LEFTPADDING', (0, 0), (-1, -1), 4),
        ('RIGHTPADDING',(0, 0), (-1, -1), 4),
        ('TOPPADDING',  (0, 0), (-1, -1), 3),
        ('BOTTOMPADDING',(0, 0), (-1, -1), 3),
        ('LINEBELOW',   (0, 0), (-1, -2), 0.3, _GRID),
    ])


def generic_table_style():
    return _base_table_style()


# ---------------------------------------------------------------------------
# COMPLIANCE DETAIL BLOCK STYLE (for individual compliance subsections)
# ---------------------------------------------------------------------------

COMPLIANCE_DETAIL_STYLE = finding_detail_style


# ---------------------------------------------------------------------------
# STATUS BADGE COLOURS  (returns tuple: (bg_color, text_color))
# ---------------------------------------------------------------------------

def status_badge_colors(status: str):
    s = (status or '').upper().strip()
    if 'NON' in s or 'NOT COMPLY' in s:
        return (HexColor('#FDECEA'), C_RED_DARK)
    if 'PARTIAL' in s:
        return (HexColor('#FFF8E1'), C_AMBER)
    if 'COMPLIANT' in s:
        return (HexColor('#E8F5E9'), C_GREEN_DARK)
    if 'NOT APPLICABLE' in s or s == 'N/A':
        return (HexColor('#F5F5F5'), C_MID_GRAY)
    if 'REVIEW' in s:
        return (HexColor('#FFF3E0'), C_ORANGE)
    return (HexColor('#F5F5F5'), C_DARK_GRAY)


def severity_badge_colors(severity: str):
    s = (severity or '').lower().strip()
    if s == 'critical':
        return (HexColor('#FDECEA'), C_RED_DARK)
    if s in ('high', 'major'):
        return (HexColor('#FFF3E0'), C_ORANGE)
    if s in ('medium', 'minor'):
        return (HexColor('#FFF8E1'), C_AMBER)
    if s in ('low', 'info'):
        return (HexColor('#E8F5E9'), C_GREEN_DARK)
    return (HexColor('#F5F5F5'), C_MID_GRAY)
