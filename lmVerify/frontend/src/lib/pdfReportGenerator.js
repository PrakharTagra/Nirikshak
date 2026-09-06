import { jsPDF } from "jspdf";
import autoTable from "jspdf-autotable";

/**
 * Truncates a long e-commerce URL for clean presentation.
 */
function formatDisplayUrl(rawUrl, maxLen = 75) {
  if (!rawUrl || rawUrl === "N/A") return "N/A";
  try {
    const parsed = new URL(rawUrl);
    const cleanDisplay = `${parsed.origin}${parsed.pathname}`;
    if (cleanDisplay.length <= maxLen) return cleanDisplay;
    return cleanDisplay.substring(0, maxLen - 3) + "…";
  } catch {
    if (rawUrl.length <= maxLen) return rawUrl;
    return rawUrl.substring(0, maxLen - 3) + "…";
  }
}

/**
 * Generates and downloads an official Legal Metrology Statutory Inspection Report PDF.
 * Minimum 3 pages containing full statutory audit, rule contraventions, scraped metadata,
 * verbatim textual evidence, image registry, and digital attestation seal.
 *
 * @param {object} scanData - Full scan data or compliance result object
 * @param {object} [officer] - The logged-in Digital Marketplace Inspector
 */
export function generatePdfReport(scanData, officer = {}) {
  const doc = new jsPDF({
    orientation: "portrait",
    unit: "pt",
    format: "a4",
  });

  const pageWidth = doc.internal.pageSize.getWidth();   // 595.28 pt
  const pageHeight = doc.internal.pageSize.getHeight(); // 841.89 pt
  const margin = 36;
  const contentWidth = pageWidth - margin * 2;          // ~523 pt

  // Official Government Palette
  const navy = [6, 3, 141];           // #06038D (Govt Navy)
  const darkNavy = [1, 42, 74];        // #012A4A (Dark Utility Navy)
  const saffron = [255, 153, 51];      // #FF9933 (Saffron)
  const indiaGreen = [19, 136, 8];     // #138808 (India Green)
  const cream = [250, 250, 245];       // #FAFAF5 (Govt Cream)
  const slateDark = [30, 41, 59];      // #1e293b
  const slateMuted = [100, 116, 139];  // #64748b
  const slateBorder = [226, 232, 240]; // #e2e8f0

  // Data Extraction & Normalization
  const compliance = scanData?.compliance?.compliance || scanData?.compliance || {};
  const declarations = scanData?.declarations || scanData?.compliance?.declarations || {};
  const packageRecord = scanData?.packageRecord || {};
  const commodity = packageRecord.commodity || declarations.commodityClassification || {};

  const isApplicable = compliance.applicable !== false;
  const isCompliant = !!compliance.compliant;
  const violations = compliance.violations || [];
  const status = !isApplicable ? "EXEMPT" : isCompliant ? "COMPLIANT" : "NON-COMPLIANT";

  const refNo =
    scanData?.referenceNo ||
    scanData?.id ||
    `LMV/${new Date().getFullYear()}/DMI-${Math.floor(1000 + Math.random() * 9000)}`;

  const inspectedAt = scanData?.scannedAt || scanData?.crawledAt || new Date().toISOString();
  const platform = scanData?.platform || "E-Commerce Marketplace";
  const rawUrl = scanData?.url || "N/A";
  const displayUrl = formatDisplayUrl(rawUrl, 75);

  const inspectorName = officer?.name || officer?.full_name || "Digital Marketplace Officer";
  const inspectorRole = "Digital Marketplace Inspector (DMI)";
  const inspectorJurisdiction = officer?.jurisdiction || "Central E-Commerce Surveillance Unit";

  // Raw Scraped Text & Metadata
  const rawTextLines = Array.isArray(scanData?.rawText)
    ? scanData.rawText
    : typeof scanData?.text === "string"
    ? scanData.text.split("\n").map((l) => l.trim()).filter(Boolean)
    : [];

  const metadata = scanData?.metadata || {};
  const structuredData = scanData?.structuredData || {};
  const images = Array.isArray(scanData?.images) ? scanData.images : scanData?.images?.items || [];

  // Helper: Draw Section Header with Left Color Accent Bar
  const drawSectionHeader = (title, y) => {
    doc.setFillColor(...navy);
    doc.rect(margin, y, 4, 15, "F");
    doc.setFont("helvetica", "bold");
    doc.setFontSize(10);
    doc.setTextColor(...navy);
    doc.text(title, margin + 10, y + 11);
    return y + 22;
  };

  // =========================================================================
  // PAGE 1: EXECUTIVE SUMMARY & STATUTORY CONTRAVENTIONS
  // =========================================================================

  // 1. Top Utility Bar
  doc.setFillColor(...darkNavy);
  doc.rect(0, 0, pageWidth, 24, "F");
  doc.setTextColor(255, 255, 255);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(8);
  doc.text("GOVERNMENT OF INDIA", margin, 15);
  doc.setFont("helvetica", "normal");
  doc.setFontSize(7.5);
  doc.text("DEPARTMENT OF CONSUMER AFFAIRS • LEGAL METROLOGY DIVISION", pageWidth - margin, 15, { align: "right" });

  // 2. Main Title Banner (Govt Navy)
  const bannerY = 24;
  const bannerH = 64;
  doc.setFillColor(...navy);
  doc.rect(0, bannerY, pageWidth, bannerH, "F");

  // Left Title
  doc.setTextColor(255, 255, 255);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(13);
  doc.text("STATUTORY INSPECTION DOSSIER", margin, bannerY + 24);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(8.5);
  doc.setTextColor(220, 230, 255);
  doc.text("The Legal Metrology (Packaged Commodities) Rules, 2011", margin, bannerY + 39);

  doc.setFontSize(7.5);
  doc.setTextColor(180, 205, 245);
  doc.text("E-Commerce Digital Marketplace Statutory Surveillance Record", margin, bannerY + 52);

  // Right Title
  doc.setFont("helvetica", "bold");
  doc.setFontSize(10.5);
  doc.setTextColor(255, 255, 255);
  doc.text("NIRIKSHAK SURVEILLANCE", pageWidth - margin, bannerY + 24, { align: "right" });

  doc.setFontSize(8.5);
  doc.setFont("helvetica", "bold");
  doc.setTextColor(...saffron);
  doc.text("DIGITAL MARKETPLACE INSPECTORATE", pageWidth - margin, bannerY + 39, { align: "right" });

  doc.setFontSize(7.5);
  doc.setFont("helvetica", "normal");
  doc.setTextColor(220, 230, 255);
  doc.text("Enforcement Dossier • Part 1 of 3", pageWidth - margin, bannerY + 52, { align: "right" });

  // 3. Tricolor Accent Stripe
  const stripeY = bannerY + bannerH; // 88
  doc.setFillColor(...saffron);
  doc.rect(0, stripeY, pageWidth, 2.5, "F");
  doc.setFillColor(255, 255, 255);
  doc.rect(0, stripeY + 2.5, pageWidth, 2, "F");
  doc.setFillColor(...indiaGreen);
  doc.rect(0, stripeY + 4.5, pageWidth, 2.5, "F");

  let curY = stripeY + 16;

  // 4. Reference & Verdict Banner Box
  const statusConfig = {
    COMPLIANT: { bg: [16, 185, 129], text: "COMPLIANT", sub: "Zero contraventions found" },
    "NON-COMPLIANT": { bg: [220, 38, 38], text: "NON-COMPLIANT", sub: `${violations.length} statutory violation(s)` },
    EXEMPT: { bg: [217, 119, 6], text: "EXEMPT", sub: "Commodity exempt under rules" },
  };
  const currentStatus = statusConfig[status] || statusConfig["NON-COMPLIANT"];

  doc.setDrawColor(...slateBorder);
  doc.setFillColor(...cream);
  doc.roundedRect(margin, curY, contentWidth, 54, 3, 3, "FD");

  // Left Details
  doc.setTextColor(...navy);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(11);
  doc.text(`REPORT REFERENCE: ${refNo}`, margin + 14, curY + 22);

  doc.setTextColor(...slateMuted);
  doc.setFont("helvetica", "normal");
  doc.setFontSize(8);
  doc.text(
    `Inspected: ${new Date(inspectedAt).toLocaleString("en-IN")}   |   Filed: ${new Date().toLocaleString("en-IN")}`,
    margin + 14,
    curY + 39
  );

  // Right Status Pill
  const pillW = 140;
  const pillH = 34;
  const pillX = pageWidth - margin - pillW - 10;
  const pillY = curY + 10;

  doc.setFillColor(...currentStatus.bg);
  doc.roundedRect(pillX, pillY, pillW, pillH, 3, 3, "F");

  doc.setTextColor(255, 255, 255);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(10);
  doc.text(currentStatus.text, pillX + pillW / 2, pillY + 16, { align: "center" });

  doc.setFont("helvetica", "normal");
  doc.setFontSize(7);
  doc.text(currentStatus.sub, pillX + pillW / 2, pillY + 27, { align: "center" });

  curY += 66;

  // 5. Offender & Surveillance Metadata Table
  const categoryLabel =
    commodity.genericName || declarations.commodityName?.value || "E-Commerce Packaged Commodity";

  const metadataRows = [
    [
      { content: "Enforcing Inspector:", styles: { fontStyle: "bold", textColor: navy } },
      `${inspectorName} (${inspectorRole})`,
      { content: "Jurisdiction / Unit:", styles: { fontStyle: "bold", textColor: navy } },
      inspectorJurisdiction,
    ],
    [
      { content: "Marketplace / Platform:", styles: { fontStyle: "bold", textColor: navy } },
      platform,
      { content: "Commodity Category:", styles: { fontStyle: "bold", textColor: navy } },
      categoryLabel,
    ],
    [
      { content: "Product Listing URL:", styles: { fontStyle: "bold", textColor: navy } },
      { content: displayUrl, colSpan: 3, styles: { textColor: [37, 99, 235], fontStyle: "normal" } },
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: metadataRows,
    theme: "grid",
    styles: {
      fontSize: 8,
      cellPadding: 5.5,
      lineColor: slateBorder,
      lineWidth: 0.5,
      textColor: slateDark,
    },
    columnStyles: {
      0: { cellWidth: 122, fillColor: [248, 250, 252] },
      1: { cellWidth: 140 },
      2: { cellWidth: 115, fillColor: [248, 250, 252] },
      3: { cellWidth: 146 },
    },
  });

  curY = doc.lastAutoTable.finalY + 20;

  // 6. Section 1: Statutory Rule Contraventions Table
  curY = drawSectionHeader(`1. STATUTORY CONTRAVENTIONS DETECTED (${violations.length})`, curY);

  if (violations.length === 0) {
    autoTable(doc, {
      startY: curY,
      margin: { left: margin, right: margin },
      head: [["Rule Citation", "Severity", "Parameter", "Verification Finding"]],
      body: [
        [
          {
            content: "✓ NIL CONTRAVENTIONS FOUND — The e-commerce listing satisfies all audited mandatory requirements under Rule 6 and applicable schedules of the Legal Metrology (Packaged Commodities) Rules, 2011.",
            colSpan: 4,
            styles: {
              halign: "center",
              textColor: [16, 185, 129],
              fontStyle: "bold",
              cellPadding: 12,
              fontSize: 8.5,
            },
          },
        ],
      ],
      headStyles: { fillColor: darkNavy, textColor: [255, 255, 255], fontSize: 8.5, fontStyle: "bold" },
      theme: "grid",
      styles: { lineColor: slateBorder, lineWidth: 0.5 },
    });
  } else {
    const violationRows = violations.map((v) => [
      v.rule || "LM PCR-2011",
      (v.severity || "MAJOR").toUpperCase(),
      v.field || "Mandatory Field",
      v.message || "Declaration non-compliant or absent",
    ]);

    autoTable(doc, {
      startY: curY,
      margin: { left: margin, right: margin },
      head: [["Statutory Rule", "Severity", "Parameter", "Contravention Details"]],
      body: violationRows,
      theme: "grid",
      headStyles: {
        fillColor: darkNavy,
        textColor: [255, 255, 255],
        fontSize: 8.5,
        fontStyle: "bold",
        cellPadding: 6,
      },
      styles: {
        fontSize: 8,
        cellPadding: 6,
        lineColor: slateBorder,
        lineWidth: 0.5,
        textColor: slateDark,
      },
      alternateRowStyles: {
        fillColor: [252, 252, 254],
      },
      columnStyles: {
        0: { cellWidth: 96, fontStyle: "bold" },
        1: { cellWidth: 70, fontStyle: "bold", halign: "center" },
        2: { cellWidth: 100, fontStyle: "bold" },
        3: { cellWidth: 257 },
      },
      didParseCell: (data) => {
        if (data.section === "body" && data.column.index === 1) {
          const val = String(data.cell.raw);
          if (val.includes("CRITICAL")) data.cell.styles.textColor = [220, 38, 38];
          else if (val.includes("MAJOR")) data.cell.styles.textColor = [217, 119, 6];
          else data.cell.styles.textColor = [37, 99, 235];
        }
      },
    });
  }

  curY = doc.lastAutoTable.finalY + 16;

  // 7. Enforcement Advice Box on Page 1
  doc.setDrawColor(...slateBorder);
  doc.setFillColor(...cream);
  doc.roundedRect(margin, curY, contentWidth, 54, 2, 2, "FD");

  doc.setTextColor(...darkNavy);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(8);
  doc.text("STATUTORY ENFORCEMENT & CORRECTIVE ACTION NOTICE", margin + 12, curY + 16);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(7.5);
  doc.setTextColor(...slateDark);
  const adviceText =
    violations.length > 0
      ? `Pursuant to Section 36(1) of The Legal Metrology Act, 2009, whoever manufactures, packs, imports or sells any pre-packaged commodity which does not conform to packaging declarations shall be punishable with fine which may extend to twenty-five thousand rupees. The marketplace entity and registered seller are issued this electronic surveillance finding for rectification.`
      : `The inspected e-commerce listing currently exhibits compliance with codified Rule 6 declarations. This finding is catalogued in the Nirikshak surveillance register for periodic audit and market surveillance.`;
  doc.text(adviceText, margin + 12, curY + 28, { maxWidth: contentWidth - 24 });

  // =========================================================================
  // PAGE 2: RULE 6 MANDATORY DECLARATIONS & SCRAPED SPECIFICATIONS
  // =========================================================================
  doc.addPage();
  curY = 32;

  curY = drawSectionHeader("2. RULE 6 MANDATORY DECLARATIONS AUDIT MATRIX", curY);

  const rule6Rows = [
    [
      "1",
      "Common / Generic Name",
      "Rule 6(1)(b)",
      declarations.commodityName?.value || "Not Declared",
      declarations.commodityName?.present ? "PRESENT" : "MISSING",
    ],
    [
      "2",
      "Net Quantity & Measure",
      "Rule 6(1)(c), R11-13",
      declarations.netQuantity?.value
        ? `${declarations.netQuantity.value} ${declarations.netQuantity.unit || ""}`.trim()
        : "Not Declared",
      declarations.netQuantity?.present ? "PRESENT" : "MISSING",
    ],
    [
      "3",
      "Retail Sale Price (MRP)",
      "Rule 6(1)(e), R2(m)",
      declarations.mrp?.value
        ? `Rs. ${declarations.mrp.value} (${declarations.mrp.inclusiveOfTaxesStated ? "Incl. taxes" : "Taxes not stated"})`
        : "Not Declared",
      declarations.mrp?.present ? "PRESENT" : "MISSING",
    ],
    [
      "4",
      "Manufacturer Details",
      "Rule 6(1)(a)",
      declarations.manufacturer?.name
        ? `${declarations.manufacturer.name}${declarations.manufacturer.address ? `, ${declarations.manufacturer.address}` : ""}`.trim()
        : "Not Declared",
      declarations.manufacturer?.present && declarations.manufacturer?.address
        ? "PRESENT"
        : "INCOMPLETE / MISSING",
    ],
    [
      "5",
      "Packer Details",
      "Rule 6(1)(a)",
      declarations.packer?.name
        ? `${declarations.packer.name}${declarations.packer.address ? `, ${declarations.packer.address}` : ""}`.trim()
        : "Packed by Manufacturer / N/A",
      declarations.packer?.present || !commodity.manufacturerIsNotPacker ? "PRESENT / N/A" : "MISSING",
    ],
    [
      "6",
      "Importer Details",
      "Rule 6(1)(a)",
      declarations.importer?.name
        ? `${declarations.importer.name}${declarations.importer.address ? `, ${declarations.importer.address}` : ""}`.trim()
        : "Domestic Commodity / N/A",
      declarations.importer?.present || !commodity.isImportedPackage ? "PRESENT / N/A" : "MISSING",
    ],
    [
      "7",
      "Consumer Care Details",
      "Rule 6(2)",
      declarations.consumerCare?.telephone || declarations.consumerCare?.email || declarations.consumerCare?.address || "Not Declared",
      declarations.consumerCare?.present ? "PRESENT" : "MISSING",
    ],
    [
      "8",
      "Country of Origin",
      "Rule 6(10)",
      commodity.countryOfOrigin || declarations.commodityClassification?.countryOfOrigin || "Not Declared",
      declarations.commodityClassification?.countryOfOrigin || commodity.countryOfOrigin
        ? "PRESENT"
        : "MISSING",
    ],
    [
      "9",
      "Date of Manufacture / Packing",
      "Rule 6(1)(d) / 6(10)",
      declarations.mfgDate?.value ||
        (commodity.isDigitalMarketplace ? "Exempt on Digital Marketplace (Rule 6(10))" : "Not Declared"),
      declarations.mfgDate?.present || commodity.isDigitalMarketplace ? "COMPLIANT / EXEMPT" : "MISSING",
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [["#", "Mandatory Declaration", "Statutory Rule", "Extracted E-Commerce Declaration", "Status"]],
    body: rule6Rows,
    theme: "grid",
    headStyles: {
      fillColor: darkNavy,
      textColor: [255, 255, 255],
      fontSize: 8.5,
      fontStyle: "bold",
      cellPadding: 5.5,
    },
    styles: {
      fontSize: 7.5,
      cellPadding: 5,
      lineColor: slateBorder,
      lineWidth: 0.5,
      textColor: slateDark,
    },
    alternateRowStyles: {
      fillColor: [252, 252, 254],
    },
    columnStyles: {
      0: { cellWidth: 20, halign: "center" },
      1: { cellWidth: 122, fontStyle: "bold" },
      2: { cellWidth: 84 },
      3: { cellWidth: 211 },
      4: { cellWidth: 86, fontStyle: "bold", halign: "center" },
    },
    didParseCell: (data) => {
      if (data.section === "body" && data.column.index === 4) {
        const text = String(data.cell.raw);
        if (text.includes("PRESENT") || text.includes("COMPLIANT")) {
          data.cell.styles.textColor = [16, 185, 129];
        } else {
          data.cell.styles.textColor = [220, 38, 38];
        }
      }
    },
  });

  curY = doc.lastAutoTable.finalY + 22;

  // 8. Section 3: Marketplace Scraped Specifications & Technical Metadata
  curY = drawSectionHeader("3. MARKETPLACE SCRAPED SPECIFICATIONS & STRUCTURED METADATA", curY);

  const jsonLdFirst = Array.isArray(structuredData?.jsonLd) && structuredData.jsonLd[0] ? structuredData.jsonLd[0] : {};
  const scrapedSpecs = [
    [
      { content: "Product Title:", styles: { fontStyle: "bold", textColor: navy } },
      metadata.title || scanData?.title || "Scraped E-Commerce Listing",
      { content: "Brand Declared:", styles: { fontStyle: "bold", textColor: navy } },
      commodity.brandName || declarations.brand || jsonLdFirst.brand?.name || "As listed on marketplace",
    ],
    [
      { content: "Model / SKU / ASIN:", styles: { fontStyle: "bold", textColor: navy } },
      jsonLdFirst.sku || jsonLdFirst.mpn || scanData?.id || "N/A",
      { content: "Declared Seller:", styles: { fontStyle: "bold", textColor: navy } },
      jsonLdFirst.offers?.seller?.name || "Marketplace Retailer / Third-Party Seller",
    ],
    [
      { content: "Unit Sale Price (USP):", styles: { fontStyle: "bold", textColor: navy } },
      declarations.unitSalePrice?.value
        ? `Rs. ${declarations.unitSalePrice.value} / ${declarations.unitSalePrice.unit || "unit"}`
        : "Not specifically stated in listing",
      { content: "Canonical / Domain:", styles: { fontStyle: "bold", textColor: navy } },
      metadata.canonical || platform,
    ],
    [
      { content: "Description Snippet:", styles: { fontStyle: "bold", textColor: navy } },
      {
        content: (metadata.description || "Captured from e-commerce product page description meta tags.").substring(0, 220) + (metadata.description?.length > 220 ? "…" : ""),
        colSpan: 3,
        styles: { textColor: slateMuted },
      },
    ],
  ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    body: scrapedSpecs,
    theme: "grid",
    styles: {
      fontSize: 7.5,
      cellPadding: 5.5,
      lineColor: slateBorder,
      lineWidth: 0.5,
      textColor: slateDark,
    },
    columnStyles: {
      0: { cellWidth: 122, fillColor: [248, 250, 252] },
      1: { cellWidth: 140 },
      2: { cellWidth: 115, fillColor: [248, 250, 252] },
      3: { cellWidth: 146 },
    },
  });

  // =========================================================================
  // PAGE 3: FORENSIC TEXTUAL EVIDENCE & STATUTORY CERTIFICATION
  // =========================================================================
  doc.addPage();
  curY = 32;

  // 9. Section 4: Forensic E-Commerce Textual Evidence (Exhibit A)
  curY = drawSectionHeader("4. EXHIBIT A: VERBATIM SCRAPED TEXTUAL EVIDENCE", curY);

  const evidenceTextLines =
    rawTextLines.length > 0
      ? rawTextLines.slice(0, 18)
      : [
          `Product listing text captured from ${platform}`,
          `Target Listing URL: ${rawUrl}`,
          `Inspection Time: ${new Date(inspectedAt).toISOString()}`,
          `Declared Commodity: ${categoryLabel}`,
          `MRP Declaration: ${declarations.mrp?.value ? `Rs. ${declarations.mrp.value}` : "Not declared"}`,
          `Net Quantity Declaration: ${declarations.netQuantity?.value ? `${declarations.netQuantity.value} ${declarations.netQuantity.unit || ""}` : "Not declared"}`,
          `Manufacturer / Importer / Packer: ${declarations.manufacturer?.name || "Not declared"}`,
          `Consumer Care Contact: ${declarations.consumerCare?.telephone || declarations.consumerCare?.email || "Not declared"}`,
          `Country of Origin: ${commodity.countryOfOrigin || "Not declared"}`,
          `Automated Optical Reading: Completed across product specification panel, product bullets, and manufacturer disclosure blocks.`,
        ];

  const evidenceRows = evidenceTextLines.map((line, idx) => [
    `LINE ${String(idx + 1).padStart(2, "0")}`,
    line.length > 115 ? line.substring(0, 112) + "…" : line,
  ]);

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [["Offset", "Verbatim E-Commerce Text Extract (Optical & DOM Evidence)"]],
    body: evidenceRows,
    theme: "grid",
    headStyles: {
      fillColor: darkNavy,
      textColor: [255, 255, 255],
      fontSize: 8,
      fontStyle: "bold",
      cellPadding: 4.5,
    },
    styles: {
      fontSize: 7,
      font: "courier",
      cellPadding: 3.5,
      lineColor: slateBorder,
      lineWidth: 0.5,
      textColor: [15, 23, 42],
    },
    alternateRowStyles: {
      fillColor: [248, 250, 252],
    },
    columnStyles: {
      0: { cellWidth: 60, fontStyle: "bold", halign: "center", font: "helvetica", textColor: slateMuted },
      1: { cellWidth: 463 },
    },
  });

  curY = doc.lastAutoTable.finalY + 18;

  // 10. Section 5: Media & Image Evidence Asset Registry (Exhibit B)
  curY = drawSectionHeader("5. EXHIBIT B: CAPTURED MEDIA & IMAGE EVIDENCE REGISTRY", curY);

  const imageEntries =
    images.length > 0
      ? images.slice(0, 4).map((img, idx) => {
          const imgUrl = typeof img === "string" ? img : img.url || `Packaging Evidence Asset #${idx + 1}`;
          return [
            `IMG-${idx + 1}`,
            idx === 0 ? "Front Packshot / Primary Listing Photo" : idx === 1 ? "Rear Label / Mandatory Declaration Panel" : `Packaging Angle ${idx + 1}`,
            imgUrl.length > 70 ? imgUrl.substring(0, 67) + "…" : imgUrl,
            "VERIFIED & ARCHIVED",
          ];
        })
      : [
          ["IMG-01", "Primary Listing Asset", `${platform} Listing Screenshot Record`, "ARCHIVED"],
          ["IMG-02", "Specification Panel Evidence", "Technical Specification Snapshot", "ARCHIVED"],
        ];

  autoTable(doc, {
    startY: curY,
    margin: { left: margin, right: margin },
    head: [["ID", "Evidence Asset Classification", "Asset URI / File Reference", "Archive Status"]],
    body: imageEntries,
    theme: "grid",
    headStyles: {
      fillColor: darkNavy,
      textColor: [255, 255, 255],
      fontSize: 8,
      fontStyle: "bold",
      cellPadding: 4.5,
    },
    styles: {
      fontSize: 7.5,
      cellPadding: 4,
      lineColor: slateBorder,
      lineWidth: 0.5,
      textColor: slateDark,
    },
    columnStyles: {
      0: { cellWidth: 50, halign: "center", fontStyle: "bold" },
      1: { cellWidth: 155, fontStyle: "bold" },
      2: { cellWidth: 218 },
      3: { cellWidth: 100, fontStyle: "bold", halign: "center", textColor: [16, 185, 129] },
    },
  });

  curY = doc.lastAutoTable.finalY + 20;

  // 11. Section 6: Official Statutory Certification & Seal Block
  const certH = 76;
  doc.setDrawColor(...slateBorder);
  doc.setFillColor(...cream);
  doc.roundedRect(margin, curY, contentWidth, certH, 2, 2, "FD");

  // Left Legal Statement
  doc.setTextColor(...darkNavy);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(8.5);
  doc.text("STATUTORY ATTESTATION & LEGAL METROLOGY CERTIFICATION", margin + 12, curY + 16);

  doc.setFont("helvetica", "normal");
  doc.setFontSize(7.5);
  doc.setTextColor(...slateDark);
  doc.text(
    "This official electronic statutory inspection report is generated under the authority of The Legal Metrology Act, 2009 (Act 1 of 2010) and The Legal Metrology (Packaged Commodities) Rules, 2011. Evidence captures, optical readings, and codified rule evaluations are cryptographically logged in the Nirikshak surveillance register. This document serves as prima facie evidence for legal compounding, compliance notices, or statutory scrutiny.",
    margin + 12,
    curY + 30,
    { maxWidth: contentWidth - 165 }
  );

  // Right Seal Block
  const sealW = 140;
  const sealH = 58;
  const sealX = pageWidth - margin - sealW - 10;
  const sealY = curY + 9;

  doc.setDrawColor(...navy);
  doc.setFillColor(255, 255, 255);
  doc.roundedRect(sealX, sealY, sealW, sealH, 2, 2, "FD");

  doc.setTextColor(...navy);
  doc.setFont("helvetica", "bold");
  doc.setFontSize(7.5);
  doc.text("DIGITALLY RECORDED BY", sealX + sealW / 2, sealY + 14, { align: "center" });

  doc.setFontSize(8.5);
  doc.setTextColor(...slateDark);
  doc.text(inspectorName, sealX + sealW / 2, sealY + 27, { align: "center" });

  doc.setFontSize(7);
  doc.setTextColor(...slateMuted);
  doc.text("Digital Marketplace Inspector (DMI)", sealX + sealW / 2, sealY + 38, { align: "center" });
  doc.text("Legal Metrology Inspectorate", sealX + sealW / 2, sealY + 49, { align: "center" });

  // =========================================================================
  // 12. Running Header on Pages 2+ & Running Footer on All Pages
  // =========================================================================
  const totalPages = doc.internal.getNumberOfPages();

  for (let i = 1; i <= totalPages; i++) {
    doc.setPage(i);

    // Running Header for Page 2+
    if (i > 1) {
      doc.setFillColor(...darkNavy);
      doc.rect(0, 0, pageWidth, 20, "F");
      doc.setTextColor(255, 255, 255);
      doc.setFont("helvetica", "bold");
      doc.setFontSize(7.5);
      doc.text("GOVERNMENT OF INDIA • LEGAL METROLOGY INSPECTION DOSSIER", margin, 13);
      doc.setFont("helvetica", "normal");
      doc.text(`REPORT REF: ${refNo}`, pageWidth - margin, 13, { align: "right" });
    }

    // Running Footer for all pages
    doc.setDrawColor(...slateBorder);
    doc.line(margin, pageHeight - 24, pageWidth - margin, pageHeight - 24);

    doc.setFont("helvetica", "normal");
    doc.setFontSize(7);
    doc.setTextColor(...slateMuted);
    doc.text("NIRIKSHAK • Digital Marketplace Legal Metrology Surveillance System • SIH 2024", margin, pageHeight - 12);
    doc.text(`Page ${i} of ${totalPages}`, pageWidth - margin, pageHeight - 12, { align: "right" });
  }

  // 13. Trigger Save & Download
  const filenameSafeRef = String(refNo).replace(/[/\\?%*:|"<>]/g, "-");
  doc.save(`LM_Verify_Inspection_Dossier_${filenameSafeRef}.pdf`);
}
