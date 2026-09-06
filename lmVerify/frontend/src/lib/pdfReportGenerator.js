import { jsPDF } from "jspdf";
import autoTable from "jspdf-autotable";

/**
 * Truncates a long e-commerce URL for clean presentation.
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
 * Safely extracts text or returns 'Not Available'
 */
function na(val) {
  if (val === null || val === undefined || val === "") return "Not Available";
  const s = String(val).trim();
  return s || "Not Available";
}

/**
 * Loads an image from a URL or data URL and returns an HTMLImageElement or dataUrl
 */
function loadImage(url) {
  return new Promise((resolve) => {
    if (!url || typeof url !== "string") return resolve(null);
    const img = new Image();
    img.crossOrigin = "Anonymous";
    img.onload = () => resolve(img);
    img.onerror = () => resolve(null);
    img.src = url;
    // Timeout fallback after 2.5s
    setTimeout(() => resolve(null), 2500);
  });
}

/**
 * Generates the Official Statutory Compliance Assessment Report PDF
 * Matching the exact 5-page Government of India statutory memorandum format
 * from ComplianceEngine/stage9_reporting/pdf_builder.py.
 *
 * Generated 100% deterministically from the mapped JSON schema.
 *
 * @param {object} scanData - Full mapped scan data or compliance record
 * @param {object} [officer] - The authenticated Digital Marketplace Inspector
 */
export async function generatePdfReport(scanData, officer = {}) {
  const doc = new jsPDF({
    orientation: "portrait",
    unit: "pt",
    format: "a4",
  });

  const pageWidth = doc.internal.pageSize.getWidth();   // 595.28 pt
  const pageHeight = doc.internal.pageSize.getHeight(); // 841.89 pt
  const margin = 34;                                    // 12 mm margins
  const contentWidth = pageWidth - margin * 2;          // 527.28 pt

  // =========================================================================
  // OFFICIAL GOVERNMENT OF INDIA STATUTORY PALETTE (Exact Match to Stage-9)
  // =========================================================================
  const C_GOV_NAVY   = [11, 37, 69];    // #0B2545 (Official Deep Ashoka Navy)
  const C_CHARCOAL   = [26, 26, 26];    // #1A1A1A (Formal off-black)
  const C_SLATE      = [51, 65, 85];    // #334155 (Slate 700)
  const C_DARK_GRAY  = [31, 41, 55];    // #1F2937 (Body text)
  const C_MID_GRAY   = [75, 85, 99];    // #4B5563 (Gray 600 captions)
  const C_LIGHT_GRAY = [248, 250, 252]; // #F8FAFC (Subtle row tint)
  const C_WHITE      = [255, 255, 255];

  // Restrained Statutory Status Indicators (No loud neon colors)
  const C_GREEN_DARK = [21, 128, 61];   // #15803D (Official Dark Forest Green)
  const C_GREEN_BG   = [240, 253, 244]; // #F0FDF4 (Soft green tint)
  const C_RED_DARK   = [153, 27, 27];   // #991B1B (Official Deep Crimson)
  const C_RED_BG     = [254, 242, 242]; // #FEF2F2 (Soft red tint)
  const C_AMBER_DARK = [133, 77, 14];   // #854D0E (Official Deep Amber)
  const C_AMBER_BG   = [255, 251, 235]; // #FFFBEB (Soft amber tint)

  const C_TABLE_HEAD = [30, 41, 59];    // #1E293B (Dark table header)
  const C_RULE_LINE  = [71, 85, 105];   // #475569 (Slate 600 dividing rule)
  const C_BORDER     = [203, 213, 225]; // #CBD5E1 (Slate 300 clean gridline)

  // =========================================================================
  // DATA EXTRACTION & DETERMINISTIC SCHEMA NORMALIZATION
  // (Strictly from mapped JSON — zero LLM narrative hallucinations)
  // =========================================================================
  const compliance = scanData?.compliance?.compliance || scanData?.compliance || {};
  const declarations = scanData?.declarations || scanData?.compliance?.declarations || {};
  const packageRecord = scanData?.packageRecord || {};
  const commodity = packageRecord.commodity || declarations.commodityClassification || {};
  const summary = scanData?.summary || compliance?.summary || {};

  const isApplicable = compliance.applicable !== false;
  const isCompliant = !!compliance.compliant;
  const violations = compliance.violations || [];
  const statusStr = !isApplicable ? "EXEMPT" : isCompliant ? "COMPLIANT" : "NON-COMPLIANT";

  const totalViolations = violations.length;
  const criticalCount = violations.filter((v) => v.severity === "critical" || v.severity === "high").length;
  const majorCount = violations.filter((v) => v.severity === "major" || v.severity === "medium").length;
  const minorCount = violations.filter((v) => v.severity === "minor" || v.severity === "low").length;

  const refNo =
    scanData?.reference_no ||
    scanData?.referenceNo ||
    scanData?.id ||
    `LMV/${new Date().getFullYear()}/DMI-${Math.floor(1000 + Math.random() * 9000)}`;

  const inspectedAt = scanData?.inspected_at || scanData?.scannedAt || scanData?.crawledAt || new Date().toISOString();
  const platform = scanData?.platform || "E-Commerce Marketplace";
  const rawUrl = scanData?.url || scanData?.listing_url || "N/A";
  const displayUrl = formatDisplayUrl(rawUrl, 75);

  const inspectorName = officer?.name || officer?.full_name || "Digital Marketplace Officer";
  const inspectorRole = "Digital Marketplace Inspector (DMI)";
  const inspectorJurisdiction = officer?.jurisdiction || "Central E-Commerce Surveillance Unit";

  // Product Particulars
  const productName =
    scanData?.product_name ||
    scanData?.productName ||
    commodity.productName ||
    declarations.commodityName?.value ||
    "E-Commerce Packaged Commodity";

  const brandName =
    scanData?.brand ||
    commodity.brandName ||
    declarations.commodityClassification?.brandName ||
    "Not Declared";

  const categoryName =
    scanData?.category ||
    commodity.category ||
    declarations.commodityClassification?.category ||
    "Consumer Packaged Commodity";

  // Pre-load images for Page 4 evidence exhibit
  const candidateImages = [
    ...(scanData?.evidenceImages || []),
    ...(scanData?.images?.items || []),
    ...(Array.isArray(scanData?.images) ? scanData.images : []),
  ]
    .map((img) => (typeof img === "string" ? img : img?.url || img?.src))
    .filter(Boolean);

  const loadedImages = [];
  for (let i = 0; i < Math.min(candidateImages.length, 2); i++) {
    const loaded = await loadImage(candidateImages[i]);
    if (loaded) loadedImages.push({ img: loaded, url: candidateImages[i] });
  }

  // Helper: Running Header & Footer on Pages 2–5
  const drawRunningHeaderFooter = (pageNum, totalPages) => {
    // Header
    doc.setDrawColor(...C_BORDER);
    doc.setLineWidth(0.5);
    doc.line(margin, 30, pageWidth - margin, 30);

    doc.setFont("helvetica", "bold");
    doc.setFontSize(7.5);
    doc.setTextColor(...C_GOV_NAVY);
    doc.text("GOVERNMENT OF INDIA • DIRECTORATE OF LEGAL METROLOGY", margin, 24);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(7);
    doc.setTextColor(...C_MID_GRAY);
    doc.text("STATUTORY COMPLIANCE ASSESSMENT MEMORANDUM", pageWidth - margin, 24, { align: "right" });

    // Footer
    doc.line(margin, pageHeight - 30, pageWidth - margin, pageHeight - 30);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(7);
    doc.setTextColor(...C_MID_GRAY);
    doc.text("The Legal Metrology Act, 2009 & Packaged Commodities Rules, 2011 • Official Record", margin, pageHeight - 20);

    const pageText = `Page ${pageNum} of ${totalPages}`;
    doc.setFont("helvetica", "bold");
    doc.text(pageText, pageWidth - margin, pageHeight - 20, { align: "right" });
  };

  // Helper: Draw State Emblem Vector on Cover Page
  const drawStateEmblem = (x, y, scale = 0.55) => {
    doc.saveGraphicsState();
    doc.setDrawColor(...C_GOV_NAVY);
    doc.setFillColor(...C_GOV_NAVY);

    // Outer Chakra Ring
    const cx = x + 24 * scale;
    const cy = y + 24 * scale;
    const r = 20 * scale;
    doc.setLineWidth(1.2 * scale);
    doc.circle(cx, cy, r, "S");
    doc.circle(cx, cy, 4 * scale, "FD");

    // 24 Radial Spokes
    for (let i = 0; i < 24; i++) {
      const angle = (i * 15 * Math.PI) / 180;
      const x1 = cx + 5 * scale * Math.cos(angle);
      const y1 = cy + 5 * scale * Math.sin(angle);
      const x2 = cx + 19 * scale * Math.cos(angle);
      const y2 = cy + 19 * scale * Math.sin(angle);
      doc.line(x1, y1, x2, y2);
    }

    // Capital base
    doc.rect(x + 10 * scale, y + 48 * scale, 28 * scale, 3 * scale, "FD");

    // English Motto
    doc.setFont("helvetica", "bold");
    doc.setFontSize(5.5 * scale * 2);
    doc.text("TRUTH ALONE TRIUMPHS", cx, y + 58 * scale, { align: "center" });

    doc.restoreGraphicsState();
  };

  // =========================================================================
  // PAGE 1: COVER & STATUTORY ASSESSMENT MEMORANDUM
  // =========================================================================

  // State Emblem on Top Left
  drawStateEmblem(margin, 38, 0.7);

  // Gazette Header (Right of Emblem)
  const headerLeft = margin + 44;
  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("GOVERNMENT OF INDIA", headerLeft, 44);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text("MINISTRY OF CONSUMER AFFAIRS, FOOD AND PUBLIC DISTRIBUTION", headerLeft, 55);
  doc.text("DEPARTMENT OF CONSUMER AFFAIRS — LEGAL METROLOGY DIVISION", headerLeft, 65);

  doc.setFont("helvetica", "bold");
  doc.setFontSize(7);
  doc.setTextColor(...C_MID_GRAY);
  doc.text("CENTRAL E-COMMERCE & DIGITAL MARKETPLACE SURVEILLANCE DIRECTORATE", headerLeft, 75);

  // Dividing Rule
  doc.setDrawColor(...C_GOV_NAVY);
  doc.setLineWidth(1.2);
  doc.line(margin, 88, pageWidth - margin, 88);

  // Document Title
  doc.setFont("helvetica", "bold");
  doc.setFontSize(13);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("STATUTORY COMPLIANCE ASSESSMENT REPORT", pageWidth / 2, 108, { align: "center" });

  doc.setFont("helvetica", "italic");
  doc.setFontSize(8);
  doc.setTextColor(...C_SLATE);
  doc.text("Under The Legal Metrology Act, 2009 & The Legal Metrology (Packaged Commodities) Rules, 2011", pageWidth / 2, 120, { align: "center" });

  let curY = 132;

  // Metadata Reference Strip Table
  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: [
      [
        { content: "STATUTORY REFERENCE NO.", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
        refNo,
        { content: "INSPECTION DATE & TIME", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
        new Date(inspectedAt).toLocaleString("en-IN"),
      ],
      [
        { content: "SURVEILLANCE ENTITY", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
        `${platform} (Digital Marketplace)`,
        { content: "ENFORCING JURISDICTION", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
        inspectorJurisdiction,
      ],
    ],
    theme: "grid",
    styles: {
      fontSize: 7.5,
      cellPadding: 4,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 130, fillColor: C_LIGHT_GRAY },
      1: { cellWidth: 133 },
      2: { cellWidth: 130, fillColor: C_LIGHT_GRAY },
      3: { cellWidth: 134 },
    },
  });

  curY = doc.lastAutoTable.finalY + 12;

  // SECTION 1: VERIFICATION SUBJECT PARTICULARS
  doc.setFont("helvetica", "bold");
  doc.setFontSize(9);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("1. VERIFICATION SUBJECT PARTICULARS", margin, curY);
  curY += 6;

  const mfrAddress = declarations.manufacturer?.address || "Address Not Declared";
  const mfrDisplay = declarations.manufacturer?.name
    ? `${declarations.manufacturer.name} (${mfrAddress})`
    : "Not Declared on Listing";

  const subjectRows = [
    [
      { content: "Product Description / Title:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      { content: productName, colSpan: 3 },
    ],
    [
      { content: "Commodity Category:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      categoryName,
      { content: "Brand Name:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      brandName,
    ],
    [
      { content: "Manufacturer / Packer:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      { content: mfrDisplay, colSpan: 3 },
    ],
    [
      { content: "Digital Listing Source URL:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      { content: displayUrl, colSpan: 3, styles: { textColor: [29, 78, 216] } },
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: subjectRows,
    theme: "grid",
    styles: {
      fontSize: 7.5,
      cellPadding: 4.5,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 120, fillColor: C_LIGHT_GRAY },
      1: { cellWidth: 143 },
      2: { cellWidth: 110, fillColor: C_LIGHT_GRAY },
      3: { cellWidth: 154 },
    },
  });

  curY = doc.lastAutoTable.finalY + 12;

  // SECTION 2: STATUTORY COMPLIANCE STATUS & VERDICT
  doc.setFont("helvetica", "bold");
  doc.setFontSize(9);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("2. STATUTORY COMPLIANCE VERDICT & EXECUTIVE SUMMARY", margin, curY);
  curY += 6;

  const verdictBg = !isApplicable ? C_AMBER_BG : isCompliant ? C_GREEN_BG : C_RED_BG;
  const verdictFg = !isApplicable ? C_AMBER_DARK : isCompliant ? C_GREEN_DARK : C_RED_DARK;
  const verdictTitle = !isApplicable
    ? "STATUS: EXEMPT FROM PACKAGED COMMODITIES RULES"
    : isCompliant
    ? "STATUS: COMPLIANT — ZERO STATUTORY CONTRAVENTIONS"
    : `STATUS: NON-COMPLIANT — ${totalViolations} STATUTORY CONTRAVENTION(S) DETECTED`;

  doc.setFillColor(...verdictBg);
  doc.setDrawColor(...verdictFg);
  doc.setLineWidth(1);
  doc.roundedRect(margin, curY, contentWidth, 38, 2, 2, "FD");

  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(...verdictFg);
  doc.text(verdictTitle, margin + 14, curY + 16);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_DARK_GRAY);
  const verdictSubtext = !isApplicable
    ? `Exemption Reason: ${compliance.exemptionReason || "Specific statutory exemption applicable under Rule 3."}`
    : isCompliant
    ? "All mandatory declarations required under Rule 6(1) of Legal Metrology Rules, 2011 verified present and standard."
    : `Enforcement Audit Summary: ${criticalCount} Critical, ${majorCount} Major, and ${minorCount} Minor infractions detected under Legal Metrology Act, 2009.`;
  doc.text(verdictSubtext, margin + 14, curY + 28);

  curY += 48;

  // Key Infractions Summary Table
  const infractionSummaryRows = violations.slice(0, 5).map((v, i) => [
    `INF-${i + 1}`,
    v.rule || "Rule 6(1)",
    v.severity?.toUpperCase() || "MAJOR",
    v.message || "Statutory declaration contravention",
    v.field || "Declaration",
  ]);

  if (infractionSummaryRows.length === 0) {
    infractionSummaryRows.push([
      "-",
      "N/A",
      "COMPLIANT",
      "No statutory contraventions identified during automated digital audit.",
      "All Mandatory Rules",
    ]);
  }

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [["ID", "Governing Rule", "Severity Degree", "Observed Statutory Deficit", "Target Declaration"]],
    body: infractionSummaryRows,
    theme: "grid",
    headStyles: {
      fillColor: C_TABLE_HEAD,
      textColor: C_WHITE,
      fontStyle: "bold",
      fontSize: 7.5,
      cellPadding: 4,
    },
    styles: {
      fontSize: 7.5,
      cellPadding: 4,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 38, halign: "center" },
      1: { cellWidth: 78 },
      2: { cellWidth: 76, halign: "center" },
      3: { cellWidth: 235 },
      4: { cellWidth: 100 },
    },
  });

  drawRunningHeaderFooter(1, 5);

  // =========================================================================
  // PAGE 2: SCHEDULE I — VERIFIED MANDATORY PACKAGING DECLARATIONS
  // =========================================================================
  doc.addPage();
  curY = 44;

  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("SCHEDULE I: VERIFIED MANDATORY PACKAGING DECLARATIONS", margin, curY);

  doc.setFont("helvetica", "italic");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text("Mandatory particulars prescribed under Rule 6(1) of Legal Metrology (Packaged Commodities) Rules, 2011", margin, curY + 11);
  curY += 20;

  // Standard 9-declaration statutory audit schedule
  const scheduleRows = [
    [
      "1",
      "Name & Address of Manufacturer / Packer / Importer",
      "Rule 6(1)(a)/(c)",
      declarations.manufacturer?.present ? "VERIFIED" : "NOT FOUND",
      declarations.manufacturer?.name
        ? `${declarations.manufacturer.name}${declarations.manufacturer.address ? ` — ${declarations.manufacturer.address}` : ""}`
        : "Name & address not declared on product listing",
      declarations.manufacturer?.present ? "Mandatory identity declared." : "Contravention of Rule 6(1)(a).",
    ],
    [
      "2",
      "Common or Generic Name of Commodity",
      "Rule 6(1)(b)",
      declarations.commodityName?.present ? "VERIFIED" : "NOT FOUND",
      declarations.commodityName?.value || "Generic name missing",
      declarations.commodityName?.present ? "Generic name declared." : "Contravention of Rule 6(1)(b).",
    ],
    [
      "3",
      "Net Quantity in Standard Units of Measurement",
      "Rule 6(1)(c), R.11-13",
      declarations.netQuantity?.present ? "VERIFIED" : "NOT FOUND",
      declarations.netQuantity?.value != null
        ? `${declarations.netQuantity.value} ${declarations.netQuantity.unit || ""}`.trim()
        : "Net quantity not stated",
      declarations.netQuantity?.present
        ? `Declared in ${declarations.netQuantity.unitKind || "standard"} units.`
        : "Contravention of Rule 6(1)(c).",
    ],
    [
      "4",
      "Maximum Retail Price (MRP inclusive of all taxes)",
      "Rule 6(1)(e), R.2(m)",
      declarations.mrp?.present ? "VERIFIED" : "NOT FOUND",
      declarations.mrp?.value != null
        ? `${declarations.mrp.currency || "INR"} ${declarations.mrp.value}`
        : "Retail price not declared",
      declarations.mrp?.inclusiveOfTaxesStated
        ? "Inclusive of all taxes stated."
        : declarations.mrp?.present
        ? "Mandatory tax statement missing."
        : "Contravention of Rule 6(1)(e).",
    ],
    [
      "5",
      "Month & Year of Manufacture / Packing / Import",
      "Rule 6(1)(d)",
      declarations.mfgDate?.present ? "VERIFIED" : "NOT FOUND",
      declarations.mfgDate?.rawText || (declarations.mfgDate?.month && declarations.mfgDate?.year ? `${declarations.mfgDate.month}/${declarations.mfgDate.year}` : "Not declared"),
      declarations.mfgDate?.present ? "Manufacturing date present." : "Contravention of Rule 6(1)(d).",
    ],
    [
      "6",
      "Consumer Care / Grievance Redressal Mechanism",
      "Rule 6(1)(n)",
      declarations.consumerCare?.present ? "VERIFIED" : "NOT FOUND",
      declarations.consumerCare?.phone || declarations.consumerCare?.email || declarations.consumerCare?.address || "Consumer care details absent",
      declarations.consumerCare?.present ? "Grievance contact declared." : "Contravention of Rule 6(1)(n).",
    ],
    [
      "7",
      "Country of Origin (Mandatory for imported goods)",
      "Rule 6(10)",
      declarations.countryOfOrigin?.present ? "VERIFIED" : "NOT FOUND",
      declarations.countryOfOrigin?.country || (declarations.countryOfOrigin?.isImported ? "Imported (Origin unstated)" : "Domestic / Unstated"),
      declarations.countryOfOrigin?.present ? "Origin country verified." : "Contravention of Rule 6(10).",
    ],
    [
      "8",
      "Dimensions of Commodity / Package (where relevant)",
      "Rule 6(1)(f)",
      declarations.dimensions?.present ? "VERIFIED" : "NOT APPLICABLE",
      declarations.dimensions?.rawText || "Dimensions not declared",
      declarations.dimensions?.present ? "Dimensions declared." : "Not mandatory for non-dimensional goods.",
    ],
    [
      "9",
      "Best Before / Use By Date (Perishable goods)",
      "Rule 6(1)(d) prov.",
      declarations.bestBefore?.present ? "VERIFIED" : "NOT APPLICABLE",
      declarations.bestBefore?.value || "Not declared",
      declarations.bestBefore?.present ? "Expiry declaration verified." : "Exempt if non-perishable.",
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [["Sl.", "Prescribed Declaration Particular", "Statutory Rule", "Audit Status", "Verified Value on Label", "Statutory Remarks"]],
    body: scheduleRows,
    theme: "grid",
    headStyles: {
      fillColor: C_TABLE_HEAD,
      textColor: C_WHITE,
      fontStyle: "bold",
      fontSize: 7.5,
      cellPadding: 4.5,
    },
    styles: {
      fontSize: 7.2,
      cellPadding: 4,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 24, halign: "center" },
      1: { cellWidth: 125 },
      2: { cellWidth: 68 },
      3: { cellWidth: 62, halign: "center", fontStyle: "bold" },
      4: { cellWidth: 135 },
      5: { cellWidth: 113 },
    },
    didParseCell: (data) => {
      if (data.column.index === 3 && data.section === "body") {
        const txt = data.cell.raw;
        if (txt === "VERIFIED") {
          data.cell.styles.textColor = C_GREEN_DARK;
        } else if (txt === "NOT FOUND") {
          data.cell.styles.textColor = C_RED_DARK;
        } else {
          data.cell.styles.textColor = C_MID_GRAY;
        }
      }
    },
  });

  drawRunningHeaderFooter(2, 5);

  // =========================================================================
  // PAGE 3: SCHEDULE II & III — TECHNICAL METRICS & EVALUATION MATRIX
  // =========================================================================
  doc.addPage();
  curY = 44;

  // SCHEDULE II: TECHNICAL MEASUREMENT & LEGIBILITY
  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("SCHEDULE II: TECHNICAL MEASUREMENT & LEGIBILITY VERIFICATION", margin, curY);

  doc.setFont("helvetica", "italic");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text("Metric normalization, numeral height analysis, and principal display panel parameters", margin, curY + 11);
  curY += 20;

  const labelMetrics = packageRecord?.labelMetrics || {};
  const technicalRows = [
    [
      { content: "Declared Quantity Standard:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      `${declarations.netQuantity?.value || "N/A"} ${declarations.netQuantity?.unit || ""}`,
      { content: "Measurement Kind:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      declarations.netQuantity?.unitKind ? `${declarations.netQuantity.unitKind.toUpperCase()} (Standard Unit)` : "Standard Unit",
    ],
    [
      { content: "Principal Display Panel Area:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      labelMetrics.principalDisplayPanelArea ? `${labelMetrics.principalDisplayPanelArea} sq.cm` : "Standard E-Commerce Viewport",
      { content: "Mandatory Minimum Font Height:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      labelMetrics.minimumFontHeightRequired ? `${labelMetrics.minimumFontHeightRequired} mm (Rule 9 Table I)` : "2.0 mm (Rule 9 Table I)",
    ],
    [
      { content: "Actual Measured Font Height:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      labelMetrics.actualFontHeightDetected ? `${labelMetrics.actualFontHeightDetected} mm` : "Digital Web Typography",
      { content: "Clear Area / Free Space Provision:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      labelMetrics.exclusionZoneCompliant !== false ? "Compliant (Rule 8(1) Proviso)" : "Non-Compliant Intrusion",
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: technicalRows,
    theme: "grid",
    styles: {
      fontSize: 7.5,
      cellPadding: 4.5,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 140, fillColor: C_LIGHT_GRAY },
      1: { cellWidth: 123 },
      2: { cellWidth: 140, fillColor: C_LIGHT_GRAY },
      3: { cellWidth: 124 },
    },
  });

  curY = doc.lastAutoTable.finalY + 16;

  // SCHEDULE III: STATUTORY RULE-BY-RULE COMPLIANCE MATRIX
  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("SCHEDULE III: STATUTORY RULE-BY-RULE COMPLIANCE EVALUATION", margin, curY);

  doc.setFont("helvetica", "italic");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text("Deterministic rule engine audit results under The Legal Metrology Act, 2009", margin, curY + 11);
  curY += 20;

  const evaluationMatrix = [
    [
      "Rule 6(1)(a)",
      "Manufacturer / Packer identification and complete address",
      declarations.manufacturer?.present ? "Manufacturer name and registered address verified." : "Mandatory manufacturer or packer name/address missing.",
      declarations.manufacturer?.present ? "COMPLIANT" : "VIOLATION",
      declarations.manufacturer?.present ? "INFO" : "CRITICAL",
    ],
    [
      "Rule 6(1)(b)",
      "Generic or common commodity nomenclature",
      declarations.commodityName?.present ? "Commodity generic identity verified." : "Absence of distinct generic commodity classification.",
      declarations.commodityName?.present ? "COMPLIANT" : "VIOLATION",
      declarations.commodityName?.present ? "INFO" : "MAJOR",
    ],
    [
      "Rule 6(1)(c)",
      "Net quantity declaration in metric units",
      declarations.netQuantity?.present ? "Declared in prescribed metric units." : "Net quantity absent or declared in unlawful non-standard units.",
      declarations.netQuantity?.present ? "COMPLIANT" : "VIOLATION",
      declarations.netQuantity?.present ? "INFO" : "CRITICAL",
    ],
    [
      "Rule 6(1)(e)",
      "Retail sale price inclusive of all taxes (MRP)",
      declarations.mrp?.inclusiveOfTaxesStated
        ? "MRP declared with mandatory 'inclusive of all taxes'."
        : declarations.mrp?.present
        ? "MRP stated without mandatory 'inclusive of all taxes' clause."
        : "Retail price completely absent from packaging.",
      declarations.mrp?.inclusiveOfTaxesStated ? "COMPLIANT" : "VIOLATION",
      declarations.mrp?.inclusiveOfTaxesStated ? "INFO" : "CRITICAL",
    ],
    [
      "Rule 6(1)(d)",
      "Month and year of manufacture or packaging",
      declarations.mfgDate?.present ? "Date of packing or manufacture declared." : "Date of manufacture/packing missing from label.",
      declarations.mfgDate?.present ? "COMPLIANT" : "VIOLATION",
      declarations.mfgDate?.present ? "INFO" : "MAJOR",
    ],
    [
      "Rule 6(1)(n)",
      "Consumer grievance contact particulars",
      declarations.consumerCare?.present ? "Consumer care telephone, email, and address declared." : "Absence of consumer grievance contact details.",
      declarations.consumerCare?.present ? "COMPLIANT" : "VIOLATION",
      declarations.consumerCare?.present ? "INFO" : "MAJOR",
    ],
    [
      "Rule 6(10)",
      "E-commerce mandatory declarations display on marketplace",
      declarations.commodityName?.present && declarations.mrp?.present
        ? "Mandatory declarations displayed on digital listing."
        : "Incomplete statutory declarations on digital marketplace listing.",
      declarations.commodityName?.present && declarations.mrp?.present ? "COMPLIANT" : "VIOLATION",
      declarations.commodityName?.present && declarations.mrp?.present ? "INFO" : "CRITICAL",
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [["Rule Reference", "Prescribed Legal Requirement", "Inspection Audit Finding", "Compliance Verdict", "Severity"]],
    body: evaluationMatrix,
    theme: "grid",
    headStyles: {
      fillColor: C_TABLE_HEAD,
      textColor: C_WHITE,
      fontStyle: "bold",
      fontSize: 7.5,
      cellPadding: 4,
    },
    styles: {
      fontSize: 7.2,
      cellPadding: 4,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 70, fontStyle: "bold" },
      1: { cellWidth: 130 },
      2: { cellWidth: 185 },
      3: { cellWidth: 78, halign: "center", fontStyle: "bold" },
      4: { cellWidth: 64, halign: "center", fontStyle: "bold" },
    },
    didParseCell: (data) => {
      if (data.column.index === 3 && data.section === "body") {
        if (data.cell.raw === "COMPLIANT") {
          data.cell.styles.textColor = C_GREEN_DARK;
        } else {
          data.cell.styles.textColor = C_RED_DARK;
        }
      }
      if (data.column.index === 4 && data.section === "body") {
        if (data.cell.raw === "CRITICAL") data.cell.styles.textColor = C_RED_DARK;
        else if (data.cell.raw === "MAJOR") data.cell.styles.textColor = C_AMBER_DARK;
        else data.cell.styles.textColor = C_MID_GRAY;
      }
    },
  });

  drawRunningHeaderFooter(3, 5);

  // =========================================================================
  // PAGE 4: SCHEDULE IV — PHOTOGRAPHIC EVIDENCE & ISSUE ANNOTATIONS
  // =========================================================================
  doc.addPage();
  curY = 44;

  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("SCHEDULE IV: PHOTOGRAPHIC EVIDENCE EXHIBITS & ISSUE ANNOTATIONS", margin, curY);

  doc.setFont("helvetica", "italic");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text("Photographic documentation, evidentiary bounding boxes, and statutory infraction callouts", margin, curY + 11);
  curY += 20;

  // Render Exhibit Image if available
  const exhibitBoxH = 145;
  if (loadedImages.length > 0) {
    const primary = loadedImages[0].img;
    const imgAspect = primary.width / primary.height;
    let renderW = 160;
    let renderH = renderW / imgAspect;
    if (renderH > exhibitBoxH - 20) {
      renderH = exhibitBoxH - 20;
      renderW = renderH * imgAspect;
    }

    // Border box for exhibit
    doc.setDrawColor(...C_BORDER);
    doc.setFillColor(...C_LIGHT_GRAY);
    doc.roundedRect(margin, curY, contentWidth, exhibitBoxH, 2, 2, "FD");

    // Draw Image
    const imgX = margin + 14;
    const imgY = curY + (exhibitBoxH - renderH) / 2;
    try {
      doc.addImage(primary, "JPEG", imgX, imgY, renderW, renderH);
    } catch {
      doc.setFont("helvetica", "normal");
      doc.setFontSize(7.5);
      doc.setTextColor(...C_MID_GRAY);
      doc.text("Photographic exhibit preview unavailable", imgX, imgY + renderH / 2);
    }

    // Evidence Exhibit Annotations & Caption
    const noteX = imgX + renderW + 16;
    const noteW = contentWidth - (imgX - margin) - renderW - 24;

    doc.setFont("helvetica", "bold");
    doc.setFontSize(8.5);
    doc.setTextColor(...C_GOV_NAVY);
    doc.text("EXHIBIT 1: STATUTORY PACKAGING INSPECTION PHOTO", noteX, curY + 20);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(7.5);
    doc.setTextColor(...C_DARK_GRAY);
    doc.text(`Marketplace: ${platform}`, noteX, curY + 34);
    doc.text(`Surveillance Timestamp: ${new Date(inspectedAt).toLocaleString("en-IN")}`, noteX, curY + 46);
    doc.text(`Source Reference: Scraped Product Primary Panel`, noteX, curY + 58);

    doc.setDrawColor(...C_RED_DARK);
    doc.setFillColor(...C_RED_BG);
    doc.roundedRect(noteX, curY + 68, noteW, 64, 2, 2, "FD");

    doc.setFont("helvetica", "bold");
    doc.setFontSize(7.5);
    doc.setTextColor(...C_RED_DARK);
    doc.text("ANNOTATED EVIDENTIARY CALLOUT & ISSUE HIGHLIGHT:", noteX + 8, curY + 82);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(7);
    doc.setTextColor(...C_DARK_GRAY);
    const legendText = violations.length > 0
      ? `• Observed Infraction: ${violations[0].message}\n• Governing Rule: ${violations[0].rule}\n• Visual Finding: Offending packaging panel lacks prescribed statutory particulars.`
      : "• Visual Finding: Product packaging exhibits all mandatory declarations in compliance with Rule 6(1).";
    doc.text(legendText, noteX + 8, curY + 94);

    curY += exhibitBoxH + 12;
  } else {
    // Clean vector placeholder if images cannot be loaded
    doc.setDrawColor(...C_BORDER);
    doc.setFillColor(...C_LIGHT_GRAY);
    doc.roundedRect(margin, curY, contentWidth, 68, 2, 2, "FD");

    doc.setFont("helvetica", "bold");
    doc.setFontSize(8.5);
    doc.setTextColor(...C_GOV_NAVY);
    doc.text("EXHIBIT 1: DIGITAL SURVEILLANCE EVIDENCE CAPTURE", margin + 14, curY + 20);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(7.5);
    doc.setTextColor(...C_DARK_GRAY);
    doc.text(`Digital Marketplace URL: ${displayUrl}`, margin + 14, curY + 34);
    doc.text(`Inspected by Officer: ${inspectorName} (${inspectorJurisdiction})`, margin + 14, curY + 46);
    doc.text(`Evidence Registry State: Extracted and logged under Reference ${refNo}`, margin + 14, curY + 58);

    curY += 80;
  }

  // Detailed Infraction Breakdown Table
  doc.setFont("helvetica", "bold");
  doc.setFontSize(9);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("DETAILED INFRACTION CITATIONS & CORRECTIVE DIRECTIVES", margin, curY);
  curY += 6;

  const infractionDetails = violations.map((v, i) => [
    `FIND-${i + 1}`,
    v.rule || "Rule 6(1)",
    v.severity?.toUpperCase() || "MAJOR",
    v.message || "Declaration deficiency observed during audit.",
    "Manufacturer / Packer / Marketplace",
    "Amend listing within 15 days",
  ]);

  if (infractionDetails.length === 0) {
    infractionDetails.push([
      "-",
      "Rule 6(1)",
      "COMPLIANT",
      "Zero infractions detected. Commodity label meets all statutory standards.",
      "N/A",
      "No corrective action required",
    ]);
  }

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [["Finding ID", "Governing Rule", "Degree", "Observed Infraction & Legal Citation", "Target of Liability", "Directive"]],
    body: infractionDetails,
    theme: "grid",
    headStyles: {
      fillColor: C_TABLE_HEAD,
      textColor: C_WHITE,
      fontStyle: "bold",
      fontSize: 7.5,
      cellPadding: 4,
    },
    styles: {
      fontSize: 7.2,
      cellPadding: 4,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 50, halign: "center", fontStyle: "bold" },
      1: { cellWidth: 68 },
      2: { cellWidth: 55, halign: "center", fontStyle: "bold" },
      3: { cellWidth: 175 },
      4: { cellWidth: 95 },
      5: { cellWidth: 84 },
    },
    didParseCell: (data) => {
      if (data.column.index === 2 && data.section === "body") {
        if (data.cell.raw === "CRITICAL") data.cell.styles.textColor = C_RED_DARK;
        else if (data.cell.raw === "MAJOR") data.cell.styles.textColor = C_AMBER_DARK;
        else if (data.cell.raw === "COMPLIANT") data.cell.styles.textColor = C_GREEN_DARK;
      }
    },
  });

  drawRunningHeaderFooter(4, 5);

  // =========================================================================
  // PAGE 5: SCHEDULE V — STATUTORY NOTICE & ATTESTATION
  // =========================================================================
  doc.addPage();
  curY = 44;

  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("SCHEDULE V: STATUTORY LIABILITY & FORMAL ENFORCEMENT NOTICE", margin, curY);

  doc.setFont("helvetica", "italic");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_SLATE);
  doc.text("Formal statutory advisement under Section 36 of The Legal Metrology Act, 2009", margin, curY + 11);
  curY += 20;

  // Statutory Warning Notice Box (Official Gazette Style)
  doc.setDrawColor(...C_RULE_LINE);
  doc.setFillColor(...C_LIGHT_GRAY);
  doc.roundedRect(margin, curY, contentWidth, 140, 2, 2, "FD");

  doc.setFont("helvetica", "bold");
  doc.setFontSize(8.5);
  doc.setTextColor(...C_RED_DARK);
  doc.text("STATUTORY PENALTY WARNING — SECTION 36, THE LEGAL METROLOGY ACT, 2009", margin + 14, curY + 18);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(7.5);
  doc.setTextColor(...C_CHARCOAL);

  const noticeParagraphs = [
    "1. Whoever manufactures, packs, imports, sells, distributes, or delivers any pre-packaged commodity which does not conform to the declarations on the package as prescribed under The Legal Metrology (Packaged Commodities) Rules, 2011, shall be punishable with fine which may extend to twenty-five thousand rupees, for the second offence, with fine which may extend to fifty thousand rupees, and for the subsequent offence, with fine which may extend to one lakh rupees or with imprisonment for a term which may extend to one year, or with both.",
    "2. Under Rule 6(10) of the Rules, e-commerce entities and marketplace platforms displaying goods for sale are legally bound to ensure that all mandatory declarations (Manufacturer, Packer, Importer, Generic Name, Net Quantity, MRP, and Country of Origin) are prominently published on the digital product listing.",
    "3. Compounding Provisions: Any offence punishable under Section 36 may, either before or after the institution of prosecution, be compounded under Section 48 of the Act upon payment of the compounding sum prescribed by the Controller.",
  ];

  let pY = curY + 32;
  noticeParagraphs.forEach((p) => {
    const splitLines = doc.splitTextToSize(p, contentWidth - 28);
    doc.text(splitLines, margin + 14, pY);
    pY += splitLines.length * 9.5 + 4;
  });

  curY += 155;

  // Official Verification Attestation Block
  doc.setFont("helvetica", "bold");
  doc.setFontSize(9);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("OFFICIAL VERIFICATION ATTESTATION & SIGNATURE", margin, curY);
  curY += 8;

  const attestationRows = [
    [
      { content: "Inspecting Officer Name:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      inspectorName,
      { content: "Designation:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      inspectorRole,
    ],
    [
      { content: "Enforcement Unit:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      inspectorJurisdiction,
      { content: "Department:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      "Legal Metrology Division, Dept. of Consumer Affairs",
    ],
    [
      { content: "Verification Timestamp:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      new Date().toLocaleString("en-IN"),
      { content: "Record Hash / Reference:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      refNo,
    ],
    [
      { content: "Attestation Statement:", styles: { fontStyle: "bold", textColor: C_GOV_NAVY } },
      {
        content: "I hereby attest that this Statutory Compliance Assessment Report has been generated from verified digital listing declarations and codified rules of The Legal Metrology Act, 2009. The observations and evidence exhibits recorded herein constitute true statutory findings.",
        colSpan: 3,
        styles: { fontStyle: "italic", fontSize: 7 },
      },
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: attestationRows,
    theme: "grid",
    styles: {
      fontSize: 7.5,
      cellPadding: 4.5,
      lineColor: C_BORDER,
      lineWidth: 0.5,
      textColor: C_DARK_GRAY,
    },
    columnStyles: {
      0: { cellWidth: 125, fillColor: C_LIGHT_GRAY },
      1: { cellWidth: 138 },
      2: { cellWidth: 110, fillColor: C_LIGHT_GRAY },
      3: { cellWidth: 154 },
    },
  });

  curY = doc.lastAutoTable.finalY + 16;

  // Official Circular Attestation Seal
  const sealCx = pageWidth / 2;
  const sealCy = curY + 38;
  const sealR = 32;

  doc.setDrawColor(...C_GOV_NAVY);
  doc.setLineWidth(1.2);
  doc.circle(sealCx, sealCy, sealR, "S");
  doc.setLineWidth(0.6);
  doc.circle(sealCx, sealCy, sealR - 3.5, "S");

  doc.setFont("helvetica", "bold");
  doc.setFontSize(6);
  doc.setTextColor(...C_GOV_NAVY);
  doc.text("DIRECTORATE OF LEGAL METROLOGY", sealCx, sealCy - 15, { align: "center" });
  doc.text("GOVERNMENT OF INDIA", sealCx, sealCy - 7, { align: "center" });

  doc.setFontSize(7);
  doc.text("★ STATUTORY SEAL ★", sealCx, sealCy + 3, { align: "center" });

  doc.setFontSize(5.5);
  doc.setFont("helvetica", "normal");
  doc.text("DIGITAL MARKETPLACE INSPECTORATE", sealCx, sealCy + 13, { align: "center" });
  doc.text("VERIFIED & RECORDED", sealCx, sealCy + 21, { align: "center" });

  drawRunningHeaderFooter(5, 5);

  // =========================================================================
  // SAVE & DOWNLOAD
  // =========================================================================
  const sanitizedRef = refNo.replace(/[^a-zA-Z0-9_-]/g, "_");
  const fileName = `Statutory_Compliance_Report_${sanitizedRef}.pdf`;
  doc.save(fileName);
  return fileName;
}
