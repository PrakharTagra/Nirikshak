"""
compliance_mapper.py — Maps Raw JSON → Normalized Compliance Model
==================================================================
Translates the mapped.json structure produced by earlier pipeline stages
into a well-defined compliance model that the PDF builder consumes.

The Legal Metrology (Packaged Commodities) Rules, 2011 define specific
requirements per declaration field. This module maps each declaration to
its corresponding Rule, checks violation linkage, and computes status.

Legal Methodology Compliance Automation — Stage-9
"""

import os
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional
from datetime import datetime


# ---------------------------------------------------------------------------
# LEGAL RULE MAPPING
# Maps each declaration field → (compliance_id_suffix, legal_requirement,
#                                 applicable_law, section_clause, description)
# ---------------------------------------------------------------------------

FIELD_RULE_MAP: Dict[str, Dict[str, str]] = {
    'commodityName': {
        'suffix':       'COMM-NAME',
        'requirement':  'Declaration of Commodity Name / Generic Name',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(a) & Rule 6(1)(b)',
        'description':  (
            'Every package of commodity shall bear the generic name or common name '
            'of the commodity. For multi-product packages, the name and quantity of '
            'each product must be declared separately.'
        ),
    },
    'manufacturer': {
        'suffix':       'MFR',
        'requirement':  'Declaration of Manufacturer / Packer / Importer Name and Address',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(c)',
        'description':  (
            'Name and complete address of the manufacturer, packer, or importer '
            'shall be mentioned on every pre-packaged commodity.'
        ),
    },
    'netQuantity': {
        'suffix':       'NET-QTY',
        'requirement':  'Declaration of Net Quantity',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(e) & Rule 8',
        'description':  (
            'Net quantity must be declared in standard units. The numeral height '
            'must meet minimum size requirements. The area surrounding the quantity '
            'declaration must be free of other printed information (Rule 8(1) proviso).'
        ),
    },
    'mrp': {
        'suffix':       'MRP',
        'requirement':  'Declaration of Maximum Retail Price (MRP)',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(f)',
        'description':  (
            'Maximum retail price inclusive of all taxes shall be declared on every '
            'pre-packaged commodity sold in India. The MRP shall be preceded by '
            '"M.R.P. Rs." and followed by "(Inclusive of all taxes)".'
        ),
    },
    'mfgDate': {
        'suffix':       'MFG-DATE',
        'requirement':  'Declaration of Month and Year of Manufacture',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(g)',
        'description':  (
            'Month and year in which the commodity is manufactured or pre-packaged '
            'shall be declared. For food articles, date of expiry or best-before '
            'date must also be declared.'
        ),
    },
    'consumerCare': {
        'suffix':       'CONSUMER-CARE',
        'requirement':  'Consumer Care / Grievance Contact Information',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(h) & Consumer Protection Act, 2019',
        'description':  (
            'Consumer care address, telephone number, and/or email address shall '
            'be displayed on the package for consumer grievance redressal.'
        ),
    },
    'packer': {
        'suffix':       'PACKER',
        'requirement':  'Declaration of Packer Details (when Packer is not Manufacturer)',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(c)',
        'description':  (
            'When the packer is different from the manufacturer, the packer\'s '
            'name and complete address shall be separately declared on the label.'
        ),
    },
    'importer': {
        'suffix':       'IMPORTER',
        'requirement':  'Declaration of Importer Details (for Imported Goods)',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(c) & Rule 6A',
        'description':  (
            'For imported pre-packaged commodities, the importer\'s name and '
            'complete address in India shall be declared on the package.'
        ),
    },
    'standardPackDeclaration': {
        'suffix':       'STD-PACK',
        'requirement':  'Standard Pack Size Declaration',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Schedule II / Rule 5',
        'description':  (
            'Commodities listed in Schedule II must be packaged only in the '
            'standard pack sizes specified therein.'
        ),
    },
    'dimensions': {
        'suffix':       'DIMS',
        'requirement':  'Dimensional Declaration (where applicable)',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(d)',
        'description':  (
            'For commodities sold by length, area, or volume dimensions, '
            'the relevant dimensions shall be declared on the label.'
        ),
    },
    'sheetCount': {
        'suffix':       'SHEET',
        'requirement':  'Sheet / Count Declaration (for sheet-type commodities)',
        'law':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'clause':       'Rule 6(1)(d)',
        'description':  (
            'For sheet-type commodities, the number of sheets and individual '
            'sheet dimensions shall be declared.'
        ),
    },
}

# Applicability rules — these fields are only required if specific conditions hold
CONDITIONAL_APPLICABILITY = {
    'packer':               lambda d: not d.get('declarations', {}).get('packer', {}).get('present', False),
    'importer':             lambda d: d.get('declarations', {}).get('importer', {}).get('present', False),
    'standardPackDeclaration': lambda d: False,  # treat as always applicable (general check)
    'dimensions':           lambda d: d.get('declarations', {}).get('dimensions', {}).get('present', False),
    'sheetCount':           lambda d: d.get('declarations', {}).get('sheetCount', {}).get('present', False),
}


# ---------------------------------------------------------------------------
# DATA CLASSES
# ---------------------------------------------------------------------------

@dataclass
class ComplianceRecord:
    sr_no:              int
    compliance_id:      str
    legal_requirement:  str
    applicable_law:     str
    section_clause:     str
    description:        str
    status:             str     # COMPLIANT / NON-COMPLIANT / NOT APPLICABLE / REQUIRES REVIEW
    assessment:         str     # Observation text
    remarks:            str
    finding_ids:        List[str] = field(default_factory=list)


@dataclass
class EvidenceRecord:
    evidence_id:    str
    finding_id:     str
    compliance_id:  str
    evidence_type:  str         # Image / Text / Measurement
    description:    str
    image_path:     Optional[str]
    annotated_path: Optional[str]
    annotation_data: Optional[Dict]   # bbox, intrusion info, etc.
    reference:      str


@dataclass
class ViolationRecord:
    finding_id:             str
    compliance_id:          str
    legal_requirement:      str
    applicable_law:         str
    section_clause:         str
    observed_violation:     str
    violation_description:  str
    severity:               str
    legal_impact:           str
    corrective_action:      str
    responsible_party:      str
    target_date:            str
    status:                 str
    evidences:              List[EvidenceRecord] = field(default_factory=list)


@dataclass
class SummaryStats:
    total_requirements:   int = 0
    compliant:            int = 0
    partial:              int = 0
    non_compliant:        int = 0
    not_applicable:       int = 0
    requires_review:      int = 0
    total_violations:     int = 0
    critical_violations:  int = 0
    high_violations:      int = 0
    medium_violations:    int = 0
    low_violations:       int = 0
    compliance_score:     float = 0.0
    overall_text:         str = ''


@dataclass
class ComplianceModel:
    meta:        Dict[str, str]
    summary:     SummaryStats
    compliances: List[ComplianceRecord]
    violations:  List[ViolationRecord]
    evidences:   List[EvidenceRecord]
    image_paths: Dict[str, Optional[str]]
    declarations: Dict[str, Any] = field(default_factory=dict)
    raw_json:    Dict[str, Any] = field(default_factory=dict)


# ---------------------------------------------------------------------------
# MAPPER
# ---------------------------------------------------------------------------

def _safe(d: Any, *keys, default='') -> Any:
    """Safe nested access with string default."""
    try:
        for k in keys:
            d = d[k]
        if d is None:
            return default
        return d
    except (KeyError, TypeError, IndexError):
        return default


def _severity_normalise(s: str) -> str:
    s = (s or '').lower().strip()
    if s == 'critical':    return 'CRITICAL'
    if s in ('major', 'high'):   return 'HIGH'
    if s in ('minor', 'medium'): return 'MEDIUM'
    if s == 'low':         return 'LOW'
    return s.upper() or 'UNKNOWN'


def _field_to_comp_id(product_id: str, suffix: str) -> str:
    return f'COMP-{product_id}-{suffix}'


def _legal_impact_for_violation(rule: str, severity: str) -> str:
    sev = severity.lower()
    if sev == 'critical':
        return (
            f'Violation of {rule} is a punishable offence under Section 36 of the '
            'Legal Metrology Act, 2009. The manufacturer / packer / importer may be '
            'liable for penalty up to ₹25,000 on first conviction and up to ₹1,00,000 '
            'for subsequent convictions. Products may be seized and proceedings '
            'initiated under Rule 32 of the LMPC Rules, 2011.'
        )
    elif sev in ('high', 'major'):
        return (
            f'Violation of {rule} may invite compounding of offence under Rule 32 '
            'of the LMPC Rules, 2011 and/or penalty under the Legal Metrology Act, 2009. '
            'Immediate corrective action is required before further distribution.'
        )
    else:
        return (
            f'Violation of {rule} constitutes a non-compliance with the LMPC Rules, 2011. '
            'Corrective relabelling or repackaging may be required. '
            'Inspector may issue a notice to show cause under Rule 32.'
        )


def _corrective_action_for_field(field_name: str, violation_msg: str) -> str:
    actions = {
        'commodityName': (
            'Immediately revise the label to include the name and individual quantity '
            'of each product in the multi-product package. Ensure each product is '
            'identified per Rule 6(1)(b). Obtain fresh label approval before restocking.'
        ),
        'netQuantity': (
            'Redesign the label to ensure the net quantity declaration zone is '
            'surrounded by the minimum clear space: ≥1× numeral height above/below, '
            '≥2× numeral height left/right (Rule 8(1) proviso). '
            'Remove or reposition any overlapping printed information.'
        ),
        'mrp': (
            'Ensure the MRP declaration includes the words "Inclusive of all taxes" '
            'and is in the correct format per Rule 6(1)(f). '
            'Verify numeral height compliance.'
        ),
        'manufacturer': (
            'Ensure complete name and address of manufacturer/packer/importer is '
            'printed on the label per Rule 6(1)(c). '
            'Address must include pin code and state.'
        ),
        'mfgDate': (
            'Declare month and year of manufacture clearly on the label per '
            'Rule 6(1)(g). Verify the date is accurate and legible.'
        ),
        'consumerCare': (
            'Provide consumer care contact details (address/phone/email) on the '
            'label per Rule 6(1)(h). Ensure details are current and accessible.'
        ),
    }
    return actions.get(field_name, (
        'Review the relevant clause of the Legal Metrology (Packaged Commodities) '
        'Rules, 2011 and revise the label accordingly. '
        'Consult the Legal Metrology Inspector before re-distribution.'
    ))


def build_model(
    json_data: Dict,
    meta: Dict[str, str],
    image_paths: Dict[str, Optional[str]],
) -> ComplianceModel:
    """
    Build the full ComplianceModel from raw JSON data.

    Parameters
    ----------
    json_data   : Parsed mapped.json dict
    meta        : Output of json_validator.extract_metadata()
    image_paths : Output of json_validator.extract_image_paths()
    """
    product_id  = meta.get('product_id', '1')
    decl        = json_data.get('declarations', {})
    pkg         = json_data.get('packageRecord', {})
    pkg_decl    = pkg.get('declarations', {})
    label_m     = pkg.get('labelMetrics', {})
    cr          = json_data.get('complianceResult', {})
    raw_violations = cr.get('violations', [])
    source_imgs = json_data.get('sourceImages', [])
    annotated_img = json_data.get('annotatedNetQuantityImage', '')

    # -----------------------------------------------------------------------
    # Map violations to fields
    # -----------------------------------------------------------------------
    violated_fields: Dict[str, List[Dict]] = {}
    for v in raw_violations:
        fld = v.get('field', '')
        if fld:
            violated_fields.setdefault(fld, []).append(v)

    # -----------------------------------------------------------------------
    # Build ComplianceRecord for every known declaration field
    # -----------------------------------------------------------------------
    compliances: List[ComplianceRecord] = []
    sr = 1

    for field_key, rule_info in FIELD_RULE_MAP.items():
        comp_id = _field_to_comp_id(product_id, rule_info['suffix'])
        field_decl = decl.get(field_key, {})

        # Determine applicability
        is_imported = _safe(json_data, 'declarations', 'commodityClassification',
                            'isImported', default=False)

        # Skip importer check for non-imported products
        if field_key == 'importer' and not is_imported:
            status = 'NOT APPLICABLE'
            assessment = 'Product is not imported; importer declaration not required.'
            remarks = 'Exempted — domestic product.'
            finding_ids = []
            compliances.append(ComplianceRecord(
                sr_no=sr, compliance_id=comp_id,
                legal_requirement=rule_info['requirement'],
                applicable_law=rule_info['law'],
                section_clause=rule_info['clause'],
                description=rule_info['description'],
                status=status, assessment=assessment,
                remarks=remarks, finding_ids=finding_ids,
            ))
            sr += 1
            continue

        # Check for violations
        field_violations = violated_fields.get(field_key, [])
        finding_ids = [
            f'FIND-{product_id}-{i+1:03d}'
            for i, v in enumerate(raw_violations)
            if v.get('field') == field_key
        ]

        if field_violations:
            status = 'NON-COMPLIANT'
            obs_lines = []
            for fv in field_violations:
                obs_lines.append(fv.get('message', 'Violation observed.'))
            assessment = ' | '.join(obs_lines)
            remarks = f'Violation detected under {rule_info["clause"]}. ' \
                      f'See Finding(s): {", ".join(finding_ids)}.'
        elif isinstance(field_decl, dict) and field_decl.get('present') is False:
            # Field not present on label
            if field_key in ('packer', 'standardPackDeclaration',
                             'dimensions', 'sheetCount'):
                status = 'NOT APPLICABLE'
                assessment = f'{field_key} declaration not applicable / not present for this product.'
                remarks = 'Not required for this product category.'
            else:
                status = 'NOT APPLICABLE'
                assessment = f'{field_key} not detected on label.'
                remarks = 'Field not found — manual verification recommended.'
        elif isinstance(field_decl, dict) and field_decl.get('present') is True:
            status = 'COMPLIANT'
            val = field_decl.get('value') or field_decl.get('name') or \
                  field_decl.get('telephone') or ''
            assessment = f'Declaration present. Extracted value: {val}'.strip('. ')
            # Extra checks for specific fields
            if field_key == 'netQuantity':
                clearance_ok = not label_m.get('clearanceOverlappingTexts', [])
                numeral_h = _safe(label_m, 'numeralHeightMm', default=None)
                if not clearance_ok or field_key in violated_fields:
                    status = 'NON-COMPLIANT'
                elif numeral_h is not None:
                    assessment += f' Numeral height: {numeral_h} mm.'
            elif field_key == 'mrp':
                incl_tax = field_decl.get('inclusiveOfTaxesStated', False)
                if not incl_tax:
                    status = 'REQUIRES REVIEW'
                    assessment += ' "Inclusive of all taxes" statement not confirmed.'
            remarks = ''
        else:
            # Fallback for dict-without-present or non-dict values
            if field_violations:
                status = 'NON-COMPLIANT'
                assessment = '; '.join(v.get('message', '') for v in field_violations)
                remarks = f'See Finding(s): {", ".join(finding_ids)}.'
            else:
                status = 'COMPLIANT'
                assessment = f'{field_key} — no violation detected.'
                remarks = ''

        compliances.append(ComplianceRecord(
            sr_no=sr, compliance_id=comp_id,
            legal_requirement=rule_info['requirement'],
            applicable_law=rule_info['law'],
            section_clause=rule_info['clause'],
            description=rule_info['description'],
            status=status, assessment=assessment,
            remarks=remarks, finding_ids=finding_ids,
        ))
        sr += 1

    # -----------------------------------------------------------------------
    # Label Metrics — additional compliance checks
    # -----------------------------------------------------------------------
    # Contrast compliance
    contrast_ok = _safe(label_m, 'contrastOk', default=True)
    contrast_ratio = _safe(label_m, 'contrastRatio', default=None)
    comp_id = _field_to_comp_id(product_id, 'CONTRAST')
    if contrast_ratio is not None:
        c_status = 'COMPLIANT' if contrast_ok else 'NON-COMPLIANT'
        c_assess = (
            f'Label contrast ratio measured at {contrast_ratio:.2f} '
            f'(minimum required: 2.5). '
            f'{"Meets" if contrast_ok else "Does not meet"} legibility requirements.'
        )
    else:
        c_status = 'REQUIRES REVIEW'
        c_assess = 'Contrast measurement not available.'
    compliances.append(ComplianceRecord(
        sr_no=sr, compliance_id=comp_id,
        legal_requirement='Label Legibility — Contrast Ratio',
        applicable_law='Legal Metrology (Packaged Commodities) Rules, 2011',
        section_clause='Rule 11',
        description=(
            'All declarations on the label must be legible and in a colour '
            'contrasting with the background. Contrast ratio must meet '
            'minimum readability standards.'
        ),
        status=c_status, assessment=c_assess, remarks='',
    ))
    sr += 1

    # Language compliance
    lang_used = _safe(label_m, 'languageUsed', default=[])
    comp_id = _field_to_comp_id(product_id, 'LANGUAGE')
    if lang_used:
        l_status = 'COMPLIANT'
        l_assess = f'Language(s) detected on label: {", ".join(lang_used)}. ' \
                   f'Declarations appear in a language or languages used in India.'
    else:
        l_status = 'REQUIRES REVIEW'
        l_assess = 'Language information not extracted. Manual verification required.'
    compliances.append(ComplianceRecord(
        sr_no=sr, compliance_id=comp_id,
        legal_requirement='Language of Declarations',
        applicable_law='Legal Metrology (Packaged Commodities) Rules, 2011',
        section_clause='Rule 11(1)',
        description=(
            'All declarations on the label of a pre-packaged commodity '
            'shall be in Hindi in Devanagari script or in English, '
            'or in both.'
        ),
        status=l_status, assessment=l_assess, remarks='',
    ))
    sr += 1

    # -----------------------------------------------------------------------
    # Build ViolationRecord list
    # -----------------------------------------------------------------------
    violations: List[ViolationRecord] = []
    evidences:  List[EvidenceRecord]  = []
    ev_counter  = 1

    for v_idx, raw_v in enumerate(raw_violations):
        finding_num = v_idx + 1
        finding_id  = f'FIND-{product_id}-{finding_num:03d}'
        field_name  = raw_v.get('field', '')
        rule_info   = FIELD_RULE_MAP.get(field_name, {})

        # Compliance ID for this violation
        suffix  = rule_info.get('suffix', field_name.upper().replace('_', '-'))
        comp_id = _field_to_comp_id(product_id, suffix)

        severity_raw = raw_v.get('severity', 'unknown')
        severity_norm = _severity_normalise(severity_raw)
        rule_ref     = raw_v.get('rule', rule_info.get('clause', 'N/A'))

        # Build evidences for this finding
        finding_evidences: List[EvidenceRecord] = []

        # 1. Check for finding-specific annotated bounding box image
        specific_ev_name = raw_v.get('evidenceImage') or f'violation_evidence_{finding_num}.png'
        ann_path = image_paths.get(specific_ev_name)
        if not ann_path and field_name == 'netQuantity' and annotated_img:
            ann_path = image_paths.get(annotated_img)

        # Primary evidence: Annotated bounding-box photographic exhibit
        if ann_path and os.path.isfile(ann_path):
            ev_id = f'EVID-{product_id}-{ev_counter:03d}'
            ev_counter += 1
            ann_data = {
                'netQuantityBox': _safe(label_m, 'netQuantityBox', default=None),
                'exclusionBox':   _safe(label_m, 'exclusionBox',   default=None),
                'intrusions':     _safe(label_m, 'clearanceDetails', 'intrusions', default=[]),
            } if field_name == 'netQuantity' else None

            ev = EvidenceRecord(
                evidence_id=ev_id,
                finding_id=finding_id,
                compliance_id=comp_id,
                evidence_type='Annotated Image',
                description=(
                    f'High-resolution photographic evidence with statutory bounding-box verification '
                    f'for {rule_ref}: {raw_v.get("message", "Non-compliance observed.")}'
                ),
                image_path=ann_path,
                annotated_path=ann_path,
                annotation_data=ann_data,
                reference=os.path.basename(ann_path),
            )
            finding_evidences.append(ev)
            evidences.append(ev)

        # Supporting evidence: raw source / preprocessed panel image
        panel_img = None
        panel_idx = raw_v.get('panelIndex', 0)
        preproc_name = f'preprocessed_{panel_idx + 1}.png' if panel_idx > 0 else 'preprocessed_1.png'
        panel_img = image_paths.get(preproc_name) or image_paths.get('preprocessed.png')
        if not panel_img and source_imgs:
            panel_img = image_paths.get(source_imgs[min(panel_idx, len(source_imgs) - 1)])

        # If no annotated image was found, use the panel image as primary evidence
        if not finding_evidences and panel_img:
            ev_id = f'EVID-{product_id}-{ev_counter:03d}'
            ev_counter += 1
            ev = EvidenceRecord(
                evidence_id=ev_id,
                finding_id=finding_id,
                compliance_id=comp_id,
                evidence_type='Image',
                description=(
                    f'Product label panel image inspected during audit for {field_name} declaration.'
                ),
                image_path=panel_img,
                annotated_path=None,
                annotation_data=None,
                reference=os.path.basename(panel_img),
            )
            finding_evidences.append(ev)
            evidences.append(ev)

        # Add measurement evidence for netQuantity
        if field_name == 'netQuantity' and label_m:
            ev_id = f'EVID-{product_id}-{ev_counter:03d}'
            ev_counter += 1
            numeral_h = _safe(label_m, 'clearanceDetails', 'numeralHeightMm', default='N/A')
            req_above  = _safe(label_m, 'clearanceDetails', 'requiredAboveBelowMm', default='N/A')
            req_lr     = _safe(label_m, 'clearanceDetails', 'requiredLeftRightMm', default='N/A')
            actual_d   = _safe(label_m, 'clearanceDetails', 'intrusions', default=[])
            intrusion_summary = ''
            if actual_d:
                i0 = actual_d[0]
                intrusion_summary = (
                    f'Actual distance: {i0.get("actualDistanceMm", "N/A")} mm; '
                    f'Required: {i0.get("requiredDistanceMm", "N/A")} mm; '
                    f'Deficit: {i0.get("deficitMm", "N/A")} mm.'
                )
            ev = EvidenceRecord(
                evidence_id=ev_id,
                finding_id=finding_id,
                compliance_id=comp_id,
                evidence_type='Measurement Data',
                description=(
                    f'Automated measurement data extracted from label image analysis. '
                    f'Numeral height: {numeral_h} mm. '
                    f'Required clear space above/below: {req_above} mm; '
                    f'left/right: {req_lr} mm. '
                    f'{intrusion_summary}'
                ),
                image_path=None,
                annotated_path=None,
                annotation_data=None,
                reference='labelMetrics.clearanceDetails',
            )
            finding_evidences.append(ev)
            evidences.append(ev)

        violations.append(ViolationRecord(
            finding_id=finding_id,
            compliance_id=comp_id,
            legal_requirement=rule_info.get('requirement', 'Not Available'),
            applicable_law=rule_info.get('law', 'Legal Metrology (Packaged Commodities) Rules, 2011'),
            section_clause=rule_ref,
            observed_violation=raw_v.get('message', 'Violation observed.'),
            violation_description=raw_v.get('message', 'Not Available'),
            severity=severity_norm,
            legal_impact=_legal_impact_for_violation(rule_ref, severity_raw),
            corrective_action=_corrective_action_for_field(
                field_name, raw_v.get('message', '')
            ),
            responsible_party='Manufacturer / Packer / Importer',
            target_date='Not Specified',
            status='OPEN',
            evidences=finding_evidences,
        ))

    # -----------------------------------------------------------------------
    # Summary Statistics
    # -----------------------------------------------------------------------
    total        = len(compliances)
    n_compliant  = sum(1 for c in compliances if c.status == 'COMPLIANT')
    n_partial    = sum(1 for c in compliances if 'PARTIAL' in c.status)
    n_non        = sum(1 for c in compliances if c.status == 'NON-COMPLIANT')
    n_na         = sum(1 for c in compliances if c.status == 'NOT APPLICABLE')
    n_review     = sum(1 for c in compliances if c.status == 'REQUIRES REVIEW')
    n_violations = len(violations)
    n_critical   = sum(1 for v in violations if v.severity == 'CRITICAL')
    n_high       = sum(1 for v in violations if v.severity == 'HIGH')
    n_medium     = sum(1 for v in violations if v.severity == 'MEDIUM')
    n_low        = sum(1 for v in violations if v.severity == 'LOW')

    # Score: (compliant + partial*0.5) / (total - not_applicable) * 100
    denominator = total - n_na
    if denominator > 0:
        score = round((n_compliant + n_partial * 0.5) / denominator * 100, 1)
    else:
        score = 100.0

    overall_compliant = cr.get('compliant', None)
    if overall_compliant is True:
        overall_text = (
            'The assessed pre-packaged commodity is COMPLIANT with the applicable '
            'provisions of the Legal Metrology (Packaged Commodities) Rules, 2011. '
            'No enforcement action is warranted at this time.'
        )
    else:
        viol_summary = cr.get('summary', {})
        crit_count = viol_summary.get('critical', 0)
        minor_count = viol_summary.get('minor', 0)
        overall_text = (
            f'The assessed pre-packaged commodity is NON-COMPLIANT with the applicable '
            f'provisions of the Legal Metrology (Packaged Commodities) Rules, 2011. '
            f'A total of {n_violations} violation(s) have been identified, including '
            f'{crit_count} critical violation(s) and {minor_count} minor violation(s). '
            f'Immediate corrective action is required by the manufacturer/packer/importer '
            f'to rectify the identified deficiencies prior to further distribution.'
        )

    summary = SummaryStats(
        total_requirements=total,
        compliant=n_compliant,
        partial=n_partial,
        non_compliant=n_non,
        not_applicable=n_na,
        requires_review=n_review,
        total_violations=n_violations,
        critical_violations=n_critical,
        high_violations=n_high,
        medium_violations=n_medium,
        low_violations=n_low,
        compliance_score=score,
        overall_text=overall_text,
    )

    return ComplianceModel(
        meta=meta,
        summary=summary,
        compliances=compliances,
        violations=violations,
        evidences=evidences,
        image_paths=image_paths,
        declarations=decl or pkg_decl or {},
        raw_json=json_data or {},
    )
