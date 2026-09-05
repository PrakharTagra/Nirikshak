import Emblem from './Emblem';
import { Link } from 'react-router-dom';

export default function GovtHeader({ user, onLogout }) {
  return (
    <header className="w-full flex flex-col">
      {/* Tier 1 - Utility Bar */}
      <div className="bg-govt-dark text-white px-4 py-1 flex justify-between items-center text-xs">
        <div>
          भारत सरकार | GOVERNMENT OF INDIA
        </div>
        <div className="flex items-center gap-4">
          <div className="hidden sm:flex gap-2 items-center" aria-label="Font size controls">
            <button className="hover:underline">A-</button>
            <button className="hover:underline">A</button>
            <button className="hover:underline">A+</button>
          </div>
          <button className="hidden sm:block hover:underline">Skip to Content</button>
          {user && (
            <div className="flex items-center gap-3 border-l border-white/20 pl-3">
              <span className="font-medium">{user.full_name} ({user.jurisdiction || 'AC'})</span>
              {onLogout && (
                <button onClick={onLogout} className="underline hover:text-gray-300">
                  Sign Out
                </button>
              )}
            </div>
          )}
        </div>
      </div>

      {/* Tier 2 - Main Banner */}
      <div className="bg-govt-navy text-white px-4 py-4 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <Emblem light={true} size={44} />
          <div className="flex flex-col">
            <span className="text-sm font-semibold tracking-wide">उपभोक्ता मामले विभाग</span>
            <span className="text-sm font-semibold tracking-wide">DEPARTMENT OF CONSUMER AFFAIRS</span>
            <span className="text-xs text-white/80">Legal Metrology Division</span>
          </div>
        </div>
        <div className="text-right">
          <span className="text-xl font-bold tracking-wider">निरीक्षक · NIRIKSHAK</span>
        </div>
      </div>

      {/* Tier 3 - Tricolor Stripe */}
      <div className="flex flex-col w-full">
        <div className="h-[3px] bg-saffron w-full"></div>
        <div className="h-[3px] bg-white w-full"></div>
        <div className="h-[3px] bg-india-green w-full"></div>
      </div>
    </header>
  );
}
