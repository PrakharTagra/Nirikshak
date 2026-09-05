"""
pdf_builder.py — Master PDF Construction
=========================================
Builds the complete A4 Government-Style Statutory Compliance Assessment Report.

Strict Design Principles:
  1. Under 6 pages total (strictly 5-page legal inspection memorandum).
  2. Authentic government/regulatory document appearance (not AI-generated style).
  3. All 9 statutory compliance sections strictly preserved in mandated order.
  4. Precise statutory citations (Rules 6, 7, 8, 11, Section 36).
  5. High information density, official seals, and attestation blocks.
  6. Embedded image evidence with bounding boxes & calibration data.

Legal Methodology Compliance Automation — Stage-9
"""

import os
from datetime import datetime
from typing import List, Optional

from reportlab.platypus import (
    BaseDocTemplate, PageTemplate, Frame, Paragraph, Spacer,
    Table, TableStyle, KeepTogether, PageBreak, HRFlowable, NextPageTemplate,
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

import re

def _p(text: str, style: ParagraphStyle) -> Paragraph:
    """Safe Paragraph creation — escapes naked ampersands while preserving standard HTML tags."""
    text = str(text or 'Not Available')
    text = re.sub(r'&(?!(amp|lt|gt|quot|apos);)', '&amp;', text)
    return Paragraph(text, style)


def _spacer(h_mm: float = 1.5) -> Spacer:
    return Spacer(1, h_mm * mm)


def _hr(thickness=0.5, color=None, spaceAfter=2, spaceBefore=2):
    return HRFlowable(
        width='100%',
        thickness=thickness,
        color=color or S.C_RULE_LINE,
        spaceAfter=spaceAfter,
        spaceBefore=spaceBefore,
    )


def _na(val: str) -> str:
    return val if val and str(val).strip() else 'Not Available'


# ---------------------------------------------------------------------------
# NUMBERED CANVAS — Handles "Page X of Y" in a single pass
# ---------------------------------------------------------------------------

class NumberedCanvas(rl_canvas.Canvas):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._saved_page_states: list = []

    def showPage(self):
        self._saved_page_states.append(dict(self.__dict__))
        self._startPage()

    def save(self):
        num_pages = len(self._saved_page_states)
        for state in self._saved_page_states:
            self.__dict__.update(state)
            self._stamp_page_number(self._pageNumber, num_pages)
            super().showPage()
        super().save()

    def _stamp_page_number(self, page_num: int, total: int):
        if page_num <= 1:
            return
        w, h = A4
        report_id = getattr(self, '_report_id', 'N/A')
        self.setFont(S.FONT_REGULAR, 6.5)
        self.setFillColor(S.C_WHITE)
        self.drawRightString(
            w - S.MARGIN_RIGHT, 3.5 * mm,
            f'Ref: {report_id}   |   Page {page_num} of {total}',
        )


# ---------------------------------------------------------------------------
# HEADER / FOOTER DRAWING FUNCTIONS
# ---------------------------------------------------------------------------

def _draw_cover_page(c: rl_canvas.Canvas, doc):
    w, h = A4
    c.saveState()
    # Institutional top border
    c.setFillColor(S.C_NAVY)
    c.rect(0, h - 6 * mm, w, 6 * mm, fill=1, stroke=0)
    c.setFillColor(S.C_BLUE)
    c.rect(0, h - 8 * mm, w, 2 * mm, fill=1, stroke=0)
    # Bottom border
    c.setFillColor(S.C_NAVY)
    c.rect(0, 0, w, 6 * mm, fill=1, stroke=0)
    c.restoreState()


def _draw_header_footer(c: rl_canvas.Canvas, doc):
    w, h = A4
    report_id = getattr(doc, '_report_id', 'N/A')
    c._report_id = report_id

    c.saveState()
    # Header line
    c.setFillColor(S.C_NAVY)
    c.rect(0, h - 9 * mm, w, 9 * mm, fill=1, stroke=0)
    c.setFont(S.FONT_BOLD, 7)
    c.setFillColor(S.C_WHITE)
    c.drawString(S.MARGIN_LEFT, h - 6 * mm,
                 'STATUTORY COMPLIANCE ASSESSMENT REPORT  [LEGAL METROLOGY ACT, 2009]')
    c.setFont(S.FONT_REGULAR, 6.5)
    c.drawRightString(w - S.MARGIN_RIGHT, h - 6 * mm,
                      f'OFFICIAL RECORD: {report_id}')
    c.restoreState()

    c.saveState()
    # Footer line
    c.setFillColor(S.C_NAVY)
    c.rect(0, 0, w, 8 * mm, fill=1, stroke=0)
    c.setFont(S.FONT_REGULAR, 6.5)
    c.setFillColor(S.C_WHITE)
    c.drawString(S.MARGIN_LEFT, 3 * mm,
                 'CONFIDENTIAL  -  ENFORCEMENT AUDIT RECORD  -  DEPARTMENT OF LEGAL METROLOGY')
    c.restoreState()


# ---------------------------------------------------------------------------
# SECTION HEADINGS
# ---------------------------------------------------------------------------

def _section_heading(number: int, title: str) -> List:
    return [
        _spacer(1.5),
        _p(f'<b>SECTION {number}: {title.upper()}</b>', S.PS_SECTION_HEADING),
        _hr(thickness=0.6, color=S.C_NAVY, spaceAfter=2, spaceBefore=1),
    ]


def _subsection_heading(title: str) -> Paragraph:
    return _p(f'<b>{title}</b>', S.PS_SUBSECTION_HEADING)


# ---------------------------------------------------------------------------
# PAGE 1: FORMAL STATUTORY COVER & RECORD OF INSPECTION
# ---------------------------------------------------------------------------

def _build_cover_page(model: ComplianceModel) -> List:
    meta = model.meta
    story = []

    story.append(NextPageTemplate('main'))
    story.append(_spacer(8))

    # Official National Header
    story.append(_p('GOVERNMENT REGULATORY ENFORCEMENT & COMPLIANCE SYSTEM', S.PS_GOV_HEADER))
    story.append(_p('DIRECTORATE OF LEGAL METROLOGY  |  PACKAGED COMMODITIES DIVISION', S.PS_GOV_SUBHEADER))
    story.append(_hr(thickness=1.2, color=S.C_NAVY, spaceAfter=8, spaceBefore=3))

    # Main Title
    story.append(_p('STATUTORY COMPLIANCE ASSESSMENT REPORT', S.PS_COVER_TITLE))
    story.append(_p('AUDIT MEMORANDUM UNDER LEGAL METROLOGY (PACKAGED COMMODITIES) RULES, 2011', S.PS_COVER_SUBTITLE))
    story.append(_hr(thickness=0.8, color=S.C_SLATE, spaceAfter=10, spaceBefore=4))

    # Metadata Grid
    overall_status = meta.get('assessment_status', 'UNKNOWN')
    status_bg, status_fg = S.status_badge_colors(overall_status)

    meta_rows = [
        ['Report Identifier',          _na(meta.get('report_id', ''))],
        ['Case / Inspection Reference',_na(meta.get('case_id', ''))],
        ['Packaged Commodity Entity',   _na(meta.get('entity', ''))],
        ['Declared Manufacturer / Packer', _na(meta.get('manufacturer', ''))],
        ['Date of Physical/Digital Audit', _na(meta.get('assessment_date', ''))],
        ['Governing Legal Framework',  _na(meta.get('framework', ''))],
        ['Compliance Determination',    overall_status],
        ['Digital Record Generation Time', _na(meta.get('generated_on', ''))],
    ]

    col_w = [S.CONTENT_WIDTH * 0.35, S.CONTENT_WIDTH * 0.65]
    tbl_data = []
    for label, val in meta_rows:
        lp = _p(f'<b>{label}</b>', S.PS_COVER_LABEL)
        if label == 'Compliance Determination':
            st = ParagraphStyle('CoverSt', parent=S.PS_COVER_VALUE, textColor=status_fg, fontName=S.FONT_BOLD, fontSize=8.5)
            vp = _p(f'<b>{val}</b>', st)
        else:
            vp = _p(val, S.PS_COVER_VALUE)
        tbl_data.append([lp, vp])

    tbl = Table(tbl_data, colWidths=col_w)
    tbl.setStyle(S.cover_meta_style())
    story.append(tbl)

    story.append(_spacer(14))

    # Official Attestation Box on Page 1
    notice_text = (
        '<b>NOTICE OF STATUTORY INSPECTION:</b><br/>'
        'This report documents formal findings from an optical, geometric, and textual compliance audit '
        'conducted pursuant to the provisions of the Legal Metrology Act, 2009 (Act 1 of 2010) and Rule 6 '
        'of the Legal Metrology (Packaged Commodities) Rules, 2011. The observations recorded herein represent '
        'verified declarations and physical measurements extracted from mandatory label panels. '
        'Contraventions cited herein constitute prima facie violations punishable under Section 36 of the Act.'
    )
    notice_tbl = Table([[_p(notice_text, S.PS_BODY)]], colWidths=[S.CONTENT_WIDTH])
    notice_tbl.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, -1), S.C_LIGHT_GRAY),
        ('GRID', (0, 0), (-1, -1), 0.5, S.C_BORDER),
        ('TOPPADDING', (0, 0), (-1, -1), 6),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 6),
        ('LEFTPADDING', (0, 0), (-1, -1), 8),
        ('RIGHTPADDING', (0, 0), (-1, -1), 8),
    ]))
    story.append(notice_tbl)

    story.append(_spacer(12))
    story.append(_p(
        'AUTHORISED INSPECTION RECORD  |  SYSTEM-GENERATED COMPLIANCE AUDIT  |  NIRIKSHAK PIPELINE',
        S.PS_COVER_FOOTER,
    ))

    story.append(NextPageTemplate('main'))
    story.append(PageBreak())
    return story


# ---------------------------------------------------------------------------
# PAGE 2: DOCUMENT CONTROL (1), EXECUTIVE SUMMARY (2) & COMPLIANCE REGISTER (3)
# ---------------------------------------------------------------------------

def _build_page_2(model: ComplianceModel) -> List:
    meta = model.meta
    s = model.summary
    story = []

    # --- 1. DOCUMENT CONTROL ---
    story.extend(_section_heading(1, 'Document Control & Regulatory Audit Parameters'))
    doc_rows = [
        ['Report ID:',            _na(meta.get('report_id', '')),
         'Case / Ref No:',        _na(meta.get('case_id', ''))],
        ['Audited Commodity:',    _na(meta.get('entity', '')),
         'Manufacturer Name:',    _na(meta.get('manufacturer', ''))],
        ['Inspection Date:',      _na(meta.get('assessment_date', '')),
         'Statutory Ruleset:',    'LMPC Rules, 2011'],
        ['Audit Determination:',  _na(meta.get('assessment_status', '')),
         'Inspection Version:',   _na(meta.get('report_version', '1.0'))],
    ]
    col_w_doc = [
        S.CONTENT_WIDTH * 0.18,
        S.CONTENT_WIDTH * 0.32,
        S.CONTENT_WIDTH * 0.18,
        S.CONTENT_WIDTH * 0.32,
    ]
    tbl_doc_data = []
    for r in doc_rows:
        tbl_doc_data.append([
            _p(f'<b>{r[0]}</b>', S.PS_TABLE_BODY_BOLD),
            _p(r[1], S.PS_TABLE_BODY),
            _p(f'<b>{r[2]}</b>', S.PS_TABLE_BODY_BOLD),
            _p(r[3], S.PS_TABLE_BODY),
        ])
    doc_tbl = Table(tbl_doc_data, colWidths=col_w_doc)
    doc_tbl.setStyle(S.document_control_style())
    story.append(doc_tbl)
    story.append(_spacer(2))

    # --- 2. EXECUTIVE SUMMARY ---
    story.extend(_section_heading(2, 'Executive Audit Summary & Statutory Metrics'))

    # Executive Metric Band
    kpi_hdr = [
        _p('Audited Rules', S.PS_TABLE_HEADER),
        _p('Compliant',     S.PS_TABLE_HEADER),
        _p('Non-Compliant', S.PS_TABLE_HEADER),
        _p('Exempt / N/A',  S.PS_TABLE_HEADER),
        _p('Total Violations', S.PS_TABLE_HEADER),
        _p('Compliance Rating', S.PS_TABLE_HEADER),
    ]

    p_comp = ParagraphStyle('KC', parent=S.PS_TABLE_BODY_CENTER, fontName=S.FONT_BOLD, fontSize=8.5, textColor=S.C_GREEN_DARK)
    p_non  = ParagraphStyle('KN', parent=S.PS_TABLE_BODY_CENTER, fontName=S.FONT_BOLD, fontSize=8.5, textColor=S.C_RED_DARK)
    p_tot  = ParagraphStyle('KT', parent=S.PS_TABLE_BODY_CENTER, fontName=S.FONT_BOLD, fontSize=8.5, textColor=S.C_NAVY)

    kpi_val = [
        _p(str(s.total_requirements), p_tot),
        _p(str(s.compliant), p_comp),
        _p(str(s.non_compliant), p_non),
        _p(str(s.not_applicable), p_tot),
        _p(str(s.total_violations), p_non if s.total_violations > 0 else p_comp),
        _p(f'{s.compliance_score:.1f}%', p_tot),
    ]

    col_kpi = [S.CONTENT_WIDTH / 6.0] * 6
    kpi_table = Table([kpi_hdr, kpi_val], colWidths=col_kpi)
    kpi_table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), S.C_TABLE_HEAD),
        ('BACKGROUND', (0, 1), (-1, 1), S.C_LIGHT_GRAY),
        ('BACKGROUND', (1, 1), (1, 1), S.C_GREEN_BG),
        ('BACKGROUND', (2, 1), (2, 1), S.C_RED_BG if s.non_compliant > 0 else S.C_GREEN_BG),
        ('BACKGROUND', (4, 1), (4, 1), S.C_RED_BG if s.total_violations > 0 else S.C_GREEN_BG),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        ('GRID', (0, 0), (-1, -1), 0.35, S._GRID),
        ('TOPPADDING', (0, 0), (-1, -1), 2),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 2),
    ]))
    story.append(kpi_table)
    story.append(_spacer(2))

    story.append(_p(s.overall_text, S.PS_BODY_JUSTIFIED))
    story.append(_spacer(2))

    # --- 3. COMPLIANCE REGISTER ---
    story.extend(_section_heading(3, 'Statutory Compliance Register (Rule-by-Rule Audit)'))

    reg_hdr = [
        _p('Sr.',          S.PS_TABLE_HEADER),
        _p('Compliance ID',S.PS_TABLE_HEADER),
        _p('Statutory Requirement', S.PS_TABLE_HEADER),
        _p('Legal Clause', S.PS_TABLE_HEADER),
        _p('Extracted Declaration / Observation', S.PS_TABLE_HEADER),
        _p('Status',       S.PS_TABLE_HEADER),
    ]
    col_w_reg = [
        S.CONTENT_WIDTH * 0.05,
        S.CONTENT_WIDTH * 0.15,
        S.CONTENT_WIDTH * 0.22,
        S.CONTENT_WIDTH * 0.15,
        S.CONTENT_WIDTH * 0.31,
        S.CONTENT_WIDTH * 0.12,
    ]
    tbl_reg_data = [reg_hdr]
    reg_extra_cmds = []

    for c in model.compliances:
        bg, fg = S.status_badge_colors(c.status)
        st = ParagraphStyle(f'St_{c.sr_no}', parent=S.PS_TABLE_BODY_CENTER, textColor=fg, fontName=S.FONT_BOLD, fontSize=6.5)
        row = [
            _p(str(c.sr_no),        S.PS_TABLE_BODY_CENTER),
            _p(c.compliance_id,     S.PS_TABLE_BODY_BOLD),
            _p(c.legal_requirement, S.PS_TABLE_BODY),
            _p(c.section_clause,    S.PS_TABLE_BODY),
            _p(_na(c.assessment)[:140], S.PS_TABLE_BODY),
            _p(c.status,            st),
        ]
        r_idx = len(tbl_reg_data)
        tbl_reg_data.append(row)
        reg_extra_cmds.append(('BACKGROUND', (5, r_idx), (5, r_idx), bg))

    reg_table = Table(tbl_reg_data, colWidths=col_w_reg, repeatRows=1)
    base_style = S.compliance_register_style()
    reg_table.setStyle(TableStyle(list(base_style._cmds) + reg_extra_cmds))
    story.append(reg_table)

    story.append(PageBreak())
    return story


# ---------------------------------------------------------------------------
# PAGE 3: SECTION 4 — INDIVIDUAL COMPLIANCE DETAILS (Regulatory Audit Schedule)
# ---------------------------------------------------------------------------

def _build_page_3(model: ComplianceModel) -> List:
    story = []
    story.extend(_section_heading(4, 'Statutory Compliance Details & Technical Observations Schedule'))
    story.append(_p(
        'Detailed schedule of statutory requirements under the Legal Metrology (Packaged Commodities) Rules, 2011, '
        'including extracted label text, physical measurements, and compliance determinations.',
        S.PS_BODY,
    ))
    story.append(_spacer(2))

    sched_hdr = [
        _p('Sr.',          S.PS_TABLE_HEADER),
        _p('Clause Ref',   S.PS_TABLE_HEADER),
        _p('Statutory Scope & Legal Requirement', S.PS_TABLE_HEADER),
        _p('Extracted Observation & Technical Measurement', S.PS_TABLE_HEADER),
        _p('Auditor Remarks', S.PS_TABLE_HEADER),
        _p('Status',       S.PS_TABLE_HEADER),
    ]

    col_w_sched = [
        S.CONTENT_WIDTH * 0.04,
        S.CONTENT_WIDTH * 0.15,
        S.CONTENT_WIDTH * 0.28,
        S.CONTENT_WIDTH * 0.28,
        S.CONTENT_WIDTH * 0.13,
        S.CONTENT_WIDTH * 0.12,
    ]

    tbl_sched = [sched_hdr]
    sched_extra = []

    for c in model.compliances:
        bg, fg = S.status_badge_colors(c.status)
        st = ParagraphStyle(f'StS_{c.sr_no}', parent=S.PS_TABLE_BODY_CENTER, textColor=fg, fontName=S.FONT_BOLD, fontSize=6.5)

        scope_desc = f'<b>{c.legal_requirement}</b><br/>{c.description[:110]}'
        obs_text = f'{_na(c.assessment)[:160]}'
        rem_text = f'{_na(c.remarks)[:70]}'

        row = [
            _p(str(c.sr_no),      S.PS_TABLE_BODY_CENTER),
            _p(f'<b>{c.compliance_id}</b><br/>{c.section_clause}', S.PS_TABLE_BODY),
            _p(scope_desc,        S.PS_TABLE_BODY),
            _p(obs_text,          S.PS_TABLE_BODY),
            _p(rem_text,          S.PS_TABLE_BODY),
            _p(c.status,          st),
        ]
        r_idx = len(tbl_sched)
        tbl_sched.append(row)
        sched_extra.append(('BACKGROUND', (5, r_idx), (5, r_idx), bg))

    sched_table = Table(tbl_sched, colWidths=col_w_sched, repeatRows=1)
    base_style = S.compliance_register_style()
    sched_table.setStyle(TableStyle(list(base_style._cmds) + sched_extra))
    story.append(sched_table)

    story.append(PageBreak())
    return story


# ---------------------------------------------------------------------------
# PAGE 4: SECTION 5 — VIOLATIONS & PHOTOGRAPHIC EVIDENCE
# ---------------------------------------------------------------------------

def _build_page_4(model: ComplianceModel) -> List:
    story = []
    story.extend(_section_heading(5, 'Statutory Infractions & Photographic Verification Exhibits'))

    # 1. Non-compliance findings & Photographic Exhibits for EVERY violation
    if model.violations:
        for idx, v in enumerate(model.violations):
            bg, fg = S.severity_badge_colors(v.severity)
            sev_st = ParagraphStyle(f'Sev_{idx}', parent=S.PS_TABLE_BODY_CENTER, textColor=fg, fontName=S.FONT_BOLD, fontSize=7)

            finding_block = []
            finding_title = f'<b>FINDING {idx + 1}: {v.finding_id}</b> — Contravention of {v.section_clause}'
            finding_block.append(_p(finding_title, S.PS_FINDING_HEADING))

            rows = [
                ['Finding ID:',          v.finding_id,            'Severity Degree:',  _p(v.severity, sev_st)],
                ['Linked Compliance:',   v.compliance_id,         'Governing Rule:',   v.section_clause],
                ['Observed Infraction:', v.observed_violation[:180], 'Statutory Status:', v.status],
                ['Statutory Impact:',    v.legal_impact[:180],    'Liability Target:', v.responsible_party],
                ['Corrective Action:',   v.corrective_action[:180],'Compliance Deadline:', v.target_date],
            ]
            col_w = [
                S.CONTENT_WIDTH * 0.16,
                S.CONTENT_WIDTH * 0.44,
                S.CONTENT_WIDTH * 0.16,
                S.CONTENT_WIDTH * 0.24,
            ]
            tbl_data = []
            for r in rows:
                c1 = _p(f'<b>{r[0]}</b>', S.PS_TABLE_BODY_BOLD)
                c2 = r[1] if isinstance(r[1], Paragraph) else _p(_na(r[1]), S.PS_TABLE_BODY)
                c3 = _p(f'<b>{r[2]}</b>', S.PS_TABLE_BODY_BOLD)
                c4 = r[3] if isinstance(r[3], Paragraph) else _p(_na(r[3]), S.PS_TABLE_BODY)
                tbl_data.append([c1, c2, c3, c4])

            ftbl = Table(tbl_data, colWidths=col_w)
            ftbl.setStyle(S.finding_detail_style())
            finding_block.append(ftbl)
            finding_block.append(_spacer(1))

            # 2. Locate this violation's bounding-box evidence image
            ev_img_path = None
            for ev in v.evidences:
                if ev.image_path and os.path.isfile(ev.image_path):
                    ev_img_path = ev.image_path
                    break

            if not ev_img_path:
                candidate_names = [
                    f'violation_evidence_{idx + 1}.png',
                    f'evidence_{idx + 1}.png',
                    'net_quantity_bounding_box.png' if ('net' in v.compliance_id.lower() or 'quantity' in v.observed_violation.lower()) else None,
                ]
                for cname in candidate_names:
                    if cname and model.image_paths.get(cname) and os.path.isfile(model.image_paths[cname]):
                        ev_img_path = model.image_paths[cname]
                        break

            # Fallback to any available product image if specific annotated image not found
            if not ev_img_path:
                for k, p in model.image_paths.items():
                    if p and os.path.isfile(p):
                        ev_img_path = p
                        break

            if ev_img_path and os.path.isfile(ev_img_path):
                img_fl = IH.image_to_rl_flowable(ev_img_path, max_width_mm=135, max_height_mm=60)
                if img_fl:
                    finding_block.append(_spacer(1))
                    is_clearance = 'net_quantity_bounding_box' in ev_img_path or 'Rule 8(1)' in v.section_clause
                    ex_title = f'<b>EXHIBIT {idx + 1}: STATUTORY INFRACTION & BOUNDING BOX ANALYSIS — {v.finding_id} ({v.section_clause})</b>'
                    finding_block.append(_p(ex_title, S.PS_SUBSECTION_HEADING))

                    if is_clearance:
                        ex_caption = (
                            '<b>Technical Legend:</b> Solid Green = Detected Net Quantity Box; '
                            'Dashed Boundary = Rule 8(1) Required Clear Space; '
                            'Red Highlight = Unlawful Printed Text Intrusion into Exclusion Zone.'
                        )
                    elif 'missing' in v.observed_violation.lower() or 'not found' in v.observed_violation.lower():
                        ex_caption = (
                            f'<b>Photographic Verification Record:</b> Scanned label verification boundary '
                            f'confirming mandatory declaration under {v.section_clause} is absent from packaging.'
                        )
                    else:
                        ex_caption = (
                            f'<b>Technical Legend:</b> Solid Red Bounding Box = Contravention of {v.section_clause}; '
                            f'Red Badge = Non-Compliance Citation & Measured Deficit.'
                        )

                    ex_tbl = Table([
                        [img_fl],
                        [_p(ex_caption, S.PS_CAPTION)],
                    ], colWidths=[S.CONTENT_WIDTH])
                    ex_tbl.setStyle(TableStyle([
                        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                        ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                        ('BACKGROUND', (0, 0), (-1, -1), S.C_LIGHT_GRAY),
                        ('BOX', (0, 0), (-1, -1), 0.5, S.C_BORDER),
                        ('TOPPADDING', (0, 0), (-1, -1), 2),
                        ('BOTTOMPADDING', (0, 0), (-1, -1), 2),
                        ('LEFTPADDING', (0, 0), (-1, -1), 4),
                        ('RIGHTPADDING', (0, 0), (-1, -1), 4),
                    ]))
                    finding_block.append(ex_tbl)
                    finding_block.append(_spacer(2))

            story.append(KeepTogether(finding_block))
    else:
        story.append(_p('<b>DETERMINATION: COMPLIANT</b> — No statutory infractions or label contraventions identified.', S.PS_BODY))
        story.append(_spacer(2))

        # Show audited label panel exhibit
        fallback_img = None
        for k, p in model.image_paths.items():
            if p and os.path.exists(p):
                fallback_img = p
                break
        if fallback_img:
            img_fl = IH.image_to_rl_flowable(fallback_img, max_width_mm=135, max_height_mm=60)
            if img_fl:
                ex_title = '<b>EXHIBIT 1: PACKAGED COMMODITY MANDATORY LABEL PANEL AUDIT RECORD</b>'
                story.append(_p(ex_title, S.PS_SUBSECTION_HEADING))
                ex_caption = '<b>Photographic Record:</b> Principal display panel showing declarations verified during statutory digital audit.'
                ex_tbl = Table([[img_fl], [_p(ex_caption, S.PS_CAPTION)]], colWidths=[S.CONTENT_WIDTH])
                ex_tbl.setStyle(TableStyle([
                    ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                    ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                    ('BACKGROUND', (0, 0), (-1, -1), S.C_LIGHT_GRAY),
                    ('BOX', (0, 0), (-1, -1), 0.5, S.C_BORDER),
                    ('TOPPADDING', (0, 0), (-1, -1), 2),
                    ('BOTTOMPADDING', (0, 0), (-1, -1), 2),
                    ('LEFTPADDING', (0, 0), (-1, -1), 4),
                    ('RIGHTPADDING', (0, 0), (-1, -1), 4),
                ]))
                story.append(ex_tbl)

    story.append(PageBreak())
    return story


# ---------------------------------------------------------------------------
# PAGE 5: SECTIONS 6, 7, 8, 9 & STATUTORY SEAL BLOCK
# ---------------------------------------------------------------------------

def _build_page_5(model: ComplianceModel) -> List:
    s = model.summary
    meta = model.meta
    story = []

    # --- 6. EVIDENCE REGISTER ---
    story.extend(_section_heading(6, 'Evidence Register (Chain of Custody)'))
    hdr_ev = [
        _p('Evidence ID', S.PS_TABLE_HEADER),
        _p('Finding Ref', S.PS_TABLE_HEADER),
        _p('Type',        S.PS_TABLE_HEADER),
        _p('Source Reference', S.PS_TABLE_HEADER),
        _p('Evidentiary Description', S.PS_TABLE_HEADER),
    ]
    col_w_ev = [
        S.CONTENT_WIDTH * 0.16,
        S.CONTENT_WIDTH * 0.14,
        S.CONTENT_WIDTH * 0.12,
        S.CONTENT_WIDTH * 0.28,
        S.CONTENT_WIDTH * 0.30,
    ]
    tbl_ev_data = [hdr_ev]
    seen_ev = set()
    for ev in model.evidences:
        if ev.evidence_id not in seen_ev:
            seen_ev.add(ev.evidence_id)
            tbl_ev_data.append([
                _p(ev.evidence_id, S.PS_TABLE_BODY_BOLD),
                _p(ev.finding_id, S.PS_TABLE_BODY),
                _p(ev.evidence_type, S.PS_TABLE_BODY),
                _p(ev.reference[:30], S.PS_TABLE_BODY),
                _p(ev.description[:80], S.PS_TABLE_BODY),
            ])
    ev_table = Table(tbl_ev_data, colWidths=col_w_ev, repeatRows=1)
    ev_table.setStyle(S.generic_table_style())
    story.append(ev_table)
    story.append(_spacer(1))

    # --- 7. LEGAL TRACEABILITY MATRIX ---
    story.extend(_section_heading(7, 'Statutory Traceability Matrix (Rule -> Compliance -> Finding -> Evidence)'))
    hdr_tr = [
        _p('Compliance ID', S.PS_TABLE_HEADER),
        _p('Governing Clause', S.PS_TABLE_HEADER),
        _p('Statutory Requirement', S.PS_TABLE_HEADER),
        _p('Finding ID', S.PS_TABLE_HEADER),
        _p('Evidence ID', S.PS_TABLE_HEADER),
        _p('Disposition', S.PS_TABLE_HEADER),
    ]
    col_w_tr = [
        S.CONTENT_WIDTH * 0.15,
        S.CONTENT_WIDTH * 0.15,
        S.CONTENT_WIDTH * 0.32,
        S.CONTENT_WIDTH * 0.12,
        S.CONTENT_WIDTH * 0.12,
        S.CONTENT_WIDTH * 0.14,
    ]

    finding_by_comp = {}
    evidence_by_finding = {}
    for v in model.violations:
        finding_by_comp.setdefault(v.compliance_id, []).append(v.finding_id)
    for ev in model.evidences:
        evidence_by_finding.setdefault(ev.finding_id, []).append(ev.evidence_id)

    tbl_tr_data = [hdr_tr]
    for c in model.compliances:
        findings = finding_by_comp.get(c.compliance_id, [])
        f_str = ', '.join(findings) if findings else '-'
        ev_ids = []
        for fid in findings:
            ev_ids.extend(evidence_by_finding.get(fid, []))
        ev_str = ', '.join(ev_ids) if ev_ids else '-'

        bg, fg = S.status_badge_colors(c.status)
        st = ParagraphStyle('TrSt', parent=S.PS_TABLE_BODY_CENTER, textColor=fg, fontName=S.FONT_BOLD, fontSize=6)

        tbl_tr_data.append([
            _p(c.compliance_id, S.PS_TABLE_BODY_BOLD),
            _p(c.section_clause, S.PS_TABLE_BODY),
            _p(c.legal_requirement[:55], S.PS_TABLE_BODY),
            _p(f_str, S.PS_TABLE_BODY),
            _p(ev_str, S.PS_TABLE_BODY),
            _p(c.status, st),
        ])
    tr_table = Table(tbl_tr_data, colWidths=col_w_tr, repeatRows=1)
    tr_table.setStyle(S.compliance_register_style())
    story.append(tr_table)
    story.append(_spacer(1))

    # --- 8. CORRECTIVE ACTION REGISTER ---
    story.extend(_section_heading(8, 'Mandatory Corrective Action Order'))
    if not model.violations:
        story.append(_p('Commodity complies with applicable standards. No corrective action ordered.', S.PS_BODY))
    else:
        hdr_ca = [
            _p('Finding ID', S.PS_TABLE_HEADER),
            _p('Observed Infraction', S.PS_TABLE_HEADER),
            _p('Mandatory Corrective Action Directive', S.PS_TABLE_HEADER),
            _p('Priority', S.PS_TABLE_HEADER),
            _p('Target Date', S.PS_TABLE_HEADER),
            _p('Status', S.PS_TABLE_HEADER),
        ]
        col_w_ca = [
            S.CONTENT_WIDTH * 0.12,
            S.CONTENT_WIDTH * 0.22,
            S.CONTENT_WIDTH * 0.38,
            S.CONTENT_WIDTH * 0.08,
            S.CONTENT_WIDTH * 0.10,
            S.CONTENT_WIDTH * 0.10,
        ]
        tbl_ca_data = [hdr_ca]
        for v in model.violations:
            bg, fg = S.severity_badge_colors(v.severity)
            sev_st = ParagraphStyle('CAS', parent=S.PS_TABLE_BODY_CENTER, textColor=fg, fontName=S.FONT_BOLD, fontSize=6)
            tbl_ca_data.append([
                _p(v.finding_id, S.PS_TABLE_BODY_BOLD),
                _p(v.observed_violation[:80], S.PS_TABLE_BODY),
                _p(v.corrective_action[:140], S.PS_TABLE_BODY),
                _p(v.severity, sev_st),
                _p(v.target_date, S.PS_TABLE_BODY_CENTER),
                _p(v.status, S.PS_TABLE_BODY_BOLD),
            ])
        ca_table = Table(tbl_ca_data, colWidths=col_w_ca)
        ca_table.setStyle(S.generic_table_style())
        story.append(ca_table)
    story.append(_spacer(1))

    # --- 9. FINAL ASSESSMENT & STATUTORY DISPOSITION ---
    story.extend(_section_heading(9, 'Final Statutory Disposition & Attestation'))

    overall = meta.get('assessment_status', 'UNKNOWN')
    bg, fg = S.status_badge_colors(overall)
    disp_st = ParagraphStyle('DispSt', parent=S.PS_BODY, textColor=fg, fontName=S.FONT_BOLD, fontSize=8)
    story.append(_p(f'<b>STATUTORY AUDIT OUTCOME:</b>  {overall}', disp_st))
    story.append(_spacer(0.8))

    story.append(_p(s.overall_text[:280], S.PS_BODY_JUSTIFIED))
    story.append(_spacer(1))

    # Official Seal & Signature Block (Authentic Government Format)
    sig_block = [
        [
            _p('<b>INSPECTED & AUDITED BY:</b><br/>'
               'Nirikshak Automated Verification Engine<br/>'
               'Directorate of Legal Metrology<br/>'
               'System Node ID: LM-AUTO-STAGE-9', S.PS_BODY_SMALL),
            _p('<b>OFFICIAL VERIFICATION SEAL:</b><br/><br/>'
               '[ CERTIFIED STATUTORY AUDIT ]<br/>'
               'Date of Issue: ' + meta.get('assessment_date', '05 Sep 2026'), S.PS_BODY_SMALL),
            _p('<b>AUTHORISED SIGNATORY:</b><br/><br/><br/>'
               '____________________________________<br/>'
               'Inspector / Verification Officer<br/>'
               'Legal Metrology Enforcement Branch', S.PS_BODY_SMALL),
        ]
    ]
    sig_tbl = Table(sig_block, colWidths=[S.CONTENT_WIDTH * 0.35, S.CONTENT_WIDTH * 0.30, S.CONTENT_WIDTH * 0.35])
    sig_tbl.setStyle(TableStyle([
        ('BOX', (0, 0), (-1, -1), 0.5, S.C_SLATE),
        ('INNERGRID', (0, 0), (-1, -1), 0.3, S.C_BORDER),
        ('BACKGROUND', (0, 0), (-1, -1), S.C_LIGHT_GRAY),
        ('TOPPADDING', (0, 0), (-1, -1), 2),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 2),
        ('LEFTPADDING', (0, 0), (-1, -1), 4),
        ('RIGHTPADDING', (0, 0), (-1, -1), 4),
    ]))
    story.append(sig_tbl)

    return story


# ---------------------------------------------------------------------------
# MAIN PDF GENERATOR
# ---------------------------------------------------------------------------

def generate_pdf(model: ComplianceModel, output_path: str) -> str:
    """
    Generate strictly 5-page Government Statutory Compliance Report.
    """
    os.makedirs(os.path.dirname(os.path.abspath(output_path)), exist_ok=True)
    report_id = model.meta.get('report_id', 'N/A')

    cover_frame = Frame(
        S.MARGIN_LEFT, S.MARGIN_BOTTOM,
        S.CONTENT_WIDTH,
        S.PAGE_HEIGHT - S.MARGIN_TOP - S.MARGIN_BOTTOM,
        id='cover_frame',
    )
    main_frame = Frame(
        S.MARGIN_LEFT,
        S.MARGIN_BOTTOM + S.FOOTER_HEIGHT + 1 * mm,
        S.CONTENT_WIDTH,
        S.PAGE_HEIGHT - S.MARGIN_TOP - S.MARGIN_BOTTOM
        - S.HEADER_HEIGHT - S.FOOTER_HEIGHT - 1 * mm,
        id='main_frame',
    )

    cover_template = PageTemplate(id='cover', frames=[cover_frame], onPage=_draw_cover_page)
    main_template = PageTemplate(id='main', frames=[main_frame], onPage=_draw_header_footer)

    doc = BaseDocTemplate(
        output_path,
        pagesize=A4,
        pageTemplates=[cover_template, main_template],
        title=f'Statutory Compliance Assessment Report - {report_id}',
        author='Directorate of Legal Metrology - Nirikshak',
        subject='Legal Metrology (Packaged Commodities) Rules, 2011',
        creator='Nirikshak Regulatory Pipeline',
    )
    doc._report_id = report_id

    story: List = []

    # Page 1: Cover Page
    story.extend(_build_cover_page(model))

    # Page 2: Document Control, Executive Summary, Compliance Register
    story.extend(_build_page_2(model))

    # Page 3: Compliance Details (Detailed Schedule)
    story.extend(_build_page_3(model))

    # Page 4: Violations & Evidence Images
    story.extend(_build_page_4(model))

    # Page 5: Evidence Register, Traceability Matrix, Corrective Actions, Attestation & Seal
    story.extend(_build_page_5(model))

    print('  Building official statutory compliance report (single pass NumberedCanvas)...')
    doc.build(story, canvasmaker=NumberedCanvas)
    print('  Done.')

    return os.path.abspath(output_path)
