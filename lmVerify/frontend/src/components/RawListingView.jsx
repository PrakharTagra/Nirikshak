import React, { useMemo, useState } from "react";

const TABS = [
  { key: "screenshot", label: "Screenshot" },
  { key: "images", label: "Images" },
  { key: "metadata", label: "Metadata" },
  { key: "structured", label: "Structured data" },
  { key: "text", label: "Raw text" },
  { key: "html", label: "Raw HTML" },
];

function bytesToReadable(bytes) {
  if (!bytes && bytes !== 0) return "—";
  if (bytes < 1024) return `${bytes} B`;
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`;
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}

function downloadBlob(content, filename, mimeType) {
  const blob = new Blob([content], { type: mimeType });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = filename;
  a.click();
  URL.revokeObjectURL(url);
}

// Renders a genuine RawListingData object as returned by the scraper's
// crawlListing(url) — see local-scraper/listing-crawler/index.js for the
// exact shape (url, platform, crawledAt, html, text, images, screenshot,
// metadata, structuredData). This is raw evidence, not a compliance
// verdict — declaration extraction/rule-checking is a later phase.
export default function RawListingView({ data }) {
  const [tab, setTab] = useState("screenshot");

  const screenshotSrc = useMemo(() => {
    if (!data.screenshot?.base64) return null;
    return `data:${data.screenshot.mimeType};base64,${data.screenshot.base64}`;
  }, [data.screenshot]);

  const jsonLdCount = data.structuredData?.jsonLd?.length || 0;
  const imageCount = data.images?.count ?? data.images?.items?.length ?? 0;

  return (
    <div className="space-y-6">
      <div className="grid grid-cols-1 gap-3 sm:grid-cols-4">
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Platform</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">{data.platform}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Images found</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">{imageCount}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">JSON-LD blocks</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">{jsonLdCount}</p>
        </div>
        <div className="rounded-lg border border-slate-200 bg-white p-4">
          <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Crawled</p>
          <p className="mt-1 text-sm font-semibold text-slate-800">
            {new Date(data.crawledAt).toLocaleString()}
          </p>
        </div>
      </div>

      <div className="rounded-lg border border-slate-200 bg-white p-4">
        <p className="text-xs font-medium uppercase tracking-wide text-slate-400">Listing title</p>
        <p className="mt-1 text-sm text-slate-800">{data.metadata?.title || "—"}</p>
        <p className="mt-1 truncate text-xs text-slate-400">{data.url}</p>
      </div>

      <div className="border-b border-slate-200">
        <nav className="-mb-px flex flex-wrap gap-6">
          {TABS.map((t) => (
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

      {tab === "screenshot" && (
        <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
          {screenshotSrc ? (
            <div className="max-h-[600px] overflow-y-auto bg-slate-100">
              <img src={screenshotSrc} alt="Full-page screenshot of the listing" className="w-full" />
            </div>
          ) : (
            <p className="p-6 text-center text-sm text-slate-400">No screenshot captured.</p>
          )}
          {data.screenshot && (
            <p className="border-t border-slate-100 px-4 py-2 text-xs text-slate-400">
              {data.screenshot.mimeType} · {bytesToReadable(data.screenshot.byteLength)}
            </p>
          )}
        </div>
      )}

      {tab === "images" && (
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-3">
          {(data.images?.items || []).map((img, i) => (
            <div key={i} className="overflow-hidden rounded-lg border border-slate-200 bg-white">
              <img
                src={img.url}
                alt={img.alt || `Listing image ${i + 1}`}
                className="h-36 w-full bg-slate-100 object-cover"
                onError={(e) => {
                  e.currentTarget.style.display = "none";
                }}
              />
              <div className="space-y-1 px-2 py-1.5">
                <p className="truncate text-xs text-slate-500" title={img.url}>
                  {img.url}
                </p>
                <div className="flex flex-wrap gap-1">
                  {img.lazy && (
                    <span className="rounded-full bg-amber-50 px-1.5 py-0.5 text-[10px] font-medium text-amber-700 ring-1 ring-inset ring-amber-200">
                      lazy
                    </span>
                  )}
                  {img.srcset?.length > 0 && (
                    <span className="rounded-full bg-slate-100 px-1.5 py-0.5 text-[10px] font-medium text-slate-600">
                      {img.srcset.length} srcset
                    </span>
                  )}
                </div>
              </div>
            </div>
          ))}
          {imageCount === 0 && (
            <p className="col-span-full py-8 text-center text-sm text-slate-400">No images found.</p>
          )}
        </div>
      )}

      {tab === "metadata" && (
        <div className="space-y-4">
          <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
            <table className="w-full text-left text-sm">
              <tbody className="divide-y divide-slate-100">
                {[
                  ["Title", data.metadata?.title],
                  ["Description", data.metadata?.description],
                  ["Canonical URL", data.metadata?.canonical],
                  ["Language", data.metadata?.lang],
                  ["Charset", data.metadata?.charset],
                  ["Viewport", data.metadata?.viewport],
                  ["Favicon", data.metadata?.favicon],
                ].map(([label, value]) => (
                  <tr key={label}>
                    <td className="w-40 px-4 py-2 align-top text-xs font-medium uppercase tracking-wide text-slate-400">
                      {label}
                    </td>
                    <td className="break-all px-4 py-2 text-slate-700">{value || "—"}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          {Object.keys(data.metadata?.ogTags || {}).length > 0 && (
            <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
              <p className="border-b border-slate-100 px-4 py-2 text-xs font-medium uppercase tracking-wide text-slate-400">
                Open Graph tags
              </p>
              <table className="w-full text-left text-sm">
                <tbody className="divide-y divide-slate-100">
                  {Object.entries(data.metadata.ogTags).map(([k, v]) => (
                    <tr key={k}>
                      <td className="w-48 px-4 py-2 align-top text-xs text-slate-500">{k}</td>
                      <td className="break-all px-4 py-2 text-slate-700">{v}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}

          {Object.keys(data.metadata?.twitterTags || {}).length > 0 && (
            <div className="overflow-hidden rounded-lg border border-slate-200 bg-white">
              <p className="border-b border-slate-100 px-4 py-2 text-xs font-medium uppercase tracking-wide text-slate-400">
                Twitter card tags
              </p>
              <table className="w-full text-left text-sm">
                <tbody className="divide-y divide-slate-100">
                  {Object.entries(data.metadata.twitterTags).map(([k, v]) => (
                    <tr key={k}>
                      <td className="w-48 px-4 py-2 align-top text-xs text-slate-500">{k}</td>
                      <td className="break-all px-4 py-2 text-slate-700">{v}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      )}

      {tab === "structured" && (
        <div className="space-y-4">
          <div>
            <p className="mb-2 text-xs font-medium uppercase tracking-wide text-slate-400">
              JSON-LD ({jsonLdCount})
            </p>
            {jsonLdCount === 0 && <p className="text-sm text-slate-400">No JSON-LD blocks found.</p>}
            <div className="space-y-3">
              {(data.structuredData?.jsonLd || []).map((block, i) => (
                <pre
                  key={i}
                  className="overflow-x-auto rounded-lg border border-slate-200 bg-slate-900 p-3 font-mono text-xs leading-relaxed text-slate-200"
                >
                  {JSON.stringify(block, null, 2)}
                </pre>
              ))}
            </div>
          </div>

          {(data.structuredData?.scriptData || []).length > 0 && (
            <div>
              <p className="mb-2 text-xs font-medium uppercase tracking-wide text-slate-400">
                Detected script data ({data.structuredData.scriptData.length})
              </p>
              <div className="space-y-2">
                {data.structuredData.scriptData.map((s, i) => (
                  <div key={i} className="rounded-lg border border-slate-200 bg-white p-3">
                    <div className="mb-1 flex items-center gap-2">
                      <span className="rounded-full bg-slate-100 px-2 py-0.5 text-xs font-medium text-slate-600">
                        {s.key}
                      </span>
                      <span className="text-xs text-slate-400">{s.matchType}</span>
                    </div>
                    <pre className="overflow-x-auto whitespace-pre-wrap font-mono text-xs leading-relaxed text-slate-500">
                      {s.parsed ? JSON.stringify(s.parsed, null, 2) : s.snippet}
                    </pre>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      )}

      {tab === "text" && (
        <div className="rounded-lg border border-slate-200 bg-slate-900 p-4">
          <pre className="max-h-[500px] overflow-y-auto whitespace-pre-wrap font-mono text-xs leading-relaxed text-slate-200">
            {data.text || "No visible text captured."}
          </pre>
        </div>
      )}

      {tab === "html" && (
        <div className="space-y-2">
          <div className="flex items-center justify-between">
            <p className="text-xs text-slate-400">
              {bytesToReadable(new Blob([data.html || ""]).size)} of rendered HTML
            </p>
            <button
              type="button"
              onClick={() => downloadBlob(data.html || "", "listing.html", "text/html")}
              className="rounded-md border border-slate-300 px-3 py-1.5 text-xs font-medium text-slate-600 hover:bg-slate-100"
            >
              Download full HTML
            </button>
          </div>
          <pre className="max-h-[500px] overflow-y-auto whitespace-pre-wrap break-all rounded-lg border border-slate-200 bg-slate-900 p-4 font-mono text-xs leading-relaxed text-slate-200">
            {(data.html || "").slice(0, 4000)}
            {(data.html || "").length > 4000 ? "\n…truncated — download to see the full document." : ""}
          </pre>
        </div>
      )}
    </div>
  );
}
