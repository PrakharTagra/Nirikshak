"""
pdf_builder.py — Master PDF Construction
=========================================
Builds the complete A4 Government-Style Statutory Compliance Assessment Report.
Official Government of India (GoI) Statutory Inspection & Enforcement Memorandum.
Under The Legal Metrology Act, 2009 & The Legal Metrology (Packaged Commodities) Rules, 2011.

Strict Design Principles:
  1. Under 6 pages total (strictly 5-page legal inspection memorandum).
  2. Authentic government regulatory document appearance with State Emblem of India on top left.
  3. All extracted particulars (Manufacturer, Packer, Importer, MRP, Net Qty, Mfg Date, Consumer Care)
     prominently displayed in a dedicated verified declarations schedule.
  4. Restrained, dignified, ink-efficient Government of India palette (no loud neon colors).
  5. Crisp, highly readable typography (8.5pt body, 8pt tables) with comfortable cell padding.
  6. High-resolution photographic evidence exhibits with clear bounding-box legends.
  7. Formal Section 36 statutory liability warning and official verification attestation block.

Legal Methodology Compliance Automation — Stage-9
"""

import os
import re
from datetime import datetime
from typing import List, Optional, Dict, Any

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


# Path to official State Emblem of India asset
EMBLEM_PATH = os.path.join(os.path.dirname(__file__), 'assets', 'emblem_of_india.png')


# ---------------------------------------------------------------------------
# HELPERS
# ---------------------------------------------------------------------------

def _p(text: str, style: ParagraphStyle) -> Paragraph:
    """Safe Paragraph creation — escapes naked ampersands while preserving standard HTML tags."""
    text = str(text or 'Not Available')
    text = re.sub(r'&(?!(amp|lt|gt|quot|apos);)', '&amp;', text)
    return Paragraph(text, style)


def _spacer(h_mm: float = 2.0) -> Spacer:
    return Spacer(1, h_mm * mm)


def _hr(thickness=0.6, color=None, spaceAfter=2, spaceBefore=2):
    return HRFlowable(
        width='100%',
        thickness=thickness,
        color=color or S.C_RULE_LINE,
        spaceAfter=spaceAfter,
        spaceBefore=spaceBefore,
    )


def _na(val: Any) -> str:
    if val is None:
        return 'Not Available'
    s = str(val).strip()
    return s if s else 'Not Available'


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
        self.setFont(S.FONT_REGULAR, 6.2)
        self.setFillColor(S.C_WHITE)
        self.drawRightString(
            w - S.MARGIN_RIGHT, 2.6 * mm,
            f'Ref: {report_id}   |   Page {page_num} of {total}',
        )


# ---------------------------------------------------------------------------
# HEADER / FOOTER DRAWING FUNCTIONS
# ---------------------------------------------------------------------------

def _draw_cover_page(c: rl_canvas.Canvas, doc):
    w, h = A4
    c.saveState()
    # Institutional top border (Ashoka Navy & Slate)
    c.setFillColor(S.C_GOV_NAVY)
    c.rect(0, h - 5 * mm, w, 5 * mm, fill=1, stroke=0)
    c.setFillColor(S.C_SLATE)
    c.rect(0, h - 6.5 * mm, w, 1.5 * mm, fill=1, stroke=0)
    # Bottom border
    c.setFillColor(S.C_GOV_NAVY)
    c.rect(0, 0, w, 5 * mm, fill=1, stroke=0)
    c.restoreState()


def _draw_header_footer(c: rl_canvas.Canvas, doc):
    w, h = A4
    report_id = getattr(doc, '_report_id', 'N/A')
    c._report_id = report_id

    c.saveState()
    # Header bar
    c.setFillColor(S.C_GOV_NAVY)
    c.rect(0, h - 9.5 * mm, w, 9.5 * mm, fill=1, stroke=0)

    # State Emblem on top-left of running header
    if os.path.isfile(EMBLEM_PATH):
        try:
            c.drawImage(EMBLEM_PATH, S.MARGIN_LEFT, h - 8.5 * mm, width=4.5 * mm, height=7.2 * mm, mask='auto')
        except Exception:
            pass

    c.setFont(S.FONT_BOLD, 7)
    c.setFillColor(S.C_WHITE)
    c.drawString(S.MARGIN_LEFT + 6.5 * mm, h - 6.0 * mm,
                 'GOVERNMENT OF INDIA  |  DIRECTORATE OF LEGAL METROLOGY')
    c.setFont(S.FONT_REGULAR, 6.2)
    c.drawRightString(w - S.MARGIN_RIGHT, h - 6.0 * mm,
                      f'OFFICIAL RECORD: {report_id}')
    c.restoreState()

    c.saveState()
    # Footer bar
    c.setFillColor(S.C_GOV_NAVY)
    c.rect(0, 0, w, 7.5 * mm, fill=1, stroke=0)
    c.setFont(S.FONT_REGULAR, 6.2)
    c.setFillColor(S.C_WHITE)
    c.drawString(S.MARGIN_LEFT, 2.6 * mm,
                 'CONFIDENTIAL  -  STATUTORY ENFORCEMENT AUDIT RECORD  -  DEPARTMENT OF LEGAL METROLOGY')
    c.restoreState()


# ---------------------------------------------------------------------------
# SECTION HEADINGS
# ---------------------------------------------------------------------------

def _section_heading(number: int, title: str) -> List:
    return [
        _spacer(2.5),
        _p(f'<b>SECTION {number}: {title.upper()}</b>', S.PS_SECTION_HEADING),
        _hr(thickness=0.8, color=S.C_GOV_NAVY, spaceAfter=2.5, spaceBefore=1.5),
    ]


# ---------------------------------------------------------------------------
# PAGE 1: FORMAL STATUTORY COVER & RECORD OF INSPECTION
# ---------------------------------------------------------------------------

def _build_cover_page(model: ComplianceModel) -> List:
    meta = model.meta
    story = []

    story.append(NextPageTemplate('main'))
    story.append(_spacer(2))

    # Official National Header with Ashoka Emblem on Top-Left
    if os.path.isfile(EMBLEM_PATH):
        try:
            emblem_img = RLImage(EMBLEM_PATH, width=22 * mm, height=35 * mm)
            header_text = [
                _p('<b>GOVERNMENT OF INDIA</b>', S.PS_GOV_HEADER_LARGE),
                _p('<b>MINISTRY OF CONSUMER AFFAIRS, FOOD &amp; PUBLIC DISTRIBUTION</b>', S.PS_GOV_HEADER),
                _p('DEPARTMENT OF CONSUMER AFFAIRS | LEGAL METROLOGY DIVISION', S.PS_GOV_SUBHEADER),
                _spacer(1.5),
                _p('<b>STATUTORY COMPLIANCE ASSESSMENT REPORT</b>', S.PS_COVER_TITLE),
                _p('AUDIT MEMORANDUM UNDER THE LEGAL METROLOGY (PACKAGED COMMODITIES) RULES, 2011', S.PS_COVER_SUBTITLE),
            ]
            header_tbl = Table([[emblem_img, header_text]], colWidths=[26 * mm, S.CONTENT_WIDTH - 26 * mm])
            header_tbl.setStyle(TableStyle([
                ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                ('ALIGN', (0, 0), (0, 0), 'CENTER'),
                ('ALIGN', (1, 0), (1, 0), 'LEFT'),
                ('LEFTPADDING', (0, 0), (-1, -1), 0),
                ('RIGHTPADDING', (0, 0), (-1, -1), 0),
                ('TOPPADDING', (0, 0), (-1, -1), 0),
                ('BOTTOMPADDING', (0, 0), (-1, -1), 0),
            ]))
            story.append(header_tbl)
        except Exception:
            story.append(_p('<b>GOVERNMENT OF INDIA</b>', S.PS_GOV_HEADER_LARGE))
            story.append(_p('<b>MINISTRY OF CONSUMER AFFAIRS, FOOD &amp; PUBLIC DISTRIBUTION</b>', S.PS_GOV_HEADER))
            story.append(_p('DEPARTMENT OF CONSUMER AFFAIRS | LEGAL METROLOGY DIVISION', S.PS_GOV_SUBHEADER))
            story.append(_spacer(2))
            story.append(_p('<b>STATUTORY COMPLIANCE ASSESSMENT REPORT</b>', S.PS_COVER_TITLE))
            story.append(_p('AUDIT MEMORANDUM UNDER LEGAL METROLOGY (PACKAGED COMMODITIES) RULES, 2011', S.PS_COVER_SUBTITLE))
    else:
        story.append(_p('<b>GOVERNMENT OF INDIA</b>', S.PS_GOV_HEADER_LARGE))
        story.append(_p('<b>MINISTRY OF CONSUMER AFFAIRS, FOOD &amp; PUBLIC DISTRIBUTION</b>', S.PS_GOV_HEADER))
        story.append(_p('DEPARTMENT OF CONSUMER AFFAIRS | LEGAL METROLOGY DIVISION', S.PS_GOV_SUBHEADER))
        story.append(_spacer(2))
        story.append(_p('<b>STATUTORY COMPLIANCE ASSESSMENT REPORT</b>', S.PS_COVER_TITLE))
        story.append(_p('AUDIT MEMORANDUM UNDER LEGAL METROLOGY (PACKAGED COMMODITIES) RULES, 2011', S.PS_COVER_SUBTITLE))

    story.append(_hr(thickness=1.2, color=S.C_GOV_NAVY, spaceAfter=8, spaceBefore=4))

    # Statutory Metadata Grid
    overall_status = meta.get('assessment_status', 'UNKNOWN')
    status_bg, status_fg = S.status_badge_colors(overall_status)

    decl = model.declarations or {}
    classif = decl.get('commodityClassification', {})
    brand_name = classif.get('brandName') or 'Not Declared'

    meta_rows = [
        ['Statutory Report Identifier',    _na(meta.get('report_id', ''))],
        ['Case / Inspection Reference',     _na(meta.get('case_id', ''))],
        ['Packaged Commodity Entity',        _na(meta.get('entity', ''))],
        ['Declared Brand Name',             brand_name],
        ['Declared Manufacturer / Packer',  _na(meta.get('manufacturer', ''))],
        ['Date of Physical/Digital Audit',   _na(meta.get('assessment_date', ''))],
        ['Governing Legal Framework',       _na(meta.get('framework', ''))],
        ['Statutory Audit Determination',    overall_status],
        ['Digital Record Generation Time',   _na(meta.get('generated_on', ''))],
    ]

    col_w = [S.CONTENT_WIDTH * 0.36, S.CONTENT_WIDTH * 0.64]
    tbl_data = []
    for label, val in meta_rows:
        lp = _p(f'<b>{label}</b>', S.PS_COVER_LABEL)
        if label == 'Statutory Audit Determination':
            st = ParagraphStyle('CoverSt', parent=S.PS_COVER_VALUE, textColor=status_fg, fontName=S.FONT_BOLD, fontSize=8.5)
            vp = _p(f'<b>{val}</b>', st)
        else:
            vp = _p(val, S.PS_COVER_VALUE)
        tbl_data.append([lp, vp])

    tbl = Table(tbl_data, colWidths=col_w)
    tbl.setStyle(S.cover_meta_style())
    story.append(tbl)

    story.append(_spacer(8))

    # Official Statutory Notice Box on Page 1
    notice_text = (
        '<b>NOTICE OF STATUTORY INSPECTION &amp; LEGAL WARNING:</b><br/>'
        'This official memorandum documents formal observations from a statutory compliance audit conducted '
        'pursuant to the provisions of <b>The Legal Metrology Act, 2009 (Act 1 of 2010)</b> and '
        '<b>The Legal Metrology (Packaged Commodities) Rules, 2011</b>. Declarations, geometric clearances, '
        'and typographical dimensions recorded herein have been extracted directly from mandatory label panels '
        'of the subject packaged commodity. Contraventions cited in this audit report represent non-compliances '
        'under Rule 6, Rule 7, and Rule 8, enforceable under <b>Section 36 of The Legal Metrology Act, 2009</b>. '
        'This assessment constitutes an official evidentiary record for regulatory review and corrective enforcement.'
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

    story.append(_spacer(8))
    story.append(_p(
        'AUTHORISED REGULATORY RECORD  |  DIRECTORATE OF LEGAL METROLOGY  |  NIRIKSHAK ENFORCEMENT ENGINE',
        S.PS_COVER_FOOTER,
    ))

    story.append(NextPageTemplate('main'))
    story.append(PageBreak())
    return story


# ---------------------------------------------------------------------------
# PAGE 2: EXECUTIVE SUMMARY (1) & VERIFIED STATUTORY DECLARATIONS SCHEDULE (2)
# ---------------------------------------------------------------------------

def _build_declarations_schedule(model: ComplianceModel) -> List:
    decl = model.declarations or {}
    meta = model.meta or {}

    # 1. Manufacturer
    mfr = decl.get('manufacturer', {})
    mfr_name = mfr.get('name') or meta.get('manufacturer', 'Not Available')
    mfr_addr = mfr.get('address') or 'Not Declared / Not Available'

    # 2. Packer
    pkr = decl.get('packer', {})
    pkr_name = pkr.get('name')
    pkr_addr = pkr.get('address')
    if not pkr.get('present') or not pkr_name:
        pkr_text = 'Identical to Manufacturer (Single Entity)'
    else:
        pkr_text = f'{pkr_name}, {pkr_addr}' if pkr_addr else str(pkr_name)

    # 3. Importer
    imp = decl.get('importer', {})
    imp_name = imp.get('name')
    imp_addr = imp.get('address')
    if not imp.get('present') or not imp_name:
        imp_text = 'Domestic Indian Manufacture (Import Provisions N/A)'
    else:
        imp_text = f'{imp_name}, {imp_addr}' if imp_addr else str(imp_name)

    # 4. MRP & USP
    mrp = decl.get('mrp', {})
    mrp_val = mrp.get('value')
    mrp_curr = mrp.get('currency', 'INR')
    mrp_incl = mrp.get('inclusiveOfTaxesStated', True)
    if isinstance(mrp_val, (int, float)):
        mrp_text = f'Rs. {mrp_val:.2f}'
    else:
        mrp_text = str(mrp_val or 'Not Available')
    if mrp_incl:
        mrp_text += ' (Incl. of all taxes)'

    # Unit Sale Price
    usp_dict = mrp.get('unitSalePrice') if isinstance(mrp.get('unitSalePrice'), dict) else {}
    if usp_dict and usp_dict.get('value'):
        usp_text = f"Rs. {usp_dict.get('value')} per {usp_dict.get('unit', 'unit')}"
    elif isinstance(mrp_val, (int, float)):
        usp_text = f'Rs. {mrp_val:.2f} per unit'
    else:
        usp_text = 'Declared / Included in MRP'

    # 5. Net Quantity
    nq = decl.get('netQuantity', {})
    nq_val = nq.get('value')
    nq_unit = nq.get('unit', '')
    nq_count = nq.get('pieceCount', '')
    nq_text = f'{nq_val} {nq_unit}'.strip() if nq_val else 'Not Available'
    if nq_count and str(nq_count) != str(nq_val):
        nq_text += f' (Count: {nq_count})'

    # 6. Mfg Date
    mfg = decl.get('mfgDate', {})
    mfg_text = mfg.get('value') or mfg.get('rawText') or 'Not Available'

    # 7. Consumer Care
    cc = decl.get('consumerCare', {})
    cc_name = cc.get('name') or 'Customer Care Cell'
    cc_phone = cc.get('telephone') or cc.get('phone') or 'Not Available'
    cc_email = cc.get('email') or 'Not Available'
    cc_web = cc.get('website') or 'Not Available'
    cc_addr = cc.get('address') or 'Registered Office / Factory Address'

    # 8. Commodity & Classification
    classif = decl.get('commodityClassification', {})
    comm = decl.get('commodityName', {})
    comm_name = comm.get('value') or classif.get('genericName') or meta.get('entity', 'Not Available')
    brand_name = classif.get('brandName') or 'Not Available'
    phys_form = classif.get('physicalForm') or 'General Packaged Article'

    # 9. Dimensions
    dims = decl.get('dimensions', {})
    dims_text = dims.get('linearDimensions') or dims.get('lengthWidthDepth') or dims.get('rawText') or 'Standard Dimensions'

    # 10. Country of Origin
    country = classif.get('countryOfOrigin') or 'India (Domestic Product)'

    table_rows = [
        [
            'Declared Commodity / Generic Name', f'{comm_name} (Brand: {brand_name})',
            'Physical Form / Category', phys_form.title(),
        ],
        [
            'Declared Manufacturer Name', mfr_name,
            'Declared Packer Details', pkr_text,
        ],
        [
            'Manufacturer Complete Address', mfr_addr,
            'Declared Importer Particulars', imp_text,
        ],
        [
            'Maximum Retail Price (MRP)', mrp_text,
            'Unit Sale Price (USP) [Rule 6(1)(n)]', usp_text,
        ],
        [
            'Declared Net Quantity [Rule 6(1)(e)]', nq_text,
            'Month & Year of Manufacture [R. 6(1)(g)]', mfg_text,
        ],
        [
            'Consumer Care Redressal Cell', cc_name,
            'Consumer Helpline / Phone', cc_phone,
        ],
        [
            'Consumer Care E-mail & Web', f'{cc_email} | {cc_web}' if cc_web != 'Not Available' else cc_email,
            'Consumer Care Address', cc_addr,
        ],
        [
            'Package Dimensions & Weight', dims_text,
            'Declared Country of Origin', country,
        ],
    ]

    col_w = [
        S.CONTENT_WIDTH * 0.22,
        S.CONTENT_WIDTH * 0.28,
        S.CONTENT_WIDTH * 0.22,
        S.CONTENT_WIDTH * 0.28,
    ]

    tbl_data = []
    for r in table_rows:
        tbl_data.append([
            _p(f'<b>{r[0]}</b>', S.PS_DECL_LABEL),
            _p(r[1], S.PS_DECL_VALUE),
            _p(f'<b>{r[2]}</b>', S.PS_DECL_LABEL),
            _p(r[3], S.PS_DECL_VALUE),
        ])

    t = Table(tbl_data, colWidths=col_w)
    t.setStyle(S.declarations_table_style())
    return [t]


def _build_page_2(model: ComplianceModel) -> List:
    s = model.summary
    story = []

    # --- 1. EXECUTIVE SUMMARY & STATUTORY METRICS ---
    story.extend(_section_heading(1, 'Executive Audit Summary & Statutory Metrics'))

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
    p_tot  = ParagraphStyle('KT', parent=S.PS_TABLE_BODY_CENTER, fontName=S.FONT_BOLD, fontSize=8.5, textColor=S.C_GOV_NAVY)

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
        ('GRID', (0, 0), (-1, -1), 0.4, S._GRID),
        ('TOPPADDING', (0, 0), (-1, -1), 3),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 3),
    ]))
    story.append(kpi_table)
    story.append(_spacer(2.5))

    story.append(_p(s.overall_text, S.PS_BODY_JUSTIFIED))
    story.append(_spacer(3))

    # --- 2. EXTRACTED STATUTORY DECLARATIONS SCHEDULE ---
    story.extend(_section_heading(2, 'Verified Statutory Declarations (Extracted Particulars Schedule)'))
    story.append(_p(
        'The following statutory particulars were extracted from the physical package label and verified '
        'against the mandatory requirements of Rule 6 of the Legal Metrology (Packaged Commodities) Rules, 2011:',
        S.PS_BODY,
    ))
    story.append(_spacer(2))
    story.extend(_build_declarations_schedule(model))

    story.append(PageBreak())
    return story


# ---------------------------------------------------------------------------
# PAGE 3: SECTION 3 — STATUTORY COMPLIANCE REGISTER (Rule-by-Rule Audit)
# ---------------------------------------------------------------------------

def _build_page_3(model: ComplianceModel) -> List:
    story = []
    story.extend(_section_heading(3, 'Statutory Compliance Register (Rule-by-Rule Audit Schedule)'))
    story.append(_p(
        'Schedule of statutory requirements under the Legal Metrology (Packaged Commodities) Rules, 2011, '
        'recording extracted declarations, optical/geometric observations, and formal compliance determinations:',
        S.PS_BODY,
    ))
    story.append(_spacer(2.5))

    reg_hdr = [
        _p('Sr.',          S.PS_TABLE_HEADER),
        _p('Clause Ref',   S.PS_TABLE_HEADER),
        _p('Statutory Requirement', S.PS_TABLE_HEADER),
        _p('Extracted Declaration / Audit Observation', S.PS_TABLE_HEADER),
        _p('Status',       S.PS_TABLE_HEADER),
        _p('Statutory Liability', S.PS_TABLE_HEADER),
    ]
    col_w_reg = [
        S.CONTENT_WIDTH * 0.05,
        S.CONTENT_WIDTH * 0.16,
        S.CONTENT_WIDTH * 0.26,
        S.CONTENT_WIDTH * 0.35,
        S.CONTENT_WIDTH * 0.18,
    ]
    # Re-adjusted to 5 columns for maximum horizontal readability:
    # Sr. (5%), Clause Ref (16%), Requirement (25%), Extracted Observation (38%), Status (16%)
    col_w_5 = [
        S.CONTENT_WIDTH * 0.05,
        S.CONTENT_WIDTH * 0.16,
        S.CONTENT_WIDTH * 0.25,
        S.CONTENT_WIDTH * 0.38,
        S.CONTENT_WIDTH * 0.16,
    ]
    tbl_reg_data = [
        [
            _p('Sr.',          S.PS_TABLE_HEADER),
            _p('Clause Ref',   S.PS_TABLE_HEADER),
            _p('Statutory Requirement', S.PS_TABLE_HEADER),
            _p('Extracted Observation / Technical Measurement', S.PS_TABLE_HEADER),
            _p('Determination', S.PS_TABLE_HEADER),
        ]
    ]
    reg_extra_cmds = []

    for c in model.compliances:
        bg, fg = S.status_badge_colors(c.status)
        st = ParagraphStyle(f'St_{c.sr_no}', parent=S.PS_TABLE_BODY_CENTER, textColor=fg, fontName=S.FONT_BOLD, fontSize=7.5)
        row = [
            _p(str(c.sr_no),        S.PS_TABLE_BODY_CENTER),
            _p(f'<b>{c.section_clause}</b><br/>{c.compliance_id}', S.PS_TABLE_BODY),
            _p(f'<b>{c.legal_requirement}</b>', S.PS_TABLE_BODY),
            _p(_na(c.assessment)[:160], S.PS_TABLE_BODY),
            _p(c.status,            st),
        ]
        r_idx = len(tbl_reg_data)
        tbl_reg_data.append(row)
        reg_extra_cmds.append(('BACKGROUND', (4, r_idx), (4, r_idx), bg))

    reg_table = Table(tbl_reg_data, colWidths=col_w_5, repeatRows=1)
    base_style = S.compliance_register_style()
    reg_table.setStyle(TableStyle(list(base_style._cmds) + reg_extra_cmds))
    story.append(reg_table)

    story.append(PageBreak())
    return story


# ---------------------------------------------------------------------------
# PAGE 4: SECTION 4 — VIOLATIONS & PHOTOGRAPHIC EVIDENCE EXHIBITS
# ---------------------------------------------------------------------------

def _build_page_4(model: ComplianceModel) -> List:
    story = []
    story.extend(_section_heading(4, 'Statutory Infractions & Photographic Verification Exhibits'))

    # Non-compliance findings & Photographic Exhibits for EVERY violation
    if model.violations:
        num_v = len(model.violations)
        img_max_h = 42 if num_v > 1 else 62
        img_max_w = 125 if num_v > 1 else 135

        for idx, v in enumerate(model.violations):
            bg, fg = S.severity_badge_colors(v.severity)
            sev_st = ParagraphStyle(f'Sev_{idx}', parent=S.PS_TABLE_BODY_CENTER, textColor=fg, fontName=S.FONT_BOLD, fontSize=7.5)

            finding_block = []
            finding_title = f'<b>INFRACTION {idx + 1}: {v.finding_id}</b> - Contravention of {v.section_clause}'
            finding_block.append(_p(finding_title, S.PS_FINDING_HEADING))

            rows = [
                ['Finding ID:',          v.finding_id,             'Severity Degree:',  _p(v.severity.upper(), sev_st)],
                ['Linked Compliance:',   v.compliance_id,          'Governing Rule:',   v.section_clause],
                ['Observed Infraction:', v.observed_violation[:180], 'Statutory Status:', v.status],
                ['Statutory Impact:',    v.legal_impact[:180],     'Target of Liability:', v.responsible_party],
                ['Corrective Directive:', v.corrective_action[:180], 'Mandatory Deadline:', v.target_date],
            ]
            col_w = [
                S.CONTENT_WIDTH * 0.17,
                S.CONTENT_WIDTH * 0.43,
                S.CONTENT_WIDTH * 0.17,
                S.CONTENT_WIDTH * 0.23,
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

            # Locate this violation's bounding-box evidence image
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
                img_fl = IH.image_to_rl_flowable(ev_img_path, max_width_mm=img_max_w, max_height_mm=img_max_h)
                if img_fl:
                    finding_block.append(_spacer(1))
                    is_clearance = 'net_quantity_bounding_box' in ev_img_path or 'Rule 8(1)' in v.section_clause
                    ex_title = f'<b>EXHIBIT {idx + 1}: PHOTOGRAPHIC EVIDENCE &amp; BOUNDING BOX ANALYSIS - {v.finding_id}</b>'
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
        story.append(_p('<b>DETERMINATION: COMPLIANT</b> - No statutory infractions or label contraventions identified.', S.PS_BODY))
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
# PAGE 5: SECTIONS 5, 6, 7 & OFFICIAL VERIFICATION ATTESTATION BLOCK
# ---------------------------------------------------------------------------

def _build_page_5(model: ComplianceModel) -> List:
    s = model.summary
    meta = model.meta
    story = []

    # --- 5. EVIDENCE REGISTER ---
    story.extend(_section_heading(5, 'Evidence Register (Chain of Custody)'))
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
    story.append(_spacer(2))

    # --- 6. STATUTORY LIABILITIES & PENALTIES UNDER SECTION 36 ---
    story.extend(_section_heading(6, 'Statutory Liabilities &amp; Penalties (The Legal Metrology Act, 2009)'))
    sec36_text = (
        '<b>PENAL PROVISIONS FOR NON-COMPLIANT PACKAGES UNDER SECTION 36(1):</b><br/>'
        'Whoever manufactures, packs, imports, sells, distributes, delivers, offers, exposes or has in '
        'possession for sale any pre-packaged commodity which does not conform to declarations specified '
        'under the Act or Rules shall be punishable with fine which may extend to <b>twenty-five thousand rupees</b>; '
        'for the second offence, to <b>fifty thousand rupees</b>; and for the subsequent offence, with fine which shall not '
        'be less than <b>fifty thousand rupees but which may extend to one lakh rupees</b> or with '
        '<b>imprisonment for a term which may extend to one year</b> or with both.<br/>'
        '<b>OFFENCES BY COMPANIES UNDER SECTION 49:</b> Every person who at the time the offence was committed was in '
        'charge of and responsible to the company for the conduct of business shall be deemed guilty of the offence.'
    )
    sec36_tbl = Table([[_p(sec36_text, S.PS_BODY)]], colWidths=[S.CONTENT_WIDTH])
    sec36_tbl.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, -1), S.C_LIGHT_GRAY),
        ('GRID', (0, 0), (-1, -1), 0.5, S.C_BORDER),
        ('TOPPADDING', (0, 0), (-1, -1), 4),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 4),
        ('LEFTPADDING', (0, 0), (-1, -1), 6),
        ('RIGHTPADDING', (0, 0), (-1, -1), 6),
    ]))
    story.append(sec36_tbl)
    story.append(_spacer(2))

    # --- 7. FINAL STATUTORY DISPOSITION & ATTESTATION ---
    story.extend(_section_heading(7, 'Final Statutory Disposition &amp; Official Verification Attestation'))

    overall = meta.get('assessment_status', 'UNKNOWN')
    bg, fg = S.status_badge_colors(overall)
    disp_st = ParagraphStyle('DispSt', parent=S.PS_BODY, textColor=fg, fontName=S.FONT_BOLD, fontSize=8.5)
    story.append(_p(f'<b>FINAL STATUTORY AUDIT OUTCOME:</b>  {overall}', disp_st))
    story.append(_spacer(1))

    story.append(_p(s.overall_text[:280], S.PS_BODY_JUSTIFIED))
    story.append(_spacer(2))

    # Official Seal & Signature Block (Authentic Government Format)
    sig_block = [
        [
            _p('<b>INSPECTED &amp; AUDITED BY:</b><br/>'
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
        ('TOPPADDING', (0, 0), (-1, -1), 3),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 3),
        ('LEFTPADDING', (0, 0), (-1, -1), 5),
        ('RIGHTPADDING', (0, 0), (-1, -1), 5),
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

    # Page 1: Cover Page with Emblem on top left
    story.extend(_build_cover_page(model))

    # Page 2: Executive Summary & Extracted Statutory Declarations Schedule
    story.extend(_build_page_2(model))

    # Page 3: Compliance Register (Rule-by-Rule Audit Schedule)
    story.extend(_build_page_3(model))

    # Page 4: Violations & Evidence Images with Bounding Boxes
    story.extend(_build_page_4(model))

    # Page 5: Evidence Register, Section 36 Liabilities, Attestation & Seal
    story.extend(_build_page_5(model))

    print('  Building official statutory compliance report (single pass NumberedCanvas)...')
    doc.build(story, canvasmaker=NumberedCanvas)
    print('  Done.')

    return os.path.abspath(output_path)
