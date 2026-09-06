import { useState } from 'react';
import Emblem from './Emblem';

const POLICIES = {
  helpline: {
    title: 'National Consumer Helpline (NCH)',
    badge: 'Ministry of Consumer Affairs, Food & Public Distribution',
    content: (
      <div className="space-y-4 text-xs text-slate-700 leading-relaxed">
        <div className="bg-blue-50 border-l-4 border-govt-navy p-3 rounded-r">
          <p className="font-bold text-govt-navy text-sm">Toll-Free National Helpline: 1915</p>
          <p className="text-slate-600 mt-0.5">National Consumer Helpline is an initiative of the Department of Consumer Affairs, Government of India.</p>
        </div>
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Assistance Channels</h4>
          <ul className="list-disc pl-4 space-y-1">
            <li><strong>Toll-Free Number:</strong> 1915 or 1800-11-4000 (Available across India, 8:00 AM to 8:00 PM, all days except National Holidays)</li>
            <li><strong>SMS Helpline:</strong> Send SMS to 8800001915</li>
            <li><strong>Official Portal:</strong> <span className="font-mono text-govt-navy">https://consumerhelpline.gov.in</span></li>
            <li><strong>Mobile Application:</strong> NCH App available on UMANG / Google Play Store</li>
          </ul>
        </div>
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Statutory Redressal under Legal Metrology Act, 2009</h4>
          <p>
            Citizens and consumers may report discrepancies regarding non-standard weights, absence of mandatory declarations (MRP, Net Quantity, Country of Origin, Manufacturer Details), and overcharging on packaged commodities. Reports submitted through this portal are directly routed to the designated Controller and Assistant Controllers of Legal Metrology.
          </p>
        </div>
        <div className="border-t border-slate-200 pt-3 text-[11px] text-slate-500">
          Krishi Bhawan, Dr. Rajendra Prasad Road, New Delhi - 110001
        </div>
      </div>
    ),
  },
  privacy: {
    title: 'Official Privacy Policy',
    badge: 'Guidelines for Indian Government Websites (GIGW)',
    content: (
      <div className="space-y-4 text-xs text-slate-700 leading-relaxed">
        <p>
          This portal does not automatically capture any specific personal information from you (like name, phone number or e-mail address), that allows us to identify you individually, unless you choose to provide such information in official inspection filings.
        </p>
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Information Collected & Purpose</h4>
          <p>
            For authorized officers and inspectors, this system records administrative session information, IP addresses, inspection timestamps, geolocations, and statutory decisions strictly for verification logs and accountability mandated under Section 15 of the Legal Metrology Act, 2009.
          </p>
        </div>
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Data Security & Retention</h4>
          <p>
            All data transmissions are encrypted using Transport Layer Security (TLS 1.3). Inspection dossiers, laboratory tests, and violation registers are archived in secured National Informatics Centre (NIC) cloud infrastructure in compliance with the Information Technology Act, 2000 and data retention guidelines.
          </p>
        </div>
        <div className="border-t border-slate-200 pt-3 text-[11px] text-slate-500">
          Last reviewed in accordance with CERT-In and MeitY Security Guidelines.
        </div>
      </div>
    ),
  },
  terms: {
    title: 'Terms of Use & Regulatory Authorization',
    badge: 'Statutory Regulatory Platform',
    content: (
      <div className="space-y-4 text-xs text-slate-700 leading-relaxed">
        <div className="bg-amber-50 border-l-4 border-amber-600 p-3 rounded-r">
          <p className="font-bold text-amber-950">Restricted Official Government System</p>
          <p className="text-slate-700 mt-0.5">
            This platform is designated exclusively for appointed Controllers, Assistant Controllers, and authorized Legal Metrology Officers.
          </p>
        </div>
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Statutory Validity</h4>
          <p>
            Reports and sanction orders issued through NIRIKSHAK carry evidentiary value under the Legal Metrology Act, 2009 and the Indian Evidence Act. Every decision, sanction, or compound notice is cryptographically signed and non-repudiable.
          </p>
        </div>
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Offenses & Penalties</h4>
          <p>
            Unauthorized access, credential sharing, tampering with inspection records, or attempting unauthorized penetrations is an offense punishable under Sections 43, 65, and 66 of the Information Technology Act, 2000 and relevant provisions of the Bharatiya Nyaya Sanhita (BNS).
          </p>
        </div>
        <div className="border-t border-slate-200 pt-3 text-[11px] text-slate-500">
          Department of Consumer Affairs, Government of India.
        </div>
      </div>
    ),
  },
  hyperlink: {
    title: 'Hyperlinking Policy',
    badge: 'Government Web Standards',
    content: (
      <div className="space-y-4 text-xs text-slate-700 leading-relaxed">
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Links to External Websites/Portals</h4>
          <p>
            At many places in this website, you will find links to other websites/portals created and maintained by other government departments, State Legal Metrology Directorates, and statutory bodies (such as BIS, FSSAI, Consumer Helpline). These links are provided for regulatory coordination and official convenience.
          </p>
        </div>
        <div>
          <h4 className="font-bold text-slate-900 mb-1">Permission to Link</h4>
          <p>
            Prior permission is not required to link directly to information hosted on this portal. However, pages from this site must load into a newly opened browser window and not within framing partitions on external websites.
          </p>
        </div>
        <div className="border-t border-slate-200 pt-3 text-[11px] text-slate-500">
          In conformity with the Guidelines for Indian Government Websites (GIGW 3.0).
        </div>
      </div>
    ),
  },
};

export default function GovtFooter() {
  const [activePolicy, setActivePolicy] = useState(null);

  const openPolicy = (key) => (e) => {
    e.preventDefault();
    setActivePolicy(key);
  };

  const closePolicy = () => setActivePolicy(null);

  return (
    <>
      <footer className="mt-auto flex flex-col select-none">
        {/* Tricolor stripe */}
        <div className="h-[9px] w-full flex flex-col">
          <div className="h-[3px] w-full bg-saffron" />
          <div className="h-[3px] w-full bg-white" />
          <div className="h-[3px] w-full bg-india-green" />
        </div>
        
        <div className="bg-govt-dark text-white/85 py-8 px-4 md:px-8 text-xs">
          <div className="max-w-7xl mx-auto flex flex-col gap-6">
            <div className="flex flex-col md:flex-row items-center md:items-start justify-between gap-6">
              <div className="flex items-center gap-3 text-center md:text-left">
                <Emblem light={true} size={42} className="opacity-95" />
                <div>
                  <p className="font-semibold text-white text-sm">
                    Department of Consumer Affairs · उपभोक्ता मामले विभाग
                  </p>
                  <p className="text-white/75 mt-0.5">
                    Ministry of Consumer Affairs, Food & Public Distribution, Government of India
                  </p>
                  <p className="text-white/60 text-[11px] mt-0.5">
                    Administered under the Legal Metrology Act, 2009 & Legal Metrology (Packaged Commodities) Rules, 2011
                  </p>
                </div>
              </div>

              <div className="flex flex-col items-center md:items-end text-center md:text-right gap-1.5">
                <div className="inline-flex items-center gap-2 px-3 py-1 rounded bg-white/10 text-white font-medium text-xs border border-white/15">
                  <span className="text-emerald-400">🏛️</span>
                  <span>Digital India Initiative</span>
                </div>
                <span className="text-[11px] text-white/70">
                  Designed, Developed & Hosted by National Informatics Centre (NIC)
                </span>
                <span className="text-[10px] text-white/50">
                  National Legal Metrology Verification System (NIRIKSHAK)
                </span>
              </div>
            </div>
            
            <div className="flex flex-col md:flex-row justify-between items-center border-t border-white/15 pt-5 gap-3">
              <p className="text-[11px] text-white/65">
                © {new Date().getFullYear()} Government of India. All rights reserved. Content Owned by Department of Consumer Affairs.
              </p>
              <div className="flex flex-wrap justify-center items-center gap-3 text-[11px] text-white/80">
                <button 
                  onClick={openPolicy('helpline')}
                  className="hover:text-amber-300 font-semibold cursor-pointer underline-offset-2 hover:underline transition-colors"
                >
                  National Consumer Helpline (1915)
                </button>
                <span className="text-white/30">•</span>
                <button 
                  onClick={openPolicy('privacy')}
                  className="hover:text-white cursor-pointer underline-offset-2 hover:underline transition-colors"
                >
                  Privacy Policy
                </button>
                <span className="text-white/30">•</span>
                <button 
                  onClick={openPolicy('terms')}
                  className="hover:text-white cursor-pointer underline-offset-2 hover:underline transition-colors"
                >
                  Terms of Service
                </button>
                <span className="text-white/30">•</span>
                <button 
                  onClick={openPolicy('hyperlink')}
                  className="hover:text-white cursor-pointer underline-offset-2 hover:underline transition-colors"
                >
                  Hyperlink Policy
                </button>
              </div>
            </div>
          </div>
        </div>
      </footer>

      {/* Official Government Policy Dialog Modal */}
      {activePolicy && POLICIES[activePolicy] && (
        <div 
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/60 backdrop-blur-xs p-4"
          role="dialog"
          aria-modal="true"
          onClick={closePolicy}
        >
          <div 
            className="w-full max-w-xl bg-white rounded shadow-2xl border border-slate-300 overflow-hidden animate-in fade-in zoom-in-95 duration-150"
            onClick={(e) => e.stopPropagation()}
          >
            {/* Modal Header */}
            <div className="bg-govt-navy text-white px-5 py-3.5 flex items-center justify-between">
              <div className="flex items-center gap-3">
                <Emblem light={true} size={30} />
                <div>
                  <h3 className="font-bold text-sm leading-tight text-white">
                    {POLICIES[activePolicy].title}
                  </h3>
                  <span className="text-[10px] text-amber-300 font-medium tracking-wide uppercase">
                    {POLICIES[activePolicy].badge}
                  </span>
                </div>
              </div>
              <button 
                onClick={closePolicy}
                className="text-white/80 hover:text-white hover:bg-white/10 rounded p-1.5 text-sm transition-colors cursor-pointer"
                aria-label="Close dialog"
              >
                ✕
              </button>
            </div>

            {/* Modal Tricolor Bar */}
            <div className="h-[3px] w-full flex">
              <div className="w-1/3 bg-saffron" />
              <div className="w-1/3 bg-white" />
              <div className="w-1/3 bg-india-green" />
            </div>

            {/* Modal Body */}
            <div className="p-6 max-h-[70vh] overflow-y-auto">
              {POLICIES[activePolicy].content}
            </div>

            {/* Modal Footer */}
            <div className="bg-slate-50 px-5 py-3 border-t border-slate-200 flex justify-between items-center text-xs">
              <span className="text-slate-500 font-medium text-[11px]">
                Government of India · भारत सरकार
              </span>
              <button
                onClick={closePolicy}
                className="bg-govt-navy text-white px-4 py-1.5 rounded text-xs font-semibold hover:bg-blue-900 transition-colors cursor-pointer"
              >
                Close Window
              </button>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
