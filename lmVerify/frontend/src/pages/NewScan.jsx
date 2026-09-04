import React, { useState } from "react";
import { crawlListing, checkCompliance } from "../lib/scraperApi.js";
import RawListingView from "../components/RawListingView.jsx";
import ComplianceReport from "../components/ComplianceReport.jsx";

export default function NewScan() {
  const [url, setUrl] = useState("");
  const [autoVerify, setAutoVerify] = useState(true);
  const [loading, setLoading] = useState(false);
  const [statusMessage, setStatusMessage] = useState("");
  const [error, setError] = useState("");
  const [result, setResult] = useState(null); // RawListingData

  const [checking, setChecking] = useState(false);
  const [checkError, setCheckError] = useState("");
  const [compliance, setCompliance] = useState(null); // Full compliance result from rule engine
  const [tab, setTab] = useState("compliance"); // "compliance" | "raw"

  const handleScan = async (e) => {
    e.preventDefault();
    if (!url.trim()) {
      setError("Enter a product listing URL first.");
      return;
    }
    setError("");
    setLoading(true);
    setResult(null);
    setCompliance(null);
    setCheckError("");
    setTab(autoVerify ? "compliance" : "raw");

    try {
      setStatusMessage("Loading product listing in browser and capturing raw data…");
      const data = await crawlListing(url.trim());
      setResult(data);

      if (autoVerify) {
        setStatusMessage("Running ComplianceEngine Stage 5/6 mapping and codified rule engine…");
        setChecking(true);
        try {
          const compData = await checkCompliance(data.url, {
            text: data.text,
            platform: data.platform,
          });
          setCompliance(compData);
          setTab("compliance");
        } catch (compErr) {
          setCheckError(compErr.message || "Couldn't run rule engine compliance check.");
          setTab("raw");
        } finally {
          setChecking(false);
        }
      }
    } catch (err) {
      setError(err.message || "Couldn't scan that listing. Check the URL and try again.");
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
      });
      setCompliance(compData);
      setTab("compliance");
    } catch (err) {
      setCheckError(err.message || "Couldn't run rule engine compliance check.");
    } finally {
      setChecking(false);
    }
  };

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-semibold text-slate-900">New scan</h1>
        <p className="mt-1 text-sm text-slate-500">
          Scan an e-commerce product listing, extract raw page data &amp; images, map
          mandatory declarations, and verify statutory compliance against the codified
          Legal Metrology (Packaged Commodities) Rules, 2011.
        </p>
      </div>

      <form onSubmit={handleScan} className="space-y-3">
        <label htmlFor="listing-url" className="block text-sm font-medium text-slate-700">
          Product listing URL
        </label>
        <div className="flex gap-3">
          <input
            id="listing-url"
            type="text"
            value={url}
            onChange={(e) => setUrl(e.target.value)}
            placeholder="https://www.amazon.in/dp/..."
            className="flex-1 rounded-md border border-slate-300 bg-white px-3 py-2 text-sm text-slate-900 placeholder-slate-400 shadow-sm focus:border-slate-500 focus:outline-none focus:ring-1 focus:ring-slate-500"
          />
          <button
            type="submit"
            disabled={loading || checking}
            className="rounded-md bg-slate-900 px-5 py-2 text-sm font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {loading ? "Scanning…" : "Scan & Verify"}
          </button>
        </div>

        <div className="flex items-center gap-2">
          <input
            type="checkbox"
            id="auto-verify"
            checked={autoVerify}
            onChange={(e) => setAutoVerify(e.target.checked)}
            className="h-4 w-4 rounded border-slate-300 text-slate-900 focus:ring-slate-500"
          />
          <label htmlFor="auto-verify" className="text-xs text-slate-600">
            Automatically run Stage 5/6 mapping &amp; rule engine verification right after crawling
          </label>
        </div>

        {error && <p className="text-sm text-red-600">{error}</p>}
      </form>

      {loading && (
        <div className="flex items-center gap-3 rounded-lg border border-slate-200 bg-white px-4 py-6 text-sm text-slate-600 shadow-sm">
          <div className="h-5 w-5 animate-spin rounded-full border-2 border-slate-300 border-t-slate-800" />
          <span>{statusMessage || "Processing scan..."}</span>
        </div>
      )}

      {!loading && !result && (
        <div className="rounded-lg border border-dashed border-slate-300 bg-white px-6 py-14 text-center">
          <p className="text-sm text-slate-500">
            Paste an e-commerce product URL above and click <strong>Scan &amp; Verify</strong> to
            crawl the listing, map declarations, and execute the Legal Metrology rule engine.
          </p>
        </div>
      )}

      {result && !loading && (
        <div className="space-y-4">
          <div className="border-b border-slate-200">
            <nav className="-mb-px flex gap-6">
              {[
                { key: "compliance", label: "Rule Engine & Compliance" },
                { key: "raw", label: "Raw Crawl Data" },
              ].map((t) => (
                <button
                  key={t.key}
                  type="button"
                  onClick={() => setTab(t.key)}
                  className={`border-b-2 px-1 py-2 text-sm font-medium ${
                    tab === t.key
                      ? "border-slate-900 text-slate-900"
                      : "border-transparent text-slate-400 hover:text-slate-600"
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
                <div className="rounded-lg border border-dashed border-slate-300 bg-white px-6 py-10 text-center">
                  <p className="mb-4 text-sm text-slate-500">
                    Run the Stage 5/6 post-OCR declaration mapping and evaluate all statutory rules
                    using the Legal Metrology rule engine.
                  </p>
                  <button
                    type="button"
                    onClick={handleCheckCompliance}
                    className="rounded-md bg-slate-900 px-5 py-2 text-sm font-medium text-white transition hover:bg-slate-800"
                  >
                    Run Rule Engine Verification
                  </button>
                  {checkError && <p className="mt-3 text-sm text-red-600">{checkError}</p>}
                </div>
              )}

              {checking && (
                <div className="flex items-center gap-3 rounded-lg border border-slate-200 bg-white px-4 py-6 text-sm text-slate-600 shadow-sm">
                  <div className="h-5 w-5 animate-spin rounded-full border-2 border-slate-300 border-t-slate-800" />
                  Extracting declarations via Groq mapping and checking Legal Metrology rules…
                </div>
              )}

              {compliance && !checking && (
                <>
                  <div className="flex items-center justify-between">
                    <p className="text-xs text-slate-400">
                      Verified at {new Date(compliance.crawledAt || Date.now()).toLocaleString()}
                    </p>
                    <button
                      type="button"
                      onClick={handleCheckCompliance}
                      className="rounded-md border border-slate-300 px-3 py-1.5 text-xs font-medium text-slate-600 hover:bg-slate-100"
                    >
                      Re-run Verification
                    </button>
                  </div>
                  <ComplianceReport report={compliance} />
                </>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
