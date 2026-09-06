import React from "react";
import Emblem from "./Emblem.jsx";

export default function GovtHeader({ user, onLogout }) {
  return (
    <header className="w-full flex flex-col shadow-sm">
      {/* Tier 1 - Utility Bar */}
      <div className="bg-govt-dark text-white px-4 py-1.5 flex justify-between items-center text-xs">
        <div className="flex items-center gap-2">
          <span className="font-semibold tracking-wider">भारत सरकार</span>
          <span className="text-white/40">|</span>
          <span className="text-white/90">GOVERNMENT OF INDIA</span>
        </div>
        <div className="flex items-center gap-4">
          <div className="hidden sm:flex gap-2 items-center text-[11px] text-white/80" aria-label="Font size controls">
            <button type="button" className="hover:text-white hover:underline">A-</button>
            <button type="button" className="hover:text-white hover:underline font-bold">A</button>
            <button type="button" className="hover:text-white hover:underline">A+</button>
          </div>
          {user && (
            <div className="flex items-center gap-3 border-l border-white/20 pl-3">
              <span className="inline-flex items-center rounded bg-blue-900/60 px-2 py-0.5 text-[10px] font-bold uppercase tracking-wider text-saffron ring-1 ring-inset ring-saffron/30">
                DMI
              </span>
              <span className="font-medium">
                {user.name || user.full_name} ({user.jurisdiction || "Central E-Commerce Cell"})
              </span>
              {onLogout && (
                <button
                  type="button"
                  onClick={onLogout}
                  className="rounded bg-white/10 px-2 py-0.5 text-[11px] font-medium text-white hover:bg-white/20 transition-colors"
                >
                  Sign Out
                </button>
              )}
            </div>
          )}
        </div>
      </div>

      {/* Tier 2 - Main Banner */}
      <div className="bg-govt-navy text-white px-4 sm:px-6 py-3.5 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <Emblem light={true} size={42} />
          <div className="flex flex-col">
            <span className="text-xs sm:text-sm font-semibold tracking-wide">उपभोक्ता मामले विभाग</span>
            <span className="text-xs sm:text-sm font-semibold tracking-wide">DEPARTMENT OF CONSUMER AFFAIRS</span>
            <span className="text-[11px] text-white/80 font-medium">Legal Metrology Division • Digital Marketplace Inspectorate</span>
          </div>
        </div>
        <div className="text-right hidden sm:block">
          <span className="text-lg sm:text-xl font-bold tracking-wider text-white">निरीक्षक · NIRIKSHAK</span>
          <p className="text-[11px] text-saffron tracking-wider font-semibold uppercase">Digital Marketplace Inspector Portal</p>
        </div>
      </div>

      {/* Tier 3 - Tricolor Stripe */}
      <div className="flex flex-col w-full">
        <div className="h-[3px] bg-saffron w-full" />
        <div className="h-[3px] bg-white w-full" />
        <div className="h-[3px] bg-india-green w-full" />
      </div>
    </header>
  );
}
