import React, { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import { getScanById } from "../lib/api.js";
import ScanResultView from "../components/ScanResultView.jsx";
import PageLoader from "../components/PageLoader.jsx";

export default function ScanDetail() {
  const { id } = useParams();
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    let active = true;
    setLoading(true);
    setError("");
    getScanById(id)
      .then((result) => active && setData(result))
      .catch(() => active && setError("Couldn't find that scan."))
      .finally(() => active && setLoading(false));
    return () => {
      active = false;
    };
  }, [id]);

  if (loading) return <PageLoader />;

  if (error || !data) {
    return (
      <div className="space-y-4">
        <Link to="/scans" className="text-sm text-slate-500 hover:text-slate-800">
          ← Back to previous scans
        </Link>
        <div className="rounded-lg border border-dashed border-slate-300 bg-white px-6 py-14 text-center">
          <p className="text-sm text-slate-500">{error || "Scan not found."}</p>
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <Link to="/scans" className="text-sm text-slate-500 hover:text-slate-800">
        ← Back to previous scans
      </Link>
      <div>
        <h1 className="text-2xl font-semibold text-slate-900">Scan details</h1>
        <p className="mt-1 text-sm text-slate-500">
          Full record for this listing scan, including saved images and raw
          extracted text.
        </p>
      </div>
      <ScanResultView data={data} />
    </div>
  );
}
