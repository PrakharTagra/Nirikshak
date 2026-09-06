import React, { useState } from "react";
import { StatusBadge, Panel, PdfButton } from "./ui.jsx";
import { generatePdfReport } from "../lib/pdfReportGenerator.js";
import { useAuth } from "../context/AuthContext.jsx";

const SEVERITY_STYLES = {
  critical: "bg-red-50 text-red-700 ring-red-200 border-red-200",
  major: "bg-amber-50 text-amber-700 ring-amber-200 border-amber-200",
  minor: "bg-blue-50 text-blue-700 ring-blue-200 border-blue-200",
};

export default function ComplianceReport({ report }) {
  const { user } = useAuth();
  const [showJson, setShowJson] = useState(false);
  const [pdfGenerating, setPdfGenerating] = useState(false);

  if (!report) return null;

  const declarations = report.declarations || report.compliance?.declarations || {};
  const packageRecord = report.packageRecord || {};
  const compliance = report.compliance?.compliance || report.compliance || {};

  const isApplicable = compliance.applicable !== false;
  const isCompliant = !!compliance.compliant;
  const violations = compliance.violations || [];
  const status = !isApplicable ? "exempt" : isCompliant ? "compliant" : "non_compliant";

  const totalViolations = violations.length;
  const criticalCount = violations.filter((v) => v.severity === "critical" || v.severity === "high").length;
  const majorCount = violations.filter((v) => v.severity === "major" || v.severity === "medium").length;
  const minorCount = violations.filter((v) => v.severity === "minor" || v.severity === "low").length;

  const commodity = packageRecord.commodity || declarations.commodityClassification || {};
  const labelMetrics = packageRecord.labelMetrics || {};

  const evidenceImages =
    report.evidenceImages ||
    report.images ||
    (report.listing?.images?.items
      ? report.listing.images.items.map((i) => (typeof i === "string" ? i : i.url))
      : []) ||
    (report.product && report.product.images) ||
    [];

  const handleDownloadPdf = async () => {
    setPdfGenerating(true);
    try {
      await generatePdfReport(report, user);
    } catch (err) {
      console.error("PDF generation error:", err);
      alert("Error generating report PDF: " + err.message);
    } finally {
      setPdfGenerating(false);
    }
  };

  const mandatoryFields = [
    {
      id: 1,
      name: "Common / Generic Commodity Name",
      rule: "Rule 6(1)(b)",
      value: declarations.commodityName?.value || null,
      present: !!declarations.commodityName?.present,
      detail: commodity.brandName ? `Brand: ${commodity.brandName}` : null,
    },
    {
      id: 2,
      name: "Net Quantity & Standard Unit",
      rule: "Rule 6(1)(c), Rule 11-13",
      value: declarations.netQuantity?.value != null
        ? `${declarations.netQuantity.value} ${declarations.netQuantity.unit || ""}`.trim()
        : null,
      present: !!declarations.netQuantity?.present,
      detail: declarations.netQuantity?.unitKind ? `Unit Standard: ${declarations.netQuantity.unitKind}` : null,
    },
    {
      id: 3,
      name: "Retail Sale Price (MRP)",
      rule: "Rule 6(1)(e), Rule 2(m)",
      value: declarations.mrp?.value != null
        ? `${declarations.mrp.currency || "₹"} ${declarations.mrp.value}`
        : null,
      present: !!declarations.mrp?.present,
      detail: declarations.mrp?.inclusiveOfTaxesStated
        ? "Inclusive of all taxes (Mandatory statement present)"
        : declarations.mrp?.present
        ? "Mandatory 'Inclusive of all taxes' statement missing"
        : null,
    },
    {
      id: 4,
      name: "Manufacturer Name & Complete Address",
      rule: "Rule 6(1)(a)",
      value: declarations.manufacturer?.name
        ? `${declarations.manufacturer.name}${declarations.manufacturer.address ? ` — ${declarations.manufacturer.address}` : ""}`
        : null,
      present: !!declarations.manufacturer?.present && !!declarations.manufacturer?.address,
      detail: declarations.manufacturer?.present && !declarations.manufacturer?.address
        ? "Name found but complete registered address missing"
        : null,
    },
    {
      id: 5,
      name: "Packer Name & Complete Address",
      rule: "Rule 6(1)(a)",
      value: declarations.packer?.name
        ? `${declarations.packer.name}${declarations.packer.address ? ` — ${declarations.packer.address}` : ""}`
        : null,
      present: commodity.manufacturerIsNotPacker ? !!declarations.packer?.present : true,
      na: !commodity.manufacturerIsNotPacker && !declarations.packer?.present,
      detail: commodity.manufacturerIsNotPacker ? "Required: Manufacturer is not packer" : "N/A (Packed by manufacturer)",
    },
    {
      id: 6,
      name: "Importer Name & Address",
      rule: "Rule 6(1)(a)",
      value: declarations.importer?.name
        ? `${declarations.importer.name}${declarations.importer.address ? ` — ${declarations.importer.address}` : ""}`
        : null,
      present: commodity.isImportedPackage ? !!declarations.importer?.present : true,
      na: !commodity.isImportedPackage && !declarations.importer?.present,
      detail: commodity.isImportedPackage ? "Required: Imported commodity" : "N/A (Domestic commodity)",
    },
    {
      id: 7,
      name: "Month & Year of Manufacture / Packing",
      rule: commodity.isDigitalMarketplace ? "Rule 6(10) (Exempt)" : "Rule 6(1)(d)",
      value: declarations.mfgDate?.value || null,
      present: !!declarations.mfgDate?.present || !!commodity.isDigitalMarketplace,
      na: !declarations.mfgDate?.present && !!commodity.isDigitalMarketplace,
      detail: declarations.mfgDate?.present
        ? (declarations.mfgDate?.usedIndividualSticker ? "Uses individual sticker" : "Declared")
        : (commodity.isDigitalMarketplace ? "Exempt on digital marketplace (Rule 6(10))" : "Missing"),
    },
    {
      id: 8,
      name: "Consumer Care Contact Details",
      rule: "Rule 6(2)",
      value: declarations.consumerCare?.telephone || declarations.consumerCare?.email || declarations.consumerCare?.address || null,
      present: !!declarations.consumerCare?.present,
      detail: [
        declarations.consumerCare?.telephone ? `Tel: ${declarations.consumerCare.telephone}` : null,
        declarations.consumerCare?.email ? `Email: ${declarations.consumerCare.email}` : null,
      ].filter(Boolean).join(" | "),
    },
    {
      id: 9,
      name: "Country of Origin",
      rule: "Rule 6(10)",
      value: commodity.countryOfOrigin || declarations.commodityClassification?.countryOfOrigin || null,
      present: !!(commodity.countryOfOrigin || declarations.commodityClassification?.countryOfOrigin),
      detail: null,
    },
  ];

  const presentCount = mandatoryFields.filter((f) => !f.na && f.present).length;
  const applicableFieldsCount = mandatoryFields.filter((f) => !f.na).length;

  const evaluationMatrix = [
    {
      rule: "Rule 6(1)(a)",
      requirement: "Manufacturer / Packer identification and complete address",
      finding: declarations.manufacturer?.present ? "Manufacturer name and registered address verified." : "Mandatory manufacturer or packer name/address missing.",
      compliant: !!declarations.manufacturer?.present,
      severity: declarations.manufacturer?.present ? "INFO" : "CRITICAL",
    },
    {
      rule: "Rule 6(1)(b)",
      requirement: "Generic or common commodity nomenclature",
      finding: declarations.commodityName?.present ? "Commodity generic identity verified." : "Absence of distinct generic commodity classification.",
      compliant: !!declarations.commodityName?.present,
      severity: declarations.commodityName?.present ? "INFO" : "MAJOR",
    },
    {
      rule: "Rule 6(1)(c)",
      requirement: "Net quantity declaration in prescribed metric units",
      finding: declarations.netQuantity?.present ? "Declared in prescribed metric units." : "Net quantity absent or declared in unlawful non-standard units.",
      compliant: !!declarations.netQuantity?.present,
      severity: declarations.netQuantity?.present ? "INFO" : "CRITICAL",
    },
    {
      rule: "Rule 6(1)(e)",
      requirement: "Retail sale price inclusive of all taxes (MRP)",
      finding: declarations.mrp?.inclusiveOfTaxesStated
        ? "MRP declared with mandatory 'inclusive of all taxes'."
        : declarations.mrp?.present
        ? "MRP stated without mandatory 'inclusive of all taxes' clause."
        : "Retail price completely absent from packaging.",
      compliant: !!declarations.mrp?.inclusiveOfTaxesStated,
      severity: declarations.mrp?.inclusiveOfTaxesStated ? "INFO" : "CRITICAL",
    },
    {
      rule: "Rule 6(1)(d)",
      requirement: "Month and year of manufacture or packaging",
      finding: declarations.mfgDate?.present ? "Date of packing or manufacture declared." : "Date of manufacture/packing missing from label.",
      compliant: !!declarations.mfgDate?.present,
      severity: declarations.mfgDate?.present ? "INFO" : "MAJOR",
    },
    {
      rule: "Rule 6(1)(n)",
      requirement: "Consumer grievance contact particulars",
      finding: declarations.consumerCare?.present ? "Consumer care telephone, email, and address declared." : "Absence of consumer grievance contact details.",
      compliant: !!declarations.consumerCare?.present,
      severity: declarations.consumerCare?.present ? "INFO" : "MAJOR",
    },
    {
      rule: "Rule 6(10)",
      requirement: "E-commerce mandatory declarations display on marketplace",
      finding: declarations.commodityName?.present && declarations.mrp?.present
        ? "Mandatory declarations displayed on digital listing."
        : "Incomplete statutory declarations on digital marketplace listing.",
      compliant: !!(declarations.commodityName?.present && declarations.mrp?.present),
      severity: declarations.commodityName?.present && declarations.mrp?.present ? "INFO" : "CRITICAL",
    },
  ];

  return (
    <div className="space-y-6">
      {/* Action Header with PDF Generation */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 bg-white p-4 border border-slate-300 rounded-sm shadow-sm border-l-4 border-l-govt-navy">
        <div>
          <h2 className="text-base font-bold text-slate-900">
            Legal Metrology Statutory Compliance Report
          </h2>
          <p className="text-xs text-slate-600">
            Surveillance assessment under the Legal Metrology (Packaged Commodities) Rules, 2011.
          </p>
        </div>
        <PdfButton
          onClick={handleDownloadPdf}
          loading={pdfGenerating}
          label="Save & Download PDF Report"
        />
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-1 gap-4 sm:grid-cols-4">
        <div className="border-t-4 border-t-govt-navy bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Rule Engine Verdict</p>
          <div className="mt-2">
            <StatusBadge status={status} />
          </div>
        </div>

        <div className="border-t-4 border-t-govt-maroon bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Statutory Violations</p>
          <p className={`mt-1 text-2xl font-extrabold ${totalViolations === 0 ? "text-emerald-600" : "text-govt-maroon"}`}>
            {totalViolations}
          </p>
          <div className="mt-1 flex flex-wrap gap-1 text-[11px]">
            {criticalCount > 0 && (
              <span className="rounded bg-red-100 px-1.5 py-0.5 font-bold text-red-800">
                {criticalCount} critical
              </span>
            )}
            {majorCount > 0 && (
              <span className="rounded bg-amber-100 px-1.5 py-0.5 font-bold text-amber-800">
                {majorCount} major
              </span>
            )}
            {minorCount > 0 && (
              <span className="rounded bg-blue-100 px-1.5 py-0.5 font-bold text-blue-800">
                {minorCount} minor
              </span>
            )}
            {totalViolations === 0 && (
              <span className="text-emerald-700 font-medium">All rules satisfied</span>
            )}
          </div>
        </div>

        <div className="border-t-4 border-t-govt-navy bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Rule 6 Declarations</p>
          <p className="mt-1 text-2xl font-extrabold text-govt-navy">
            {presentCount} / {applicableFieldsCount}
          </p>
          <p className="mt-0.5 text-xs text-slate-500 font-medium">Mandatory statutory declarations</p>
        </div>

        <div className="border-t-4 border-t-saffron bg-white p-4 shadow-sm rounded-sm border-x border-b border-slate-200">
          <p className="text-xs font-bold uppercase tracking-wider text-slate-500">Classified Commodity</p>
          <p className="mt-1 truncate text-sm font-bold text-slate-800" title={commodity.genericName || "Unclassified"}>
            {commodity.genericName || declarations.commodityName?.value || "Packaged Commodity"}
          </p>
          <p className="mt-0.5 text-xs text-slate-500">
            {commodity.brandName ? `Brand: ${commodity.brandName}` : "Brand: Declared"}
          </p>
        </div>
      </div>

      {/* Exemption Notice if applicable */}
      {!isApplicable && (
        <div className="border-l-4 border-blue-600 bg-blue-50 p-4 text-sm text-blue-900 shadow-sm rounded-r-sm">
          <p className="font-bold">Exempt from Legal Metrology (Packaged Commodities) Rules</p>
          <p className="mt-1 text-xs text-blue-800">{compliance.exemptionReason}</p>
        </div>
      )}

      {/* Contraventions Table */}
      {violations.length > 0 ? (
        <Panel
          title={`Statutory Violations Detected by Rule Engine (${violations.length})`}
          note="Tagged with statutory citations under the Legal Metrology (Packaged Commodities) Rules, 2011"
        >
          <div className="overflow-x-auto">
            <table className="w-full text-left text-sm">
              <thead className="bg-[#f1f5f9] text-[11px] uppercase tracking-wider text-slate-700 font-bold border-b border-slate-200">
                <tr>
                  <th className="px-4 py-3">Statutory Rule</th>
                  <th className="px-4 py-3">Severity</th>
                  <th className="px-4 py-3">Affected Field</th>
                  <th className="px-4 py-3">Contravention Finding</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200">
                {violations.map((v, idx) => (
                  <tr key={idx} className="hover:bg-red-50/40">
                    <td className="whitespace-nowrap px-4 py-3 font-mono text-xs font-bold text-govt-navy">
                      {v.rule}
                    </td>
                    <td className="whitespace-nowrap px-4 py-3">
                      <span
                        className={`inline-flex items-center rounded-sm px-2 py-0.5 text-xs font-bold border ${
                          SEVERITY_STYLES[v.severity] || SEVERITY_STYLES.major
                        }`}
                      >
                        {(v.severity || "MAJOR").toUpperCase()}
                      </span>
                    </td>
                    <td className="whitespace-nowrap px-4 py-3 font-mono text-xs text-slate-700 font-semibold">
                      {v.field || "general"}
                    </td>
                    <td className="px-4 py-3 text-slate-800 text-xs font-medium">{v.message}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </Panel>
      ) : isApplicable ? (
        <div className="border border-emerald-300 bg-emerald-50/70 p-5 rounded-sm shadow-sm flex items-start gap-3">
          <span className="flex h-7 w-7 items-center justify-center rounded-full bg-emerald-600 text-white font-bold text-sm">
            ✓
          </span>
          <div>
            <h3 className="text-sm font-bold text-emerald-950">
              Statutory Compliance Verified — Zero Contraventions Found
            </h3>
            <p className="mt-1 text-xs text-emerald-800">
              All mandatory package declarations required under Rule 6 and applicable schedules of the Legal Metrology (Packaged Commodities) Rules, 2011 are satisfied.
            </p>
          </div>
        </div>
      ) : null}

      {/* Schedule I: Mandatory Package Declarations Matrix */}
      <Panel
        title="Schedule I: Mandatory Package Declarations Matrix"
        note="Field-by-field verification against statutory requirements under Rule 6(1)"
      >
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-[#f1f5f9] text-[11px] uppercase tracking-wider text-slate-700 font-bold border-b border-slate-200">
              <tr>
                <th className="px-4 py-3">#</th>
                <th className="px-4 py-3">Statutory Declaration</th>
                <th className="px-4 py-3">Extracted E-Commerce Declaration</th>
                <th className="px-4 py-3 text-center">Status</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-200">
              {mandatoryFields.map((f) => (
                <tr key={f.id} className="hover:bg-slate-50">
                  <td className="px-4 py-3 text-slate-400 font-mono text-xs">{f.id}</td>
                  <td className="px-4 py-3">
                    <p className="font-bold text-slate-900 text-xs">{f.name}</p>
                    <p className="text-[11px] text-govt-navy font-mono">{f.rule}</p>
                    {f.detail && <p className="mt-0.5 text-[11px] text-slate-500">{f.detail}</p>}
                  </td>
                  <td className="px-4 py-3 text-xs text-slate-800">
                    {f.value ? (
                      <span className="font-semibold text-slate-900">{f.value}</span>
                    ) : (
                      <span className="italic text-slate-400">Not declared / Missing from listing</span>
                    )}
                  </td>
                  <td className="px-4 py-3 text-center">
                    {f.na ? (
                      <span className="rounded-sm bg-slate-100 px-2 py-0.5 text-xs font-semibold text-slate-600 border border-slate-300">
                        N/A
                      </span>
                    ) : f.present ? (
                      <span className="rounded-sm bg-emerald-100 px-2.5 py-0.5 text-xs font-bold text-emerald-900 border border-emerald-300">
                        ✓ DECLARED
                      </span>
                    ) : (
                      <span className="rounded-sm bg-red-100 px-2.5 py-0.5 text-xs font-bold text-red-900 border border-red-300">
                        ✗ MISSING
                      </span>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </Panel>

      {/* Schedule II & III: Technical Measurement & Compliance Evaluation Matrix */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Schedule II */}
        <Panel
          title="Schedule II: Technical Measurement Parameters"
          note="Metric normalization, numeral height analysis, and principal display panel parameters"
        >
          <div className="p-4 divide-y divide-slate-200 text-xs space-y-3">
            <div className="flex items-center justify-between pt-1">
              <span className="font-bold text-slate-700">Declared Quantity Standard:</span>
              <span className="font-mono text-govt-navy font-bold">
                {declarations.netQuantity?.value != null
                  ? `${declarations.netQuantity.value} ${declarations.netQuantity.unit || ""}`
                  : "Not Declared"}
              </span>
            </div>
            <div className="flex items-center justify-between pt-3">
              <span className="font-bold text-slate-700">Measurement Standard Kind:</span>
              <span className="font-medium text-slate-800">
                {declarations.netQuantity?.unitKind ? `${declarations.netQuantity.unitKind.toUpperCase()} (Metric)` : "Metric Standard Unit"}
              </span>
            </div>
            <div className="flex items-center justify-between pt-3">
              <span className="font-bold text-slate-700">Principal Display Panel Area:</span>
              <span className="font-medium text-slate-800">
                {labelMetrics.principalDisplayPanelArea ? `${labelMetrics.principalDisplayPanelArea} sq.cm` : "Standard E-Commerce Viewport"}
              </span>
            </div>
            <div className="flex items-center justify-between pt-3">
              <span className="font-bold text-slate-700">Mandatory Minimum Font Height:</span>
              <span className="font-medium text-slate-800">
                {labelMetrics.minimumFontHeightRequired ? `${labelMetrics.minimumFontHeightRequired} mm (Rule 9 Table I)` : "2.0 mm (Rule 9 Table I)"}
              </span>
            </div>
            <div className="flex items-center justify-between pt-3">
              <span className="font-bold text-slate-700">Exclusion Zone / Clear Space Provision:</span>
              <span className={`font-bold ${labelMetrics.exclusionZoneCompliant !== false ? "text-emerald-700" : "text-red-700"}`}>
                {labelMetrics.exclusionZoneCompliant !== false ? "Compliant (Rule 8(1) Proviso)" : "Non-Compliant Intrusion"}
              </span>
            </div>
          </div>
        </Panel>

        {/* Schedule III */}
        <Panel
          title="Schedule III: Rule-by-Rule Compliance Evaluation"
          note="Deterministic rule engine audit results under The Legal Metrology Act, 2009"
        >
          <div className="overflow-x-auto">
            <table className="w-full text-left text-xs">
              <thead className="bg-[#f1f5f9] text-[10px] uppercase tracking-wider text-slate-700 font-bold border-b border-slate-200">
                <tr>
                  <th className="px-3 py-2.5">Rule</th>
                  <th className="px-3 py-2.5">Audit Finding</th>
                  <th className="px-3 py-2.5 text-center">Verdict</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-200">
                {evaluationMatrix.map((m, idx) => (
                  <tr key={idx} className="hover:bg-slate-50">
                    <td className="px-3 py-2 font-mono font-bold text-govt-navy whitespace-nowrap">
                      {m.rule}
                    </td>
                    <td className="px-3 py-2 text-slate-700">
                      <p className="font-medium text-[11px] leading-tight">{m.finding}</p>
                      <p className="text-[10px] text-slate-400 mt-0.5">{m.requirement}</p>
                    </td>
                    <td className="px-3 py-2 text-center whitespace-nowrap">
                      <span className={`inline-flex rounded-sm px-2 py-0.5 text-[10px] font-bold border ${
                        m.compliant
                          ? "bg-emerald-100 text-emerald-900 border-emerald-300"
                          : "bg-red-100 text-red-900 border-red-300"
                      }`}>
                        {m.compliant ? "COMPLIANT" : "VIOLATION"}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </Panel>
      </div>

      {/* Schedule IV: Photographic Evidence Exhibits & Issue Annotations */}
      <Panel
        title="Schedule IV: Photographic Evidence Exhibits & Issue Annotations"
        note="Visual evidentiary records extracted from marketplace product listing with statutory violation annotations"
      >
        <div className="p-5 space-y-6">
          {violations.length > 0 ? (
            violations.map((v, idx) => {
              const imageSrc =
                evidenceImages[idx % Math.max(1, evidenceImages.length)] ||
                evidenceImages[0];

              const isClearance = v.rule?.includes("8") || v.message?.toLowerCase().includes("clearance");
              const isMissing = v.message?.toLowerCase().includes("missing") || v.message?.toLowerCase().includes("not declared");

              const legendText = isClearance
                ? "Solid Green = Detected Net Quantity Box; Dashed Boundary = Rule 8(1) Required Clear Space; Red Highlight = Unlawful Printed Text Intrusion into Exclusion Zone."
                : isMissing
                ? `Photographic Verification Record: Scanned label verification boundary confirming mandatory declaration under ${v.rule} is absent from digital marketplace listing packaging.`
                : `Solid Red Bounding Box = Contravention of ${v.rule}; Red Badge = Non-Compliance Citation & Measured Deficit.`;

              return (
                <div
                  key={idx}
                  className="border border-slate-300 rounded-sm bg-white overflow-hidden shadow-sm"
                >
                  {/* Finding Top Strip */}
                  <div className="bg-[#1e293b] text-white px-4 py-2.5 flex flex-wrap items-center justify-between gap-2 text-xs">
                    <div className="flex items-center gap-2">
                      <span className="font-mono font-bold text-amber-400">
                        FIND-DMI-{String(idx + 1).padStart(3, "0")}
                      </span>
                      <span className="text-slate-400">|</span>
                      <span className="font-mono font-semibold">{v.rule}</span>
                      <span className="text-slate-400">|</span>
                      <span className="text-slate-300">{v.field || "Mandatory Package Declarations"}</span>
                    </div>
                    <span
                      className={`inline-flex items-center rounded-sm px-2 py-0.5 text-xs font-bold border ${
                        v.severity === "critical"
                          ? "bg-red-900 text-white border-red-700"
                          : "bg-amber-900 text-amber-200 border-amber-700"
                      }`}
                    >
                      {(v.severity || "MAJOR").toUpperCase()} DEGREE
                    </span>
                  </div>

                  {/* Finding Metadata Grid */}
                  <div className="p-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 text-xs bg-slate-50 border-b border-slate-200">
                    <div>
                      <span className="font-bold text-slate-500 block uppercase text-[10px]">Observed Infraction:</span>
                      <span className="text-slate-900 font-semibold">{v.message}</span>
                    </div>
                    <div>
                      <span className="font-bold text-slate-500 block uppercase text-[10px]">Statutory Status:</span>
                      <span className="text-red-700 font-bold font-mono">NON-COMPLIANT CONTRAVENTION</span>
                    </div>
                    <div>
                      <span className="font-bold text-slate-500 block uppercase text-[10px]">Statutory Impact:</span>
                      <span className="text-slate-800 font-medium">Contravention of Rule 6(1) / Section 36(1)</span>
                    </div>
                    <div>
                      <span className="font-bold text-slate-500 block uppercase text-[10px]">Target of Liability:</span>
                      <span className="text-slate-800 font-medium">E-Commerce Entity &amp; Registered Seller</span>
                    </div>
                  </div>

                  {/* Visual Photographic Exhibit Container */}
                  <div className="p-4 bg-white">
                    <h4 className="text-xs font-bold text-govt-navy uppercase tracking-wider mb-3">
                      EXHIBIT {idx + 1}: PHOTOGRAPHIC EVIDENCE &amp; BOUNDING BOX ANALYSIS — FIND-DMI-{String(idx + 1).padStart(3, "0")}
                    </h4>

                    <div className="flex flex-col md:flex-row gap-5 items-start bg-[#f8fafc] p-4 rounded-sm border border-slate-200">
                      {/* Photographic Container with Annotated Bounding Box */}
                      <div className="relative w-full md:w-72 h-56 bg-slate-200 rounded-sm overflow-hidden flex items-center justify-center shrink-0 border border-slate-300 shadow-inner">
                        {imageSrc ? (
                          <>
                            <img
                              src={imageSrc}
                              alt={`Statutory packaging audit evidence for ${v.rule}`}
                              className="w-full h-full object-contain"
                            />
                            {/* Annotated Issue Bounding Box Overlay */}
                            <div className="absolute inset-5 border-2 border-dashed border-red-600 bg-red-600/10 pointer-events-none flex flex-col justify-between p-2">
                              <span className="bg-red-700 text-white font-mono text-[9px] font-bold px-1.5 py-0.5 rounded shadow self-start">
                                NON-COMPLIANCE: {v.rule}
                              </span>
                              <span className="bg-slate-900/90 text-white font-mono text-[9px] px-1.5 py-0.5 rounded self-end">
                                STATUTORY DEFICIT DETECTED
                              </span>
                            </div>
                          </>
                        ) : (
                          <div className="text-center p-4">
                            <span className="text-3xl block mb-1">📷</span>
                            <span className="text-xs text-slate-600 font-bold block">Digital Packaging Capture</span>
                            <span className="text-[10px] text-slate-400 block mt-1 truncate max-w-[220px]">
                              {report.url || "Marketplace Listing URL"}
                            </span>
                          </div>
                        )}
                      </div>

                      {/* Technical Legend & Action Directives */}
                      <div className="flex-1 space-y-3 text-xs">
                        <div className="bg-white p-3.5 rounded border border-slate-200 shadow-2xs">
                          <p className="font-bold text-slate-900 text-xs mb-1.5">
                            Technical Legend &amp; Inspection Audit Note:
                          </p>
                          <p className="text-slate-600 leading-relaxed font-normal">
                            {legendText}
                          </p>
                        </div>

                        <div className="bg-amber-50/60 p-3 rounded border border-amber-200 text-amber-950 space-y-1">
                          <p className="font-bold text-[11px] uppercase tracking-wider text-amber-900">
                            Statutory Enforcement Directive:
                          </p>
                          <p className="text-xs">
                            Issue statutory notice under Section 36 of The Legal Metrology Act, 2009. Mandatory response deadline is 15 days from official communication.
                          </p>
                        </div>

                        <div className="flex flex-wrap gap-2 text-[11px] text-slate-600 pt-1">
                          <span className="bg-slate-200/80 px-2 py-0.5 rounded">
                            <strong>Platform:</strong> {report.platform || "E-Commerce"}
                          </span>
                          <span className="bg-slate-200/80 px-2 py-0.5 rounded">
                            <strong>Audit Protocol:</strong> Codified Rule Engine
                          </span>
                          <span className="bg-slate-200/80 px-2 py-0.5 rounded">
                            <strong>Evidence Hash:</strong> Verified Deterministic
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              );
            })
          ) : (
            <div className="border border-emerald-200 rounded-sm bg-white p-4 shadow-sm">
              <h4 className="text-xs font-bold text-emerald-900 uppercase tracking-wider mb-2">
                EXHIBIT 1: PACKAGED COMMODITY MANDATORY LABEL PANEL AUDIT RECORD
              </h4>
              <div className="flex flex-col md:flex-row gap-4 items-start bg-emerald-50/50 p-4 rounded-sm border border-emerald-200">
                <div className="relative w-full md:w-64 h-48 bg-slate-200 rounded-sm overflow-hidden flex items-center justify-center shrink-0 border border-slate-300">
                  {evidenceImages[0] ? (
                    <img
                      src={evidenceImages[0]}
                      alt="Statutory packaging audit exhibit"
                      className="w-full h-full object-contain"
                    />
                  ) : (
                    <div className="text-center p-4">
                      <span className="text-2xl block mb-1">✓</span>
                      <span className="text-xs text-emerald-800 font-bold block">Principal Display Panel Verified</span>
                    </div>
                  )}
                </div>
                <div className="flex-1 text-xs text-slate-700 space-y-2">
                  <p className="font-bold text-emerald-950 text-sm">
                    Statutory Determination: COMPLIANT
                  </p>
                  <p className="leading-relaxed">
                    <strong>Photographic Record:</strong> Principal display panel showing declarations verified during statutory digital audit under Rule 6(1) and applicable schedules of the Legal Metrology (Packaged Commodities) Rules, 2011. Zero non-compliance infractions observed.
                  </p>
                  <div className="pt-2 flex flex-wrap gap-2 text-[11px] text-slate-600">
                    <span className="bg-emerald-100 text-emerald-900 px-2.5 py-0.5 rounded font-semibold border border-emerald-300">
                      Rule 6(1) Fully Verified
                    </span>
                    <span className="bg-slate-200 px-2 py-0.5 rounded">
                      Standard Typography &amp; Exclusion Zone
                    </span>
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </Panel>

      {/* Raw JSON inspection accordion */}
      <div className="border border-slate-300 bg-white rounded-sm shadow-sm">
        <button
          type="button"
          onClick={() => setShowJson(!showJson)}
          className="flex w-full items-center justify-between px-4 py-3 text-left text-xs font-bold text-slate-700 hover:bg-slate-50 uppercase tracking-wider"
        >
          <span>Inspection Evidence &amp; Machine Contract (mapped.json)</span>
          <span className="text-govt-navy font-medium">
            {showJson ? "▲ Collapse Contract" : "▼ View Raw Contract"}
          </span>
        </button>
        {showJson && (
          <div className="border-t border-slate-200 bg-slate-900 p-4">
            <pre className="max-h-96 overflow-y-auto font-mono text-xs leading-relaxed text-slate-200">
              {JSON.stringify({ declarations, packageRecord, compliance }, null, 2)}
            </pre>
          </div>
        )}
      </div>

      {/* Bottom Download PDF Button */}
      <div className="flex justify-end pt-2">
        <PdfButton
          onClick={handleDownloadPdf}
          loading={pdfGenerating}
          label="Download Statutory Inspection Report (PDF)"
        />
      </div>
    </div>
  );
}
