"""
pdf_builder.py — Master PDF Construction
=========================================
Builds the complete A4 government-style Compliance Assessment Report PDF
using ReportLab Platypus flowables.

Section order is FIXED — only content changes between reports.
All styling references styles.py exclusively.

Legal Methodology Compliance Automation — Stage-9
"""

import os
from datetime import datetime
from typing import List, Optional

from reportlab.platypus import (
    BaseDocTemplate, PageTemplate, Frame, Paragraph, Spacer,
    Table, KeepTogether, PageBreak, HRFlowable, NextPageTemplate,
)
from reportlab.platypus import Image as RLImage
from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm
from reportlab.lib import colors
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfgen import canvas as rl_canvas

import styles as S
import image_handler as IH
from compliance_mapper import ComplianceModel, ComplianceRecord, ViolationRecord, EvidenceRecord


# ---------------------------------------------------------------------------
# HELPERS
# ---------------------------------------------------------------------------

def _p(text: str, style: ParagraphStyle) -> Paragraph:
    """Safe Paragraph creation — escapes & and < characters."""
    text = (text or 'Not Available') \
        .replace('&', '&amp;') \
        .replace('<', '&lt;') \
        .replace('>', '&gt;')
    return Paragraph(text, style)


def _spacer(h_mm: float = 3) -> Spacer:
    return Spacer(1, h_mm * mm)


def _hr(thickness=0.5, color=None, spaceAfter=4):
    return HRFlowable(
        width='100%',
        thickness=thickness,
        color=color or S.C_RULE_LINE,
        spaceAfter=spaceAfter,
        spaceBefore=2,
    )


def _status_para(status: str) -> Paragraph:
    bg, fg = S.status_badge_colors(status)
    style = ParagraphStyle(
        'StatusInline',
        parent=S.PS_TABLE_BODY_CENTER,
        textColor=fg,
        fontName=S.FONT_BOLD,
        fontSize=8,
    )
    return _p(status, style)


def _severity_para(severity: str) -> Paragraph:
    bg, fg = S.severity_badge_colors(severity)
    style = ParagraphStyle(
        'SeverityInline',
        parent=S.PS_TABLE_BODY_CENTER,
        textColor=fg,
        fontName=S.FONT_BOLD,
        fontSize=8,
    )
    return _p(severity, style)


def _na(val: str) -> str:
    return val if val and str(val).strip() else 'Not Available'


# ---------------------------------------------------------------------------
# NUMBERED CANVAS  — handles "Page X of Y" reliably in a single pass
# ---------------------------------------------------------------------------

class NumberedCanvas(rl_canvas.Canvas):
    """
    Custom canvas that accumulates page states, then on save()
    goes back and stamps the total-page count into every footer.

    This avoids two-pass building which causes layout instability.
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._saved_page_states: list = []

    def showPage(self):
        """Called at the end of every page; save canvas state."""
        self._saved_page_states.append(dict(self.__dict__))
        self._startPage()

    def save(self):
        """Go back through each page and stamp Page X of Y, then save."""
        num_pages = len(self._saved_page_states)
        for state in self._saved_page_states:
            self.__dict__.update(state)
            self._stamp_page_number(self._pageNumber, num_pages)
            super().showPage()
        super().save()

    def _stamp_page_number(self, page_num: int, total: int):
        """Overwrite the page-number placeholder in the footer."""
        # We only stamp page 2+; cover (page 1) has no footer.
        if page_num <= 1:
            return
        w, h = A4
        report_id = getattr(self, '_report_id', 'N/A')
        self.setFont(S.FONT_ITALIC, 7)
        self.setFillColor(S.C_WHITE)
        self.drawRightString(
            w - S.MARGIN_RIGHT, 4 * mm,
            f'Report ID: {report_id}  |  Page {page_num} of {total}',
        )


# ---------------------------------------------------------------------------
# HEADER / FOOTER DRAWING FUNCTIONS
# ---------------------------------------------------------------------------

def _draw_cover_page(c: rl_canvas.Canvas, doc):
    """Decorative elements on cover page only."""
    w, h = A4
    # Top bar
    c.setFillColor(S.C_NAVY)
    c.rect(0, h - 12 * mm, w, 12 * mm, fill=1, stroke=0)
    # Bottom bar
    c.rect(0, 0, w, 10 * mm, fill=1, stroke=0)
    # Subtle side accent
    c.setFillColor(S.C_TABLE_HEAD2)
    c.rect(0, 10 * mm, 4 * mm, h - 22 * mm, fill=1, stroke=0)


def _draw_header_footer(c: rl_canvas.Canvas, doc):
    """Standard header and footer for all pages after cover."""
    w, h = A4
    report_id = getattr(doc, '_report_id', 'N/A')
    # Pass report_id to canvas so NumberedCanvas can use it in _stamp_page_number
    c._report_id = report_id

    # ---- HEADER ----
    c.saveState()
    # Header background stripe
    c.setFillColor(S.C_NAVY)
    c.rect(0, h - 14 * mm, w, 14 * mm, fill=1, stroke=0)
    # Left text
    c.setFont(S.FONT_BOLD, 8)
    c.setFillColor(S.C_WHITE)
    c.drawString(S.MARGIN_LEFT, h - 8 * mm,
                 'LEGAL METHODOLOGY COMPLIANCE ASSESSMENT REPORT')
    # Right text
    c.setFont(S.FONT_REGULAR, 7)
    c.drawRightString(w - S.MARGIN_RIGHT, h - 8 * mm,
                      f'Report ID: {report_id}')
    c.restoreState()

    # ---- FOOTER ----
    c.saveState()
    c.setFillColor(S.C_NAVY)
    c.rect(0, 0, w, 11 * mm, fill=1, stroke=0)
    c.setFont(S.FONT_ITALIC, 7)
    c.setFillColor(S.C_WHITE)
    # Left: confidential notice
    c.drawString(S.MARGIN_LEFT, 4 * mm,
                 'CONFIDENTIAL -- SYSTEM-GENERATED COMPLIANCE REPORT')
    # Right: page number will be stamped by NumberedCanvas.save()
    # Draw a placeholder that NumberedCanvas will overwrite
    c.drawRightString(w - S.MARGIN_RIGHT, 4 * mm,
                      f'Report ID: {report_id}  |  Page {doc.page} of ...')
    c.restoreState()


# ---------------------------------------------------------------------------
# SECTION HEADING BUILDER
# ---------------------------------------------------------------------------

def _section_heading(number: int, title: str) -> List:
    """Returns flowables for a numbered section heading with decorative bar."""
    flows = [
        _spacer(4),
        _hr(thickness=1.0, color=S.C_NAVY),
        _p(f'{number}. {title.upper()}', S.PS_SECTION_HEADING),
        _hr(thickness=0.4, color=S.C_RULE_LINE, spaceAfter=6),
    ]
    return flows


def _subsection_heading(title: str, style=None) -> Paragraph:
    return _p(title, style or S.PS_SUBSECTION_HEADING)


def _field_row(label: str, value: str) -> List:
    """Compact label + value row for detail blocks."""
    return [
        _p(f'<b>{label}:</b>', S.PS_LABEL),
        _p(_na(value), S.PS_VALUE),
    ]


# ---------------------------------------------------------------------------
# COVER PAGE
# ---------------------------------------------------------------------------

def _build_cover_page(model: ComplianceModel) -> List:
    """Build all flowables for the cover page."""
    meta  = model.meta
    story = []

    # The cover page uses a different page template (no header/footer)
    story.append(NextPageTemplate('cover'))
    story.append(PageBreak())
    story.append(NextPageTemplate('main'))   # reset for subsequent pages

    # Top spacer (below the navy bar)
    story.append(_spacer(20))

    # Organisation / Project
    story.append(_p('NIRIKSHAK — LEGAL METHODOLOGY COMPLIANCE AUTOMATION',
                    S.PS_COVER_SUBTITLE))
    story.append(_spacer(2))

    # Horizontal rule
    story.append(_hr(thickness=2.0, color=S.C_NAVY, spaceAfter=6))

    # Main title
    story.append(_spacer(4))
    story.append(_p('LEGAL METHODOLOGY\nCOMPLIANCE ASSESSMENT REPORT',
                    S.PS_COVER_TITLE))
    story.append(_spacer(4))

    story.append(_hr(thickness=2.0, color=S.C_NAVY, spaceAfter=10))
    story.append(_spacer(10))

    # Metadata table
    overall_status = meta.get('assessment_status', 'UNKNOWN')
    status_bg, status_fg = S.status_badge_colors(overall_status)

    meta_data = [
        ['Report ID',               _na(meta.get('report_id', ''))],
        ['Case / Application ID',   _na(meta.get('case_id', ''))],
        ['Product / Entity',        _na(meta.get('entity', ''))],
        ['Manufacturer',            _na(meta.get('manufacturer', ''))],
        ['Assessment Date',         _na(meta.get('assessment_date', ''))],
        ['Applicable Legal Framework', _na(meta.get('framework', ''))],
        ['Overall Compliance Status',  overall_status],
        ['Report Generation Date',  _na(meta.get('generated_on', ''))],
    ]

    col_w = [S.CONTENT_WIDTH * 0.38, S.CONTENT_WIDTH * 0.62]
    tbl_data = []
    for row in meta_data:
        label_para = _p(row[0], S.PS_COVER_LABEL)
        val = row[1]
        if isinstance(val, str):
            # Colour-code the overall status cell
            if row[0] == 'Overall Compliance Status':
                vstyle = ParagraphStyle(
                    'CoverStatus',
                    parent=S.PS_COVER_VALUE,
                    textColor=status_fg,
                    fontName=S.FONT_BOLD,
                )
                val_para = _p(val, vstyle)
            else:
                val_para = _p(val, S.PS_COVER_VALUE)
        else:
            val_para = val
        tbl_data.append([label_para, val_para])

    tbl = Table(tbl_data, colWidths=col_w, repeatRows=0)
    tbl.setStyle(S.cover_meta_style())
    story.append(tbl)

    # Spacer + bottom notice
    story.append(_spacer(30))
    story.append(_hr(thickness=1.0, color=S.C_RULE_LINE))
    story.append(_spacer(4))
    story.append(_p(
        'SYSTEM-GENERATED COMPLIANCE REPORT\n'
        'Generated by the Nirikshak Legal Methodology Compliance Automation Pipeline.\n'
        'This report is based on automated image-based label analysis. '
        'Registration status and penalty determination require manual verification.',
        S.PS_COVER_FOOTER,
    ))

    return story


# ---------------------------------------------------------------------------
# SECTION 1 — DOCUMENT CONTROL
# ---------------------------------------------------------------------------

def _build_document_control(model: ComplianceModel) -> List:
    meta  = model.meta
    story = _section_heading(1, 'Document Control')

    rows = [
        ['Report ID',            _na(meta.get('report_id', ''))],
        ['Case / Reference ID',  _na(meta.get('case_id', ''))],
        ['Entity / Organisation',_na(meta.get('entity', ''))],
        ['Manufacturer',         _na(meta.get('manufacturer', ''))],
        ['Assessment Date',      _na(meta.get('assessment_date', ''))],
        ['Applicable Framework', _na(meta.get('framework', ''))],
        ['Report Version',       _na(meta.get('report_version', ''))],
        ['Generated On',         _na(meta.get('generated_on', ''))],
        ['Assessment Status',    _na(meta.get('assessment_status', ''))],
        ['Exemption Reason',     _na(meta.get('exemption_reason', 'None'))],
    ]

    col_w = [S.CONTENT_WIDTH * 0.35, S.CONTENT_WIDTH * 0.65]
    tbl_data = [
        [_p(r[0], S.PS_TABLE_BODY_BOLD), _p(r[1], S.PS_TABLE_BODY)]
        for r in rows
    ]
    tbl = Table(tbl_data, colWidths=col_w)
    tbl.setStyle(S.document_control_style())
    story.append(tbl)

    return story


# ---------------------------------------------------------------------------
# SECTION 2 — EXECUTIVE SUMMARY
# ---------------------------------------------------------------------------

def _build_executive_summary(model: ComplianceModel) -> List:
    s     = model.summary
    story = _section_heading(2, 'Executive Summary')

    # Compliance requirements table
    story.append(_subsection_heading('2.1  Compliance Requirements Summary'))

    comp_data = [
        [_p('Metric', S.PS_TABLE_HEADER), _p('Count', S.PS_TABLE_HEADER)],
        [_p('Total Compliance Requirements',  S.PS_TABLE_BODY), _p(str(s.total_requirements),  S.PS_TABLE_BODY_CENTER)],
        [_p('Compliant',                       S.PS_TABLE_BODY), _p(str(s.compliant),            S.PS_TABLE_BODY_BOLD)],
        [_p('Partially Compliant',             S.PS_TABLE_BODY), _p(str(s.partial),              S.PS_TABLE_BODY)],
        [_p('Non-Compliant',                   S.PS_TABLE_BODY), _p(str(s.non_compliant),        S.PS_TABLE_BODY_BOLD)],
        [_p('Not Applicable',                  S.PS_TABLE_BODY), _p(str(s.not_applicable),       S.PS_TABLE_BODY)],
        [_p('Requires Review',                 S.PS_TABLE_BODY), _p(str(s.requires_review),      S.PS_TABLE_BODY)],
        [_p('Compliance Score',                S.PS_TABLE_BODY), _p(f'{s.compliance_score:.1f}%', S.PS_TABLE_BODY_BOLD)],
    ]

    # Apply row-specific styling
    from reportlab.platypus import TableStyle as TS
    extra_cmds = [
        ('TEXTCOLOR', (1, 2), (1, 2), S.C_GREEN_DARK),
        ('TEXTCOLOR', (1, 4), (1, 4), S.C_RED_DARK),
        ('FONTNAME',  (1, 2), (1, 2), S.FONT_BOLD),
        ('FONTNAME',  (1, 4), (1, 4), S.FONT_BOLD),
    ]

    col_w = [S.CONTENT_WIDTH * 0.7, S.CONTENT_WIDTH * 0.3]
    comp_tbl = Table(comp_data, colWidths=col_w)
    comp_tbl.setStyle(S.summary_table_style())

    story.append(comp_tbl)
    story.append(_spacer(6))

    # Violations summary table
    story.append(_subsection_heading('2.2  Violation / Non-Compliance Summary'))

    viol_data = [
        [_p('Violation Category', S.PS_TABLE_HEADER), _p('Count', S.PS_TABLE_HEADER)],
        [_p('Total Violations',    S.PS_TABLE_BODY), _p(str(s.total_violations),    S.PS_TABLE_BODY_BOLD)],
        [_p('Critical Violations', S.PS_TABLE_BODY), _p(str(s.critical_violations), S.PS_TABLE_BODY_BOLD)],
        [_p('High Violations',     S.PS_TABLE_BODY), _p(str(s.high_violations),     S.PS_TABLE_BODY)],
        [_p('Medium Violations',   S.PS_TABLE_BODY), _p(str(s.medium_violations),   S.PS_TABLE_BODY)],
        [_p('Low Violations',      S.PS_TABLE_BODY), _p(str(s.low_violations),      S.PS_TABLE_BODY)],
    ]

    viol_tbl = Table(viol_data, colWidths=col_w)
    viol_tbl.setStyle(S.summary_table_style())
    story.append(viol_tbl)
    story.append(_spacer(6))

    # Overall text
    story.append(_subsection_heading('2.3  Overall Assessment'))
    story.append(_p(s.overall_text, S.PS_BODY_JUSTIFIED))

    return story


# ---------------------------------------------------------------------------
# SECTION 3 — COMPLIANCE REGISTER
# ---------------------------------------------------------------------------

def _build_compliance_register(model: ComplianceModel) -> List:
    story = _section_heading(3, 'Compliance Register')
    story.append(_p(
        'The following table presents all compliance requirements assessed during '
        'this evaluation. Every applicable provision has been individually reviewed.',
        S.PS_BODY,
    ))
    story.append(_spacer(4))

    # Table header
    hdr = [
        _p('Sr.\nNo.',          S.PS_TABLE_HEADER),
        _p('Compliance ID',     S.PS_TABLE_HEADER),
        _p('Legal Requirement', S.PS_TABLE_HEADER),
        _p('Applicable Law / Rule', S.PS_TABLE_HEADER),
        _p('Description',       S.PS_TABLE_HEADER),
        _p('Status',            S.PS_TABLE_HEADER),
    ]
    col_w = [
        S.CONTENT_WIDTH * 0.05,   # Sr No
        S.CONTENT_WIDTH * 0.12,   # Compliance ID
        S.CONTENT_WIDTH * 0.18,   # Legal Requirement
        S.CONTENT_WIDTH * 0.15,   # Applicable Law
        S.CONTENT_WIDTH * 0.37,   # Description
        S.CONTENT_WIDTH * 0.13,   # Status
    ]

    tbl_data = [hdr]
    cmd_extra = []

    for c in model.compliances:
        bg, fg = S.status_badge_colors(c.status)
        status_style = ParagraphStyle(
            f'St_{c.sr_no}',
            parent=S.PS_TABLE_BODY_CENTER,
            textColor=fg,
            fontName=S.FONT_BOLD,
        )
        row = [
            _p(str(c.sr_no),           S.PS_TABLE_BODY_CENTER),
            _p(c.compliance_id,        S.PS_TABLE_BODY_BOLD),
            _p(c.legal_requirement,    S.PS_TABLE_BODY),
            _p(c.section_clause,       S.PS_TABLE_BODY),
            _p(c.description[:220],    S.PS_TABLE_BODY),
            _p(c.status,               status_style),
        ]
        row_idx = len(tbl_data)
        tbl_data.append(row)
        # Background for status cell
        cmd_extra.append(('BACKGROUND', (5, row_idx), (5, row_idx), bg))

    tbl = Table(tbl_data, colWidths=col_w, repeatRows=1)
    base_style = S.compliance_register_style()
    from reportlab.platypus import TableStyle as TS
    combined_style = TS(list(base_style._cmds) + cmd_extra)
    tbl.setStyle(combined_style)

    story.append(tbl)
    return story


# ---------------------------------------------------------------------------
# SECTION 4 — COMPLIANCE DETAILS
# ---------------------------------------------------------------------------

def _build_compliance_details(model: ComplianceModel) -> List:
    story = _section_heading(4, 'Compliance Details')
    story.append(_p(
        'This section provides individual compliance assessment details for each '
        'compliance requirement. Each sub-section follows a standardised format.',
        S.PS_BODY,
    ))

    for c in model.compliances:
        block = _build_single_compliance_detail(c)
        story.append(KeepTogether(block))

    return story


def _build_single_compliance_detail(c: ComplianceRecord) -> List:
    """Build the detail block for one compliance."""
    block = [
        _spacer(3),
        _hr(thickness=0.5, color=S.C_RULE_LINE),
        _p(f'Compliance {c.sr_no}', S.PS_SUBSECTION_HEADING),
    ]

    rows = [
        ['Compliance ID',        c.compliance_id],
        ['Legal Requirement',    c.legal_requirement],
        ['Applicable Law / Regulation', c.applicable_law],
        ['Section / Clause',     c.section_clause],
        ['Requirement Description', c.description],
        ['Assessment / Observation', _na(c.assessment)],
        ['Status',               c.status],
        ['Remarks',              _na(c.remarks)],
    ]

    col_w = [S.CONTENT_WIDTH * 0.30, S.CONTENT_WIDTH * 0.70]
    tbl_data = []
    for label, val in rows:
        if label == 'Status':
            bg, fg = S.status_badge_colors(val)
            st = ParagraphStyle('DtSt', parent=S.PS_TABLE_BODY_BOLD,
                                textColor=fg)
            tbl_data.append([_p(label, S.PS_TABLE_BODY_BOLD),
                              _p(val, st)])
        else:
            tbl_data.append([_p(label, S.PS_TABLE_BODY_BOLD),
                              _p(_na(val), S.PS_TABLE_BODY)])

    tbl = Table(tbl_data, colWidths=col_w)
    tbl.setStyle(S.finding_detail_style())
    block.append(tbl)
    return block


# ---------------------------------------------------------------------------
# SECTION 5 — VIOLATIONS
# ---------------------------------------------------------------------------

def _build_violations(model: ComplianceModel) -> List:
    story = _section_heading(5, 'Violations / Non-Compliance Findings')

    if not model.violations:
        story.append(_p(
            'No violations or non-compliance findings were identified during '
            'this compliance assessment.',
            S.PS_BODY,
        ))
        return story

    story.append(_p(
        f'This section documents all {len(model.violations)} non-compliance '
        'finding(s) identified during the assessment. Each finding includes '
        'the applicable legal provision, observed violation, severity, '
        'legal impact, recommended corrective action, and evidence.',
        S.PS_BODY,
    ))

    for idx, v in enumerate(model.violations):
        # Build the finding block WITHOUT KeepTogether so it can span pages
        block = _build_single_finding(idx + 1, v, model)
        story.extend(block)

    return story


def _build_single_finding(
    num: int,
    v: ViolationRecord,
    model: ComplianceModel,
) -> List:
    """Build all flowables for one violation/finding."""
    block: List = [
        _spacer(6),
        _hr(thickness=1.5, color=S.C_RED_DARK, spaceAfter=4),
        _p(f'FINDING {num}', S.PS_FINDING_HEADING),
    ]

    rows = [
        ['Finding ID',                 v.finding_id],
        ['Related Compliance ID',      v.compliance_id],
        ['Legal Requirement',          v.legal_requirement],
        ['Applicable Legal Provision', v.section_clause],
        ['Observed Violation',         v.observed_violation[:500]],
        ['Violation Description',      v.violation_description[:500]],
        ['Severity',                   v.severity],
        ['Legal / Compliance Impact',  v.legal_impact],
        ['Recommended Corrective Action', v.corrective_action],
        ['Responsible Party',          v.responsible_party],
        ['Target Date',                v.target_date],
        ['Finding Status',             v.status],
    ]

    col_w = [S.CONTENT_WIDTH * 0.30, S.CONTENT_WIDTH * 0.70]
    tbl_data = []
    for label, val in rows:
        if label == 'Severity':
            bg, fg = S.severity_badge_colors(val)
            st = ParagraphStyle('SevSt', parent=S.PS_TABLE_BODY_BOLD, textColor=fg)
            tbl_data.append([_p(label, S.PS_TABLE_BODY_BOLD), _p(val, st)])
        elif label == 'Finding Status':
            bg, fg = S.status_badge_colors(val)
            st = ParagraphStyle('FSt', parent=S.PS_TABLE_BODY_BOLD, textColor=fg)
            tbl_data.append([_p(label, S.PS_TABLE_BODY_BOLD), _p(val, st)])
        else:
            tbl_data.append([_p(label, S.PS_TABLE_BODY_BOLD),
                             _p(_na(val), S.PS_TABLE_BODY)])

    tbl = Table(tbl_data, colWidths=col_w)
    tbl.setStyle(S.finding_detail_style())
    block.append(tbl)

    # ---- EVIDENCE SUB-BLOCKS ----
    if v.evidences:
        block.append(_spacer(4))
        block.append(_p(f'Evidence — Finding {v.finding_id}',
                        S.PS_SUBSECTION_HEADING))

        for ev_idx, ev in enumerate(v.evidences):
            ev_block = _build_evidence_block(ev_idx + 1, ev)
            block.extend(ev_block)
    else:
        block.append(_spacer(2))
        block.append(_p('No image evidence associated with this finding.',
                        S.PS_BODY_SMALL))

    block.append(_spacer(4))
    return block


def _build_evidence_block(ev_num: int, ev: EvidenceRecord) -> List:
    """Build flowables for a single evidence item."""
    ev_label = f'Evidence {ev_num} - {ev.evidence_id}'
    block = [
        _spacer(3),
        _p(ev_label, S.PS_EVIDENCE_LABEL),
    ]

    # Truncate long descriptions to prevent table row overflow
    desc_short = (ev.description or '')[:300]

    meta_rows = [
        ['Evidence ID',    ev.evidence_id],
        ['Evidence Type',  ev.evidence_type],
        ['Finding ID',     ev.finding_id],
        ['Compliance ID',  ev.compliance_id],
        ['Description',    desc_short],
        ['Reference',      ev.reference],
    ]
    col_w = [S.CONTENT_WIDTH * 0.25, S.CONTENT_WIDTH * 0.75]
    tbl_data = [
        [_p(r[0], S.PS_TABLE_BODY_BOLD), _p(_na(r[1]), S.PS_TABLE_BODY)]
        for r in meta_rows
    ]
    tbl = Table(tbl_data, colWidths=col_w, splitByRow=1)
    tbl.setStyle(S.finding_detail_style())
    block.append(tbl)

    # Image embedding
    if ev.evidence_type in ('Image', 'Annotated Image') and ev.image_path:
        from reportlab.platypus import CondPageBreak
        # Ensure enough space for image (55mm + caption + label + spacer ~ 70mm ≈ 198pt)
        block.append(CondPageBreak(180))
        block.append(_spacer(3))

        # If this is the annotated image, show both original and annotated
        if ev.annotated_path and ev.annotation_data and ev.image_path == ev.annotated_path:
            # Annotated evidence
            block.append(_p('ANNOTATED EVIDENCE', S.PS_LABEL))
            ann_fl = IH.annotated_image_to_rl_flowable(
                ev.image_path, ev.annotation_data,
                max_width_mm=110, max_height_mm=55,
            )
            if ann_fl:
                block.append(ann_fl)
                block.append(_p(
                    f'Figure {ev_num}: Annotated evidence image for '
                    f'Finding {ev.finding_id}. Red box = net quantity zone; '
                    'orange border = required clear space; '
                    'red arrow = intruding text.',
                    S.PS_CAPTION,
                ))
            else:
                block.append(_p(
                    IH.unavailable_placeholder_text(ev.evidence_id),
                    S.PS_WARNING_BOX,
                ))
        else:
            # Standard image
            block.append(_p('EVIDENCE IMAGE', S.PS_LABEL))
            img_fl = IH.image_to_rl_flowable(
                ev.image_path,
                max_width_mm=110, max_height_mm=55,
            )
            if img_fl:
                block.append(img_fl)
                block.append(_p(
                    f'Figure {ev_num}: Evidence image for '
                    f'Finding {ev.finding_id} ({ev.evidence_id}).',
                    S.PS_CAPTION,
                ))
            else:
                block.append(_p(
                    IH.unavailable_placeholder_text(ev.evidence_id),
                    S.PS_WARNING_BOX,
                ))
    elif ev.evidence_type == 'Measurement Data':
        block.append(_spacer(2))
        block.append(_p('[Measurement Data - see Description above]', S.PS_BODY_SMALL))

    return block


# ---------------------------------------------------------------------------
# SECTION 6 — EVIDENCE REGISTER
# ---------------------------------------------------------------------------

def _build_evidence_register(model: ComplianceModel) -> List:
    story = _section_heading(6, 'Evidence Register')
    story.append(_p(
        'Complete register of all evidence items collected during this assessment. '
        'Each evidence item is traceable to its associated finding and compliance requirement.',
        S.PS_BODY,
    ))
    story.append(_spacer(4))

    if not model.evidences:
        story.append(_p('No evidence items recorded.', S.PS_BODY))
        return story

    hdr = [
        _p('Evidence ID',   S.PS_TABLE_HEADER),
        _p('Finding ID',    S.PS_TABLE_HEADER),
        _p('Compliance ID', S.PS_TABLE_HEADER),
        _p('Evidence Type', S.PS_TABLE_HEADER),
        _p('Description',   S.PS_TABLE_HEADER),
        _p('Reference',     S.PS_TABLE_HEADER),
    ]
    col_w = [
        S.CONTENT_WIDTH * 0.14,
        S.CONTENT_WIDTH * 0.13,
        S.CONTENT_WIDTH * 0.15,
        S.CONTENT_WIDTH * 0.13,
        S.CONTENT_WIDTH * 0.30,
        S.CONTENT_WIDTH * 0.15,
    ]
    tbl_data = [hdr]
    for ev in model.evidences:
        tbl_data.append([
            _p(ev.evidence_id,  S.PS_TABLE_BODY_BOLD),
            _p(ev.finding_id,   S.PS_TABLE_BODY),
            _p(ev.compliance_id, S.PS_TABLE_BODY),
            _p(ev.evidence_type, S.PS_TABLE_BODY),
            _p(ev.description[:150], S.PS_TABLE_BODY),
            _p(ev.reference[:60],    S.PS_TABLE_BODY),
        ])

    tbl = Table(tbl_data, colWidths=col_w, repeatRows=1)
    tbl.setStyle(S.generic_table_style())
    story.append(tbl)

    return story


# ---------------------------------------------------------------------------
# SECTION 7 — LEGAL TRACEABILITY MATRIX
# ---------------------------------------------------------------------------

def _build_traceability_matrix(model: ComplianceModel) -> List:
    story = _section_heading(7, 'Legal Traceability Matrix')
    story.append(_p(
        'This matrix provides end-to-end traceability from each legal requirement '
        'through its corresponding compliance record, finding, and evidence.',
        S.PS_BODY,
    ))
    story.append(_spacer(4))

    hdr = [
        _p('Compliance ID',     S.PS_TABLE_HEADER),
        _p('Legal Requirement', S.PS_TABLE_HEADER),
        _p('Legal Reference',   S.PS_TABLE_HEADER),
        _p('Finding ID',        S.PS_TABLE_HEADER),
        _p('Evidence ID',       S.PS_TABLE_HEADER),
        _p('Status',            S.PS_TABLE_HEADER),
    ]
    col_w = [
        S.CONTENT_WIDTH * 0.14,
        S.CONTENT_WIDTH * 0.20,
        S.CONTENT_WIDTH * 0.14,
        S.CONTENT_WIDTH * 0.12,
        S.CONTENT_WIDTH * 0.13,
        S.CONTENT_WIDTH * 0.27,
    ]

    # Build finding/evidence lookup
    finding_by_comp: dict = {}
    evidence_by_finding: dict = {}
    for v in model.violations:
        finding_by_comp.setdefault(v.compliance_id, []).append(v.finding_id)
    for ev in model.evidences:
        evidence_by_finding.setdefault(ev.finding_id, []).append(ev.evidence_id)

    tbl_data = [hdr]
    for c in model.compliances:
        findings = finding_by_comp.get(c.compliance_id, [])
        finding_str = '\n'.join(findings) if findings else '—'
        ev_ids = []
        for fid in findings:
            ev_ids.extend(evidence_by_finding.get(fid, []))
        ev_str = '\n'.join(ev_ids) if ev_ids else '—'

        bg, fg = S.status_badge_colors(c.status)
        st = ParagraphStyle('TrSt', parent=S.PS_TABLE_BODY_CENTER,
                            textColor=fg, fontName=S.FONT_BOLD)
        tbl_data.append([
            _p(c.compliance_id,       S.PS_TABLE_BODY_BOLD),
            _p(c.legal_requirement[:80], S.PS_TABLE_BODY),
            _p(c.section_clause,      S.PS_TABLE_BODY),
            _p(finding_str,           S.PS_TABLE_BODY),
            _p(ev_str,                S.PS_TABLE_BODY),
            _p(c.status,              st),
        ])

    tbl = Table(tbl_data, colWidths=col_w, repeatRows=1)
    tbl.setStyle(S.compliance_register_style())
    story.append(tbl)

    return story


# ---------------------------------------------------------------------------
# SECTION 8 — CORRECTIVE ACTION REGISTER
# ---------------------------------------------------------------------------

def _build_corrective_actions(model: ComplianceModel) -> List:
    story = _section_heading(8, 'Corrective Action Register')
    story.append(_p(
        'The following corrective actions are required to address identified '
        'violations and achieve full compliance with the applicable legal provisions.',
        S.PS_BODY,
    ))
    story.append(_spacer(4))

    if not model.violations:
        story.append(_p('No corrective actions required.', S.PS_BODY))
        return story

    hdr = [
        _p('Finding ID',       S.PS_TABLE_HEADER),
        _p('Violation',        S.PS_TABLE_HEADER),
        _p('Corrective Action', S.PS_TABLE_HEADER),
        _p('Priority',         S.PS_TABLE_HEADER),
        _p('Responsible Party', S.PS_TABLE_HEADER),
        _p('Target Date',      S.PS_TABLE_HEADER),
        _p('Status',           S.PS_TABLE_HEADER),
    ]
    col_w = [
        S.CONTENT_WIDTH * 0.11,
        S.CONTENT_WIDTH * 0.17,
        S.CONTENT_WIDTH * 0.26,
        S.CONTENT_WIDTH * 0.08,
        S.CONTENT_WIDTH * 0.14,
        S.CONTENT_WIDTH * 0.10,
        S.CONTENT_WIDTH * 0.14,
    ]

    tbl_data = [hdr]
    for v in model.violations:
        bg, fg = S.severity_badge_colors(v.severity)
        sev_st = ParagraphStyle('CASev', parent=S.PS_TABLE_BODY_CENTER,
                                textColor=fg, fontName=S.FONT_BOLD)
        tbl_data.append([
            _p(v.finding_id,              S.PS_TABLE_BODY_BOLD),
            _p(v.observed_violation[:120], S.PS_TABLE_BODY),
            _p(v.corrective_action[:220],  S.PS_TABLE_BODY),
            _p(v.severity,                 sev_st),
            _p(v.responsible_party,        S.PS_TABLE_BODY),
            _p(v.target_date,              S.PS_TABLE_BODY_CENTER),
            _p(v.status,                   S.PS_TABLE_BODY_BOLD),
        ])

    tbl = Table(tbl_data, colWidths=col_w, repeatRows=1)
    tbl.setStyle(S.generic_table_style())
    story.append(tbl)

    return story


# ---------------------------------------------------------------------------
# SECTION 9 — FINAL ASSESSMENT
# ---------------------------------------------------------------------------

def _build_final_assessment(model: ComplianceModel) -> List:
    s     = model.summary
    meta  = model.meta
    story = _section_heading(9, 'Final Assessment')

    overall = meta.get('assessment_status', 'UNKNOWN')
    bg, fg = S.status_badge_colors(overall)
    status_style = ParagraphStyle('FinalStatus', parent=S.PS_SUBSECTION_HEADING,
                                  textColor=fg)
    story.append(_p(f'Overall Compliance Status:  {overall}', status_style))
    story.append(_spacer(4))

    summary_data = [
        ['Total Requirements Assessed',   str(s.total_requirements)],
        ['Total Compliant',               str(s.compliant)],
        ['Total Non-Compliant',           str(s.non_compliant)],
        ['Total Not Applicable',          str(s.not_applicable)],
        ['Requires Review',               str(s.requires_review)],
        ['Total Violations Found',        str(s.total_violations)],
        ['Critical Findings',             str(s.critical_violations)],
        ['High Findings',                 str(s.high_violations)],
        ['Medium Findings',               str(s.medium_violations)],
        ['Low Findings',                  str(s.low_violations)],
        ['Outstanding Corrective Actions', str(s.total_violations)],
        ['Compliance Score',              f'{s.compliance_score:.1f}%'],
    ]

    col_w = [S.CONTENT_WIDTH * 0.60, S.CONTENT_WIDTH * 0.40]
    tbl_data = [
        [_p(r[0], S.PS_TABLE_BODY_BOLD), _p(r[1], S.PS_TABLE_BODY_CENTER)]
        for r in summary_data
    ]
    tbl = Table(tbl_data, colWidths=col_w)
    tbl.setStyle(S.document_control_style())
    story.append(tbl)
    story.append(_spacer(8))

    story.append(_subsection_heading('Final Assessment Statement'))
    story.append(_p(s.overall_text, S.PS_BODY_JUSTIFIED))
    story.append(_spacer(6))

    story.append(_hr(thickness=1.0, color=S.C_NAVY))
    story.append(_spacer(3))
    story.append(_p(
        'DECLARATION\n'
        'This report has been generated automatically by the Nirikshak Legal Methodology '
        'Compliance Automation System based on image-based label analysis. '
        'The findings documented herein are based on computational analysis of product '
        'label images and extracted textual data. This report does not constitute a '
        'legal opinion and does not replace a formal inspection by an authorised '
        'Legal Metrology Inspector under the Legal Metrology Act, 2009. '
        'Registration status (Rules 27–30) and penalty determination (Rule 32) '
        'require manual verification and are not covered by this automated report.',
        S.PS_NOTE,
    ))
    story.append(_spacer(3))
    story.append(_p(
        f'Report generated on: {meta.get("generated_on", "N/A")}  |  '
        f'System: Nirikshak Compliance Automation Pipeline  |  '
        f'Version: {meta.get("report_version", "1.0")}',
        S.PS_BODY_SMALL,
    ))

    return story


# ---------------------------------------------------------------------------
# MAIN PDF GENERATOR
# ---------------------------------------------------------------------------

def generate_pdf(model: ComplianceModel, output_path: str) -> str:
    """
    Generate the complete A4 compliance report PDF.

    Parameters
    ----------
    model       : ComplianceModel from compliance_mapper.build_model()
    output_path : Destination PDF file path

    Returns
    -------
    Absolute path to the generated PDF.
    """
    os.makedirs(os.path.dirname(os.path.abspath(output_path)), exist_ok=True)

    report_id = model.meta.get('report_id', 'N/A')

    # ---- Page Templates ----
    # Cover page frame (no header/footer space)
    cover_frame = Frame(
        S.MARGIN_LEFT, S.MARGIN_BOTTOM,
        S.CONTENT_WIDTH,
        S.PAGE_HEIGHT - S.MARGIN_TOP - S.MARGIN_BOTTOM,
        id='cover_frame',
    )
    # Main frame with space for header and footer bars
    main_frame = Frame(
        S.MARGIN_LEFT,
        S.MARGIN_BOTTOM + S.FOOTER_HEIGHT + 2 * mm,
        S.CONTENT_WIDTH,
        S.PAGE_HEIGHT - S.MARGIN_TOP - S.MARGIN_BOTTOM
        - S.HEADER_HEIGHT - S.FOOTER_HEIGHT - 4 * mm,
        id='main_frame',
    )

    cover_template = PageTemplate(
        id='cover',
        frames=[cover_frame],
        onPage=_draw_cover_page,
    )
    main_template = PageTemplate(
        id='main',
        frames=[main_frame],
        onPage=_draw_header_footer,
    )

    doc = BaseDocTemplate(
        output_path,
        pagesize=A4,
        pageTemplates=[cover_template, main_template],
        title=f'Compliance Assessment Report - {report_id}',
        author='Nirikshak Compliance Automation System',
        subject='Legal Metrology (Packaged Commodities) Rules, 2011',
        creator='Nirikshak Stage-9',
    )
    doc._report_id = report_id  # accessed by header/footer functions

    # ---- Build Story ----
    story: List = []

    # Cover page
    story.extend(_build_cover_page(model))

    # Section 1 — Document Control
    story.extend(_build_document_control(model))
    story.append(PageBreak())

    # Section 2 — Executive Summary
    story.extend(_build_executive_summary(model))
    story.append(PageBreak())

    # Section 3 — Compliance Register
    story.extend(_build_compliance_register(model))
    story.append(PageBreak())

    # Section 4 — Compliance Details
    story.extend(_build_compliance_details(model))
    story.append(PageBreak())

    # Section 5 — Violations
    story.extend(_build_violations(model))
    story.append(PageBreak())

    # Section 6 — Evidence Register
    story.extend(_build_evidence_register(model))
    story.append(PageBreak())

    # Section 7 — Traceability Matrix
    story.extend(_build_traceability_matrix(model))
    story.append(PageBreak())

    # Section 8 — Corrective Actions
    story.extend(_build_corrective_actions(model))
    story.append(PageBreak())

    # Section 9 — Final Assessment
    story.extend(_build_final_assessment(model))

    # ---- Single pass build using NumberedCanvas ----
    print('  Building PDF (single pass with NumberedCanvas)...')
    doc.build(story, canvasmaker=NumberedCanvas)
    print('  Done.')

    return os.path.abspath(output_path)
