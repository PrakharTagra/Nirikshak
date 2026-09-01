import React, { useState } from "react";
import { crawlListing, checkCompliance } from "../lib/scraperApi.js";
import RawListingView from "../components/RawListingView.jsx";
import ComplianceReport from "../components/ComplianceReport.jsx";

export default function NewScan() {
  const [url, setUrl] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [result, setResult] = useState(null); // temporary — cleared on next scan

  const [checking, setChecking] = useState(false);
  const [checkError, setCheckError] = useState("");
  const [compliance, setCompliance] = useState(null); // { url, platform, crawledAt, compliance }
  const [tab, setTab] = useState("raw"); // "raw" | "compliance"

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
    setTab("raw");
    try {
      const data = await crawlListing(url.trim());
      setResult(data);
    } catch (err) {
      setError(err.message || "Couldn't scan that listing. Check the URL and try again.");
    } finally {
      setLoading(false);
    }
  };

  const handleCheckCompliance = async () => {
    if (!result) return;
    setChecking(true);
    setCheckError("");
    try {
      // Reuse the already-crawled raw text so the backend doesn't have to
      // re-crawl the page — it goes straight to the LLM in one call.
      const data = await checkCompliance(result.url, {
        text: result.text,
        platform: result.platform,
      });
      setCompliance(data);
      setTab("compliance");
    } catch (err) {
      setCheckError(err.message || "Couldn't run the compliance check.");
    } finally {
      setChecking(false);
    }
  };

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-semibold text-slate-900">New scan</h1>
        <p className="mt-1 text-sm text-slate-500">
          Load a product listing page, capture its raw HTML, text, images,
          metadata, structured data and a full-page screenshot, then run a
          Legal Metrology compliance check against the raw text.
        </p>
      </div>

      <form onSubmit={handleScan}>
        <label htmlFor="listing-url" className="mb-1.5 block text-sm font-medium text-slate-700">
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
            disabled={loading}
            className="rounded-md bg-slate-900 px-5 py-2 text-sm font-medium text-white transition hover:bg-slate-800 disabled:cursor-not-allowed disabled:opacity-60"
          >
            {loading ? "Scanning…" : "Scan listing"}
          </button>
        </div>
        {error && <p className="mt-2 text-sm text-red-600">{error}</p>}
      </form>

      {loading && (
        <div className="flex items-center gap-3 rounded-lg border border-slate-200 bg-white px-4 py-6 text-sm text-slate-500">
          <div className="h-4 w-4 animate-spin rounded-full border-2 border-slate-300 border-t-slate-700" />
          Loading the page in a real browser, scrolling for lazy content, and capturing raw data…
        </div>
      )}

      {!loading && !result && (
        <div className="rounded-lg border border-dashed border-slate-300 bg-white px-6 py-14 text-center">
          <p className="text-sm text-slate-500">
            Paste a product page URL above and scan it to see the raw
            crawled data, then run the Legal Metrology compliance check.
          </p>
        </div>
      )}

      {result && !loading && (
        <div className="space-y-4">
          <div className="rounded-md bg-amber-50 px-4 py-2 text-xs font-medium text-amber-700 ring-1 ring-inset ring-amber-200">
            This result is shown temporarily and is not yet saved to persistent history —
            the backend doesn't have a storage layer wired up yet.
          </div>

          <div className="border-b border-slate-200">
            <nav className="-mb-px flex gap-6">
              {[
                { key: "raw", label: "Raw crawl data" },
                { key: "compliance", label: "Compliance check" },
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
                    Send the complete raw text captured above to the LLM and extract the
                    Legal Metrology Rule 6 declarations, scope gates, and format checks.
                  </p>
                  <button
                    type="button"
                    onClick={handleCheckCompliance}
                    className="rounded-md bg-slate-900 px-5 py-2 text-sm font-medium text-white transition hover:bg-slate-800"
                  >
                    Run compliance check
                  </button>
                  {checkError && <p className="mt-3 text-sm text-red-600">{checkError}</p>}
                </div>
              )}

              {checking && (
                <div className="flex items-center gap-3 rounded-lg border border-slate-200 bg-white px-4 py-6 text-sm text-slate-500">
                  <div className="h-4 w-4 animate-spin rounded-full border-2 border-slate-300 border-t-slate-700" />
                  Sending the raw listing text to the LLM and extracting declarations…
                </div>
              )}

              {compliance && !checking && (
                <>
                  <div className="flex items-center justify-between">
                    <p className="text-xs text-slate-400">
                      Checked {new Date(compliance.crawledAt).toLocaleString()}
                    </p>
                    <button
                      type="button"
                      onClick={handleCheckCompliance}
                      className="rounded-md border border-slate-300 px-3 py-1.5 text-xs font-medium text-slate-600 hover:bg-slate-100"
                    >
                      Re-run check
                    </button>
                  </div>
                  <ComplianceReport report={compliance.compliance} />
                </>
              )}
            </div>
          )}
        </div>
      )}
    </div>
  );
}
