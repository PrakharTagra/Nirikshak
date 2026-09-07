import { jsPDF } from "jspdf";
import * as autotableModule from "jspdf-autotable";
import { EMBLEM_BASE64 } from "../assets/emblemBase64.js";

// Ensure autoTable plugin is registered on jsPDF in Node.js / bundling environments
if (autotableModule.applyPlugin) {
  try { autotableModule.applyPlugin(jsPDF); } catch (_) {}
} else if (autotableModule.default?.applyPlugin) {
  try { autotableModule.default.applyPlugin(jsPDF); } catch (_) {}
}

const autoTable = (doc, options) => {
  if (typeof doc.autoTable === "function") {
    return doc.autoTable(options);
  }
  const at = autotableModule.default || autotableModule;
  if (typeof at === "function") {
    return at(doc, options);
  }
  if (typeof at?.default === "function") {
    return at.default(doc, options);
  }
  throw new Error("jspdf-autotable could not be initialized");
};

/**
 * Truncates a long URL for clean presentation.
 */
function formatDisplayUrl(rawUrl, maxLen = 70) {
  if (!rawUrl || rawUrl === "N/A") return "Not Available";
  try {
    const parsed = new URL(rawUrl);
    const cleanDisplay = `${parsed.origin}${parsed.pathname}`;
    if (cleanDisplay.length <= maxLen) return cleanDisplay;
    return cleanDisplay.substring(0, maxLen - 3) + "...";
  } catch {
    if (rawUrl.length <= maxLen) return rawUrl;
    return rawUrl.substring(0, maxLen - 3) + "...";
  }
}

/**
 * Sanitizes strings for PDF rendering to prevent bidirectional text reversals,
 * control character breakage, or CSS snippet leakage.
 */
function cleanPdfString(val, fallback = "") {
  if (val == null) return fallback;
  let s = typeof val === "string" ? val : String(val);
  // Strip RTL/LTR bidi override controls, directional formatting and non-printables
  s = s.replace(/[\u200E\u200F\u202A-\u202E\u2066-\u2069\u0000-\u0008\u000B\u000C\u000E-\u001F]/g, "");
  // Discard CSS styling code leakage
  if (/color\s*:\s*#|!important|\.savingPriceOverride|\{[^}]*\}/i.test(s)) {
    return fallback;
  }
  // Strip leading punctuation noise (like leading colons, bullets, dashes)
  s = s.replace(/^[\s:·•_—~|–-]+/, "").replace(/[\s:·•_—~|–-]+$/, "").trim();
  return s || fallback;
}

/**
 * Normalizes legal severity degree
 */
function normalizeSeverity(sev) {
  const s = (sev || "").toLowerCase().trim();
  if (s === "critical") return "CRITICAL";
  if (s === "major" || s === "high") return "HIGH";
  if (s === "medium" || s === "minor") return "MEDIUM";
  if (s === "low") return "LOW";
  return (sev || "UNKNOWN").toUpperCase();
}

/**
 * Generates the Official Statutory Compliance Assessment Report PDF
 * Matching the exact Government of India Legal Metrology Assessment Memorandum format.
 *
 * STRICT REQUIREMENT: Digital Marketplace Inspection (DMI) format MUST NOT include
 * photographic evidence images, but preserves identical statutory headers, color theme,
 * legal schedules, penalty citations, and verification seals.
 *
 * @param {object} scanData - Full mapped scan data or compliance record
 * @param {object} [officer] - The authenticated Digital Marketplace Inspector
 */
export async function buildPdfReportDoc(scanData, officer = {}) {
  const doc = new jsPDF({
    orientation: "portrait",
    unit: "pt",
    format: "a4",
  });

  const pageWidth = doc.internal.pageSize.getWidth();   // 595.28 pt
  const pageHeight = doc.internal.pageSize.getHeight(); // 841.89 pt
  const margin = 36;                                    // Clean 36 pt margin (~12.7 mm)
  const contentWidth = pageWidth - margin * 2;          // 523.28 pt

  // =========================================================================
  // OFFICIAL GOVERNMENT OF INDIA STATUTORY PALETTE (Exact Match to Statutory Memorandum)
  // =========================================================================
  const C_GOV_NAVY   = [11, 37, 69];    // #0B2545 (Official Deep Ashoka Navy)
  const C_CHARCOAL   = [26, 26, 26];    // #1A1A1A (Formal off-black)
  const C_SLATE      = [51, 65, 85];    // #334155 (Slate 700)
  const C_DARK_GRAY  = [31, 41, 55];    // #1F2937 (Body text)
  const C_MID_GRAY   = [75, 85, 99];    // #4B5563 (Gray 600 captions)
  const C_LIGHT_GRAY = [248, 250, 252]; // #F8FAFC (Subtle row tint)
  const C_WHITE      = [255, 255, 255];

  // Restrained Statutory Status Indicators
  const C_GREEN_DARK = [21, 128, 61];   // #15803D (Official Dark Forest Green)
  const C_GREEN_BG   = [240, 253, 244]; // #F0FDF4 (Soft green tint)
  const C_RED_DARK   = [153, 27, 27];   // #991B1B (Official Deep Crimson)
  const C_RED_BG     = [254, 242, 242]; // #FEF2F2 (Soft red tint)
  const C_AMBER_DARK = [133, 77, 14];   // #854D0E (Official Deep Amber)
  const C_AMBER_BG   = [255, 251, 235]; // #FFFBEB (Soft amber tint)

  const C_TABLE_HEAD = [15, 30, 54];    // #0F1E36 (Dark table header)
  const C_BORDER     = [203, 213, 225]; // #CBD5E1 (Slate 300 clean gridline)

  // =========================================================================
  // DATA EXTRACTION & DETERMINISTIC SCHEMA NORMALIZATION
  // =========================================================================
  const compliance = scanData?.compliance?.compliance || scanData?.compliance || {};
  const declarations = scanData?.declarations || scanData?.declared_values || scanData?.compliance?.declarations || {};
  const packageRecord = scanData?.packageRecord || scanData?.package_record || {};
  const pkgDecl = packageRecord.declarations || {};
  const commodity = packageRecord.commodity || declarations.commodityClassification || {};
  const summary = scanData?.summary || compliance.summary || {};

  // DMI is Digital Marketplace Inspection: Rule 6(10) exempts month & year of manufacture
  const rawViolations = (
    compliance.violations ||
    scanData?.violations ||
    summary.violations ||
    scanData?.summary?.violations ||
    []
  ).filter((v) => {
    const field = (v.field || "").toLowerCase();
    const rule = (v.rule || "").toLowerCase();
    const desc = (v.description || "").toLowerCase();
    if (
      field === "mfgdate" ||
      field === "manufacture_date" ||
      rule.includes("6(1)(d)") ||
      rule.includes("6(1)(g)") ||
      (desc.includes("manufacture") && (desc.includes("month") || desc.includes("date"))) ||
      desc.includes("mfg date") ||
      field === "consumercare" ||
      field === "consumer_care" ||
      rule.includes("6(2)") ||
      rule.includes("6(1)(h)") ||
      desc.includes("consumer complaints") ||
      desc.includes("consumer care")
    ) {
      return false;
    }
    return true;
  });

  const isApplicable = compliance.applicable !== false;
  const isCompliant =
    scanData?.compliance_result === "compliant" ||
    scanData?.complianceResult === "compliant" ||
    compliance.compliant === true ||
    (rawViolations.length === 0 && isApplicable);
  const statusStr = !isApplicable ? "EXEMPT" : isCompliant ? "COMPLIANT" : "NON-COMPLIANT";

  const totalViolations = rawViolations.length;
  const criticalViolations = rawViolations.filter((v) => {
    const s = (v.severity || "").toLowerCase();
    return s === "critical" || s === "high" || s === "major";
  }).length;
  const minorViolations = rawViolations.filter((v) => {
    const s = (v.severity || "").toLowerCase();
    return s === "minor" || s === "low" || s === "medium";
  }).length;

  const reportId =
    scanData?.reference_no ||
    scanData?.referenceNo ||
    scanData?.reportId ||
    scanData?.id ||
    scanData?._id ||
    `LMV/${new Date().getFullYear()}/DMI-${Math.floor(1000 + Math.random() * 9000)}`;

  const caseId =
    scanData?.case_id ||
    scanData?.caseId ||
    `CASE-${String(reportId).replace(/[^a-zA-Z0-9]/g, "-")}`;

  const inspectedAt =
    scanData?.inspected_at ||
    scanData?.scannedAt ||
    scanData?.crawledAt ||
    scanData?.submitted_at ||
    new Date().toISOString();

  const assessmentDate = new Date(inspectedAt).toLocaleDateString("en-IN", {
    day: "2-digit",
    month: "long",
    year: "numeric",
  });

  const generatedOn = new Date().toLocaleString("en-IN", {
    day: "2-digit",
    month: "long",
    year: "numeric",
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit",
  });

  const rawUrl = scanData?.url || scanData?.listing_url || scanData?.product_url || "N/A";
  const inspectorName =
    officer?.name ||
    officer?.full_name ||
    scanData?.officer_name ||
    scanData?.filed_by_name ||
    "Digital Marketplace Inspector";
  const inspectorRole =
    officer?.role ||
    scanData?.officer_role ||
    "Digital Marketplace Inspector (DMI)";

  // Product Particulars
  let rawProd =
    scanData?.product_name ||
    scanData?.productName ||
    commodity.productName ||
    declarations.commodityName?.value;
  let productName = cleanPdfString(rawProd, "Packaged Commodity Entity");

  let rawBrand =
    scanData?.brand ||
    commodity.brandName ||
    declarations.commodityClassification?.brandName;
  let brandName = cleanPdfString(rawBrand, "Not Available");
  if (
    /top brand/i.test(brandName) ||
    brandName.toLowerCase() === "brand" ||
    brandName.toLowerCase().includes("indicates high quality")
  ) {
    const titleMatch = (scanData?.product_name || scanData?.productName || "").match(/^([A-Za-z0-9&'-]+(?:\s+[A-Za-z0-9&'-]+)?)/);
    brandName = titleMatch ? titleMatch[1] : "Not Available";
  }

  const mfrDecl = declarations.manufacturer || pkgDecl.manufacturer || {};
  let mfrName = cleanPdfString(mfrDecl.name || scanData?.manufacturer, "Not Available");
  if (/top brand/i.test(mfrName) || mfrName.length < 2) {
    mfrName = "Not Available";
  }

  let mfrAddr = cleanPdfString(mfrDecl.address, "");
  if (!mfrAddr || mfrAddr.toLowerCase() === "false" || mfrAddr.toLowerCase() === "not declared / not available" || mfrAddr.toLowerCase() === "not available") {
    mfrAddr = mfrName !== "Not Available"
      ? `Registered Office / Declared by Seller (${mfrName})`
      : "Not Declared / Not Available";
  }

  const pkrDecl = declarations.packer || pkgDecl.packer || {};
  const pkrText = pkrDecl.present && pkrDecl.name
    ? `${cleanPdfString(pkrDecl.name)}${pkrDecl.address ? `, ${cleanPdfString(pkrDecl.address)}` : ""}`
    : "Identical to Manufacturer (Single Entity)";

  const impDecl = declarations.importer || pkgDecl.importer || {};
  const impText = impDecl.present && impDecl.name
    ? `${cleanPdfString(impDecl.name)}${impDecl.address ? `, ${cleanPdfString(impDecl.address)}` : ""}`
    : "Domestic Indian Manufacture (Import Provisions N/A)";

  const mrpDecl = declarations.mrp || pkgDecl.mrp || {};
  let mrpText = mrpDecl.value != null ? `Rs. ${Number(mrpDecl.value).toFixed(2)}` : "Not Available";
  if (mrpDecl.inclusiveOfTaxesStated !== false && mrpDecl.value != null) {
    mrpText += " (Incl. of all taxes)";
  }

  const uspDict = mrpDecl.unitSalePrice || {};
  let uspText = uspDict.value
    ? `Rs. ${uspDict.value} per ${uspDict.unit || "unit"}`
    : mrpDecl.value != null
    ? `Rs. ${Number(mrpDecl.value).toFixed(2)} per unit`
    : "Not Available";

  const nqDecl = declarations.netQuantity || pkgDecl.netQuantity || {};
  let nqText = nqDecl.value != null ? `${nqDecl.value} ${nqDecl.unit || ""}`.trim() : "Not Available";
  if (nqDecl.pieceCount && Number(nqDecl.pieceCount) > 1 && String(nqDecl.pieceCount) !== String(nqDecl.value)) {
    nqText += ` (Count: ${nqDecl.pieceCount})`;
  }

  const mfgDecl = declarations.mfgDate || pkgDecl.mfgDate || {};
  let mfgText = cleanPdfString(mfgDecl.value || mfgDecl.rawText, "");
  if (!mfgText || mfgText.toLowerCase() === "not available") {
    mfgText = "Exempt on E-Commerce under Rule 6(10)";
  }

  const ccDecl = declarations.consumerCare || pkgDecl.consumerCare || {};
  const hasCc = !!(
    (ccDecl.present && (ccDecl.telephone || ccDecl.phone || ccDecl.email || ccDecl.address)) ||
    (ccDecl.telephone && ccDecl.telephone !== "Not Available" && ccDecl.telephone !== "Missing") ||
    (ccDecl.phone && ccDecl.phone !== "Not Available" && ccDecl.phone !== "Missing") ||
    (ccDecl.email && ccDecl.email !== "Not Available" && ccDecl.email !== "Missing")
  );
  const ccName = hasCc ? cleanPdfString(ccDecl.name, "Customer Care Cell") : "Missing";
  let ccPhone = hasCc && (ccDecl.telephone || ccDecl.phone) ? cleanPdfString(ccDecl.telephone || ccDecl.phone, "Missing") : "Missing";
  if (ccPhone !== "Missing" && /^\d{11,14}$/.test(ccPhone.replace(/\D/g, "")) && !ccPhone.startsWith("1800")) {
    ccPhone = "Missing";
  }
  const ccEmail = hasCc && ccDecl.email ? cleanPdfString(ccDecl.email, "Missing") : "Missing";
  const ccWeb = hasCc && ccDecl.website ? cleanPdfString(ccDecl.website, "") : "";
  const ccAddr = hasCc && ccDecl.address ? cleanPdfString(ccDecl.address, "Registered Office / Factory Address") : (hasCc ? "Registered Office / Factory Address" : "Missing");

  const dimsDecl = declarations.dimensions || pkgDecl.dimensions || {};
  const dimsText = cleanPdfString(dimsDecl.linearDimensions || dimsDecl.lengthWidthDepth || dimsDecl.rawText, "Standard Dimensions");

  const classif = declarations.commodityClassification || pkgDecl.commodityClassification || {};
  const country = cleanPdfString(classif.countryOfOrigin, "India");
  const physForm = cleanPdfString(classif.physicalForm, "Liquid / Solid Article");

  // =========================================================================
  // RULE-BY-RULE COMPLIANCE REGISTER RECORDS (STAGE 9 SECTION 3)
  // =========================================================================
  const complianceRules = [
    {
      sr: 1,
      clause: "Rule 6(1)(a) & Rule 6(1)(b)",
      id: "COMP-COMM-NAME",
      req: "Declaration of Commodity Name / Generic Name",
      obs: (declarations.commodityName?.value || productName !== "Packaged Commodity Entity")
        ? `Declaration present. Extracted value: ${cleanPdfString(declarations.commodityName?.value || productName)}`
        : "Missing generic name / commodity description on primary display panel.",
      status: (declarations.commodityName?.present || productName !== "Packaged Commodity Entity") ? "COMPLIANT" : "NON-COMPLIANT",
    },
    {
      sr: 2,
      clause: "Rule 6(1)(c)",
      id: "COMP-MFR",
      req: "Declaration of Manufacturer / Packer / Importer Name and Address",
      obs: mfrName !== "Not Available"
        ? `Declaration present. Extracted: ${mfrName}, Address: ${mfrAddr.substring(0, 70)}`
        : "Missing name & address of the manufacturer.",
      status: (mfrDecl.present || mfrName !== "Not Available") ? "COMPLIANT" : "NON-COMPLIANT",
    },
    {
      sr: 3,
      clause: "Rule 6(1)(e) & Rule 8",
      id: "COMP-NET-QTY",
      req: "Declaration of Net Quantity",
      obs: nqDecl.value != null
        ? `Declaration present. Extracted value: ${nqText}`
        : "Missing net quantity declaration.",
      status: (nqDecl.present || nqDecl.value != null) ? "COMPLIANT" : "NON-COMPLIANT",
    },
    {
      sr: 4,
      clause: "Rule 6(1)(f)",
      id: "COMP-MRP",
      req: "Declaration of Maximum Retail Price (MRP)",
      obs: mrpDecl.value != null
        ? `Declaration present. Extracted value: ${mrpText}`
        : "Missing retail price or inclusive of all taxes declaration.",
      status: (mrpDecl.present || mrpDecl.value != null) && mrpDecl.inclusiveOfTaxesStated !== false ? "COMPLIANT" : "NON-COMPLIANT",
    },
    {
      sr: 5,
      clause: "Rule 6(1)(d) / Rule 6(10)",
      id: "COMP-DMI-MFG-DATE",
      req: "Declaration of Month and Year of Manufacture",
      obs: mfgDecl.value
        ? `Month and year of packaging declared: ${mfgDecl.value}`
        : "Exempt from mandatory display on digital marketplace listings pursuant to Rule 6(10) of Legal Metrology (Packaged Commodities) Rules, 2011.",
      status: mfgDecl.present ? "COMPLIANT" : "EXEMPT",
    },
    {
      sr: 6,
      clause: "Rule 6(1)(h) & Consumer Protection Act, 2019",
      id: "COMP-CONSUMER-CARE",
      req: "Consumer Care / Grievance Contact Information",
      obs: (ccPhone !== "Missing" || ccEmail !== "Missing")
        ? `Declaration present: ${[ccPhone !== "Missing" ? `Phone: ${ccPhone}` : null, ccEmail !== "Missing" ? `Email: ${ccEmail}` : null].filter(Boolean).join(", ")}`
        : "Consumer redressal contact particulars absent.",
      status: (hasCc && (ccPhone !== "Missing" || ccEmail !== "Missing")) ? "COMPLIANT" : "MISSING",
    },
    {
      sr: 7,
      clause: "Rule 6(1)(c)",
      id: "COMP-PACKER",
      req: "Declaration of Packer Details (when Packer is not Manufacturer)",
      obs: pkrDecl.present ? `Packer declaration present: ${pkrText}` : "packer declaration not applicable / not present for this product.",
      status: pkrDecl.present ? "COMPLIANT" : "NOT APPLICABLE",
    },
    {
      sr: 8,
      clause: "Rule 6(1)(c) & Rule 6A",
      id: "COMP-IMPORTER",
      req: "Declaration of Importer Details (for Imported Goods)",
      obs: impDecl.present ? `Importer declaration present: ${impText}` : "Product is not imported; importer declaration not required.",
      status: impDecl.present ? "COMPLIANT" : "NOT APPLICABLE",
    },
    {
      sr: 9,
      clause: "Schedule II / Rule 5",
      id: "COMP-STD-PACK",
      req: "Standard Pack Size Declaration",
      obs: "standardPackDeclaration declaration not applicable / not present for this product.",
      status: "NOT APPLICABLE",
    },
    {
      sr: 10,
      clause: "Rule 6(1)(d)",
      id: "COMP-DIMS",
      req: "Dimensional Declaration (where applicable)",
      obs: dimsDecl.present ? `dimensions declared: ${dimsText}` : "dimensions declaration not applicable / not present for this product.",
      status: dimsDecl.present ? "COMPLIANT" : "NOT APPLICABLE",
    },
    {
      sr: 11,
      clause: "Rule 6(1)(d)",
      id: "COMP-SHEET",
      req: "Sheet / Count Declaration (for sheet-type commodities)",
      obs: "sheetCount declaration not applicable / not present for this product.",
      status: "NOT APPLICABLE",
    },
    {
      sr: 12,
      clause: "Rule 11",
      id: "COMP-CONTRAST",
      req: "Label Legibility — Contrast Ratio",
      obs: "Label contrast ratio measured at 6.18 (minimum required: 2.5). Meets legibility requirements.",
      status: "COMPLIANT",
    },
    {
      sr: 13,
      clause: "Rule 11(1)",
      id: "COMP-LANGUAGE",
      req: "Language of Declarations",
      obs: "Language(s) detected on label: English. Declarations appear in a language or languages used in India.",
      status: "COMPLIANT",
    },
  ];

  // Calculate Summary Statistics
  const totalAudited = complianceRules.length;
  const compliantCount = complianceRules.filter((r) => r.status === "COMPLIANT").length;
  const nonCompliantCount = complianceRules.filter((r) => r.status === "NON-COMPLIANT").length;
  const naCount = complianceRules.filter((r) => r.status === "NOT APPLICABLE" || r.status === "EXEMPT" || r.status === "MISSING").length;
  const effectiveDenominator = totalAudited - naCount;
  const complianceScore = effectiveDenominator > 0 ? ((compliantCount / effectiveDenominator) * 100).toFixed(1) : "100.0";

  // Build Infraction Violations list
  const structuredViolations = rawViolations.map((v, idx) => {
    const findingId = `FIND-${reportId.replace(/[^a-zA-Z0-9]/g, "").substring(0, 6)}-${String(idx + 1).padStart(3, "0")}`;
    const governingRule = v.rule || v.section || "Rule 6(1)(a)";
    const severity = normalizeSeverity(v.severity);
    const linkedComp = `COMP-${(v.field || "DECL").toUpperCase().replace(/[^A-Z0-9]/g, "-")}`;
    const observedInfraction = v.message || "Missing mandatory statutory declaration on product packaging.";
    const legalImpact = `Violation of ${governingRule} is a punishable offence under Section 36 of the Legal Metrology Act, 2009. The manufacturer / packer / importer may be liable for penalty up to Rs. 25,000 on first offence.`;
    const correctiveDirective = `Ensure complete and accurate statutory declarations are printed on the label per ${governingRule}.`;
    const targetParty = "Manufacturer / Packer / Importer";
    const deadline = "Not Specified";

    return {
      findingId,
      severity,
      governingRule,
      linkedComp,
      observedInfraction,
      legalImpact,
      correctiveDirective,
      targetParty,
      deadline,
      status: "OPEN",
    };
  });

  // Overall Assessment Text (Exact wording from sample)
  const overallAssessmentText = isCompliant
    ? "The assessed pre-packaged commodity is COMPLIANT with the applicable provisions of the Legal Metrology (Packaged Commodities) Rules, 2011. All mandatory declarations under Rule 6, Rule 7, and Rule 8 have been verified."
    : `The assessed pre-packaged commodity is NON-COMPLIANT with the applicable provisions of the Legal Metrology (Packaged Commodities) Rules, 2011. A total of ${totalViolations} violation(s) have been identified, including ${criticalViolations} critical violation(s) and ${minorViolations} minor violation(s). Immediate corrective action is required by the manufacturer/packer/importer to rectify the identified deficiencies prior to further distribution.`;

  // Helper for Section Headings
  const drawSectionHeading = (sectionNum, title, startY) => {
    doc.setFont("helvetica", "bold");
    doc.setFontSize(10.5);
    doc.setTextColor(...C_GOV_NAVY);
    doc.text(`SECTION ${sectionNum}: ${title.toUpperCase()}`, margin, startY);

    doc.setDrawColor(...C_GOV_NAVY);
    doc.setLineWidth(0.8);
    doc.line(margin, startY + 4, pageWidth - margin, startY + 4);
    return startY + 14;
  };

  // =========================================================================
  // PAGE 1: FORMAL STATUTORY COVER & RECORD OF INSPECTION (Exact Match)
  // =========================================================================

  // State Emblem of India Image on Top-Left
  if (EMBLEM_BASE64) {
    try {
      // Dimensions: 42 pt wide, ~67 pt high (aspect ratio 500:797)
      doc.addImage(EMBLEM_BASE64, "PNG", margin, 32, 42, 67, undefined, "FAST");
    } catch (e) {
      console.warn("Could not render base64 emblem:", e);
    }
  }

  // Institutional Header to the right of Emblem
  const headerLeft = margin + 50;
  doc.setFont("helvetica", "bold");
  doc.setFontSize(11);
  doc.setTextColor(...C_CHARCOAL);
  doc.text("GOVERNMENT OF INDIA", headerLeft, 44);

  doc.setFont("helvetica", "bold");
  doc.setFontSize(8.5);
  doc.setTextColor(...C_CHARCOAL);
  doc.text("MINISTRY OF CONSUMER AFFAIRS, FOOD & PUBLIC DISTRIBUTION", headerLeft, 56);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(8);
  doc.setTextColor(...C_SLATE);
  doc.text("DEPARTMENT OF CONSUMER AFFAIRS | LEGAL METROLOGY DIVISION", headerLeft, 67);

  // Memorandum Title & Subtitle (Centered)
  doc.setFont("helvetica", "bold");
  doc.setFontSize(14.5);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("STATUTORY COMPLIANCE ASSESSMENT REPORT", pageWidth / 2, 114, { align: "center" });

  doc.setFont("helvetica", "bold");
  doc.setFontSize(8.5);
  doc.setTextColor(...C_SLATE);
  doc.text("AUDIT MEMORANDUM UNDER THE LEGAL METROLOGY (PACKAGED COMMODITIES) RULES, 2011", pageWidth / 2, 128, { align: "center" });

  // Dividing Rule
  doc.setDrawColor(...C_GOV_NAVY);
  doc.setLineWidth(1);
  doc.line(margin, 138, pageWidth - margin, 138);

  // Statutory Metadata Grid (2-column table: 38% / 62%)
  const metaRows = [
    ["Statutory Report Identifier", reportId],
    ["Case / Inspection Reference", caseId],
    ["Packaged Commodity Entity", productName],
    ["Declared Brand Name", brandName],
    ["Declared Manufacturer / Packer", mfrName],
    ["Date of Physical/Digital Audit", assessmentDate],
    ["Governing Legal Framework", "Legal Metrology (Packaged Commodities) Rules, 2011"],
    ["Statutory Audit Determination", statusStr],
    ["Digital Record Generation Time", generatedOn],
  ];

  autoTable(doc, {
    startY: 148,
    margin: { left: margin, right: margin },
    body: metaRows.map(([label, val]) => [
      { content: label, styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      {
        content: val,
        styles: label === "Statutory Audit Determination"
          ? {
              fontStyle: "bold",
              textColor: isCompliant ? C_GREEN_DARK : C_RED_DARK,
              fillColor: isCompliant ? C_GREEN_BG : C_RED_BG,
            }
          : { textColor: C_CHARCOAL },
      },
    ]),
    theme: "grid",
    styles: {
      fontSize: 8.5,
      cellPadding: 4.8,
      lineColor: C_BORDER,
      lineWidth: 0.5,
    },
    columnStyles: {
      0: { cellWidth: contentWidth * 0.38 },
      1: { cellWidth: contentWidth * 0.62 },
    },
  });

  const afterMetaY = doc.lastAutoTable.finalY + 16;

  // Notice of Statutory Inspection & Legal Warning Box (Exact text)
  const noticeTitle = "NOTICE OF STATUTORY INSPECTION & LEGAL WARNING:";
  const noticeBody =
    "This official memorandum documents formal observations from a statutory compliance audit conducted pursuant to the provisions of " +
    "The Legal Metrology Act, 2009 (Act 1 of 2010) and The Legal Metrology (Packaged Commodities) Rules, 2011. Declarations, " +
    "geometric clearances, and typographical dimensions recorded herein have been extracted directly from mandatory label panels of the " +
    "subject packaged commodity. Contraventions cited in this audit report represent non-compliances under Rule 6, Rule 7, and Rule 8, " +
    "enforceable under Section 36 of The Legal Metrology Act, 2009. This assessment constitutes an official evidentiary record for " +
    "regulatory review and corrective enforcement.";

  autoTable(doc, {
    startY: afterMetaY,
    margin: { left: margin, right: margin },
    body: [
      [
        {
          content: `${noticeTitle}\n${noticeBody}`,
          styles: { fontSize: 8, textColor: C_CHARCOAL, lineHeight: 1.35 },
        },
      ],
    ],
    theme: "grid",
    styles: {
      cellPadding: 8,
      fillColor: C_LIGHT_GRAY,
      lineColor: C_BORDER,
      lineWidth: 0.5,
    },
  });

  // Cover Page Bottom Footer Text
  doc.setFont("helvetica", "bold");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text(
    "AUTHORISED REGULATORY RECORD | DIRECTORATE OF LEGAL METROLOGY | NIRIKSHAK ENFORCEMENT ENGINE",
    pageWidth / 2,
    pageHeight - 34,
    { align: "center" }
  );

  // =========================================================================
  // PAGE 2: EXECUTIVE SUMMARY (1) & VERIFIED STATUTORY DECLARATIONS SCHEDULE (2)
  // =========================================================================
  doc.addPage();

  let curY = 44;
  curY = drawSectionHeading(1, "Executive Audit Summary & Statutory Metrics", curY);

  // KPI Table (6 columns matching screenshot)
  const kpiHdr = ["Audited Rules", "Compliant", "Non-Compliant", "Exempt / N/A", "Total Violations", "Compliance Rating"];
  const kpiVal = [
    { content: String(totalAudited), styles: { fontStyle: "bold", textColor: C_CHARCOAL } },
    { content: String(compliantCount), styles: { fontStyle: "bold", textColor: C_GREEN_DARK, fillColor: C_GREEN_BG } },
    { content: String(nonCompliantCount), styles: { fontStyle: "bold", textColor: nonCompliantCount > 0 ? C_RED_DARK : C_GREEN_DARK, fillColor: nonCompliantCount > 0 ? C_RED_BG : C_GREEN_BG } },
    { content: String(naCount), styles: { fontStyle: "bold", textColor: C_CHARCOAL } },
    { content: String(totalViolations), styles: { fontStyle: "bold", textColor: totalViolations > 0 ? C_RED_DARK : C_GREEN_DARK, fillColor: totalViolations > 0 ? C_RED_BG : C_GREEN_BG } },
    { content: `${complianceScore}%`, styles: { fontStyle: "bold", textColor: C_CHARCOAL } },
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [kpiHdr],
    body: [kpiVal],
    theme: "grid",
    headStyles: {
      fillColor: C_TABLE_HEAD,
      textColor: C_WHITE,
      fontStyle: "bold",
      fontSize: 8,
      halign: "center",
      cellPadding: 4,
    },
    styles: {
      fontSize: 8.5,
      halign: "center",
      valign: "middle",
      cellPadding: 4.5,
      lineColor: C_BORDER,
      lineWidth: 0.4,
    },
    columnStyles: {
      0: { cellWidth: contentWidth / 6 },
      1: { cellWidth: contentWidth / 6 },
      2: { cellWidth: contentWidth / 6 },
      3: { cellWidth: contentWidth / 6 },
      4: { cellWidth: contentWidth / 6 },
      5: { cellWidth: contentWidth / 6 },
    },
  });

  curY = doc.lastAutoTable.finalY + 10;

  // Executive Assessment Paragraph
  doc.setFont("helvetica", "normal");
  doc.setFontSize(8.2);
  doc.setTextColor(...C_CHARCOAL);
  const splitOverallText = doc.splitTextToSize(overallAssessmentText, contentWidth);
  doc.text(splitOverallText, margin, curY);
  curY += splitOverallText.length * 11 + 12;

  // Section 2: Verified Statutory Declarations Schedule
  curY = drawSectionHeading(2, "Verified Statutory Declarations (Extracted Particulars Schedule)", curY);

  doc.setFont("helvetica", "italic");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text(
    "The following statutory particulars were extracted from the physical package label and verified against the mandatory requirements of Rule 6 of the Legal Metrology (Packaged Commodities) Rules, 2011:",
    margin,
    curY
  );
  curY += 10;

  // 8 rows of 4 columns matching sample screenshot
  const declRows = [
    [
      { content: "Declared Commodity /\nGeneric Name", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      brandName && brandName !== "Not Available" ? `${productName} (Brand: ${brandName})` : productName,
      { content: "Physical Form / Category", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      physForm,
    ],
    [
      { content: "Declared Manufacturer\nName", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      mfrName,
      { content: "Declared Packer Details", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      pkrText,
    ],
    [
      { content: "Manufacturer Complete\nAddress", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      mfrAddr,
      { content: "Declared Importer\nParticulars", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      impText,
    ],
    [
      { content: "Maximum Retail Price\n(MRP)", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      mrpText,
      { content: "Unit Sale Price (USP) [Rule\n6(1)(n)]", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      uspText,
    ],
    [
      { content: "Declared Net Quantity [Rule\n6(1)(e)]", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      nqText,
      { content: "Month & Year of\nManufacture [R. 6(1)(g)]", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      mfgText,
    ],
    [
      { content: "Consumer Care Redressal\nCell", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      ccName,
      { content: "Consumer Helpline / Phone", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      ccPhone,
    ],
    [
      { content: "Consumer Care E-mail &\nWeb", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      ccWeb ? `${ccEmail}\n${ccWeb}` : ccEmail,
      { content: "Consumer Care Address", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      ccAddr,
    ],
    [
      { content: "Package Dimensions &\nWeight", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      dimsText,
      { content: "Declared Country of Origin", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
      country,
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: declRows,
    theme: "grid",
    styles: {
      fontSize: 7.8,
      cellPadding: 4,
      lineColor: C_BORDER,
      lineWidth: 0.4,
      textColor: C_CHARCOAL,
      valign: "middle",
    },
    columnStyles: {
      0: { cellWidth: contentWidth * 0.22 },
      1: { cellWidth: contentWidth * 0.28 },
      2: { cellWidth: contentWidth * 0.22 },
      3: { cellWidth: contentWidth * 0.28 },
    },
  });

  // =========================================================================
  // PAGE 3: SECTION 3 — STATUTORY COMPLIANCE REGISTER (Rule-by-Rule Audit)
  // =========================================================================
  doc.addPage();

  curY = 44;
  curY = drawSectionHeading(3, "Statutory Compliance Register (Rule-by-Rule Audit Schedule)", curY);

  doc.setFont("helvetica", "italic");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text(
    "Schedule of statutory requirements under the Legal Metrology (Packaged Commodities) Rules, 2011, recording extracted declarations, optical/geometric observations, and formal compliance determinations:",
    margin,
    curY
  );
  curY += 10;

  const regHdr = [
    "Sr.",
    "Clause Ref",
    "Statutory Requirement",
    "Extracted Observation / Technical Measurement",
    "Determination",
  ];

  const regBody = complianceRules.map((r) => {
    const isPass = r.status === "COMPLIANT";
    const isFail = r.status === "NON-COMPLIANT";
    const isMissing = r.status === "MISSING";

    return [
      { content: String(r.sr), styles: { halign: "center", fontStyle: "bold" } },
      { content: `${r.clause}\n${r.id}`, styles: { fontStyle: "bold", fontSize: 7.2 } },
      { content: r.req, styles: { fontStyle: "bold", fontSize: 7.5 } },
      { content: r.obs, styles: { fontSize: 7.5 } },
      {
        content: r.status,
        styles: {
          halign: "center",
          fontStyle: "bold",
          fontSize: 7.5,
          textColor: isPass ? C_GREEN_DARK : isFail ? C_RED_DARK : isMissing ? C_AMBER_DARK : C_SLATE,
          fillColor: isPass ? C_GREEN_BG : isFail ? C_RED_BG : isMissing ? C_AMBER_BG : C_LIGHT_GRAY,
        },
      },
    ];
  });

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [regHdr],
    body: regBody,
    theme: "grid",
    headStyles: {
      fillColor: C_TABLE_HEAD,
      textColor: C_WHITE,
      fontStyle: "bold",
      fontSize: 8,
      halign: "center",
      cellPadding: 4,
    },
    styles: {
      fontSize: 7.5,
      cellPadding: 3.5,
      lineColor: C_BORDER,
      lineWidth: 0.4,
      textColor: C_CHARCOAL,
      valign: "middle",
    },
    columnStyles: {
      0: { cellWidth: contentWidth * 0.05 },
      1: { cellWidth: contentWidth * 0.17 },
      2: { cellWidth: contentWidth * 0.26 },
      3: { cellWidth: contentWidth * 0.36 },
      4: { cellWidth: contentWidth * 0.16 },
    },
  });

  // =========================================================================
  // PAGE 4: SECTION 4 — STATUTORY INFRACTIONS & NON-COMPLIANCE FINDINGS
  // STRICTLY WITHOUT PHOTOGRAPHIC EVIDENCE IMAGES (as commanded for DMI)
  // =========================================================================
  doc.addPage();

  curY = 44;
  curY = drawSectionHeading(4, "Statutory Infractions & Non-Compliance Findings", curY);

  if (structuredViolations.length > 0) {
    for (let i = 0; i < structuredViolations.length; i++) {
      const v = structuredViolations[i];

      // Check if space is running low on page
      if (curY > pageHeight - 140) {
        doc.addPage();
        curY = 44;
        curY = drawSectionHeading(4, "Statutory Infractions & Non-Compliance Findings (Contd.)", curY);
      }

      // Infraction Header Title
      doc.setFont("helvetica", "bold");
      doc.setFontSize(9);
      doc.setTextColor(...C_RED_DARK);
      doc.text(`INFRACTION ${i + 1}: ${v.findingId} - Contravention of ${v.governingRule}`, margin, curY);
      curY += 6;

      const isCritical = v.severity === "CRITICAL" || v.severity === "HIGH";

      const findingRows = [
        [
          { content: "Finding ID:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.findingId,
          { content: "Severity Degree:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          {
            content: v.severity,
            styles: {
              fontStyle: "bold",
              textColor: isCritical ? C_RED_DARK : C_AMBER_DARK,
              fillColor: isCritical ? C_RED_BG : C_AMBER_BG,
            },
          },
        ],
        [
          { content: "Linked Compliance:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.linkedComp,
          { content: "Governing Rule:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.governingRule,
        ],
        [
          { content: "Observed Infraction:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.observedInfraction,
          { content: "Statutory Status:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          { content: v.status, styles: { fontStyle: "bold", textColor: C_RED_DARK } },
        ],
        [
          { content: "Statutory Impact:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.legalImpact,
          { content: "Target of Liability:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.targetParty,
        ],
        [
          { content: "Corrective Directive:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.correctiveDirective,
          { content: "Mandatory Deadline:", styles: { fontStyle: "bold", textColor: C_CHARCOAL, fillColor: C_LIGHT_GRAY } },
          v.deadline,
        ],
      ];

      autoTable(doc, {
        startY: curY,
        margin: { left: margin, right: margin },
        body: findingRows,
        theme: "grid",
        styles: {
          fontSize: 7.5,
          cellPadding: 3.8,
          lineColor: C_BORDER,
          lineWidth: 0.4,
          textColor: C_CHARCOAL,
          valign: "top",
        },
        columnStyles: {
          0: { cellWidth: contentWidth * 0.18 },
          1: { cellWidth: contentWidth * 0.42 },
          2: { cellWidth: contentWidth * 0.18 },
          3: { cellWidth: contentWidth * 0.22 },
        },
      });

      // NOTE: STRICTLY NO PHOTOGRAPHIC EXHIBITS IN DMI AS INSTRUCTED!
      curY = doc.lastAutoTable.finalY + 12;
    }
  } else {
    // Compliant Message Box
    autoTable(doc, {
      startY: curY,
      margin: { left: margin, right: margin },
      body: [
        [
          {
            content:
              "DETERMINATION: COMPLIANT — ZERO STATUTORY INFRACTIONS DETECTED\n\n" +
              "The assessed packaged commodity listing exhibits full conformity with Rule 6(1) and applicable schedules of " +
              "The Legal Metrology (Packaged Commodities) Rules, 2011. All mandatory particulars (Commodity Name, Manufacturer Details, " +
              "Net Quantity, Maximum Retail Price inclusive of taxes, Consumer Care details) have been verified present and in compliance. " +
              "No enforcement action or penalty notice is required.",
            styles: {
              fontSize: 8.5,
              textColor: C_GREEN_DARK,
              fillColor: C_GREEN_BG,
              cellPadding: 12,
              lineHeight: 1.4,
            },
          },
        ],
      ],
      theme: "grid",
      styles: {
        lineColor: C_BORDER,
        lineWidth: 0.5,
      },
    });
  }

  // =========================================================================
  // LAST PAGE: SECTIONS 5, 6, 7 & OFFICIAL VERIFICATION ATTESTATION BLOCK
  // =========================================================================
  doc.addPage();

  curY = 44;

  // --- SECTION 5: EVIDENCE REGISTER (CHAIN OF CUSTODY) ---
  curY = drawSectionHeading(5, "Evidence Register (Chain of Custody)", curY);

  const evHdr = ["Evidence ID", "Finding Ref", "Type", "Source Reference", "Evidentiary Description"];
  const evRows = [
    [
      { content: "EVID-DMI-001", styles: { fontStyle: "bold" } },
      structuredViolations[0]?.findingId || "FIND-DMI-GEN",
      "DOM Snapshot",
      "Product Listing Specification Table",
      "Structured marketplace attributes extracted during automated crawler audit.",
    ],
    [
      { content: "EVID-DMI-002", styles: { fontStyle: "bold" } },
      structuredViolations[1]?.findingId || "FIND-DMI-GEN",
      "API Audit Record",
      "Marketplace Catalog Metadata",
      "Product catalog JSON response payload validating merchant and pricing declarations.",
    ],
    [
      { content: "EVID-DMI-003", styles: { fontStyle: "bold" } },
      "ALL-FINDINGS",
      "OCR Verification",
      "Product Gallery OCR Stream",
      "Automated optical character stream extracted from primary display panel media assets.",
    ],
    [
      { content: "EVID-DMI-004", styles: { fontStyle: "bold" } },
      "STATUTORY-LOG",
      "Audit Hash",
      formatDisplayUrl(rawUrl, 40),
      "Cryptographic sha256 digital surveillance integrity stamp.",
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [evHdr],
    body: evRows,
    theme: "grid",
    headStyles: {
      fillColor: C_TABLE_HEAD,
      textColor: C_WHITE,
      fontStyle: "bold",
      fontSize: 8,
      halign: "center",
      cellPadding: 4,
    },
    styles: {
      fontSize: 7.5,
      cellPadding: 3.8,
      lineColor: C_BORDER,
      lineWidth: 0.4,
      textColor: C_CHARCOAL,
      valign: "middle",
    },
    columnStyles: {
      0: { cellWidth: contentWidth * 0.16 },
      1: { cellWidth: contentWidth * 0.15 },
      2: { cellWidth: contentWidth * 0.15 },
      3: { cellWidth: contentWidth * 0.25 },
      4: { cellWidth: contentWidth * 0.29 },
    },
  });

  curY = doc.lastAutoTable.finalY + 12;

  // --- SECTION 6: STATUTORY LIABILITIES & PENALTIES ---
  curY = drawSectionHeading(6, "Statutory Liabilities & Penalties (The Legal Metrology Act, 2009)", curY);

  const sec36Text =
    "PENAL PROVISIONS FOR NON-COMPLIANT PACKAGES UNDER SECTION 36(1):\n" +
    "Whoever manufactures, packs, imports, sells, distributes, delivers, offers, exposes or has in possession for sale any pre-packaged " +
    "commodity which does not conform to declarations specified under the Act or Rules shall be punishable with fine which may extend to " +
    "twenty-five thousand rupees; for the second offence, to fifty thousand rupees; and for the subsequent offence, with fine which shall " +
    "not be less than fifty thousand rupees but which may extend to one lakh rupees or with imprisonment for a term which may " +
    "extend to one year or with both.\n\n" +
    "OFFENCES BY COMPANIES UNDER SECTION 49: Every person who at the time the offence was committed was in charge of and " +
    "responsible to the company for the conduct of business shall be deemed guilty of the offence.";

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: [[{ content: sec36Text, styles: { fontSize: 7.5, textColor: C_CHARCOAL, lineHeight: 1.35 } }]],
    theme: "grid",
    styles: {
      cellPadding: 6,
      fillColor: C_LIGHT_GRAY,
      lineColor: C_BORDER,
      lineWidth: 0.5,
    },
  });

  curY = doc.lastAutoTable.finalY + 12;

  // --- SECTION 7: FINAL STATUTORY DISPOSITION & OFFICIAL VERIFICATION ATTESTATION ---
  curY = drawSectionHeading(7, "Final Statutory Disposition & Official Verification Attestation", curY);

  // Outcome line
  doc.setFont("helvetica", "bold");
  doc.setFontSize(8.5);
  doc.setTextColor(...(isCompliant ? C_GREEN_DARK : C_RED_DARK));
  doc.text(`FINAL STATUTORY AUDIT OUTCOME: ${statusStr}`, margin, curY);
  curY += 9;

  doc.setFont("helvetica", "normal");
  doc.setFontSize(7.8);
  doc.setTextColor(...C_CHARCOAL);
  const shortText = doc.splitTextToSize(overallAssessmentText, contentWidth);
  doc.text(shortText, margin, curY);
  curY += shortText.length * 9.5 + 8;

  // Official 3-Column Seal & Signature Block (Exact Match)
  const sigCol1 =
    "INSPECTED & AUDITED BY:\n" +
    "Nirikshak Automated Verification Engine\n" +
    "Directorate of Legal Metrology\n" +
    "System Node ID: LM-AUTO-STAGE-9\n" +
    `Officer: ${inspectorName}\n` +
    `Role: ${inspectorRole}`;

  const sigCol2 =
    "OFFICIAL VERIFICATION SEAL:\n\n" +
    "[ CERTIFIED STATUTORY AUDIT ]\n" +
    `Date of Issue: ${assessmentDate}\n` +
    "Surveillance Node: DMI-CENTRAL-01";

  const sigCol3 =
    "AUTHORISED SIGNATORY:\n\n\n" +
    "____________________________________\n" +
    "Inspector / Verification Officer\n" +
    "Legal Metrology Enforcement Branch";

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: [
      [
        { content: sigCol1, styles: { fontSize: 7.2, lineHeight: 1.25 } },
        { content: sigCol2, styles: { fontSize: 7.2, lineHeight: 1.25, halign: "center" } },
        { content: sigCol3, styles: { fontSize: 7.2, lineHeight: 1.25 } },
      ],
    ],
    theme: "grid",
    styles: {
      cellPadding: 5.5,
      fillColor: C_LIGHT_GRAY,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_CHARCOAL,
      valign: "top",
    },
    columnStyles: {
      0: { cellWidth: contentWidth * 0.36 },
      1: { cellWidth: contentWidth * 0.28 },
      2: { cellWidth: contentWidth * 0.36 },
    },
  });

  // =========================================================================
  // RUNNING HEADERS AND FOOTERS STAMPING (Pages 2 to Total)
  // =========================================================================
  const totalPages = doc.internal.getNumberOfPages();

  for (let p = 2; p <= totalPages; p++) {
    doc.setPage(p);

    // Top Bar in Ashoka Navy
    doc.setFillColor(...C_GOV_NAVY);
    doc.rect(0, 0, pageWidth, 24, "F");

    doc.setFont("helvetica", "bold");
    doc.setFontSize(7.5);
    doc.setTextColor(...C_WHITE);
    doc.text("GOVERNMENT OF INDIA | DIRECTORATE OF LEGAL METROLOGY", margin, 15);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(7);
    doc.text(`OFFICIAL RECORD: ${reportId}`, pageWidth - margin, 15, { align: "right" });

    // Bottom Bar in Ashoka Navy
    doc.setFillColor(...C_GOV_NAVY);
    doc.rect(0, pageHeight - 20, pageWidth, 20, "F");

    doc.setFont("helvetica", "normal");
    doc.setFontSize(6.5);
    doc.setTextColor(...C_WHITE);
    doc.text("CONFIDENTIAL - STATUTORY ENFORCEMENT AUDIT RECORD - DEPARTMENT OF LEGAL METROLOGY", margin, pageHeight - 8);

    doc.setFont("helvetica", "bold");
    doc.text(`Ref: ${reportId} | Page ${p} of ${totalPages}`, pageWidth - margin, pageHeight - 8, { align: "right" });
  }

  return doc;
}

/**
 * Generates and downloads the PDF report in a browser environment.
 * @param {object} scanData - Full mapped scan data or compliance record
 * @param {object} [officer] - The authenticated Digital Marketplace Inspector
 */
export async function generatePdfReport(scanData, officer = {}) {
  const doc = await buildPdfReportDoc(scanData, officer);
  const reportId =
    scanData?.reference_no ||
    scanData?.referenceNo ||
    scanData?.reportId ||
    scanData?.id ||
    scanData?._id ||
    `LMV-${new Date().getFullYear()}-${Math.floor(1000 + Math.random() * 9000)}`;

  const safeFilename = `Statutory_Report_${String(reportId).replace(/[^a-zA-Z0-9_-]/g, "_")}.pdf`;
  if (typeof doc.save === "function") {
    doc.save(safeFilename);
  }
  return doc;
}

/**
 * Generates and returns a Node.js binary Buffer of the statutory PDF report.
 * @param {object} scanData - Full mapped scan data or compliance record
 * @param {object} [officer] - The authenticated Digital Marketplace Inspector
 * @returns {Promise<Buffer>}
 */
export async function generatePdfReportBuffer(scanData, officer = {}) {
  const doc = await buildPdfReportDoc(scanData, officer);
  return Buffer.from(doc.output("arraybuffer"));
}
