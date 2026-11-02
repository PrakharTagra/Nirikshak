import React, { useState } from 'react';

// Official SVG vector icon library (Zero emojis used)
function IconPhone({ size = 16, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
    </svg>
  );
}

function IconBuilding({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M3 21h18M3 10h18M5 10v11M9 10v11M15 10v11M19 10v11M12 2l9 8H3l9-8z"/>
    </svg>
  );
}

function IconScale({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="m16 16 3-8 3 8c-.87.65-1.92 1-3 1s-2.13-.35-3-1ZM2 16l3-8 3 8c-.87.65-1.92 1-3 1s-2.13-.35-3-1ZM7 21h10M12 3v18M3 7h18"/>
    </svg>
  );
}

function IconScanner({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M3 7V5a2 2 0 0 1 2-2h2M17 3h2a2 2 0 0 1 2 2v2M21 17v2a2 2 0 0 1-2 2h-2M7 21H5a2 2 0 0 1-2-2v-2M7 12h10"/>
      <circle cx="12" cy="12" r="3"/>
    </svg>
  );
}

function IconMobile({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <rect x="5" y="2" width="14" height="20" rx="2" ry="2"/>
      <line x1="12" y1="18" x2="12.01" y2="18"/>
    </svg>
  );
}

function IconShieldCheck({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
      <polyline points="9 12 11 14 15 10"/>
    </svg>
  );
}

function IconLock({ size = 16, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
      <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
    </svg>
  );
}

function IconAlertTriangle({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z"/>
      <line x1="12" y1="9" x2="12" y2="13"/>
      <line x1="12" y1="17" x2="12.01" y2="17"/>
    </svg>
  );
}

function IconFileText({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
      <polyline points="14 2 14 8 20 8"/>
      <line x1="16" y1="13" x2="8" y2="13"/>
      <line x1="16" y1="17" x2="8" y2="17"/>
      <polyline points="10 9 9 9 8 9"/>
    </svg>
  );
}

function IconCheckCircle({ size = 16, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
      <polyline points="22 4 12 14.01 9 11.01"/>
    </svg>
  );
}

function IconArrowRight({ size = 16, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <line x1="5" y1="12" x2="19" y2="12"/>
      <polyline points="12 5 19 12 12 19"/>
    </svg>
  );
}

function IconChevronDown({ size = 14, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <polyline points="6 9 12 15 18 9"/>
    </svg>
  );
}

function IconChevronUp({ size = 14, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <polyline points="18 15 12 9 6 15"/>
    </svg>
  );
}

function IconServer({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <rect x="2" y="2" width="20" height="8" rx="2" ry="2"/>
      <rect x="2" y="14" width="20" height="8" rx="2" ry="2"/>
      <line x1="6" y1="6" x2="6.01" y2="6"/>
      <line x1="6" y1="18" x2="6.01" y2="18"/>
    </svg>
  );
}

function IconClose({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <line x1="18" y1="6" x2="6" y2="18"/>
      <line x1="6" y1="6" x2="18" y2="18"/>
    </svg>
  );
}

// Statutory GIGW Policies
const POLICIES = {
  helpline: {
    title: 'National Consumer Helpline (NCH)',
    badge: 'Department of Consumer Affairs, Government of India',
    content: (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.82rem', color: '#334155', lineHeight: 1.6 }}>
        <div style={{ background: '#EFF6FF', borderLeft: '4px solid #06038D', padding: '0.85rem 1.25rem', borderRadius: '0 4px 4px 0' }}>
          <p style={{ fontWeight: 700, color: '#06038D', fontSize: '0.95rem', margin: 0 }}>Toll-Free National Helpline: 1915</p>
          <p style={{ margin: '0.25rem 0 0 0', color: '#475569', fontSize: '0.8rem' }}>
            Operated under the Department of Consumer Affairs, Ministry of Consumer Affairs, Food & Public Distribution.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.4rem', textTransform: 'uppercase', fontSize: '0.78rem', letterSpacing: '0.04em' }}>Statutory Consumer Redressal Channels</h4>
          <ul style={{ paddingLeft: '1.25rem', display: 'flex', flexDirection: 'column', gap: '0.35rem' }}>
            <li><strong>Toll-Free Helpline:</strong> 1915 or 1800-11-4000 (Available 8:00 AM to 8:00 PM, all days except National Holidays)</li>
            <li><strong>SMS Redressal:</strong> Send SMS to 8800001915</li>
            <li><strong>National Consumer Portal:</strong> consumerhelpline.gov.in</li>
            <li><strong>UMANG Mobile Integration:</strong> Integrated NCH Services available across all States & UTs</li>
          </ul>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.4rem', textTransform: 'uppercase', fontSize: '0.78rem', letterSpacing: '0.04em' }}>Report Legal Metrology Non-Compliance</h4>
          <p>
            Citizens and consumers may report non-standard packaging, missing mandatory declarations (MRP, Net Quantity, Country of Origin, Manufacturer Details), or overcharging above printed Maximum Retail Price. Verified reports are automatically routed to jurisdictional State Controllers of Legal Metrology.
          </p>
        </div>
        <div style={{ borderTop: '1px solid #E2E8F0', paddingTop: '0.75rem', fontSize: '0.75rem', color: '#64748B' }}>
          Krishi Bhawan, Dr. Rajendra Prasad Road, New Delhi - 110001
        </div>
      </div>
    ),
  },
  privacy: {
    title: 'Official Privacy Policy',
    badge: 'Guidelines for Indian Government Websites (GIGW 3.0)',
    content: (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.82rem', color: '#334155', lineHeight: 1.6 }}>
        <p>
          This portal does not automatically collect personal identifiable information without explicit regulatory authorization. Departmental and officer sessions are recorded strictly for statutory audit trails mandated under the Legal Metrology Act, 2009.
        </p>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.4rem', textTransform: 'uppercase', fontSize: '0.78rem', letterSpacing: '0.04em' }}>Statutory Session Logging & Purpose</h4>
          <p>
            For appointed Controllers, Assistant Controllers, and inspection personnel, this system cryptographically records administrative session IDs, inspection timestamps, geolocations, and statutory decisions strictly for verification logs mandated under Section 15 of the Act.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.4rem', textTransform: 'uppercase', fontSize: '0.78rem', letterSpacing: '0.04em' }}>Data Security & Storage</h4>
          <p>
            All transmissions are secured via TLS 1.3 encryption. Inspection dossiers, packaging OCR data, and violation registers are archived in secured cloud infrastructure in compliance with the Information Technology Act, 2000.
          </p>
        </div>
        <div style={{ borderTop: '1px solid #E2E8F0', paddingTop: '0.75rem', fontSize: '0.75rem', color: '#64748B' }}>
          Reviewed in accordance with CERT-In and MeitY Security Guidelines.
        </div>
      </div>
    ),
  },
  terms: {
    title: 'Terms of Service & Regulatory Authorization',
    badge: 'Statutory Regulatory Platform',
    content: (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.82rem', color: '#334155', lineHeight: 1.6 }}>
        <div style={{ background: '#FFFBEB', borderLeft: '4px solid #D97706', padding: '0.85rem 1.25rem', borderRadius: '0 4px 4px 0' }}>
          <p style={{ fontWeight: 700, color: '#78350F', margin: 0 }}>Restricted Official Government System</p>
          <p style={{ margin: '0.25rem 0 0 0', color: '#92400E', fontSize: '0.8rem' }}>
            This platform is designated exclusively for appointed Controllers, Assistant Controllers, and authorized Legal Metrology Officers.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.4rem', textTransform: 'uppercase', fontSize: '0.78rem', letterSpacing: '0.04em' }}>Evidentiary Legal Validity</h4>
          <p>
            Inspection dossiers, OCR extraction records, and sanction orders issued through NIRIKSHAK carry evidentiary value under the Legal Metrology Act, 2009 and the Bharatiya Sakshya Adhiniyam, 2023. Every decision, sanction, or compound notice is cryptographically signed and non-repudiable.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.4rem', textTransform: 'uppercase', fontSize: '0.78rem', letterSpacing: '0.04em' }}>Penal Provisions for Unauthorized Access</h4>
          <p>
            Unauthorized access, credential sharing, tampering with inspection records, or attempting unauthorized penetrations is an offense punishable under Sections 43 and 66 of the Information Technology Act, 2000 and Section 318 of Bharatiya Nyaya Sanhita (BNS).
          </p>
        </div>
        <div style={{ borderTop: '1px solid #E2E8F0', paddingTop: '0.75rem', fontSize: '0.75rem', color: '#64748B' }}>
          Department of Consumer Affairs, Government of India.
        </div>
      </div>
    ),
  },
  hyperlink: {
    title: 'Hyperlinking Policy',
    badge: 'Government Web Standards (GIGW)',
    content: (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.82rem', color: '#334155', lineHeight: 1.6 }}>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.4rem', textTransform: 'uppercase', fontSize: '0.78rem', letterSpacing: '0.04em' }}>Links to External Government Portals</h4>
          <p>
            Links to external statutory authorities (such as BIS, FSSAI, National Consumer Helpline, and State Directorates) are provided strictly for official regulatory reference. The Department does not endorse or guarantee the availability of external links.
          </p>
        </div>
        <div style={{ borderTop: '1px solid #E2E8F0', paddingTop: '0.75rem', fontSize: '0.75rem', color: '#64748B' }}>
          Guidelines for Indian Government Websites (GIGW) Standard.
        </div>
      </div>
    ),
  },
};

export default function App() {
  const [fontSizeLevel, setFontSizeLevel] = useState(0);
  const [loginMenuOpen, setLoginMenuOpen] = useState(false);
  const [activePolicy, setActivePolicy] = useState(null);

  const handleFontSize = (level) => {
    setFontSizeLevel(level);
    const root = document.documentElement;
    if (level === -1) root.style.fontSize = '14px';
    else if (level === 1) root.style.fontSize = '18px';
    else root.style.fontSize = '16px';
  };

  const openPolicy = (key) => () => setActivePolicy(key);
  const closePolicy = () => setActivePolicy(null);

  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column', backgroundColor: 'var(--govt-cream)' }}>
      
      {/* Tier 1 - Official Government Utility Bar */}
      <div style={{
        backgroundColor: 'var(--govt-dark)',
        color: '#FFFFFF',
        fontSize: '0.75rem',
        padding: '0.35rem 1.5rem',
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexWrap: 'wrap',
        gap: '0.75rem',
        borderBottom: '1px solid rgba(255, 255, 255, 0.1)'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <img
            src="/emblem-white.png"
            alt="State Emblem of India"
            style={{ height: '16px', width: 'auto', display: 'block', opacity: 0.95 }}
            onError={(e) => { e.currentTarget.src = '/emblem.png'; }}
          />
          <span style={{ fontWeight: 600, letterSpacing: '0.04em' }}>
            भारत सरकार | GOVERNMENT OF INDIA
          </span>
        </div>

        <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
          {/* Text size controls */}
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.2rem', backgroundColor: 'rgba(0,0,0,0.25)', padding: '0.15rem 0.4rem', borderRadius: '3px' }} aria-label="Text Size Controls">
            <button
              type="button"
              onClick={() => handleFontSize(-1)}
              title="Decrease font size"
              style={{
                backgroundColor: fontSizeLevel === -1 ? '#FFFFFF' : 'transparent',
                color: fontSizeLevel === -1 ? 'var(--govt-dark)' : '#FFFFFF',
                border: 'none',
                borderRadius: '2px',
                padding: '0.1rem 0.35rem',
                fontSize: '0.68rem',
                fontWeight: 700,
                cursor: 'pointer'
              }}
            >
              A-
            </button>
            <button
              type="button"
              onClick={() => handleFontSize(0)}
              title="Reset font size"
              style={{
                backgroundColor: fontSizeLevel === 0 ? '#FFFFFF' : 'transparent',
                color: fontSizeLevel === 0 ? 'var(--govt-dark)' : '#FFFFFF',
                border: 'none',
                borderRadius: '2px',
                padding: '0.1rem 0.35rem',
                fontSize: '0.68rem',
                fontWeight: 700,
                cursor: 'pointer'
              }}
            >
              A
            </button>
            <button
              type="button"
              onClick={() => handleFontSize(1)}
              title="Increase font size"
              style={{
                backgroundColor: fontSizeLevel === 1 ? '#FFFFFF' : 'transparent',
                color: fontSizeLevel === 1 ? 'var(--govt-dark)' : '#FFFFFF',
                border: 'none',
                borderRadius: '2px',
                padding: '0.1rem 0.35rem',
                fontSize: '0.68rem',
                fontWeight: 700,
                cursor: 'pointer'
              }}
            >
              A+
            </button>
          </div>

          <a href="#main-content" style={{ color: 'rgba(255, 255, 255, 0.85)', fontSize: '0.75rem', fontWeight: 500 }}>
            Skip to Content
          </a>

          <span style={{ color: 'rgba(255, 255, 255, 0.25)' }}>|</span>

          <button
            type="button"
            onClick={openPolicy('helpline')}
            style={{
              background: 'none',
              border: 'none',
              color: '#FCD34D',
              fontSize: '0.75rem',
              fontWeight: 700,
              cursor: 'pointer',
              display: 'flex',
              alignItems: 'center',
              gap: '0.4rem',
              padding: 0
            }}
          >
            <IconPhone size={13} />
            <span>National Helpline: 1915</span>
          </button>
        </div>
      </div>

      {/* Tier 2 - Main Ministry Brand Banner (Matching GovtHeader in all Portals) */}
      <header style={{
        backgroundColor: 'var(--govt-navy)',
        color: '#FFFFFF',
        padding: '0.85rem 1.5rem',
        position: 'relative',
        overflow: 'hidden'
      }}>
        <div style={{ maxWidth: '1360px', margin: '0 auto', display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1.25rem', position: 'relative', zIndex: 1 }}>
          
          {/* Left: Official National Emblem + Ministry Stack */}
          <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
            <div style={{
              backgroundColor: 'rgba(255, 255, 255, 0.08)',
              padding: '0.35rem',
              borderRadius: '4px',
              border: '1px solid rgba(255, 255, 255, 0.15)',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: 'inset 0 1px 2px rgba(0,0,0,0.2)'
            }}>
              <img
                src="/emblem-white.png"
                alt="State Emblem of India"
                style={{ height: '54px', width: 'auto', objectFit: 'contain', display: 'block' }}
                onError={(e) => { e.currentTarget.src = '/emblem.png'; }}
              />
            </div>
            <div style={{ display: 'flex', flexDirection: 'column' }}>
              <span style={{ fontSize: '1.05rem', fontWeight: 600, color: '#FFFFFF', lineHeight: 1.25 }}>
                उपभोक्ता मामले विभाग
              </span>
              <span style={{ fontSize: '0.92rem', fontWeight: 800, textTransform: 'uppercase', letterSpacing: '0.05em', color: '#FFFFFF', lineHeight: 1.25 }}>
                Department of Consumer Affairs
              </span>
              <span style={{ fontSize: '0.75rem', color: 'rgba(255, 255, 255, 0.85)', marginTop: '0.15rem' }}>
                Ministry of Consumer Affairs, Food & Public Distribution · Government of India
              </span>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginTop: '0.25rem' }}>
                <span style={{ fontSize: '0.72rem', fontWeight: 700, color: '#FCD34D', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                  Legal Metrology Division
                </span>
                <span style={{ color: 'rgba(255, 255, 255, 0.4)', fontSize: '0.72rem' }}>•</span>
                <span style={{ fontSize: '0.72rem', color: 'rgba(255, 255, 255, 0.75)' }}>विधिक मापविज्ञान प्रभाग</span>
              </div>
            </div>
          </div>

          {/* Right: Nirikshak System Brand Badge */}
          <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
            <div style={{ textAlign: 'right', display: 'flex', flexDirection: 'column', alignItems: 'flex-end' }}>
              <div style={{ fontSize: '1.4rem', fontWeight: 800, color: '#FFFFFF', letterSpacing: '0.05em' }}>
                निरीक्षक <span style={{ fontWeight: 400, opacity: 0.6 }}>·</span> NIRIKSHAK
              </div>
              <div style={{ fontSize: '0.72rem', fontWeight: 700, color: '#FCD34D', textTransform: 'uppercase', letterSpacing: '0.08em', display: 'inline-flex', alignItems: 'center', gap: '0.35rem', marginTop: '0.15rem' }}>
                <span style={{ width: '6px', height: '6px', borderRadius: '50%', backgroundColor: 'var(--saffron)' }} />
                National Legal Metrology Digital Verification System
              </div>
              <div style={{ fontSize: '0.7rem', color: 'rgba(255, 255, 255, 0.7)', marginTop: '0.15rem' }}>
                The Legal Metrology Act, 2009 & Packaged Commodities Rules, 2011
              </div>
            </div>
            <div style={{
              backgroundColor: '#FFFFFF',
              padding: '0.25rem',
              borderRadius: '4px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: '0 1px 3px rgba(0,0,0,0.2)'
            }}>
              <img
                src="/nirikshak_logo.png"
                alt="Nirikshak Official Logo"
                style={{ height: '54px', width: 'auto', objectFit: 'contain', display: 'block' }}
                onError={(e) => { e.currentTarget.src = '/logo.png'; }}
              />
            </div>
          </div>

        </div>
      </header>

      {/* Tier 3 - National Tricolor Ribbon (9px standard: 3px Saffron, 3px White, 3px Green) */}
      <div className="tricolor-stripe">
        <div className="saffron" />
        <div className="white" />
        <div className="green" />
      </div>

      {/* Official Secondary Navigation Bar */}
      <nav style={{
        backgroundColor: '#FFFFFF',
        borderBottom: '1px solid var(--slate-300)',
        padding: '0.55rem 1.5rem',
        position: 'sticky',
        top: 0,
        zIndex: 40,
        boxShadow: '0 1px 3px rgba(0,0,0,0.03)'
      }}>
        <div style={{ maxWidth: '1360px', margin: '0 auto', display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '0.75rem' }}>
          
          <div style={{ display: 'flex', alignItems: 'center', gap: '1.5rem', flexWrap: 'wrap' }}>
            <a href="#portals" style={{ fontSize: '0.84rem', fontWeight: 700, color: 'var(--govt-navy)', display: 'inline-flex', alignItems: 'center', gap: '0.35rem' }}>
              <IconBuilding size={14} />
              <span>Officer Portals</span>
            </a>
            <a href="#declarations" style={{ fontSize: '0.84rem', fontWeight: 600, color: 'var(--slate-700)' }}>
              Mandatory PCR Declarations
            </a>
            <a href="#pipeline" style={{ fontSize: '0.84rem', fontWeight: 600, color: 'var(--slate-700)' }}>
              Verification Pipeline
            </a>
            <a href="#act" style={{ fontSize: '0.84rem', fontWeight: 600, color: 'var(--slate-700)' }}>
              Legal Framework
            </a>
            <a href="#infrastructure" style={{ fontSize: '0.84rem', fontWeight: 600, color: 'var(--slate-700)' }}>
              System Specifications
            </a>
          </div>

          {/* Officer Portal Gateway Access Button & Menu */}
          <div style={{ position: 'relative' }}>
            <button
              type="button"
              onClick={() => setLoginMenuOpen(!loginMenuOpen)}
              style={{
                backgroundColor: 'var(--govt-navy)',
                color: '#FFFFFF',
                border: 'none',
                padding: '0.5rem 1.15rem',
                borderRadius: '3px',
                fontWeight: 700,
                fontSize: '0.82rem',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                gap: '0.5rem',
                boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
              }}
            >
              <IconBuilding size={14} />
              <span>Officer Login / पोर्टल लॉगिन</span>
              {loginMenuOpen ? <IconChevronUp size={12} /> : <IconChevronDown size={12} />}
            </button>

            {/* Official Portal Dropdown */}
            {loginMenuOpen && (
              <div
                className="fade-in"
                style={{
                  position: 'absolute',
                  right: 0,
                  top: 'calc(100% + 6px)',
                  width: '330px',
                  backgroundColor: '#FFFFFF',
                  borderRadius: '3px',
                  boxShadow: '0 10px 25px rgba(0,0,0,0.15)',
                  border: '1px solid var(--slate-300)',
                  overflow: 'hidden',
                  zIndex: 50
                }}
              >
                <div style={{ backgroundColor: 'var(--govt-dark)', padding: '0.65rem 0.85rem', color: '#FFFFFF' }}>
                  <div style={{ fontSize: '0.68rem', color: '#FCD34D', fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                    Government Authorization Gateway
                  </div>
                  <div style={{ fontSize: '0.82rem', fontWeight: 700, marginTop: '0.1rem' }}>
                    Select Designated Departmental Console
                  </div>
                </div>

                <div style={{ padding: '0.4rem' }}>
                  
                  {/* CLM Admin */}
                  <a
                    href="/admin"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.75rem',
                      padding: '0.65rem 0.75rem',
                      borderRadius: '2px',
                      borderBottom: '1px solid var(--slate-100)',
                      transition: 'background 0.15s'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.backgroundColor = 'var(--slate-100)'}
                    onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'transparent'}
                  >
                    <div style={{
                      width: '32px',
                      height: '32px',
                      borderRadius: '3px',
                      backgroundColor: '#FEF2F2',
                      color: 'var(--govt-maroon)',
                      border: '1px solid #FECACA',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      flexShrink: 0
                    }}>
                      <IconBuilding size={16} />
                    </div>
                    <div>
                      <div style={{ fontSize: '0.82rem', fontWeight: 700, color: 'var(--slate-900)' }}>
                        CLM Admin Portal
                      </div>
                      <div style={{ fontSize: '0.72rem', color: 'var(--slate-500)' }}>
                        Controller of Legal Metrology Directorate
                      </div>
                    </div>
                  </a>

                  {/* Assistant Controller (AC) */}
                  <a
                    href="/ac"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.75rem',
                      padding: '0.65rem 0.75rem',
                      borderRadius: '2px',
                      borderBottom: '1px solid var(--slate-100)',
                      transition: 'background 0.15s'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.backgroundColor = 'var(--slate-100)'}
                    onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'transparent'}
                  >
                    <div style={{
                      width: '32px',
                      height: '32px',
                      borderRadius: '3px',
                      backgroundColor: '#EFF6FF',
                      color: 'var(--govt-navy)',
                      border: '1px solid #BFDBFE',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      flexShrink: 0
                    }}>
                      <IconScale size={16} />
                    </div>
                    <div>
                      <div style={{ fontSize: '0.82rem', fontWeight: 700, color: 'var(--slate-900)' }}>
                        Assistant Controller (AC) Portal
                      </div>
                      <div style={{ fontSize: '0.72rem', color: 'var(--slate-500)' }}>
                        Senior Enforcement & Adjudication Unit
                      </div>
                    </div>
                  </a>

                  {/* DMI Inspector */}
                  <a
                    href="/dmi"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.75rem',
                      padding: '0.65rem 0.75rem',
                      borderRadius: '2px',
                      borderBottom: '1px solid var(--slate-100)',
                      transition: 'background 0.15s'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.backgroundColor = 'var(--slate-100)'}
                    onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'transparent'}
                  >
                    <div style={{
                      width: '32px',
                      height: '32px',
                      borderRadius: '3px',
                      backgroundColor: '#ECFDF5',
                      color: '#065F46',
                      border: '1px solid #A7F3D0',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      flexShrink: 0
                    }}>
                      <IconScanner size={16} />
                    </div>
                    <div>
                      <div style={{ fontSize: '0.82rem', fontWeight: 700, color: 'var(--slate-900)' }}>
                        Digital Inspector (DMI) Portal
                      </div>
                      <div style={{ fontSize: '0.72rem', color: 'var(--slate-500)' }}>
                        E-Commerce Surveillance & Packaging OCR
                      </div>
                    </div>
                  </a>

                  {/* Android APK */}
                  <a
                    href="/api/apk/health"
                    target="_blank"
                    rel="noreferrer"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.75rem',
                      padding: '0.65rem 0.75rem',
                      borderRadius: '2px',
                      transition: 'background 0.15s'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.backgroundColor = 'var(--slate-100)'}
                    onMouseLeave={(e) => e.currentTarget.style.backgroundColor = 'transparent'}
                  >
                    <div style={{
                      width: '32px',
                      height: '32px',
                      borderRadius: '3px',
                      backgroundColor: '#FFFBEB',
                      color: '#92400E',
                      border: '1px solid #FDE68A',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      flexShrink: 0
                    }}>
                      <IconMobile size={16} />
                    </div>
                    <div>
                      <div style={{ fontSize: '0.82rem', fontWeight: 700, color: 'var(--slate-900)' }}>
                        Field Inspector Mobile APK
                      </div>
                      <div style={{ fontSize: '0.72rem', color: 'var(--slate-500)' }}>
                        Physical Package Inspection & API Gateway
                      </div>
                    </div>
                  </a>

                </div>

                <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.5rem 0.75rem', borderTop: '1px solid var(--slate-200)', fontSize: '0.68rem', color: 'var(--slate-500)', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '0.35rem' }}>
                  <IconLock size={12} />
                  <span>Authorized Officers Only · Encrypted TLS 1.3</span>
                </div>
              </div>
            )}
          </div>

        </div>
      </nav>

      {/* Official Statutory Gazette Ribbon */}
      <div style={{
        backgroundColor: '#F8FAFC',
        borderBottom: '1px solid var(--slate-200)',
        padding: '0.45rem 1.5rem',
        fontSize: '0.76rem',
        color: 'var(--slate-700)'
      }}>
        <div style={{ maxWidth: '1360px', margin: '0 auto', display: 'flex', alignItems: 'center', gap: '0.75rem', flexWrap: 'wrap' }}>
          <span style={{
            backgroundColor: 'var(--govt-navy)',
            color: '#FFFFFF',
            fontSize: '0.66rem',
            fontWeight: 800,
            padding: '0.15rem 0.5rem',
            borderRadius: '2px',
            textTransform: 'uppercase',
            letterSpacing: '0.05em'
          }}>
            Official Notice
          </span>
          <span style={{ fontWeight: 600 }}>
            Mandatory Compliance Audit: E-commerce and physical packaged commodity inspections under Rule 6 of PCR, 2011 are active pan-India.
          </span>
          <span style={{ color: 'var(--slate-400)', marginLeft: 'auto', fontSize: '0.72rem' }}>
            Ref: Legal Metrology (Packaged Commodities) Amendment Rules · MoCA
          </span>
        </div>
      </div>

      {/* Main Content Area */}
      <main id="main-content" style={{ flex: 1 }}>

        {/* SECTION 1: OFFICIAL STATUTORY GATEWAY OVERVIEW */}
        <section style={{
          backgroundColor: '#FFFFFF',
          borderBottom: '1px solid var(--slate-300)',
          padding: '2.5rem 1.5rem'
        }}>
          <div className="container-govt" style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(min(100%, 460px), 1fr))', gap: '2.5rem', alignItems: 'start' }}>
            
            {/* Left: Ministry Purpose & Directives */}
            <div>
              <div style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.4rem',
                backgroundColor: '#EFF6FF',
                border: '1px solid #BFDBFE',
                color: 'var(--govt-navy)',
                fontSize: '0.72rem',
                fontWeight: 700,
                textTransform: 'uppercase',
                letterSpacing: '0.05em',
                padding: '0.25rem 0.65rem',
                borderRadius: '2px',
                marginBottom: '1rem'
              }}>
                <IconScale size={13} />
                <span>Statutory Regulatory Infrastructure</span>
              </div>

              <h1 style={{
                fontSize: 'clamp(1.6rem, 2.8vw, 2.3rem)',
                fontWeight: 800,
                color: 'var(--govt-navy)',
                lineHeight: 1.25,
                marginBottom: '0.4rem',
                letterSpacing: '-0.01em'
              }}>
                National Legal Metrology Digital Verification & Surveillance Gateway
              </h1>

              <div style={{ fontSize: '0.95rem', fontWeight: 600, color: 'var(--slate-700)', marginBottom: '1.25rem' }}>
                राष्ट्रीय विधिक मापविज्ञान डिजिटल सत्यापन एवं निगरानी पोर्टल
              </div>

              <p style={{ fontSize: '0.9rem', color: 'var(--slate-700)', lineHeight: 1.65, marginBottom: '1.5rem' }}>
                NIRIKSHAK is the sovereign compliance automation and regulatory enforcement platform instituted by the <strong>Department of Consumer Affairs, Government of India</strong>. Designed to ensure strict compliance with <strong>The Legal Metrology Act, 2009</strong> and <strong>The Legal Metrology (Packaged Commodities) Rules, 2011</strong> across physical supply chains and digital marketplace listings through neural packaging vision, OCR extraction, and multi-tier judicial adjudication workflows.
              </p>

              <div style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
                <a
                  href="#portals"
                  style={{
                    backgroundColor: 'var(--govt-navy)',
                    color: '#FFFFFF',
                    padding: '0.7rem 1.35rem',
                    borderRadius: '2px',
                    fontWeight: 700,
                    fontSize: '0.86rem',
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '0.5rem',
                    boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
                  }}
                >
                  <IconBuilding size={15} />
                  <span>Access Officer Portals</span>
                  <IconArrowRight size={14} />
                </a>

                <a
                  href="#declarations"
                  style={{
                    backgroundColor: '#FFFFFF',
                    color: 'var(--slate-800)',
                    border: '1px solid var(--slate-300)',
                    padding: '0.7rem 1.35rem',
                    borderRadius: '2px',
                    fontWeight: 700,
                    fontSize: '0.86rem',
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '0.5rem'
                  }}
                >
                  <IconFileText size={15} />
                  <span>Mandatory Declarations Matrix</span>
                </a>
              </div>
            </div>

            {/* Right: National Compliance Ledger & Admissibility Status */}
            <div style={{
              border: '1px solid var(--slate-300)',
              backgroundColor: '#FFFFFF',
              borderTop: '3px solid var(--govt-navy)',
              borderRadius: '2px',
              overflow: 'hidden',
              boxShadow: '0 1px 3px rgba(0,0,0,0.04)'
            }}>
              
              <div style={{
                backgroundColor: '#F8F9FA',
                padding: '0.75rem 1.25rem',
                borderBottom: '1px solid var(--slate-200)',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                flexWrap: 'wrap',
                gap: '0.5rem'
              }}>
                <div>
                  <div style={{ fontSize: '0.75rem', fontWeight: 800, textTransform: 'uppercase', letterSpacing: '0.04em', color: 'var(--govt-dark)' }}>
                    Statutory Compliance Registry
                  </div>
                  <div style={{ fontSize: '0.7rem', color: 'var(--slate-500)' }}>
                    Active Nationwide Enforcement Coverage
                  </div>
                </div>
                <div style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  gap: '0.35rem',
                  backgroundColor: '#ECFDF5',
                  color: '#065F46',
                  border: '1px solid #A7F3D0',
                  padding: '0.2rem 0.55rem',
                  borderRadius: '2px',
                  fontSize: '0.68rem',
                  fontWeight: 700
                }}>
                  <span style={{ width: '6px', height: '6px', borderRadius: '50%', backgroundColor: '#10B981' }} />
                  ACTIVE PAN-INDIA
                </div>
              </div>

              <div style={{ padding: '1.25rem' }}>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '0.85rem', marginBottom: '1.25rem' }}>
                  
                  <div style={{ backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', padding: '0.85rem', borderRadius: '2px' }}>
                    <div style={{ fontSize: '0.68rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-600)', letterSpacing: '0.03em' }}>
                      Statutory Rules
                    </div>
                    <div style={{ fontSize: '1.5rem', fontWeight: 800, color: 'var(--govt-navy)', margin: '0.2rem 0' }}>
                      42+
                    </div>
                    <div style={{ fontSize: '0.7rem', color: 'var(--slate-500)' }}>
                      Audited under PCR, 2011
                    </div>
                  </div>

                  <div style={{ backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', padding: '0.85rem', borderRadius: '2px' }}>
                    <div style={{ fontSize: '0.68rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-600)', letterSpacing: '0.03em' }}>
                      Metric Standard
                    </div>
                    <div style={{ fontSize: '1.5rem', fontWeight: 800, color: 'var(--india-green)', margin: '0.2rem 0' }}>
                      100%
                    </div>
                    <div style={{ fontSize: '0.7rem', color: 'var(--slate-500)' }}>
                      Legal Metrology units (kg, g, l)
                    </div>
                  </div>

                  <div style={{ backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', padding: '0.85rem', borderRadius: '2px' }}>
                    <div style={{ fontSize: '0.68rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-600)', letterSpacing: '0.03em' }}>
                      Digital Marketplaces
                    </div>
                    <div style={{ fontSize: '1.35rem', fontWeight: 800, color: '#B45309', margin: '0.2rem 0' }}>
                      Rule 6(10)
                    </div>
                    <div style={{ fontSize: '0.7rem', color: 'var(--slate-500)' }}>
                      E-Commerce surveillance active
                    </div>
                  </div>

                  <div style={{ backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', padding: '0.85rem', borderRadius: '2px' }}>
                    <div style={{ fontSize: '0.68rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-600)', letterSpacing: '0.03em' }}>
                      Field Inspection
                    </div>
                    <div style={{ fontSize: '1.35rem', fontWeight: 800, color: 'var(--govt-navy)', margin: '0.2rem 0' }}>
                      Android APK
                    </div>
                    <div style={{ fontSize: '0.7rem', color: 'var(--slate-500)' }}>
                      On-site offline verification
                    </div>
                  </div>

                </div>

                {/* Evidentiary Notice Banner */}
                <div style={{
                  backgroundColor: '#EFF6FF',
                  border: '1px solid #BFDBFE',
                  borderLeft: '4px solid var(--govt-navy)',
                  padding: '0.75rem 1rem',
                  borderRadius: '0 2px 2px 0',
                  fontSize: '0.78rem',
                  color: '#1E3A8A',
                  display: 'flex',
                  alignItems: 'flex-start',
                  gap: '0.65rem'
                }}>
                  <div style={{ color: 'var(--govt-navy)', marginTop: '0.1rem', flexShrink: 0 }}>
                    <IconShieldCheck size={18} />
                  </div>
                  <div>
                    <strong style={{ display: 'block', marginBottom: '0.15rem' }}>Statutory Evidentiary Validity (Sections 15 & 36)</strong>
                    Timestamped OCR packaging extractions and inspection records carry legal admissibility under the Legal Metrology Act, 2009 and Bharatiya Sakshya Adhiniyam, 2023.
                  </div>
                </div>

              </div>

            </div>

          </div>
        </section>

        {/* SECTION 2: OFFICIAL DEPARTMENTAL PORTALS (CENTRAL CONNECTION HUB) */}
        <section id="portals" style={{ padding: '3.5rem 1.5rem' }}>
          <div className="container-govt">
            
            <div style={{ textAlign: 'center', maxWidth: '820px', margin: '0 auto 2.5rem auto' }}>
              <div style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.35rem',
                backgroundColor: 'var(--govt-navy)',
                color: '#FFFFFF',
                fontSize: '0.7rem',
                fontWeight: 700,
                textTransform: 'uppercase',
                letterSpacing: '0.06em',
                padding: '0.2rem 0.65rem',
                borderRadius: '2px',
                marginBottom: '0.65rem'
              }}>
                <IconBuilding size={13} />
                <span>Statutory Access Consoles</span>
              </div>
              <h2 style={{ fontSize: '2rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.5rem' }}>
                Designated Departmental Portals
              </h2>
              <p style={{ fontSize: '0.9rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                Select your designated statutory jurisdiction to enter your departmental authentication console. System access is governed under Section 15 of the Legal Metrology Act, 2009 and the Information Technology Act, 2000.
              </p>
            </div>

            <div className="grid-cols-auto-fit-360" style={{ marginBottom: '2rem' }}>
              
              {/* Card 1: CLM Admin (Controller of Legal Metrology) */}
              <div style={{
                backgroundColor: '#FFFFFF',
                border: '1px solid var(--slate-300)',
                borderTop: '4px solid var(--govt-maroon)',
                borderRadius: '2px',
                padding: '1.75rem',
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'space-between',
                boxShadow: '0 1px 3px rgba(0,0,0,0.04)'
              }}>
                <div>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
                    <div style={{
                      width: '42px',
                      height: '42px',
                      borderRadius: '3px',
                      backgroundColor: '#FEF2F2',
                      color: 'var(--govt-maroon)',
                      border: '1px solid #FECACA',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center'
                    }}>
                      <IconBuilding size={22} />
                    </div>
                    <span style={{
                      backgroundColor: '#FEF2F2',
                      color: 'var(--govt-maroon)',
                      border: '1px solid #FCA5A5',
                      padding: '0.2rem 0.5rem',
                      borderRadius: '2px',
                      fontSize: '0.68rem',
                      fontWeight: 800,
                      letterSpacing: '0.04em'
                    }}>
                      CENTRAL DIRECTIVE
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.25rem' }}>
                    Controller of Legal Metrology (CLM)
                  </h3>
                  <div style={{ fontSize: '0.78rem', color: 'var(--govt-maroon)', fontWeight: 700, marginBottom: '0.85rem' }}>
                    National Directorate Administration
                  </div>

                  <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                    Apex regulatory console. Issue sovereign policy directives, provision and manage departmental inspector credentials, monitor national compliance registers across states, and supervise cryptographic audit logs.
                  </p>

                  <div style={{ borderTop: '1px solid var(--slate-200)', paddingTop: '0.85rem', marginBottom: '1.25rem' }}>
                    <div style={{ fontSize: '0.72rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-500)', marginBottom: '0.4rem', letterSpacing: '0.04em' }}>
                      Key Administrative Functions:
                    </div>
                    <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--slate-700)' }}>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Nationwide compliance overview and reporting ledger</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Inspector account provisioning & access control</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Statutory audit trails & tamper-evident logs</span>
                      </li>
                    </ul>
                  </div>
                </div>

                <div>
                  <div style={{
                    backgroundColor: 'var(--slate-50)',
                    border: '1px solid var(--slate-200)',
                    padding: '0.65rem 0.85rem',
                    borderRadius: '2px',
                    marginBottom: '1rem',
                    fontSize: '0.72rem',
                    color: 'var(--slate-600)',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '0.4rem'
                  }}>
                    <IconLock size={13} />
                    <span><strong>Restricted:</strong> Authorized Central & State Directorate Officers Only.</span>
                  </div>

                  <a
                    href="/admin"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      gap: '0.5rem',
                      backgroundColor: 'var(--govt-maroon)',
                      color: '#FFFFFF',
                      padding: '0.75rem 1.25rem',
                      borderRadius: '2px',
                      fontWeight: 700,
                      fontSize: '0.86rem',
                      boxShadow: '0 1px 2px rgba(0,0,0,0.1)'
                    }}
                  >
                    <span>Enter CLM Admin Console</span>
                    <IconArrowRight size={14} />
                  </a>
                </div>
              </div>

              {/* Card 2: Assistant Controller (AC) */}
              <div style={{
                backgroundColor: '#FFFFFF',
                border: '1px solid var(--slate-300)',
                borderTop: '4px solid var(--govt-navy)',
                borderRadius: '2px',
                padding: '1.75rem',
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'space-between',
                boxShadow: '0 1px 3px rgba(0,0,0,0.04)'
              }}>
                <div>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
                    <div style={{
                      width: '42px',
                      height: '42px',
                      borderRadius: '3px',
                      backgroundColor: '#EFF6FF',
                      color: 'var(--govt-navy)',
                      border: '1px solid #BFDBFE',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center'
                    }}>
                      <IconScale size={22} />
                    </div>
                    <span style={{
                      backgroundColor: '#EFF6FF',
                      color: 'var(--govt-navy)',
                      border: '1px solid #93C5FD',
                      padding: '0.2rem 0.5rem',
                      borderRadius: '2px',
                      fontSize: '0.68rem',
                      fontWeight: 800,
                      letterSpacing: '0.04em'
                    }}>
                      APPELLATE & REVIEW
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.25rem' }}>
                    Assistant Controller (AC)
                  </h3>
                  <div style={{ fontSize: '0.78rem', color: 'var(--govt-navy)', fontWeight: 700, marginBottom: '0.85rem' }}>
                    Senior Enforcement & Adjudication Unit
                  </div>

                  <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                    Senior supervisory adjudication portal. Review live field and e-commerce statutory violation queues, approve digital Show-Cause notices, initiate compounding proceedings under Section 49, or dismiss invalid claims.
                  </p>

                  <div style={{ borderTop: '1px solid var(--slate-200)', paddingTop: '0.85rem', marginBottom: '1.25rem' }}>
                    <div style={{ fontSize: '0.72rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-500)', marginBottom: '0.4rem', letterSpacing: '0.04em' }}>
                      Key Adjudication Functions:
                    </div>
                    <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--slate-700)' }}>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Inspection docket evaluation & visual evidence review</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Issuance of digital Show-Cause statutory notices</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Compounding sanction or prosecution forwarding</span>
                      </li>
                    </ul>
                  </div>
                </div>

                <div>
                  <div style={{
                    backgroundColor: 'var(--slate-50)',
                    border: '1px solid var(--slate-200)',
                    padding: '0.65rem 0.85rem',
                    borderRadius: '2px',
                    marginBottom: '1rem',
                    fontSize: '0.72rem',
                    color: 'var(--slate-600)',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '0.4rem'
                  }}>
                    <IconLock size={13} />
                    <span><strong>Restricted:</strong> Appointed Assistant Controllers & Review Officers Only.</span>
                  </div>

                  <a
                    href="/ac"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      gap: '0.5rem',
                      backgroundColor: 'var(--govt-navy)',
                      color: '#FFFFFF',
                      padding: '0.75rem 1.25rem',
                      borderRadius: '2px',
                      fontWeight: 700,
                      fontSize: '0.86rem',
                      boxShadow: '0 1px 2px rgba(0,0,0,0.1)'
                    }}
                  >
                    <span>Enter AC Review Console</span>
                    <IconArrowRight size={14} />
                  </a>
                </div>
              </div>

              {/* Card 3: Digital Metrology Inspector (DMI) */}
              <div style={{
                backgroundColor: '#FFFFFF',
                border: '1px solid var(--slate-300)',
                borderTop: '4px solid #047857',
                borderRadius: '2px',
                padding: '1.75rem',
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'space-between',
                boxShadow: '0 1px 3px rgba(0,0,0,0.04)'
              }}>
                <div>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
                    <div style={{
                      width: '42px',
                      height: '42px',
                      borderRadius: '3px',
                      backgroundColor: '#ECFDF5',
                      color: '#047857',
                      border: '1px solid #A7F3D0',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center'
                    }}>
                      <IconScanner size={22} />
                    </div>
                    <span style={{
                      backgroundColor: '#ECFDF5',
                      color: '#047857',
                      border: '1px solid #6EE7B7',
                      padding: '0.2rem 0.5rem',
                      borderRadius: '2px',
                      fontSize: '0.68rem',
                      fontWeight: 800,
                      letterSpacing: '0.04em'
                    }}>
                      MARKETPLACE SURVEILLANCE
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.25rem' }}>
                    Digital Metrology Inspector (DMI)
                  </h3>
                  <div style={{ fontSize: '0.78rem', color: '#047857', fontWeight: 700, marginBottom: '0.85rem' }}>
                    E-Commerce Surveillance & Packaging OCR
                  </div>

                  <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                    Operational inspectorate console. Crawl live marketplace listings (Amazon, Flipkart, Quick-Commerce platforms), execute high-precision neural OCR on packaging image carousels, extract statutory declarations, and file violation dossiers.
                  </p>

                  <div style={{ borderTop: '1px solid var(--slate-200)', paddingTop: '0.85rem', marginBottom: '1.25rem' }}>
                    <div style={{ fontSize: '0.72rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-500)', marginBottom: '0.4rem', letterSpacing: '0.04em' }}>
                      Key Inspectorate Functions:
                    </div>
                    <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--slate-700)' }}>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Automated stealth scraping of marketplace listings</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Tesseract OCR & packaging declaration extraction</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Instant docket submission to jurisdictional AC</span>
                      </li>
                    </ul>
                  </div>
                </div>

                <div>
                  <div style={{
                    backgroundColor: 'var(--slate-50)',
                    border: '1px solid var(--slate-200)',
                    padding: '0.65rem 0.85rem',
                    borderRadius: '2px',
                    marginBottom: '1rem',
                    fontSize: '0.72rem',
                    color: 'var(--slate-600)',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '0.4rem'
                  }}>
                    <IconLock size={13} />
                    <span><strong>Restricted:</strong> Authorized Legal Metrology Inspection Officers Only.</span>
                  </div>

                  <a
                    href="/dmi"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      gap: '0.5rem',
                      backgroundColor: '#047857',
                      color: '#FFFFFF',
                      padding: '0.75rem 1.25rem',
                      borderRadius: '2px',
                      fontWeight: 700,
                      fontSize: '0.86rem',
                      boxShadow: '0 1px 2px rgba(0,0,0,0.1)'
                    }}
                  >
                    <span>Enter DMI Scanner Portal</span>
                    <IconArrowRight size={14} />
                  </a>
                </div>
              </div>

            </div>

            {/* Mobile APK Suite & On-Ground Inspection Integration Card */}
            <div style={{
              backgroundColor: '#FFFFFF',
              border: '1px solid var(--slate-300)',
              borderTop: '3px solid #D97706',
              borderRadius: '2px',
              padding: '1.5rem',
              display: 'flex',
              flexDirection: 'column',
              gap: '1rem',
              boxShadow: '0 1px 3px rgba(0,0,0,0.03)'
            }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.85rem' }}>
                  <div style={{
                    width: '38px',
                    height: '38px',
                    borderRadius: '3px',
                    backgroundColor: '#FEF3C7',
                    color: '#B45309',
                    border: '1px solid #FDE68A',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    flexShrink: 0
                  }}>
                    <IconMobile size={20} />
                  </div>
                  <div>
                    <h3 style={{ fontSize: '1.05rem', fontWeight: 800, color: 'var(--slate-900)' }}>
                      Nirikshak Android Field Inspector Suite (Companion APK)
                    </h3>
                    <p style={{ fontSize: '0.78rem', color: 'var(--slate-500)' }}>
                      Mobile Enforcement Suite for Physical Marketplaces, Manufacturing Units & Warehouses
                    </p>
                  </div>
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                  <span style={{
                    backgroundColor: '#ECFDF5',
                    color: '#065F46',
                    border: '1px solid #A7F3D0',
                    padding: '0.2rem 0.55rem',
                    borderRadius: '2px',
                    fontSize: '0.72rem',
                    fontWeight: 700,
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '0.35rem'
                  }}>
                    <span style={{ width: '6px', height: '6px', borderRadius: '50%', backgroundColor: '#10B981' }} />
                    API Online
                  </span>
                  <a
                    href="/api/apk/health"
                    target="_blank"
                    rel="noreferrer"
                    style={{
                      backgroundColor: 'var(--slate-100)',
                      border: '1px solid var(--slate-300)',
                      color: 'var(--slate-800)',
                      padding: '0.45rem 0.85rem',
                      borderRadius: '2px',
                      fontSize: '0.76rem',
                      fontWeight: 700,
                      display: 'inline-flex',
                      alignItems: 'center',
                      gap: '0.4rem'
                    }}
                  >
                    <span>Check APK Backend Service</span>
                    <IconArrowRight size={12} />
                  </a>
                </div>
              </div>

              <div style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.55 }}>
                Field inspectors utilize the dedicated Nirikshak Android application with local SQLite offline storage, camera-based barcode verification, GPS geotagged physical inspection reporting, and synchronization with the central Directorate server.
              </div>
            </div>

            {/* Restricted Official Government Notice (Matching Login.jsx in Portals) */}
            <div style={{
              backgroundColor: '#FFFBEB',
              border: '1px solid #FCD34D',
              borderLeft: '4px solid #D97706',
              borderRadius: '0 2px 2px 0',
              padding: '1rem 1.25rem',
              marginTop: '1.75rem',
              display: 'flex',
              alignItems: 'flex-start',
              gap: '0.85rem'
            }}>
              <div style={{ color: '#D97706', marginTop: '0.1rem', flexShrink: 0 }}>
                <IconAlertTriangle size={20} />
              </div>
              <div style={{ fontSize: '0.8rem', color: '#78350F', lineHeight: 1.55 }}>
                <strong style={{ display: 'block', marginBottom: '0.2rem', textTransform: 'uppercase', letterSpacing: '0.02em' }}>
                  Statutory Security Notice & Access Restriction:
                </strong>
                This is a secure Government of India computing platform designated exclusively for appointed Legal Metrology Officers. Unauthorized access, probing, tampering with inspection records, or attempting unauthorized data extraction is a cognizable offense punishable under Sections 43, 65, and 66 of the Information Technology Act, 2000 and Section 318 of Bharatiya Nyaya Sanhita (BNS).
              </div>
            </div>

          </div>
        </section>

        {/* SECTION 3: STATUTORY PCR DECLARATIONS (GIGW TABULAR MATRIX) */}
        <section id="declarations" style={{
          backgroundColor: '#FFFFFF',
          borderTop: '1px solid var(--slate-300)',
          borderBottom: '1px solid var(--slate-300)',
          padding: '3.5rem 1.5rem'
        }}>
          <div className="container-govt">
            
            <div style={{ maxWidth: '840px', marginBottom: '2rem' }}>
              <div style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.35rem',
                backgroundColor: '#EFF6FF',
                border: '1px solid #BFDBFE',
                color: 'var(--govt-navy)',
                fontSize: '0.7rem',
                fontWeight: 700,
                textTransform: 'uppercase',
                letterSpacing: '0.05em',
                padding: '0.2rem 0.6rem',
                borderRadius: '2px',
                marginBottom: '0.5rem'
              }}>
                <IconFileText size={13} />
                <span>Statutory Compliance Matrix</span>
              </div>
              <h2 style={{ fontSize: '1.85rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.4rem' }}>
                Mandatory Declarations on Pre-Packaged Commodities
              </h2>
              <p style={{ fontSize: '0.88rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                Under Rule 6 of the Legal Metrology (Packaged Commodities) Rules, 2011, every package distributed, sold, or offered for sale in physical retail or digital e-commerce must display the following statutory declarations clearly on the Principal Display Panel (PDP).
              </p>
            </div>

            <div className="govt-table-wrap">
              <table className="govt-table">
                <thead>
                  <tr>
                    <th style={{ width: '15%' }}>Statutory Rule</th>
                    <th style={{ width: '22%' }}>Mandatory Declaration</th>
                    <th style={{ width: '38%' }}>Regulatory Requirement & Standard Format</th>
                    <th style={{ width: '25%' }}>Audit Verification Rule</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><strong>Rule 6(1)(a)</strong></td>
                    <td><strong>Manufacturer / Packer / Importer</strong></td>
                    <td>Complete physical street address, corporate entity name, city, state, and pin code where goods are manufactured, packed, or imported.</td>
                    <td>Absence of physical address or omission of pin code flagged as Non-Compliant.</td>
                  </tr>
                  <tr>
                    <td><strong>Rule 6(1)(aa)</strong></td>
                    <td><strong>Country of Origin</strong></td>
                    <td>Unambiguous country of origin statement (e.g., "Country of Origin: India") without misleading abbreviations.</td>
                    <td>Mandatory on both physical pre-packs and e-commerce listings under Rule 6(10).</td>
                  </tr>
                  <tr>
                    <td><strong>Rule 6(1)(b)</strong></td>
                    <td><strong>Generic / Common Commodity Name</strong></td>
                    <td>Actual trade or generic name clearly identifying the contained commodity to prevent deceptive naming.</td>
                    <td>Must match standard nomenclature prescribed in the First Schedule.</td>
                  </tr>
                  <tr>
                    <td><strong>Rule 6(1)(c) & (e)</strong></td>
                    <td><strong>Net Quantity & Unit Sale Price (USP)</strong></td>
                    <td>Declared in legal standard metric units (g, kg, ml, l, or number). Packages &gt; 1kg / 1L must display Unit Sale Price (₹ per g / ₹ per ml).</td>
                    <td>Non-metric units (lbs, oz, fluid oz) strictly prohibited under Section 11 of the Act.</td>
                  </tr>
                  <tr>
                    <td><strong>Rule 6(1)(d)</strong></td>
                    <td><strong>Month & Year of Manufacture / Packing</strong></td>
                    <td>Month and Year of manufacture, packing, or import clearly printed on the outer display panel.</td>
                    <td>Missing or ambiguous manufacturing/packing date constitutes statutory violation.</td>
                  </tr>
                  <tr>
                    <td><strong>Rule 6(1)(da) & Rule 18</strong></td>
                    <td><strong>Maximum Retail Price (MRP)</strong></td>
                    <td>Consolidated retail price inclusive of all taxes. Mandatory statutory wording: "MRP ₹ ... (Inclusive of all taxes)".</td>
                    <td>Arbitrary charging above printed MRP or missing tax inclusivity statement flagged for compounding.</td>
                  </tr>
                  <tr>
                    <td><strong>Rule 6(1)(n)</strong></td>
                    <td><strong>Consumer Care / Redressal Details</strong></td>
                    <td>Officer name or designation, complete physical postal address, telephone/helpline number, and active email address.</td>
                    <td>Omission of telephone or email is a compoundable violation under Section 49.</td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div style={{ marginTop: '1rem', fontSize: '0.74rem', color: 'var(--slate-500)', display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
              <IconCheckCircle size={13} className="text-emerald-600" />
              <span>Complies with the First and Second Schedules of the Legal Metrology (Packaged Commodities) Rules, 2011.</span>
            </div>

          </div>
        </section>

        {/* SECTION 4: 4-STAGE REGULATORY VERIFICATION PIPELINE */}
        <section id="pipeline" style={{ padding: '3.5rem 1.5rem' }}>
          <div className="container-govt">
            
            <div style={{ textAlign: 'center', maxWidth: '820px', margin: '0 auto 2.5rem auto' }}>
              <div style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.35rem',
                backgroundColor: 'var(--govt-navy)',
                color: '#FFFFFF',
                fontSize: '0.7rem',
                fontWeight: 700,
                textTransform: 'uppercase',
                letterSpacing: '0.06em',
                padding: '0.2rem 0.65rem',
                borderRadius: '2px',
                marginBottom: '0.65rem'
              }}>
                <IconServer size={13} />
                <span>Statutory Verification Lifecycle</span>
              </div>
              <h2 style={{ fontSize: '2rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.5rem' }}>
                Automated 4-Stage Verification Pipeline
              </h2>
              <p style={{ fontSize: '0.9rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                Every physical product scan and digital listing crawl executes through an automated, cryptographically logged 4-stage pipeline.
              </p>
            </div>

            <div className="grid-cols-auto-fit-280">
              
              {/* Step 1 */}
              <div style={{
                backgroundColor: '#FFFFFF',
                border: '1px solid var(--slate-300)',
                borderTop: '3px solid var(--govt-navy)',
                borderRadius: '2px',
                padding: '1.5rem'
              }}>
                <div style={{
                  width: '32px',
                  height: '32px',
                  borderRadius: '2px',
                  backgroundColor: 'var(--govt-navy)',
                  color: '#FFFFFF',
                  fontWeight: 800,
                  fontSize: '0.9rem',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  marginBottom: '1rem'
                }}>
                  01
                </div>
                <h3 style={{ fontSize: '1rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.4rem' }}>
                  Surveillance & Ingestion
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  Digital marketplace stealth crawlers and on-ground field officers ingest high-resolution packaging photo carousels, barcode numbers, and merchant metadata into the processing queue.
                </p>
              </div>

              {/* Step 2 */}
              <div style={{
                backgroundColor: '#FFFFFF',
                border: '1px solid var(--slate-300)',
                borderTop: '3px solid var(--govt-navy)',
                borderRadius: '2px',
                padding: '1.5rem'
              }}>
                <div style={{
                  width: '32px',
                  height: '32px',
                  borderRadius: '2px',
                  backgroundColor: 'var(--govt-navy)',
                  color: '#FFFFFF',
                  fontWeight: 800,
                  fontSize: '0.9rem',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  marginBottom: '1rem'
                }}>
                  02
                </div>
                <h3 style={{ fontSize: '1rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.4rem' }}>
                  Surface Detection & Neural OCR
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  ComplianceEngine microservice performs packaging surface distortion correction, multilingual text segmentation, and high-accuracy Tesseract OCR extraction across all packaging panels.
                </p>
              </div>

              {/* Step 3 */}
              <div style={{
                backgroundColor: '#FFFFFF',
                border: '1px solid var(--slate-300)',
                borderTop: '3px solid var(--govt-navy)',
                borderRadius: '2px',
                padding: '1.5rem'
              }}>
                <div style={{
                  width: '32px',
                  height: '32px',
                  borderRadius: '2px',
                  backgroundColor: 'var(--govt-navy)',
                  color: '#FFFFFF',
                  fontWeight: 800,
                  fontSize: '0.9rem',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  marginBottom: '1rem'
                }}>
                  03
                </div>
                <h3 style={{ fontSize: '1rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.4rem' }}>
                  Statutory Rule Verification
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  Automated rule evaluation against PCR 2011 declarations (MRP inclusivity, metric unit adherence, country of origin presence, and unit sale price math), generating a structured compliance audit record.
                </p>
              </div>

              {/* Step 4 */}
              <div style={{
                backgroundColor: '#FFFFFF',
                border: '1px solid var(--slate-300)',
                borderTop: '3px solid var(--govt-navy)',
                borderRadius: '2px',
                padding: '1.5rem'
              }}>
                <div style={{
                  width: '32px',
                  height: '32px',
                  borderRadius: '2px',
                  backgroundColor: 'var(--govt-navy)',
                  color: '#FFFFFF',
                  fontWeight: 800,
                  fontSize: '0.9rem',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  marginBottom: '1rem'
                }}>
                  04
                </div>
                <h3 style={{ fontSize: '1rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.4rem' }}>
                  AC Adjudication & Notice Issuance
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  Jurisdictional Assistant Controllers review flagged non-compliance dossiers, approve digital Show-Cause notices, schedule compounding proceedings under Section 49, or forward for legal prosecution.
                </p>
              </div>

            </div>

          </div>
        </section>

        {/* SECTION 5: LEGAL FRAMEWORK & TECHNICAL SPECIFICATIONS */}
        <section id="act" style={{
          backgroundColor: '#FFFFFF',
          borderTop: '1px solid var(--slate-300)',
          padding: '3.5rem 1.5rem'
        }}>
          <div className="container-govt">
            
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(min(100%, 460px), 1fr))', gap: '2.5rem' }}>
              
              {/* Statutory Legal Admissibility */}
              <div style={{ border: '1px solid var(--slate-300)', borderTop: '3px solid var(--govt-maroon)', padding: '1.75rem', borderRadius: '2px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.65rem', marginBottom: '0.85rem' }}>
                  <IconScale size={20} className="text-red-900" />
                  <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: 'var(--slate-900)' }}>
                    The Legal Metrology Act, 2009 (Evidentiary Provisions)
                  </h3>
                </div>
                <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1rem' }}>
                  Nirikshak inspection records, OCR bounding boxes, and timestamped crawler dockets are engineered to satisfy evidentiary requirements under statutory law:
                </p>
                <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.65rem', fontSize: '0.8rem', color: 'var(--slate-700)' }}>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '85px' }}>Section 15:</span>
                    <span>Power of inspection, search, seizure, and forfeiture of non-conforming pre-packaged commodities.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '85px' }}>Section 18:</span>
                    <span>Prohibition on manufacture, packing, sale, distribution, or delivery of non-standard packaged goods.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '85px' }}>Section 36:</span>
                    <span>Penalties for selling non-standard packages, including statutory fines and subsequent offense imprisonment.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '85px' }}>Section 49:</span>
                    <span>Statutory compounding of offenses before court filing upon payment of prescribed compounding sum.</span>
                  </li>
                </ul>
              </div>

              {/* Technical Specifications & Microservice Pipeline */}
              <div id="infrastructure" style={{ border: '1px solid var(--slate-300)', borderTop: '3px solid var(--govt-navy)', padding: '1.75rem', borderRadius: '2px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.65rem', marginBottom: '0.85rem' }}>
                  <IconServer size={20} className="text-blue-900" />
                  <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: 'var(--slate-900)' }}>
                    System Architecture & Computing Services
                  </h3>
                </div>
                <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1rem' }}>
                  Decoupled microservice architecture designed for high availability, 24/7 background keep-alive pings, and rapid horizontal scaling:
                </p>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem', fontSize: '0.8rem', color: 'var(--slate-700)' }}>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.65rem 0.85rem', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <strong>CLM Directorate Admin API:</strong> Express.js multi-tier governance backend handling user provisioning, national metrics, and audit logs.
                  </div>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.65rem 0.85rem', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <strong>Senior Inspector Adjudication API:</strong> Dedicated decision engine managing violation queues, notice drafting, and Section 49 compounding registers.
                  </div>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.65rem 0.85rem', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <strong>ComplianceEngine Neural Microservice:</strong> High-precision Tesseract OCR, surface distortion mitigation, and rule analysis engine.
                  </div>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.65rem 0.85rem', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <strong>Stealth Marketplace Scraper:</strong> High-fidelity HTTP scraper extracting uncompressed 1500px packaging images bypassing bot verification.
                  </div>
                </div>
              </div>

            </div>

          </div>
        </section>

      </main>

      {/* Official Government Footer (Matching GovtFooter across all Portals) */}
      <footer style={{ marginTop: 'auto', userSelect: 'none' }}>
        
        {/* Tricolor Ribbon above Footer (9px: 3px Saffron, 3px White, 3px Green) */}
        <div className="tricolor-stripe">
          <div className="saffron" />
          <div className="white" />
          <div className="green" />
        </div>

        {/* Dark Navy Background (Matching GovtFooter in portals) */}
        <div style={{
          backgroundColor: 'var(--govt-dark)',
          color: 'rgba(255, 255, 255, 0.85)',
          padding: '2.5rem 1.5rem 1.5rem 1.5rem',
          fontSize: '0.75rem'
        }}>
          <div className="container-govt">
            
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'flex-start',
              flexWrap: 'wrap',
              gap: '1.5rem',
              paddingBottom: '2rem',
              borderBottom: '1px solid rgba(255, 255, 255, 0.15)'
            }}>
              
              {/* Left: Department Details */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.85rem' }}>
                <img
                  src="/emblem-white.png"
                  alt="Emblem"
                  style={{ height: '44px', width: 'auto', display: 'block', opacity: 0.95 }}
                  onError={(e) => { e.currentTarget.src = '/emblem.png'; }}
                />
                <div>
                  <p style={{ fontWeight: 700, color: '#FFFFFF', fontSize: '0.88rem', margin: 0 }}>
                    Department of Consumer Affairs · उपभोक्ता मामले विभाग
                  </p>
                  <p style={{ color: 'rgba(255, 255, 255, 0.75)', margin: '0.2rem 0 0 0' }}>
                    Ministry of Consumer Affairs, Food & Public Distribution, Government of India
                  </p>
                  <p style={{ color: 'rgba(255, 255, 255, 0.55)', fontSize: '0.7rem', margin: '0.2rem 0 0 0' }}>
                    Administered under the Legal Metrology Act, 2009 & Legal Metrology (Packaged Commodities) Rules, 2011
                  </p>
                </div>
              </div>

              {/* Right: NIC & Digital India Info */}
              <div style={{ textAlign: 'right', display: 'flex', flexDirection: 'column', alignItems: 'flex-end', gap: '0.35rem' }}>
                <div style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  gap: '0.4rem',
                  padding: '0.3rem 0.65rem',
                  borderRadius: '2px',
                  backgroundColor: 'rgba(255, 255, 255, 0.08)',
                  color: '#FFFFFF',
                  fontWeight: 600,
                  fontSize: '0.74rem',
                  border: '1px solid rgba(255, 255, 255, 0.12)'
                }}>
                  <IconBuilding size={13} />
                  <span>Digital India Initiative</span>
                </div>
                <span style={{ fontSize: '0.7rem', color: 'rgba(255, 255, 255, 0.65)' }}>
                  Designed, Developed & Maintained for National Regulatory Enforcement
                </span>
                <span style={{ fontSize: '0.68rem', color: 'rgba(255, 255, 255, 0.5)' }}>
                  National Legal Metrology Digital Verification System (NIRIKSHAK)
                </span>
              </div>

            </div>

            {/* Bottom Row: Copyright & Policies */}
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              flexWrap: 'wrap',
              gap: '1rem',
              paddingTop: '1.25rem',
              fontSize: '0.72rem',
              color: 'rgba(255, 255, 255, 0.65)'
            }}>
              <div>
                © {new Date().getFullYear()} Government of India. All rights reserved. Content Owned by Department of Consumer Affairs.
              </div>
              
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.85rem', flexWrap: 'wrap' }}>
                <button
                  type="button"
                  onClick={openPolicy('helpline')}
                  style={{ background: 'none', border: 'none', color: '#FCD34D', cursor: 'pointer', fontWeight: 700, padding: 0 }}
                >
                  National Consumer Helpline (1915)
                </button>
                <span style={{ color: 'rgba(255, 255, 255, 0.25)' }}>•</span>
                <button
                  type="button"
                  onClick={openPolicy('privacy')}
                  style={{ background: 'none', border: 'none', color: '#FFFFFF', cursor: 'pointer', padding: 0 }}
                >
                  Privacy Policy
                </button>
                <span style={{ color: 'rgba(255, 255, 255, 0.25)' }}>•</span>
                <button
                  type="button"
                  onClick={openPolicy('terms')}
                  style={{ background: 'none', border: 'none', color: '#FFFFFF', cursor: 'pointer', padding: 0 }}
                >
                  Terms of Service
                </button>
                <span style={{ color: 'rgba(255, 255, 255, 0.25)' }}>•</span>
                <button
                  type="button"
                  onClick={openPolicy('hyperlink')}
                  style={{ background: 'none', border: 'none', color: '#FFFFFF', cursor: 'pointer', padding: 0 }}
                >
                  Hyperlink Policy
                </button>
              </div>
            </div>

          </div>
        </div>
      </footer>

      {/* Official Government Policy Dialog Modal (GIGW Compliant, Matching Portals) */}
      {activePolicy && POLICIES[activePolicy] && (
        <div
          role="dialog"
          aria-modal="true"
          onClick={closePolicy}
          style={{
            position: 'fixed',
            inset: 0,
            backgroundColor: 'rgba(0, 0, 0, 0.6)',
            backdropFilter: 'blur(2px)',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            padding: '1rem',
            zIndex: 100
          }}
        >
          <div
            onClick={(e) => e.stopPropagation()}
            style={{
              backgroundColor: '#FFFFFF',
              borderRadius: '2px',
              maxWidth: '620px',
              width: '100%',
              boxShadow: '0 20px 40px rgba(0, 0, 0, 0.25)',
              border: '1px solid var(--slate-300)',
              overflow: 'hidden'
            }}
          >
            {/* Modal Header */}
            <div style={{
              backgroundColor: 'var(--govt-navy)',
              color: '#FFFFFF',
              padding: '0.85rem 1.25rem',
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center'
            }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.65rem' }}>
                <img
                  src="/emblem-white.png"
                  alt="Emblem"
                  style={{ height: '28px', width: 'auto', display: 'block' }}
                  onError={(e) => { e.currentTarget.src = '/emblem.png'; }}
                />
                <div>
                  <h3 style={{ fontSize: '0.88rem', fontWeight: 800, margin: 0, color: '#FFFFFF' }}>
                    {POLICIES[activePolicy].title}
                  </h3>
                  <div style={{ fontSize: '0.68rem', color: '#FCD34D', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                    {POLICIES[activePolicy].badge}
                  </div>
                </div>
              </div>
              <button
                type="button"
                onClick={closePolicy}
                aria-label="Close dialog"
                style={{
                  background: 'none',
                  border: 'none',
                  color: 'rgba(255, 255, 255, 0.8)',
                  cursor: 'pointer',
                  padding: '0.25rem',
                  display: 'flex',
                  alignItems: 'center'
                }}
              >
                <IconClose size={18} />
              </button>
            </div>

            {/* Modal Tricolor Bar */}
            <div className="tricolor-stripe" style={{ height: '6px' }}>
              <div className="saffron" style={{ height: '2px' }} />
              <div className="white" style={{ height: '2px' }} />
              <div className="green" style={{ height: '2px' }} />
            </div>

            {/* Modal Body */}
            <div style={{ padding: '1.25rem', maxHeight: '68vh', overflowY: 'auto' }}>
              {POLICIES[activePolicy].content}
            </div>

            {/* Modal Footer */}
            <div style={{
              backgroundColor: 'var(--slate-50)',
              borderTop: '1px solid var(--slate-200)',
              padding: '0.65rem 1.25rem',
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center'
            }}>
              <span style={{ fontSize: '0.72rem', color: 'var(--slate-500)', fontWeight: 600 }}>
                Government of India · भारत सरकार
              </span>
              <button
                type="button"
                onClick={closePolicy}
                style={{
                  backgroundColor: 'var(--govt-navy)',
                  color: '#FFFFFF',
                  border: 'none',
                  padding: '0.45rem 1.15rem',
                  borderRadius: '2px',
                  fontWeight: 600,
                  fontSize: '0.78rem',
                  cursor: 'pointer'
                }}
              >
                Close Window
              </button>
            </div>

          </div>
        </div>
      )}

    </div>
  );
}
