import Emblem from './Emblem';

export default function GovtHeader({ user, onLogout }) {
  return (
    <header className="flex flex-col">
      {/* Tier 1 - Utility Bar */}
      <div className="bg-govt-dark text-white text-xs py-1.5 px-4 md:px-8 flex justify-between items-center">
        <div className="flex gap-4">
          <span>भारत सरकार | GOVERNMENT OF INDIA</span>
        </div>
        <div className="flex gap-4 items-center">
          <div className="hidden sm:flex gap-1.5 items-center">
            <button className="px-1 hover:bg-white/10 rounded">A-</button>
            <button className="px-1 hover:bg-white/10 rounded">A</button>
            <button className="px-1 hover:bg-white/10 rounded">A+</button>
          </div>
          <a href="#main-content" className="hidden sm:inline hover:underline underline-offset-2">Skip to Content</a>
          {user && (
            <div className="flex items-center gap-3 border-l border-white/20 pl-3">
              <span className="font-medium">{user.full_name}</span>
              <button 
                onClick={onLogout} 
                className="bg-white/10 hover:bg-white/20 px-2 py-1 rounded transition-colors"
              >
                Sign out
              </button>
            </div>
          )}
        </div>
      </div>

      {/* Tier 2 - Main Banner */}
      <div className="bg-govt-navy text-white px-4 md:px-8 py-3 flex flex-wrap justify-between items-center gap-4">
        <div className="flex items-center gap-4">
          <Emblem light={true} size={44} />
          <div className="flex flex-col">
            <span className="font-semibold text-lg leading-tight">उपभोक्ता मामले विभाग</span>
            <span className="font-semibold text-lg leading-tight">Department of Consumer Affairs</span>
            <span className="text-xs opacity-80 mt-1">Ministry of Consumer Affairs, Food & Public Distribution</span>
            <span className="text-[10px] uppercase tracking-wider opacity-70">Legal Metrology Division</span>
          </div>
        </div>
        <div className="flex items-center">
          <div className="text-right">
            <span className="font-bold text-xl md:text-2xl tracking-wide">निरीक्षक · NIRIKSHAK</span>
            <div className="text-xs text-white/80 tracking-widest mt-0.5">CONTROLLER PLATFORM</div>
          </div>
        </div>
      </div>

      {/* Tier 3 - Tricolor Stripe */}
      <div className="h-[9px] w-full flex flex-col">
        <div className="h-[3px] w-full bg-saffron" />
        <div className="h-[3px] w-full bg-white" />
        <div className="h-[3px] w-full bg-india-green" />
      </div>
    </header>
  );
}
