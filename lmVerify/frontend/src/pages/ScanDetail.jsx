import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import { getScanById } from "../lib/api.js";
import ScanResultView from "../components/ScanResultView.jsx";
import ComplianceReport from "../components/ComplianceReport.jsx";
import { Breadcrumb, Loading, PdfButton } from "../components/ui.jsx";
import { generatePdfReport } from "../lib/pdfReportGenerator.js";
import { useAuth } from "../context/AuthContext.jsx";

export default function ScanDetail() {
  const { id } = useParams();
  const { user } = useAuth();
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [pdfBusy, setPdfBusy] = useState(false);

  useEffect(() => {
    let active = true;
    setLoading(true);
    setError("");
    getScanById(id)
      .then((result) => active && setData(result))
      .catch(() => active && setError("Couldn't find that scan record."))
      .finally(() => active && setLoading(false));
    return () => {
      active = false;
    };
  }, [id]);

  const handleDownloadPdf = async () => {
    if (!data) return;
    setPdfBusy(true);
    try {
      await generatePdfReport(data, user);
    } catch (err) {
      alert("Failed to generate PDF: " + err.message);
    } finally {
      setPdfBusy(false);
    }
  };

  if (loading) return <Loading label="Retrieving Official Inspection Record" />;

  if (error || !data) {
    return (
      <div className="space-y-4">
        <Breadcrumb items={[{ to: "/scans", label: "Historical Records" }, { label: "Not Found" }]} />
        <div className="border-l-4 border-amber-500 bg-amber-50 p-6 text-sm font-semibold text-amber-900 rounded-r-sm">
          {error || "Scan record not found in the surveillance register."}
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <Breadcrumb
        items={[
          { to: "/scans", label: "Historical Records" },
          { label: data.id || "Inspection Detail" },
        ]}
      />

      {/* Top Banner with PDF Action */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 pb-4 border-b border-slate-300">
        <div>
          <div className="flex items-center gap-2">
            <h1 className="text-xl sm:text-2xl font-bold text-govt-navy">
              Inspection Dossier: {data.reference_no || data.id}
            </h1>
            <span className="rounded bg-slate-100 px-2 py-0.5 text-xs font-semibold text-slate-700 border border-slate-200">
              {data.platform}
            </span>
          </div>
          <p className="mt-1 text-xs sm:text-sm text-slate-600 font-medium">
            Scanned on {new Date(data.scannedAt).toLocaleString("en-IN")} • Official Digital Marketplace Surveillance Dossier
          </p>
        </div>

        <PdfButton
          onClick={handleDownloadPdf}
          loading={pdfBusy}
          label="Download Statutory PDF"
        />
      </div>

      {/* Assistant Controller Review Status Banner */}
      {data.controller_status && (
        <div className={`p-4 rounded-sm border ${
          data.controller_status === 'approved'
            ? 'bg-emerald-50 border-emerald-300 text-emerald-900'
            : data.controller_status === 'rejected'
            ? 'bg-red-50 border-red-300 text-red-900'
            : 'bg-amber-50 border-amber-300 text-amber-900'
        }`}>
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <span className="text-base">
                {data.controller_status === 'approved' ? '✅' : data.controller_status === 'rejected' ? '❌' : '⏳'}
              </span>
              <span className="font-bold text-xs uppercase tracking-wider">
                Statutory Decision Status: {data.controller_status.toUpperCase()}
              </span>
            </div>
            {data.decided_by && (
              <span className="text-xs font-medium">Decided by: {data.decided_by}</span>
            )}
          </div>
          {data.decision_reason && (
            <p className="mt-2 text-xs italic bg-white p-2.5 rounded border border-red-200">
              "{data.decision_reason}"
            </p>
          )}
        </div>
      )}

      <ComplianceReport report={data} />
    </div>
  );
}
