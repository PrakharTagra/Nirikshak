/**
 * Diagnostic logger for Nirikshak Compliance Engine.
 * Formats complete audit details (OCR raw lines, extracted statutory declarations,
 * packaging geometry, and rule violations) into clear, human-readable terminal/server logs.
 */
'use strict';

const path = require('path');

function formatBox(title) {
  const line = '='.repeat(80);
  const pad = Math.max(0, Math.floor((80 - title.length) / 2));
  const centered = ' '.repeat(pad) + title;
  return `${line}\n${centered}\n${line}`;
}

function formatSection(title) {
  return `\n${'-'.repeat(80)}\n${title}\n${'-'.repeat(80)}`;
}

function logComplianceAuditDiagnostics({
  productId = 'N/A',
  sourceImages = [],
  detectedProductName = 'Unknown Product',
  status = 'UNKNOWN',
  ocrResult = {},
  declarations = {},
  packageRecord = {},
  complianceResult = {},
  labelMetrics = {},
}) {
  const out = [];

  out.push(formatBox('NIRIKSHAK LEGAL METROLOGY COMPLIANCE AUDIT DIAGNOSTIC REPORT'));
  out.push(`[PRODUCT NAME]    : ${detectedProductName}`);
  out.push(`[PRODUCT ID]      : ${productId} | [STATUS]: ${status}`);
  out.push(`[INPUT IMAGES]    : ${sourceImages.length} panel(s) (${sourceImages.map(p => path.basename(p)).join(', ') || 'N/A'})`);
  
  const summary = complianceResult.summary || {};
  const violations = complianceResult.violations || [];
  out.push(`[AUDIT SUMMARY]   : Total Issues: ${violations.length} | Critical: ${summary.critical || 0} | Major: ${summary.major || 0} | Minor: ${summary.minor || 0}`);

  // ---------------------------------------------------------------------------
  // 1. EXTRACTED OCR RAW TEXT PER PANEL
  // ---------------------------------------------------------------------------
  out.push(formatSection('1. EXTRACTED OCR RAW TEXT (PER PANEL)'));
  const panels = ocrResult.perImage || [];
  if (panels.length > 0) {
    panels.forEach((p, idx) => {
      out.push(`[Panel ${idx + 1}: ${p.filename || `Panel_${idx + 1}`}]`);
      const lines = p.lines || [];
      if (lines.length > 0) {
        lines.forEach((l, lIdx) => {
          const ht = l.heightPx ? ` (${l.heightPx}px)` : '';
          out.push(`  Line ${String(lIdx + 1).padStart(2, ' ')}: "${l.text}"${ht}`);
        });
      } else if (p.text) {
        p.text.split('\n').filter(Boolean).forEach((t, lIdx) => {
          out.push(`  Line ${String(lIdx + 1).padStart(2, ' ')}: "${t.trim()}"`);
        });
      } else {
        out.push('  (No text lines recognized for this panel)');
      }
      out.push('');
    });
  } else if (ocrResult.text) {
    out.push('Extracted Raw Text:');
    ocrResult.text.split('\n').filter(Boolean).forEach((t, idx) => {
      out.push(`  Line ${String(idx + 1).padStart(2, ' ')}: "${t.trim()}"`);
    });
  } else {
    out.push('  (No OCR text detected across input images)');
  }

  // ---------------------------------------------------------------------------
  // 2. STATUTORY DECLARATIONS EXTRACTED (RULE 6)
  // ---------------------------------------------------------------------------
  out.push(formatSection('2. STATUTORY DECLARATIONS EXTRACTED (RULE 6)'));
  const comm = declarations.commodityName || {};
  const commClass = declarations.commodityClassification || {};
  out.push(`- Commodity Generic Name : "${comm.value || commClass.genericName || 'NOT FOUND'}"`);
  out.push(`- Brand Name             : "${commClass.brandName || 'NOT FOUND'}"`);
  out.push(`- Physical Form          : ${packageRecord?.commodity?.physicalForm || commClass.physicalForm || 'unknown'}`);
  
  const netQty = declarations.netQuantity || {};
  const qtyVal = netQty.value != null ? netQty.value : 'MISSING';
  const qtyUnit = netQty.unit || '';
  const qtyKind = netQty.unitKind || 'N/A';
  const pieceCount = netQty.pieceCount || 1;
  const symbolUsed = netQty.symbolUsed || netQty.unit || 'N/A';
  out.push(`- Net Quantity           : ${qtyVal} ${qtyUnit} (Kind: ${qtyKind}, Pieces: ${pieceCount}, Symbol: "${symbolUsed}", Raw: "${netQty.rawText || ''}")`);

  const mrp = declarations.mrp || {};
  const mrpVal = mrp.value != null ? `Rs. ${mrp.value}` : 'MISSING';
  const usp = mrp.unitSalePrice != null ? ` (Unit Sale Price: Rs. ${mrp.unitSalePrice} / ${mrp.unitSalePriceUnit || qtyUnit})` : '';
  out.push(`- Maximum Retail Price   : ${mrpVal}${usp} (Raw: "${mrp.rawText || ''}")`);

  const mfg = declarations.mfgDate || {};
  const mfgStr = (mfg.month != null && mfg.year != null) ? `${mfg.month}/${mfg.year}` : (mfg.rawText || 'MISSING');
  out.push(`- Date of Mfg / Packing  : ${mfgStr} (Month: ${mfg.month ?? 'null'}, Year: ${mfg.year ?? 'null'})`);

  const exp = declarations.expiryDate || {};
  const expStr = (exp.month != null && exp.year != null) ? `${exp.month}/${exp.year}` : (exp.rawText || 'Not Declared');
  out.push(`- Best Before / Expiry   : ${expStr}`);

  const mfr = declarations.manufacturer || {};
  const mfrPresent = mfr.present ? 'YES' : 'NO';
  out.push(`- Manufacturer Details   : Present: ${mfrPresent} | Name: "${mfr.name || ''}" | Address: "${mfr.address || ''}"`);

  const pkr = declarations.packer || {};
  const pkrPresent = pkr.present ? 'YES' : 'NO';
  out.push(`- Packer Details         : Present: ${pkrPresent} | Name: "${pkr.name || ''}" | Address: "${pkr.address || ''}"`);

  const imp = declarations.importer || {};
  const impPresent = imp.present ? 'YES' : 'NO';
  out.push(`- Importer Details       : Present: ${impPresent} | Name: "${imp.name || ''}" | Address: "${imp.address || ''}"`);

  const care = declarations.consumerCare || {};
  const carePresent = care.present ? 'YES' : 'NO';
  out.push(`- Consumer Care Contact  : Present: ${carePresent} | Phone: "${care.phone || ''}" | Email: "${care.email || ''}" | Address: "${care.address || ''}"`);

  out.push(`- Country of Origin      : "${commClass.countryOfOrigin || declarations.countryOfOrigin?.value || 'NOT DECLARED'}"`);

  const dims = declarations.dimensions || {};
  out.push(`- Package Dimensions     : Raw: "${dims.rawText || ''}" | L: ${dims.length ?? 'null'}, W: ${dims.width ?? 'null'}, H: ${dims.height ?? 'null'} ${dims.unit || ''}`);

  // ---------------------------------------------------------------------------
  // 3. PACKAGING GEOMETRY & READABILITY ANALYSIS (STAGE 5)
  // ---------------------------------------------------------------------------
  out.push(formatSection('3. PACKAGING GEOMETRY & READABILITY ANALYSIS (STAGE 5)'));
  if (labelMetrics.netQuantityBox) {
    const b = labelMetrics.netQuantityBox;
    out.push(`- Net Quantity Box       : [x: ${b.x || 0}, y: ${b.y || 0}, w: ${b.width || 0}, h: ${b.height || 0}]`);
  } else {
    out.push('- Net Quantity Box       : Not isolated geometrically');
  }
  const numPx = labelMetrics.numeralHeightPx || labelMetrics.clearanceDetails?.numeralHeightPx;
  const numMm = labelMetrics.numeralHeightMm || labelMetrics.clearanceDetails?.numeralHeightMm;
  let numMmVal = null;
  if (typeof numMm === 'number') {
    numMmVal = `${numMm.toFixed(2)} mm`;
  } else if (numMm && typeof numMm === 'object' && numMm.value != null) {
    numMmVal = `${Number(numMm.value).toFixed(2)} mm`;
  } else if (numMm && typeof numMm === 'string') {
    numMmVal = numMm;
  }
  const numMmStr = numMmVal ? ` (~${numMmVal})` : '';
  out.push(`- Numeral Height         : ${numPx ? `${numPx} px` : 'N/A'}${numMmStr}`);
  
  const intrusions = labelMetrics.clearanceDetails?.intrusions || [];
  out.push(`- Clearance Intrusions   : ${intrusions.length} intrusive element(s) detected around Net Quantity`);

  // ---------------------------------------------------------------------------
  // 4. STATUTORY VIOLATION AUDIT FINDINGS (RULE ENGINE - G.S.R. 202(E))
  // ---------------------------------------------------------------------------
  out.push(formatSection('4. STATUTORY VIOLATION AUDIT FINDINGS (RULE ENGINE - G.S.R. 202(E))'));
  if (violations.length === 0) {
    out.push('  *** ALL STATUTORY PACKAGING RULES COMPLIANT (0 VIOLATIONS FOUND) ***');
  } else {
    violations.forEach((v, idx) => {
      out.push(`[FINDING ${idx + 1}] [${(v.severity || 'MAJOR').toUpperCase()}] - Rule ${v.rule || 'Unspecified'}`);
      out.push(`  * Field        : ${v.field || 'General'}`);
      out.push(`  * Description  : ${v.message || v.description || 'Statutory packaging violation'}`);
      if (v.expected) out.push(`  * Required     : ${v.expected}`);
      if (v.actual)   out.push(`  * Found on Pkg : ${v.actual}`);
      if (v.statutoryReference) out.push(`  * Law Ref      : ${v.statutoryReference}`);
      out.push('');
    });
  }

  out.push(formatBox(`END OF NIRIKSHAK DIAGNOSTIC REPORT -- STATUS: ${status}`));
  out.push('\n');

  const finalString = out.join('\n');
  console.log(finalString);
  return finalString;
}

module.exports = { logComplianceAuditDiagnostics };
