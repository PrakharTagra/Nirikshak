import React, { useState } from "react";
import { crawlListing, checkCompliance } from "../lib/scraperApi.js";
import RawListingView from "../components/RawListingView.jsx";
import ComplianceReport from "../components/ComplianceReport.jsx";
import { Breadcrumb, Panel, Loading } from "../components/ui.jsx";

export default function NewScan() {
  const [url, setUrl] = useState("");
  const [autoVerify, setAutoVerify] = useState(true);
  const [loading, setLoading] = useState(false);
  const [statusMessage, setStatusMessage] = useState("");
  const [error, setError] = useState("");
  const [result, setResult] = useState(null); // RawListingData

  const [checking, setChecking] = useState(false);
  const [checkError, setCheckError] = useState("");
  const [compliance, setCompliance] = useState(null);
  const [tab, setTab] = useState("compliance"); // "compliance" | "raw"

  const handleScan = async (e) => {
    e.preventDefault();
    if (!url.trim()) {
      setError("Please input an e-commerce product listing URL.");
      return;
    }
    setError("");
    setLoading(true);
    setResult(null);
    setCompliance(null);
    setCheckError("");
    setTab(autoVerify ? "compliance" : "raw");

    try {
      setStatusMessage("Dispatching crawler to load product listing and extract page metadata…");
      const data = await crawlListing(url.trim());
      setResult(data);

      if (autoVerify) {
        setStatusMessage("Executing ComplianceEngine declaration mapping and codified rule engine…");
        setChecking(true);
        try {
          const compData = await checkCompliance(data.url, {
            text: data.text,
            platform: data.platform,
            structuredData: data.structuredData,
            metadata: data.metadata,
          });
          setCompliance(compData);
          setTab("compliance");
        } catch (compErr) {
          setCheckError(compErr.message || "Failed to execute Legal Metrology rule engine.");
          setTab("raw");
        } finally {
          setChecking(false);
        }
      }
    } catch (err) {
      setError(err.message || "Could not complete listing scan. Verify the URL and crawler service.");
    } finally {
      setLoading(false);
      setStatusMessage("");
    }
  };

  const handleCheckCompliance = async () => {
    if (!result) return;
    setChecking(true);
    setCheckError("");
    try {
      const compData = await checkCompliance(result.url, {
        text: result.text,
        platform: result.platform,
        structuredData: result.structuredData,
        metadata: result.metadata,
      });
      setCompliance(compData);
      setTab("compliance");
    } catch (err) {
      setCheckError(err.message || "Failed to execute Legal Metrology rule engine.");
    } finally {
      setChecking(false);
    }
  };

  return (
    <div className="space-y-6">
      <Breadcrumb items={[{ label: "New Marketplace Scan" }]} />

      <div className="pb-4 border-b border-slate-300">
        <h1 className="text-xl sm:text-2xl font-bold text-govt-navy">
          Statutory Marketplace Inspection
        </h1>
        <p className="mt-1 text-xs sm:text-sm text-slate-600 font-medium">
          Automated crawler &amp; codified rule engine verifying mandatory declarations under The Legal Metrology (Packaged Commodities) Rules, 2011.
        </p>
      </div>

      <Panel
        title="Marketplace Listing Surveillance Form"
        note="Supports Amazon.in, Flipkart, Meesho, BigBasket, JioMart and other major e-commerce platforms"
      >
        <form onSubmit={handleScan} className="p-5 space-y-4">
          <div>
            <label htmlFor="listing-url" className="block text-xs font-bold uppercase tracking-wider text-slate-800 mb-1.5">
              Product Listing URL <span className="text-red-600">*</span>
            </label>
            <div className="flex flex-col sm:flex-row gap-3">
              <input
                id="listing-url"
                type="text"
                value={url}
                onChange={(e) => setUrl(e.target.value)}
                placeholder="https://www.amazon.in/dp/... or https://www.flipkart.com/..."
                className="flex-1 rounded-sm border border-slate-300 bg-white px-3.5 py-2.5 text-sm text-slate-900 placeholder-slate-400 shadow-sm focus:border-govt-navy focus:outline-none focus:ring-1 focus:ring-govt-navy font-mono text-xs"
              />
              <button
                type="submit"
                disabled={loading || checking}
                className="rounded-sm bg-govt-navy px-6 py-2.5 text-xs sm:text-sm font-bold tracking-wide text-white shadow hover:bg-blue-900 disabled:cursor-not-allowed disabled:opacity-60 transition-colors shrink-0"
              >
                {loading ? "Scanning Listing…" : "Inspect & Verify"}
              </button>
            </div>
          </div>

          <div className="flex items-center gap-2 pt-1">
            <input
              type="checkbox"
              id="auto-verify"
              checked={autoVerify}
              onChange={(e) => setAutoVerify(e.target.checked)}
              className="h-4 w-4 rounded border-slate-300 text-govt-navy focus:ring-govt-navy"
            />
            <label htmlFor="auto-verify" className="text-xs text-slate-700 font-medium">
              Automatically execute declaration extraction and Legal Metrology rule engine upon crawl completion
            </label>
          </div>

          {error && (
            <div className="border-l-4 border-red-600 bg-red-50 p-3 text-xs text-red-900 font-semibold shadow-sm">
              {error}
            </div>
          )}
        </form>
      </Panel>

      {loading && (
        <div className="border-t-[3px] border-t-govt-navy border-x border-b border-slate-200 bg-white p-8 rounded-sm shadow-sm">
          <Loading label={statusMessage || "Inspecting Marketplace Listing"} />
        </div>
      )}

      {!loading && !result && (
        <div className="rounded-sm border-2 border-dashed border-slate-300 bg-white p-12 text-center shadow-sm">
          <div className="mx-auto w-12 h-12 text-slate-400 mb-3 flex items-center justify-center">
            <svg fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="1.5" className="h-9 w-9">
              <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </div>
          <h3 className="text-sm font-bold text-slate-800">Awaiting Product Listing Submission</h3>
          <p className="mt-1 text-xs text-slate-500 max-w-md mx-auto">
            Paste any active e-commerce packaged commodity URL above to trigger automated crawling, optical text processing, and rule verification.
          </p>
        </div>
      )}

      {result && !loading && (
        <div className="space-y-4">
          {/* Tabs */}
          <div className="border-b border-slate-300">
            <nav className="-mb-px flex gap-6">
              {[
                { key: "compliance", label: "Statutory Rule Compliance & Report" },
                { key: "raw", label: "Raw Crawled Listing Data" },
              ].map((t) => (
                <button
                  key={t.key}
                  type="button"
                  onClick={() => setTab(t.key)}
                  className={`border-b-4 px-3 py-2.5 text-xs sm:text-sm font-bold tracking-wide transition-colors ${
                    tab === t.key
                      ? "border-saffron text-govt-navy"
                      : "border-transparent text-slate-500 hover:text-slate-800"
                  }`}
                >
                  {t.label}
                </button>
              ))}
            </nav>
          </div>

          {tab === "raw" && <RawListingView data={result} />}

          {tab === "compliance" && (
            <div className="space-y-4">
              {!compliance && !checking && (
                <div className="border-t-[3px] border-t-govt-navy border-x border-b border-slate-200 bg-white p-8 text-center rounded-sm">
                  <p className="mb-4 text-xs sm:text-sm text-slate-700 font-medium">
                    Raw crawl completed. Run the codified Legal Metrology rule engine to analyze Rule 6 mandatory declarations and produce the official PDF inspection report.
                  </p>
                  <button
                    type="button"
                    onClick={handleCheckCompliance}
                    className="rounded-sm bg-govt-navy px-6 py-2.5 text-xs sm:text-sm font-bold text-white shadow hover:bg-blue-900 transition-colors"
                  >
                    Run Legal Metrology Rule Engine
                  </button>
                  {checkError && (
                    <p className="mt-3 text-xs text-red-600 font-medium">{checkError}</p>
                  )}
                </div>
              )}

              {checking && (
                <div className="border-t-[3px] border-t-govt-navy border-x border-b border-slate-200 bg-white p-8 rounded-sm shadow-sm">
                  <Loading label="Evaluating Declarations against Legal Metrology Rules" />
                </div>
              )}

              {compliance && !checking && (
                <ComplianceReport report={{ ...compliance, url: result.url, platform: result.platform }} />
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
