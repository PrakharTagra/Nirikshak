"""
json_validator.py — JSON Validation and Data Extraction
========================================================
Validates the mapped JSON structure and extracts all fields
needed for the compliance report, reporting issues clearly.

Legal Methodology Compliance Automation — Stage-9
"""

import json
import os
from datetime import datetime
from typing import Any, Dict, List, Optional, Tuple


class ValidationWarning:
    """Represents a non-fatal validation warning."""
    def __init__(self, field: str, message: str, severity: str = 'warning'):
        self.field    = field
        self.message  = message
        self.severity = severity  # 'info', 'warning', 'error'

    def __str__(self):
        return f'[{self.severity.upper()}] {self.field}: {self.message}'


class ValidationResult:
    """Container for validation output."""
    def __init__(self):
        self.warnings: List[ValidationWarning] = []
        self.errors:   List[ValidationWarning] = []
        self.data:     Optional[Dict]           = None
        self.valid:    bool                     = False

    def add_warning(self, field: str, message: str):
        self.warnings.append(ValidationWarning(field, message, 'warning'))

    def add_info(self, field: str, message: str):
        self.warnings.append(ValidationWarning(field, message, 'info'))

    def add_error(self, field: str, message: str):
        self.errors.append(ValidationWarning(field, message, 'error'))

    def has_errors(self) -> bool:
        return len(self.errors) > 0

    def print_summary(self):
        if self.errors:
            print(f'\n  [ERROR] Errors ({len(self.errors)}):')
            for e in self.errors:
                print(f'    {e}')
        if self.warnings:
            print(f'\n  [WARN] Warnings ({len(self.warnings)}):')
            for w in self.warnings:
                print(f'    {w}')
        if not self.errors and not self.warnings:
            print('  [OK] Validation passed with no issues.')


def _safe_get(d: Any, *keys, default=None) -> Any:
    """Safe nested dict access."""
    try:
        for k in keys:
            d = d[k]
        return d if d is not None else default
    except (KeyError, TypeError, IndexError):
        return default


def validate_json(json_path: str, image_dir: Optional[str] = None) -> ValidationResult:
    """
    Load and validate the mapped JSON file.

    Parameters
    ----------
    json_path  : Absolute or relative path to mapped.json
    image_dir  : Directory where product images are stored (for image validation).
                 If None, uses the directory containing mapped.json.

    Returns
    -------
    ValidationResult with .data populated on success.
    """
    result = ValidationResult()

    # --- 1. File existence check ---
    if not os.path.isfile(json_path):
        result.add_error('file', f'File not found: {json_path}')
        return result

    # --- 2. JSON parse ---
    try:
        with open(json_path, 'r', encoding='utf-8') as fh:
            raw = json.load(fh)
    except json.JSONDecodeError as exc:
        result.add_error('json_parse', f'Invalid JSON: {exc}')
        return result
    except Exception as exc:
        result.add_error('file_read', f'Cannot read file: {exc}')
        return result

    if not isinstance(raw, dict):
        result.add_error('json_structure', 'Root must be a JSON object.')
        return result

    result.data = raw

    # --- 3. Top-level field checks ---
    expected_top = ['productId', 'sourceImages', 'declarations',
                    'packageRecord', 'complianceResult']
    for field in expected_top:
        if field not in raw:
            result.add_warning('structure', f'Missing expected top-level field: {field}')

    # --- 4. complianceResult checks ---
    cr = raw.get('complianceResult', {})
    if not cr:
        result.add_warning('complianceResult', 'No complianceResult block found.')
    else:
        if 'violations' not in cr:
            result.add_warning('complianceResult.violations', 'No violations array.')
        else:
            violations = cr['violations']
            if not isinstance(violations, list):
                result.add_error('complianceResult.violations', 'violations must be a list.')
            else:
                result.add_info('complianceResult.violations',
                                f'{len(violations)} violation(s) found.')
                for i, v in enumerate(violations):
                    for req_field in ('rule', 'message', 'severity', 'field'):
                        if req_field not in v:
                            result.add_warning(
                                f'violations[{i}]',
                                f'Missing field: {req_field}')

        if 'compliant' not in cr:
            result.add_warning('complianceResult.compliant', 'compliant flag missing.')
        if 'summary' not in cr:
            result.add_warning('complianceResult.summary', 'summary block missing.')

    # --- 5. declarations checks ---
    decl = raw.get('declarations', {})
    if not decl:
        result.add_warning('declarations', 'No declarations block found.')
    else:
        important_fields = [
            'manufacturer', 'commodityName', 'netQuantity',
            'mrp', 'mfgDate', 'consumerCare',
        ]
        for field in important_fields:
            if field not in decl:
                result.add_warning('declarations', f'Missing declaration field: {field}')

    # --- 6. Image validation ---
    if image_dir is None:
        image_dir = os.path.dirname(os.path.abspath(json_path))

    source_images = raw.get('sourceImages', [])
    if not source_images:
        result.add_warning('sourceImages', 'No source images listed.')
    else:
        fallback_images = sorted([
            os.path.join(image_dir, f)
            for f in os.listdir(image_dir)
            if f.startswith('preprocessed') and f.endswith('.png')
        ] if os.path.isdir(image_dir) else [])
        for idx, img_name in enumerate(source_images):
            img_path = os.path.join(image_dir, img_name)
            if not os.path.isfile(img_path) and idx >= len(fallback_images):
                result.add_warning('sourceImages',
                                   f'Image file not found: {img_name} '
                                   f'(looked in: {image_dir})')

    annotated_img = raw.get('annotatedNetQuantityImage')
    if annotated_img:
        ann_path = os.path.join(image_dir, annotated_img)
        if not os.path.isfile(ann_path):
            result.add_warning('annotatedNetQuantityImage',
                               f'Annotated image not found: {annotated_img} '
                               f'(looked in: {image_dir})')

    # --- 7. panels checks ---
    panels = raw.get('panels', [])
    if not panels:
        result.add_warning('panels', 'No panels found; no per-image text data.')
    else:
        for i, panel in enumerate(panels):
            if 'filename' not in panel:
                result.add_warning(f'panels[{i}]', 'Panel missing filename.')
            if 'imageIndex' not in panel:
                result.add_warning(f'panels[{i}]', 'Panel missing imageIndex.')

    # --- 8. packageRecord checks ---
    pkg = raw.get('packageRecord', {})
    if not pkg:
        result.add_warning('packageRecord', 'No packageRecord block.')
    else:
        if 'labelMetrics' not in pkg:
            result.add_warning('packageRecord', 'labelMetrics block missing.')

    result.valid = not result.has_errors()
    return result


def extract_image_paths(json_data: Dict, image_dir: str) -> Dict[str, Optional[str]]:
    """
    Build a mapping of  { image_name: absolute_path_or_None }.

    For images that are not found by their original name, attempts to
    find preprocessed counterparts (preprocessed_1.png, preprocessed_2.png, etc.)
    in the same directory.
    Also maps all violation evidence images (violation_evidence_*.png).

    Returns None for still-missing images rather than raising.
    """
    paths: Dict[str, Optional[str]] = {}
    image_dir = os.path.abspath(image_dir)

    # Scan for any preprocessed images available as fallback
    fallback_images = sorted([
        os.path.join(image_dir, f)
        for f in os.listdir(image_dir)
        if f.startswith('preprocessed') and f.endswith('.png')
    ] if os.path.isdir(image_dir) else [])

    source_images = json_data.get('sourceImages', [])
    for idx, img_name in enumerate(source_images):
        candidate = os.path.join(image_dir, img_name)
        if os.path.isfile(candidate):
            paths[img_name] = candidate
        elif idx < len(fallback_images):
            # Use preprocessed image as fallback
            paths[img_name] = fallback_images[idx]
        else:
            paths[img_name] = None

    # Map preprocessed images by their own names as well
    for f_img in fallback_images:
        paths[os.path.basename(f_img)] = f_img

    annotated = json_data.get('annotatedNetQuantityImage')
    if annotated:
        candidate = os.path.join(image_dir, annotated)
        paths[annotated] = candidate if os.path.isfile(candidate) else None

    # Map violation-specific evidence images from complianceResult.violations
    for v in json_data.get('complianceResult', {}).get('violations', []):
        ev_img = v.get('evidenceImage')
        if ev_img:
            candidate = os.path.join(image_dir, ev_img)
            paths[ev_img] = candidate if os.path.isfile(candidate) else None

    # Map violation-specific evidence images from violationEvidences
    for ev in json_data.get('violationEvidences', []):
        ev_img = ev.get('evidenceImage')
        if ev_img:
            candidate = os.path.join(image_dir, ev_img)
            paths[ev_img] = candidate if os.path.isfile(candidate) else None

    # Automatically register any violation_evidence_*.png files found on disk
    if os.path.isdir(image_dir):
        for f in os.listdir(image_dir):
            if (f.startswith('violation_evidence_') or f.startswith('evidence_') or f == 'net_quantity_bounding_box.png') and f.endswith('.png'):
                paths[f] = os.path.join(image_dir, f)

    return paths


def extract_metadata(json_data: Dict) -> Dict[str, str]:
    """
    Extract top-level report metadata fields.
    All values are returned as strings (empty string if missing).
    """
    product_id = str(_safe_get(json_data, 'productId', default='N/A'))
    now_str    = datetime.now().strftime('%d %B %Y, %H:%M:%S')

    commodity  = _safe_get(json_data, 'packageRecord', 'commodity', 'genericName', default='')
    brand      = _safe_get(json_data, 'packageRecord', 'commodity', 'brandName', default='')
    entity     = (brand or commodity or 'Not Available').strip()

    # Manufacturer name
    mfr_name = _safe_get(json_data, 'declarations', 'manufacturer', 'name', default='')
    if mfr_name:
        mfr_name = mfr_name[:120]  # truncate very long strings

    cr = json_data.get('complianceResult', {})
    overall_compliant = cr.get('compliant', None)
    if overall_compliant is True:
        overall_status = 'COMPLIANT'
    elif overall_compliant is False:
        overall_status = 'NON-COMPLIANT'
    else:
        overall_status = 'UNKNOWN'

    return {
        'report_id':          f'RPT-{product_id}-{datetime.now().strftime("%Y%m%d")}',
        'case_id':            f'CASE-{product_id}',
        'product_id':         product_id,
        'entity':             entity,
        'manufacturer':       mfr_name or 'Not Available',
        'assessment_date':    datetime.now().strftime('%d %B %Y'),
        'framework':          'Legal Metrology (Packaged Commodities) Rules, 2011',
        'report_version':     '1.0',
        'generated_on':       now_str,
        'assessment_status':  overall_status,
        'applicable':         str(cr.get('applicable', True)),
        'exemption_reason':   cr.get('exemptionReason') or 'None',
    }
