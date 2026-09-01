import React from "react";

export default function PageLoader() {
  return (
    <div className="flex min-h-[240px] w-full items-center justify-center">
      <div className="flex items-center gap-3 text-sm text-slate-500">
        <div className="h-4 w-4 animate-spin rounded-full border-2 border-slate-300 border-t-slate-700" />
        Loading…
      </div>
    </div>
  );
}
