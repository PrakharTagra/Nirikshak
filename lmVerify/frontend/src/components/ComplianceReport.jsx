import React, { useState } from "react";
import ComplianceBadge from "./ComplianceBadge.jsx";
import StatusBadge from "./StatusBadge.jsx";

const SEVERITY_STYLES = {
  critical: "bg-red-50 text-red-700 ring-red-200 border-red-200",
  major: "bg-amber-50 text-amber-700 ring-amber-200 border-amber-200",
  minor: "bg-blue-50 text-blue-700 ring-blue-200 border-blue-200",
};

/**
 * ComplianceReport
 *
 * Renders the results of the codified Legal Metrology rule engine and
 * Stage 5/6 mapping flow from ComplianceEngine.
 */
export default function ComplianceReport({ report }) {
  const [showJson, setShowJson] = useState(false);

  if (!report) return null;

  // Handle both formats: direct pipeline result or nested report
  const declarations = report.declarations || report.compliance?.declarations || {};
  const packageRecord = report.packageRecord || {};
  const compliance = report.compliance?.compliance || report.compliance || {};
  const summary = report.summary || {};

  const isApplicable = compliance.applicable !== false;
  const isCompliant = !!compliance.compliant;
  const violations = compliance.violations || [];
  const status = !isApplicable
    ? "exempt"
    : isCompliant
    ? "compliant"
    : "non_compliant";

  const totalViolations = violations.length;
  const criticalCount = violations.filter((v) => v.severity === "critical").length;
  const majorCount = violations.filter((v) => v.severity === "major").length;
  const minorCount = violations.filter((v) => v.severity === "minor").length;

  const commodity = packageRecord.commodity || declarations.commodityClassification || {};

  // Build rows for Rule 6 mandatory declarations table
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
      name: "Net Quantity",
      rule: "Rule 6(1)(c), Rule 11-13",
      value: declarations.netQuantity?.value != null
        ? `${declarations.netQuantity.value} ${declarations.netQuantity.unit || ""}`.trim()
        : null,
      present: !!declarations.netQuantity?.present,
      detail: declarations.netQuantity?.unitKind ? `Kind: ${declarations.netQuantity.unitKind}` : null,
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
        ? "Inclusive of all taxes"
        : declarations.mrp?.present
        ? "Taxes inclusive declaration missing"
        : null,
    },
    {
      id: 4,
      name: "Manufacturer Name & Address",
      rule: "Rule 6(1)(a)",
      value: declarations.manufacturer?.name
        ? `${declarations.manufacturer.name}${declarations.manufacturer.address ? ` — ${declarations.manufacturer.address}` : ""}`
        : null,
      present: !!declarations.manufacturer?.present && !!declarations.manufacturer?.address,
      detail: declarations.manufacturer?.present && !declarations.manufacturer?.address
        ? "Name found but complete address missing"
        : null,
    },
    {
      id: 5,
      name: "Packer Name & Address",
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
      name: "Consumer Care Details",
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
      rule: "Rule 6(1)",
      value: commodity.countryOfOrigin || declarations.commodityClassification?.countryOfOrigin || null,
      present: !!(commodity.countryOfOrigin || declarations.commodityClassification?.countryOfOrigin),
      detail: null,
    },
    {
      id: 10,
      name: "Dimensions / Standard Pack Size",
      rule: "Rule 6(1)(f), Rule 5",
      value: declarations.dimensions?.rawText || declarations.standardPackDeclaration?.rawText || null,
      present: true, // Non-mandatory unless relevant
      na: !commodity.dimensionsAreRelevant && !declarations.standardPackDeclaration?.present,
      detail: commodity.dimensionsAreRelevant ? "Dimensions relevant for this commodity" : "N/A",
    },
  ];

  const presentCount = mandatoryFields.filter((f) => !f.na && f.present).length;
  const applicableFieldsCount = mandatoryFields.filter((f) => !f.na).length;

  return (
    <div className="space-y-6">
      {/* 1. Summary Cards */}
      <div className="grid grid-cols-1 gap-4 sm:grid-cols-4">
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Rule Engine Verdict</p>
          <div className="mt-2">
            <ComplianceBadge status={status} />
          </div>
        </div>

        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Rule Violations</p>
          <p className={`mt-1 text-2xl font-bold ${totalViolations === 0 ? "text-emerald-600" : "text-red-600"}`}>
            {totalViolations}
          </p>
          <div className="mt-1 flex gap-1.5 text-xs">
            {criticalCount > 0 && (
              <span className="rounded bg-red-100 px-1.5 py-0.5 font-medium text-red-700">
                {criticalCount} critical
              </span>
            )}
            {majorCount > 0 && (
              <span className="rounded bg-amber-100 px-1.5 py-0.5 font-medium text-amber-700">
                {majorCount} major
              </span>
            )}
            {minorCount > 0 && (
              <span className="rounded bg-blue-100 px-1.5 py-0.5 font-medium text-blue-700">
                {minorCount} minor
              </span>
            )}
            {totalViolations === 0 && (
              <span className="text-slate-500">Zero contraventions found</span>
            )}
          </div>
        </div>

        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Mandatory Declarations</p>
          <p className="mt-1 text-2xl font-bold text-slate-800">
            {presentCount} / {applicableFieldsCount}
          </p>
          <p className="mt-1 text-xs text-slate-500">Rule 6 fields extracted &amp; verified</p>
        </div>

        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Commodity Classification</p>
          <p className="mt-1 truncate text-sm font-semibold text-slate-800" title={commodity.genericName || declarations.commodityName?.value || "Unclassified"}>
            {commodity.genericName || declarations.commodityName?.value || "Unclassified"}
          </p>
          <p className="mt-0.5 text-xs text-slate-500">
            {commodity.brandName ? `Brand: ${commodity.brandName} • ` : ""}
            Form: {commodity.physicalForm || "N/A"}
          </p>
        </div>
      </div>

      {/* 2. Exemption Alert (if not applicable) */}
      {!isApplicable && (
        <div className="rounded-md bg-slate-50 px-4 py-3 text-sm text-slate-700 ring-1 ring-inset ring-slate-200">
          <p className="font-semibold text-slate-800">Exempt from Legal Metrology (Packaged Commodities) Rules</p>
          <p className="mt-1 text-slate-600">{compliance.exemptionReason}</p>
        </div>
      )}

      {/* 3. Rule Violations Table */}
      {violations.length > 0 ? (
        <div className="overflow-hidden rounded-lg border border-red-200 bg-white shadow-sm">
          <div className="border-b border-red-100 bg-red-50/50 px-4 py-3">
            <h3 className="text-sm font-semibold text-red-900">
              Violations Detected by Codified Rule Engine ({violations.length})
            </h3>
            <p className="text-xs text-red-700">
              Each issue is tagged with the statutory rule citation from the Legal Metrology (Packaged Commodities) Rules, 2011.
            </p>
          </div>
          <table className="w-full text-left text-sm">
            <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-500">
              <tr>
                <th className="px-4 py-2 font-medium">Rule Citation</th>
                <th className="px-4 py-2 font-medium">Severity</th>
                <th className="px-4 py-2 font-medium">Affected Field</th>
                <th className="px-4 py-2 font-medium">Violation Detail</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {violations.map((v, idx) => (
                <tr key={idx} className="hover:bg-slate-50/80">
                  <td className="whitespace-nowrap px-4 py-3 font-mono text-xs font-semibold text-slate-800">
                    {v.rule}
                  </td>
                  <td className="whitespace-nowrap px-4 py-3">
                    <span
                      className={`inline-flex items-center rounded-full px-2 py-0.5 text-xs font-medium ring-1 ring-inset ${
                        SEVERITY_STYLES[v.severity] || SEVERITY_STYLES.major
                      }`}
                    >
                      {v.severity.toUpperCase()}
                    </span>
                  </td>
                  <td className="whitespace-nowrap px-4 py-3 font-mono text-xs text-slate-600">
                    {v.field || "general"}
                  </td>
                  <td className="px-4 py-3 text-slate-700">{v.message}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : isApplicable ? (
        <div className="rounded-lg border border-emerald-200 bg-emerald-50/50 p-4">
          <div className="flex items-center gap-2">
            <span className="flex h-6 w-6 items-center justify-center rounded-full bg-emerald-100 text-emerald-700 font-bold text-xs">
              ✓
            </span>
            <h3 className="text-sm font-semibold text-emerald-900">
              All Codified Legal Metrology Rules Passed
            </h3>
          </div>
          <p className="mt-1 text-xs text-emerald-700 pl-8">
            No mandatory declaration contraventions or packaging standard violations were found in this listing.
          </p>
        </div>
      ) : null}

      {/* 4. Mapped Mandatory Declarations Table (Rule 6) */}
      <div className="overflow-hidden rounded-lg border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 bg-slate-50 px-4 py-3">
          <h3 className="text-sm font-semibold text-slate-800">
            Rule 6 — Mandatory Package Declarations Mapping
          </h3>
          <p className="text-xs text-slate-500">
            Structured facts extracted from listing text via Stage 5/6 mapping and fed into the rule engine.
          </p>
        </div>
        <table className="w-full text-left text-sm">
          <thead className="bg-slate-50/70 text-xs uppercase tracking-wide text-slate-400">
            <tr>
              <th className="px-4 py-2 font-medium">#</th>
              <th className="px-4 py-2 font-medium">Declaration &amp; Rule</th>
              <th className="px-4 py-2 font-medium">Extracted Value</th>
              <th className="px-4 py-2 font-medium">Status</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {mandatoryFields.map((f) => (
              <tr key={f.id} className="hover:bg-slate-50/60">
                <td className="px-4 py-3 text-slate-400 text-xs">{f.id}</td>
                <td className="px-4 py-3">
                  <p className="font-medium text-slate-800">{f.name}</p>
                  <p className="text-xs text-slate-400 font-mono">{f.rule}</p>
                  {f.detail && <p className="mt-0.5 text-xs text-slate-500">{f.detail}</p>}
                </td>
                <td className="px-4 py-3 text-slate-700">
                  {f.value ? (
                    <span className="font-medium">{f.value}</span>
                  ) : (
                    <span className="italic text-slate-400">Not declared / not found</span>
                  )}
                </td>
                <td className="px-4 py-3">
                  {f.na ? (
                    <span className="rounded-full bg-slate-100 px-2 py-0.5 text-xs font-medium text-slate-500 ring-1 ring-inset ring-slate-200">
                      N/A
                    </span>
                  ) : (
                    <StatusBadge found={f.present} />
                  )}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* 5. Collapsible Mapped JSON / Package Record Inspector */}
      <div className="rounded-lg border border-slate-200 bg-white">
        <button
          type="button"
          onClick={() => setShowJson(!showJson)}
          className="flex w-full items-center justify-between px-4 py-3 text-left text-sm font-medium text-slate-700 hover:bg-slate-50"
        >
          <span>Inspection Contract: mapped.json &amp; packageRecord</span>
          <span className="text-xs text-slate-400">
            {showJson ? "▲ Collapse JSON" : "▼ Expand mapped.json"}
          </span>
        </button>
        {showJson && (
          <div className="border-t border-slate-200 bg-slate-900 p-4">
            <pre className="max-h-96 overflow-y-auto font-mono text-xs leading-relaxed text-slate-200">
              {JSON.stringify(
                {
                  declarations,
                  packageRecord,
                  compliance,
                },
                null,
                2
              )}
            </pre>
          </div>
        )}
      </div>
    </div>
  );
}
