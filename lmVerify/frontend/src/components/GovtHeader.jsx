import React, { useState } from "react";
import Emblem from "./Emblem.jsx";

export default function GovtHeader({ user, onLogout }) {
  const [fontSizeLevel, setFontSizeLevel] = useState(0);

  const handleFontSize = (level) => {
    setFontSizeLevel(level);
    const root = document.documentElement;
    if (level === -1) root.style.fontSize = "14px";
    else if (level === 1) root.style.fontSize = "18px";
    else root.style.fontSize = "16px";
  };

  return (
    <header className="w-full flex flex-col select-none shadow-sm">
      {/* Tier 1 - Official Government Utility Bar */}
      <div className="bg-govt-dark text-white px-4 md:px-8 py-1 flex justify-between items-center text-xs border-b border-white/10">
        <div className="flex items-center gap-2">
          {/* Top leftmost Indian Emblem Symbol mini badge */}
          <Emblem light={true} size={16} className="opacity-90" />
          <span className="font-medium tracking-wide">भारत सरकार | GOVERNMENT OF INDIA</span>
        </div>
        <div className="flex items-center gap-4">
          <div className="hidden sm:flex items-center gap-1 bg-black/20 rounded px-1.5 py-0.5" aria-label="Text Size Controls">
            <button 
              type="button"
              onClick={() => handleFontSize(-1)}
              title="Decrease font size"
              className={`px-1.5 py-0.5 rounded text-[11px] font-semibold transition-colors ${fontSizeLevel === -1 ? 'bg-white text-govt-dark' : 'hover:bg-white/20 text-white/90'}`}
            >
              A-
            </button>
            <button 
              type="button"
              onClick={() => handleFontSize(0)}
              title="Reset font size"
              className={`px-1.5 py-0.5 rounded text-[11px] font-semibold transition-colors ${fontSizeLevel === 0 ? 'bg-white text-govt-dark' : 'hover:bg-white/20 text-white/90'}`}
            >
              A
            </button>
            <button 
              type="button"
              onClick={() => handleFontSize(1)}
              title="Increase font size"
              className={`px-1.5 py-0.5 rounded text-[11px] font-semibold transition-colors ${fontSizeLevel === 1 ? 'bg-white text-govt-dark' : 'hover:bg-white/20 text-white/90'}`}
            >
              A+
            </button>
          </div>
          <a href="#main-content" className="hidden sm:block text-white/80 hover:text-white hover:underline underline-offset-2">
            Skip to Content
          </a>
          {user && (
            <div className="flex items-center gap-3 border-l border-white/20 pl-3">
              <div className="flex items-center gap-1.5">
                <span className="inline-block w-2 h-2 rounded-full bg-emerald-400 animate-pulse" title="Active session" />
                <span className="font-semibold text-white/95">{user.name || user.full_name}</span>
                <span className="text-[10px] bg-white/20 text-amber-300 px-1.5 py-0.5 rounded font-mono font-bold">
                  {user.role || "DMI"}
                </span>
                <span className="hidden md:inline text-[11px] text-white/70">
                  ({user.jurisdiction || "Central E-Commerce Cell"})
                </span>
              </div>
              {onLogout && (
                <button 
                  type="button"
                  onClick={onLogout} 
                  className="bg-white/15 hover:bg-white/25 px-2.5 py-0.5 rounded text-white text-[11px] font-medium transition-colors border border-white/10 cursor-pointer"
                >
                  Sign Out
                </button>
              )}
            </div>
          )}
        </div>
      </div>

      {/* Tier 2 - Main Ministry Brand Banner */}
      <div className="bg-govt-navy text-white px-4 md:px-8 py-3.5 flex flex-wrap justify-between items-center gap-4 relative overflow-hidden">
        {/* Subtle decorative background watermarks */}
        <div className="absolute right-0 top-0 bottom-0 w-96 bg-gradient-to-l from-white/[0.04] to-transparent pointer-events-none" />

        {/* Left corner: Official National Emblem + Ministry Details */}
        <div className="flex items-center gap-4 z-10">
          <div className="p-1 rounded bg-white/5 border border-white/10 shadow-inner">
            <Emblem light={true} size={54} />
          </div>
          <div className="flex flex-col">
            <span className="font-semibold text-base md:text-lg leading-tight tracking-normal text-white">
              उपभोक्ता मामले विभाग
            </span>
            <span className="font-bold text-sm md:text-base leading-tight tracking-wider uppercase text-white/95">
              Department of Consumer Affairs
            </span>
            <span className="text-xs text-white/80 mt-0.5 font-normal">
              Ministry of Consumer Affairs, Food & Public Distribution
            </span>
            <div className="flex items-center gap-2 mt-1">
              <span className="text-[11px] font-semibold text-amber-300 tracking-wide uppercase">
                Legal Metrology Division
              </span>
              <span className="text-white/40 text-xs">•</span>
              <span className="text-[11px] text-white/70">डिजिटल मार्केटप्लेस निरीक्षण प्रभाग</span>
            </div>
          </div>
        </div>

        {/* Right side: Nirikshak Brand Badge */}
        <div className="flex items-center gap-3 z-10 self-center sm:self-auto">
          <div className="text-right flex flex-col items-end">
            <div className="flex items-center gap-2">
              <span className="font-extrabold text-xl md:text-2xl tracking-wider text-white">
                निरीक्षक <span className="font-light opacity-60">·</span> NIRIKSHAK
              </span>
            </div>
            <div className="inline-flex items-center gap-1.5 mt-0.5">
              <span className="h-1.5 w-1.5 rounded-full bg-saffron" />
              <span className="text-[11px] tracking-widest uppercase font-bold text-amber-300">
                DIGITAL MARKETPLACE INSPECTOR PORTAL
              </span>
            </div>
            <span className="text-[10px] text-white/60 tracking-wider">
              E-Commerce Surveillance &amp; Regulatory Audit Console
            </span>
          </div>
        </div>
      </div>

      {/* Tier 3 - National Tricolor Ribbon */}
      <div className="flex flex-col w-full shadow-sm">
        <div className="h-[3px] bg-saffron w-full" />
        <div className="h-[3px] bg-white w-full" />
        <div className="h-[3px] bg-india-green w-full" />
      </div>
    </header>
  );
}
