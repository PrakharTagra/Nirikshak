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
  const criticalCount = violations.filter((v) => v.severity === "critical").length;
  const majorCount = violations.filter((v) => v.severity === "major").length;
  const minorCount = violations.filter((v) => v.severity === "minor").length;

  const commodity = packageRecord.commodity || declarations.commodityClassification || {};

  const handleDownloadPdf = () => {
    setPdfGenerating(true);
    try {
      generatePdfReport(report, user);
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

      {/* Rule 6 Mandatory Declarations Matrix */}
      <Panel
        title="Rule 6 Mandatory Package Declarations Matrix"
        note="Field-by-field verification against statutory requirements"
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
