import React, { useState } from 'react';

// Official SVG vector icon library (Zero casual emojis used)
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

function IconBookOpen({ size = 18, className = "" }) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" aria-hidden="true">
      <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
      <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/>
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
  const [activeTab, setActiveTab] = useState('rules');

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
                The Legal Metrology (Packaged Commodities) Rules, 2011 · G.S.R. 202(E)
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
            <a href="#gazette-masthead" style={{ fontSize: '0.84rem', fontWeight: 600, color: 'var(--slate-700)' }}>
              Gazette Notification G.S.R. 202(E)
            </a>
            <a href="#statutory-rulebook" style={{ fontSize: '0.84rem', fontWeight: 600, color: 'var(--slate-700)' }}>
              PCR 2011 Statutory Rulebook
            </a>
            <a href="#pipeline" style={{ fontSize: '0.84rem', fontWeight: 600, color: 'var(--slate-700)' }}>
              Verification Pipeline
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
                        Director / Controller (Rules 27-30 & 33)
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
                        Adjudication & Seizure (Rules 19, 20, 23 & Sec 49)
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
                      color: '#047857',
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
                        Marketplace Surveillance & OCR (Rules 6, 7 & 9)
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
                        On-Site Testing & Form A/B (Rules 19, 21 & Sched V-VII)
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

      {/* Main Content Area */}
      <main id="main-content" style={{ flex: 1 }}>

        {/* SECTION 1: OFFICIAL GAZETTE OF INDIA EXTRAORDINARY MASTHEAD & AUTHORITY */}
        <section id="gazette-masthead" style={{
          backgroundColor: '#FFFFFF',
          borderBottom: '1px solid var(--slate-300)',
          padding: '2.5rem 1.5rem'
        }}>
          <div className="container-govt">
            
            {/* The Gazette of India Notification Card (Directly based on PDF Page 1) */}
            <div className="gazette-masthead" style={{ marginBottom: '2rem' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: '1rem', borderBottom: '1px solid var(--slate-200)', paddingBottom: '1rem' }}>
                <div>
                  <div style={{ fontSize: '0.78rem', fontWeight: 800, letterSpacing: '0.08em', color: 'var(--slate-700)', textTransform: 'uppercase' }}>
                    [भाग II—खण्ड 3(i)] · भारत का राजपत्र : असाधारण · THE GAZETTE OF INDIA : EXTRAORDINARY
                  </div>
                  <div style={{ fontSize: '0.88rem', fontWeight: 800, color: 'var(--govt-navy)', marginTop: '0.25rem' }}>
                    MINISTRY OF CONSUMER AFFAIRS, FOOD AND PUBLIC DISTRIBUTION
                  </div>
                  <div style={{ fontSize: '0.8rem', color: 'var(--slate-600)' }}>
                    (Department of Consumer Affairs) · New Delhi, the 7th March, 2011
                  </div>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', flexWrap: 'wrap' }}>
                  <span className="gazette-tag">NOTIFICATION G.S.R. 202(E)</span>
                  <span className="gazette-tag">Effective: 1st April, 2011</span>
                  <span className="gazette-tag">Enacted u/s 52(1) &amp; (2)(j),(q)</span>
                </div>
              </div>

              <div style={{ padding: '1rem 0 0.5rem 0', fontSize: '0.84rem', color: 'var(--slate-700)', lineHeight: 1.65 }}>
                <p style={{ margin: 0 }}>
                  <strong>Statutory Preamble:</strong> G.S.R. 202(E).—In exercise of the powers conferred by sub-section (1) read with clause (j) and (q) of sub-section (2) of section 52 of the <strong>Legal Metrology Act, 2009 (1 of 2010)</strong>, the Central Government hereby makes <strong>The Legal Metrology (Packaged Commodities) Rules, 2011</strong>. NIRIKSHAK serves as the sovereign digital surveillance, automated packaging OCR verification, and hierarchical adjudication platform enforcing these statutory rules.
                </p>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem', marginTop: '1rem', paddingTop: '0.75rem', borderTop: '1px solid var(--slate-100)', fontSize: '0.75rem', color: 'var(--slate-500)' }}>
                  <span>Published under Authority: RAKESH KACKER, Spl. Secy. [F. No. WM-9(6)/2010-Pt.]</span>
                  <span>Enforcing Chapter I through Chapter VII &amp; Schedules I to VII</span>
                </div>
              </div>
            </div>

            {/* Overview Grid */}
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(min(100%, 460px), 1fr))', gap: '2rem', alignItems: 'start' }}>
              
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
                  <span>Statutory Digital Enforcement Architecture</span>
                </div>

                <h1 style={{
                  fontSize: 'clamp(1.6rem, 2.6vw, 2.2rem)',
                  fontWeight: 800,
                  color: 'var(--govt-navy)',
                  lineHeight: 1.25,
                  marginBottom: '0.4rem',
                  letterSpacing: '-0.01em'
                }}>
                  National Legal Metrology Digital Verification System (NIRIKSHAK)
                </h1>

                <div style={{ fontSize: '0.92rem', fontWeight: 600, color: 'var(--slate-700)', marginBottom: '1.25rem' }}>
                  विधिक मापविज्ञान (पैकेज्ड कमोडिटीज) नियमावली, 2011 का स्वचालित प्रवर्तन
                </div>

                <p style={{ fontSize: '0.88rem', color: 'var(--slate-700)', lineHeight: 1.65, marginBottom: '1.5rem' }}>
                  Engineered to eliminate enforcement bottlenecks under the Legal Metrology (Packaged Commodities) Rules, 2011. NIRIKSHAK unifies marketplace computer vision, multi-panel neural packaging OCR, automated SI metric unit verification, and the Seventh Schedule statutory inspection data sheets into an integrated government portal connecting Controllers, Assistant Controllers, and Field Inspectors.
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
                    <span>Enter Officer Portals</span>
                    <IconArrowRight size={14} />
                  </a>

                  <a
                    href="#statutory-rulebook"
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
                    <IconBookOpen size={15} />
                    <span>Explore PCR 2011 Rules &amp; Schedules</span>
                  </a>
                </div>
              </div>

              {/* Gazette Key Provisions Panel */}
              <div style={{
                border: '1px solid var(--slate-300)',
                backgroundColor: '#FFFFFF',
                borderTop: '3px solid var(--govt-navy)',
                borderRadius: '2px',
                boxShadow: '0 1px 3px rgba(0,0,0,0.04)',
                overflow: 'hidden'
              }}>
                <div style={{ backgroundColor: '#F8FAFC', padding: '0.75rem 1.25rem', borderBottom: '1px solid var(--slate-200)', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <span style={{ fontSize: '0.75rem', fontWeight: 800, textTransform: 'uppercase', letterSpacing: '0.04em', color: 'var(--govt-dark)' }}>
                    PCR 2011 Core Chapters &amp; Schedules
                  </span>
                  <span style={{ fontSize: '0.68rem', fontWeight: 700, color: 'var(--india-green)', backgroundColor: '#ECFDF5', padding: '0.15rem 0.5rem', border: '1px solid #A7F3D0', borderRadius: '2px' }}>
                    GAZETTE STANDARD
                  </span>
                </div>

                <div style={{ padding: '1.25rem', display: 'flex', flexDirection: 'column', gap: '0.75rem', fontSize: '0.82rem' }}>
                  <div style={{ padding: '0.65rem 0.85rem', backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <div style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>Chapter II: Retail Package Provisions (Rules 3 to 23)</div>
                    <div style={{ color: 'var(--slate-600)', fontSize: '0.76rem', marginTop: '0.2rem' }}>
                      Mandatory declarations (Rule 6), Numeral/Letter heights (Rule 7, Tables I &amp; II), Display area &amp; contrast (Rules 8 &amp; 9), Complete address with PIN code (Rule 10), Standard SI units (Rule 13), Pricing &amp; MRP (Rule 18), Deceptive packaging (Rule 23).
                    </div>
                  </div>

                  <div style={{ padding: '0.65rem 0.85rem', backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <div style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>Chapter VI: Registration of Manufacturers &amp; Importers (Rules 27 to 30)</div>
                    <div style={{ color: 'var(--slate-600)', fontSize: '0.76rem', marginTop: '0.2rem' }}>
                      Application to Director/Controller with fee of ₹500, state-wise register maintenance, public register inspection, shorter address permission.
                    </div>
                  </div>

                  <div style={{ padding: '0.65rem 0.85rem', backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <div style={{ fontWeight: 700, color: '#047857' }}>Schedules I, II, V, VI &amp; VII (Forms A &amp; B)</div>
                    <div style={{ color: 'var(--slate-600)', fontSize: '0.76rem', marginTop: '0.2rem' }}>
                      Maximum Permissible Error (First Schedule), Standard pack sizes (Second Schedule), Lot sampling &lt;4000: 32 / &gt;4000: 80 (Fifth Schedule), Testing &amp; Tare method (Sixth Schedule), Form A/B Data Sheets (Seventh Schedule).
                    </div>
                  </div>

                  <div style={{ padding: '0.65rem 0.85rem', backgroundColor: '#FFFBEB', border: '1px solid #FDE68A', borderRadius: '2px', color: '#92400E', fontSize: '0.76rem' }}>
                    <strong>Statutory Offences &amp; Penalties:</strong> Rule 32 fine up to ₹4,000 for Rules 27-31; ₹2,000 for other rules; Section 36 penalty for non-standard packages; Section 49 compounding proceedings.
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
                <span>Statutory Departmental Consoles</span>
              </div>
              <h2 style={{ fontSize: '2rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.5rem' }}>
                Designated Legal Metrology Departmental Portals
              </h2>
              <p style={{ fontSize: '0.9rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                Statutory officers must access their designated consoles. Operations and inspection dossiers are legally binding under Section 15 of the Legal Metrology Act, 2009.
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
                      DIRECTORATE / CONTROLLER
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.25rem' }}>
                    Controller of Legal Metrology (CLM)
                  </h3>
                  <div style={{ fontSize: '0.78rem', color: 'var(--govt-maroon)', fontWeight: 700, marginBottom: '0.85rem' }}>
                    Rules 27–30 &amp; 33 Statutory Administration
                  </div>

                  <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                    Central regulatory console. Oversee statutory registers under Rule 29, maintain state-wise lists of registered manufacturers, packers, and importers under Rule 30, manage officer authorizations, and exercise relaxation powers under Rule 33.
                  </p>

                  <div style={{ borderTop: '1px solid var(--slate-200)', paddingTop: '0.85rem', marginBottom: '1.25rem' }}>
                    <div style={{ fontSize: '0.72rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-500)', marginBottom: '0.4rem', letterSpacing: '0.04em' }}>
                      Statutory PCR Powers:
                    </div>
                    <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--slate-700)' }}>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 29: Maintenance of Central Register of Manufacturers &amp; Packers</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 30: State-wise list circulation to jurisdictional Controllers</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 33: Compounding &amp; power to relax packaging provisions</span>
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
                    <span><strong>Restricted:</strong> Central &amp; State Legal Metrology Directorate Officers.</span>
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
                      ADJUDICATION &amp; REVIEW
                    </span>
                  </div>

                  <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.25rem' }}>
                    Assistant Controller (AC)
                  </h3>
                  <div style={{ fontSize: '0.78rem', color: 'var(--govt-navy)', fontWeight: 700, marginBottom: '0.85rem' }}>
                    Rules 19, 20, 21, 23 &amp; Sec 49 Adjudication
                  </div>

                  <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                    Senior supervisory adjudication unit. Evaluate Seventh Schedule Form A &amp; Form B inspection findings, enforce seizure under Section 15 for non-compliant or deceptive packaging under Rule 23, issue Show-Cause notices, and execute compounding under Section 49.
                  </p>

                  <div style={{ borderTop: '1px solid var(--slate-200)', paddingTop: '0.85rem', marginBottom: '1.25rem' }}>
                    <div style={{ fontSize: '0.72rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-500)', marginBottom: '0.4rem', letterSpacing: '0.04em' }}>
                      Statutory PCR Powers:
                    </div>
                    <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--slate-700)' }}>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 19 &amp; 20: Action on manufacturer/packer inspection reports</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 23: Deceptive packaging orders (repacking vs seizure)</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Section 49: Compounding of offences &amp; sanctioning prosecution</span>
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
                    <span><strong>Restricted:</strong> Appointed Assistant Controllers &amp; Senior Inspectors.</span>
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
                    Rules 6, 7, 8, 9, 10 &amp; 18 E-Commerce OCR Audit
                  </div>

                  <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                    Automated market surveillance console. Crawl e-commerce marketplace listings, extract packaging image carousels, audit mandatory declarations under Rule 6, verify Table-I &amp; Table-II numeral heights under Rule 7, and check statutory MRP inclusivity.
                  </p>

                  <div style={{ borderTop: '1px solid var(--slate-200)', paddingTop: '0.85rem', marginBottom: '1.25rem' }}>
                    <div style={{ fontSize: '0.72rem', fontWeight: 700, textTransform: 'uppercase', color: 'var(--slate-500)', marginBottom: '0.4rem', letterSpacing: '0.04em' }}>
                      Statutory PCR Powers:
                    </div>
                    <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.35rem', fontSize: '0.78rem', color: 'var(--slate-700)' }}>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 6: Mandatory PDP declarations audit (Manufacturer, Origin, MRP)</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 7: Table-I &amp; II numeral height and font dimension check</span>
                      </li>
                      <li style={{ display: 'flex', alignItems: 'center', gap: '0.4rem' }}>
                        <IconCheckCircle size={13} className="text-emerald-600" />
                        <span>Rule 9: High-contrast display &amp; Hindi/English language verification</span>
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
                    <span><strong>Restricted:</strong> Authorized Legal Metrology Inspection Officers.</span>
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
                      On-Ground Enforcement under Rules 19 &amp; 21 · Schedules V, VI &amp; VII (Forms A &amp; B)
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
                    API Active
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
                Equipped for physical visits to manufacturer premises, packing lines, and retail stores. Executes Fifth Schedule sample size picking (<span style={{ fontFamily: 'var(--font-family-mono)' }}>32 for lot &lt;4000; 80 for lot &gt;4000</span>), tare weight determinations under Sixth Schedule, and digitizes Seventh Schedule Form A (Weight) and Form B (Volume/Length) inspection sheets with cryptographic officer signature.
              </div>
            </div>

            {/* Restricted Official Government Notice */}
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
                  Statutory Security Notice &amp; Access Restriction:
                </strong>
                This is a secure Government of India computing platform designated exclusively for appointed Legal Metrology Officers. Unauthorized access, probing, tampering with inspection records, or attempting unauthorized data extraction is a cognizable offense punishable under Sections 43, 65, and 66 of the Information Technology Act, 2000 and Section 318 of Bharatiya Nyaya Sanhita (BNS).
              </div>
            </div>

          </div>
        </section>

        {/* SECTION 3: PCR 2011 STATUTORY RULEBOOK & SCHEDULES (DIRECT FROM GAZETTE PDF) */}
        <section id="statutory-rulebook" style={{
          backgroundColor: '#FFFFFF',
          borderTop: '1px solid var(--slate-300)',
          borderBottom: '1px solid var(--slate-300)',
          padding: '3.5rem 1.5rem'
        }}>
          <div className="container-govt">
            
            <div style={{ maxWidth: '840px', marginBottom: '1.5rem' }}>
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
                <IconBookOpen size={13} />
                <span>Gazette Notification G.S.R. 202(E) Statutory Provisions</span>
              </div>
              <h2 style={{ fontSize: '1.85rem', fontWeight: 800, color: 'var(--slate-900)', marginBottom: '0.4rem' }}>
                The Legal Metrology (Packaged Commodities) Rules, 2011 Rulebook
              </h2>
              <p style={{ fontSize: '0.88rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                Reference extracted directly from the official Gazette of India publication. Nirikshak automated algorithms strictly audit pre-packaged commodities against these statutory sections, tables, and schedules.
              </p>
            </div>

            {/* Interactive Tab Navigation */}
            <div className="statutory-tabs-nav" style={{ marginBottom: '1.5rem' }}>
              <button
                type="button"
                className={`statutory-tab-btn ${activeTab === 'rules' ? 'active' : ''}`}
                onClick={() => setActiveTab('rules')}
              >
                <IconFileText size={14} />
                <span>Rule 6: Mandatory Declarations</span>
              </button>
              <button
                type="button"
                className={`statutory-tab-btn ${activeTab === 'dimensions' ? 'active' : ''}`}
                onClick={() => setActiveTab('dimensions')}
              >
                <IconScale size={14} />
                <span>Rule 7: Tables I &amp; II (Font &amp; Numeral Height)</span>
              </button>
              <button
                type="button"
                className={`statutory-tab-btn ${activeTab === 'mpe' ? 'active' : ''}`}
                onClick={() => setActiveTab('mpe')}
              >
                <IconShieldCheck size={14} />
                <span>First Schedule: Maximum Permissible Error (MPE)</span>
              </button>
              <button
                type="button"
                className={`statutory-tab-btn ${activeTab === 'standard' ? 'active' : ''}`}
                onClick={() => setActiveTab('standard')}
              >
                <IconCheckCircle size={14} />
                <span>Second Schedule: Standard Pack Quantities</span>
              </button>
              <button
                type="button"
                className={`statutory-tab-btn ${activeTab === 'inspection' ? 'active' : ''}`}
                onClick={() => setActiveTab('inspection')}
              >
                <IconServer size={14} />
                <span>Schedules V, VI &amp; VII: Forms A &amp; B</span>
              </button>
            </div>

            {/* TAB CONTENT 1: RULE 6 MANDATORY DECLARATIONS */}
            {activeTab === 'rules' && (
              <div className="fade-in">
                <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.85rem 1.25rem', border: '1px solid var(--slate-300)', borderBottom: 'none', display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '0.5rem' }}>
                  <div style={{ fontWeight: 700, fontSize: '0.82rem', color: 'var(--slate-900)' }}>
                    Rule 6: Declarations to be Made on Every Package (Pages 6–10 of Gazette)
                  </div>
                  <span className="gazette-tag">Rule 6(1)(a) through Rule 6(3)</span>
                </div>

                <div className="govt-table-wrap">
                  <table className="govt-table">
                    <thead>
                      <tr>
                        <th style={{ width: '18%' }}>Rule Clause</th>
                        <th style={{ width: '22%' }}>Statutory Declaration</th>
                        <th style={{ width: '38%' }}>Gazette Text Specification</th>
                        <th style={{ width: '22%' }}>Statutory Legal Mandate</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><strong>Rule 6(1)(a) &amp; Rule 10</strong></td>
                        <td><strong>Name &amp; Address of Manufacturer / Packer / Importer</strong></td>
                        <td>The name and complete address of the manufacturer, or where manufacturer is not packer, of manufacturer and packer; for imported packages, of the importer. Complete address means street, factory/premises number, city, State, and Postal Index Number (PIN) Code.</td>
                        <td>Explanations I &amp; II: Marketer/brand owner held liable if manufacturer name omitted.</td>
                      </tr>
                      <tr>
                        <td><strong>Rule 6(1)(b)</strong></td>
                        <td><strong>Generic / Common Name of Commodity</strong></td>
                        <td>The common or generic names of the commodity contained in the package. In case of packages with more than one product, the name and number or quantity of each product shall be mentioned.</td>
                        <td>Prevents misleading or fictitious commodity naming under Rule 11.</td>
                      </tr>
                      <tr>
                        <td><strong>Rule 6(1)(c) &amp; Rule 11</strong></td>
                        <td><strong>Net Quantity in Standard Units</strong></td>
                        <td>The net quantity, in terms of standard unit of weight or measure, of the commodity or where the commodity is packed or sold by number, the number contained in the package excluding packaging or wrappers.</td>
                        <td>Standard SI units only (g, kg, ml, l, cm, m, N, U) under Rule 13.</td>
                      </tr>
                      <tr>
                        <td><strong>Rule 6(1)(d)</strong></td>
                        <td><strong>Month &amp; Year of Manufacture / Packing</strong></td>
                        <td>The month and year in which the commodity is manufactured or pre-packed or imported. May be indicated using rubber stamp without overwriting. Expressed in words, numerals, or both.</td>
                        <td>Exempt: Domestic LPG cylinders (Rule 6(g)(A)(ii)) and bidi/incense sticks.</td>
                      </tr>
                      <tr>
                        <td><strong>Rule 6(1)(e) &amp; Rule 4(m)</strong></td>
                        <td><strong>Retail Sale Price (MRP)</strong></td>
                        <td>Strictly formatted as: <code style={{ backgroundColor: '#F1F5F9', padding: '0.1rem 0.3rem', borderRadius: '2px', fontWeight: 700 }}>Maximum or Max. retail price Rs.... / ₹ ... inclusive of all taxes</code> or <code style={{ backgroundColor: '#F1F5F9', padding: '0.1rem 0.3rem', borderRadius: '2px', fontWeight: 700 }}>MRP Rs.... / ₹ ... incl., of all taxes</code>.</td>
                        <td>Rounding off: Fraction &lt;50 paise to preceding rupee; 50 to 95 paise to 50 paise.</td>
                      </tr>
                      <tr>
                        <td><strong>Rule 6(1)(f) &amp; Rules 14–17</strong></td>
                        <td><strong>Dimensions of Commodity</strong></td>
                        <td>Where sizes/dimensions are relevant (e.g. bed-sheets, sarees, napkins, aluminum foils, facial tissues, container bags/cups), the dimensions or number of usable sheets must be stated.</td>
                        <td>Dimensions of each piece must also be declared if package contains varied sizes.</td>
                      </tr>
                      <tr>
                        <td><strong>Rule 6(2)</strong></td>
                        <td><strong>Consumer Redressal Details</strong></td>
                        <td>Every package shall bear the name, address, telephone number, E-mail address, if available, of the person who can be or the office which can be, contacted, in case of consumer complaints.</td>
                        <td>Mandatory on all retail packaging pan-India under Rule 6(2).</td>
                      </tr>
                      <tr>
                        <td><strong>Rule 6(3)</strong></td>
                        <td><strong>Prohibition on Stickers</strong></td>
                        <td>It shall not be permissible to affix individual stickers on the package for altering or making declaration required under these rules.</td>
                        <td>Exception: Permitted only for reducing MRP (inclusive of all taxes).</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            )}

            {/* TAB CONTENT 2: RULE 7 NUMERAL & LETTER HEIGHTS (TABLES I & II) */}
            {activeTab === 'dimensions' && (
              <div className="fade-in" style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
                <div>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.85rem 1.25rem', border: '1px solid var(--slate-300)', borderBottom: 'none', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div style={{ fontWeight: 700, fontSize: '0.82rem', color: 'var(--slate-900)' }}>
                      Rule 7(2)(i) — TABLE-I: Minimum Height of Numeral (Page 11 of Gazette)
                    </div>
                    <span className="gazette-tag">Net Quantity by Weight / Volume</span>
                  </div>

                  <div className="govt-table-wrap">
                    <table className="govt-table">
                      <thead>
                        <tr>
                          <th style={{ width: '15%' }}>Serial Number</th>
                          <th style={{ width: '40%' }}>Net Quantity in Weight / Volume</th>
                          <th style={{ width: '25%' }}>Minimum Height: Normal Case</th>
                          <th style={{ width: '20%' }}>When Blown, Formed, Molded, Embossed or Perforated</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td><strong>Upto 200g / ml</strong></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>1 mm</span></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>2 mm</span></td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td><strong>Above 200g / ml and upto 500g / ml</strong></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>2 mm</span></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>4 mm</span></td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td><strong>Above 500g / ml</strong></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>4 mm</span></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>6 mm</span></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>

                <div>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.85rem 1.25rem', border: '1px solid var(--slate-300)', borderBottom: 'none', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div style={{ fontWeight: 700, fontSize: '0.82rem', color: 'var(--slate-900)' }}>
                      Rule 7(2)(ii) — TABLE-II: Minimum Height of Numeral (Page 12 of Gazette)
                    </div>
                    <span className="gazette-tag">Length, Area, Number or Area of Principal Display Panel</span>
                  </div>

                  <div className="govt-table-wrap">
                    <table className="govt-table">
                      <thead>
                        <tr>
                          <th style={{ width: '15%' }}>Serial Number</th>
                          <th style={{ width: '40%' }}>Area of Principal Display Panel (PDP)</th>
                          <th style={{ width: '25%' }}>Minimum Height: Normal Case</th>
                          <th style={{ width: '20%' }}>When Blown, Formed, Molded, Embossed or Perforated</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td><strong>Upto 100 cm²</strong></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>1 mm</span></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>2 mm</span></td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td><strong>Above 100 cm² and upto 500 cm²</strong></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>2 mm</span></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>4 mm</span></td>
                        </tr>
                        <tr>
                          <td>3</td>
                          <td><strong>Above 500 cm² and upto 2500 cm²</strong></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>4 mm</span></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>6 mm</span></td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td><strong>Above 2500 cm²</strong></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-navy)' }}>6 mm</span></td>
                          <td><span style={{ fontWeight: 700, color: 'var(--govt-maroon)' }}>6 mm</span></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>

                  <div style={{ padding: '0.85rem 1rem', backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', borderTop: 'none', fontSize: '0.76rem', color: 'var(--slate-600)' }}>
                    <strong>Rule 7(3) Width Ratio:</strong> The height of letters shall not be less than 1 mm (2 mm if molded). Width of letters or numerals shall not be less than one-third of height, except in the case of numeral '1' and letters 'i', 'I', and 'l'.
                  </div>
                </div>
              </div>
            )}

            {/* TAB CONTENT 3: FIRST SCHEDULE MAXIMUM PERMISSIBLE ERROR (MPE) */}
            {activeTab === 'mpe' && (
              <div className="fade-in">
                <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.85rem 1.25rem', border: '1px solid var(--slate-300)', borderBottom: 'none', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <div style={{ fontWeight: 700, fontSize: '0.82rem', color: 'var(--slate-900)' }}>
                    THE FIRST SCHEDULE [See Rule 2(e)] — Maximum Permissible Errors on Net Quantity (Page 36 of Gazette)
                  </div>
                  <span className="gazette-tag">TABLE-I: Weight or Volume</span>
                </div>

                <div className="govt-table-wrap">
                  <table className="govt-table">
                    <thead>
                      <tr>
                        <th style={{ width: '15%' }}>Sl. No.</th>
                        <th style={{ width: '35%' }}>Declared Quantity (g or ml)</th>
                        <th style={{ width: '25%' }}>As Percentage of Declared Quantity</th>
                        <th style={{ width: '25%' }}>In Fixed Units (g or ml)</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>(i)</td>
                        <td><strong>Up to 50</strong></td>
                        <td><strong>9.0%</strong></td>
                        <td>—</td>
                      </tr>
                      <tr>
                        <td>(ii)</td>
                        <td><strong>50 to 100</strong></td>
                        <td>—</td>
                        <td><strong>4.5 g / ml</strong></td>
                      </tr>
                      <tr>
                        <td>(iii)</td>
                        <td><strong>100 to 200</strong></td>
                        <td><strong>4.5%</strong></td>
                        <td>—</td>
                      </tr>
                      <tr>
                        <td>(iv)</td>
                        <td><strong>200 to 300</strong></td>
                        <td>—</td>
                        <td><strong>9.0 g / ml</strong></td>
                      </tr>
                      <tr>
                        <td>(v)</td>
                        <td><strong>300 to 500</strong></td>
                        <td><strong>3.0%</strong></td>
                        <td>—</td>
                      </tr>
                      <tr>
                        <td>(vi)</td>
                        <td><strong>500 to 1000</strong></td>
                        <td>—</td>
                        <td><strong>15.0 g / ml</strong></td>
                      </tr>
                      <tr>
                        <td>(vii)</td>
                        <td><strong>1000 to 10000</strong></td>
                        <td><strong>1.5%</strong></td>
                        <td>—</td>
                      </tr>
                      <tr>
                        <td>(viii)</td>
                        <td><strong>10000 to 15000</strong></td>
                        <td>—</td>
                        <td><strong>150.0 g / ml</strong></td>
                      </tr>
                      <tr>
                        <td>(ix)</td>
                        <td><strong>More than 15000</strong></td>
                        <td><strong>1.0%</strong></td>
                        <td>—</td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div style={{ padding: '0.85rem 1rem', backgroundColor: 'var(--slate-50)', border: '1px solid var(--slate-200)', borderTop: 'none', fontSize: '0.76rem', color: 'var(--slate-600)' }}>
                  <strong>First Schedule Table-II (Other Quantities):</strong> Length declaration: 2% of declared quantity up to 10m and thereafter 1%; Area declaration: 4% of declared quantity up to 10 sq. metre and thereafter 1%; Number: 2% of declared quantity.
                </div>
              </div>
            )}

            {/* TAB CONTENT 4: SECOND SCHEDULE STANDARD PACK QUANTITIES */}
            {activeTab === 'standard' && (
              <div className="fade-in">
                <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.85rem 1.25rem', border: '1px solid var(--slate-300)', borderBottom: 'none', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <div style={{ fontWeight: 700, fontSize: '0.82rem', color: 'var(--slate-900)' }}>
                    THE SECOND SCHEDULE [See Rule 5] — Commodities to be Packed in Specified Quantities (Pages 37–39)
                  </div>
                  <span className="gazette-tag">Rule 5 Standard Pack Sizes</span>
                </div>

                <div className="govt-table-wrap">
                  <table className="govt-table">
                    <thead>
                      <tr>
                        <th style={{ width: '12%' }}>Sl. No.</th>
                        <th style={{ width: '30%' }}>Commodity</th>
                        <th style={{ width: '58%' }}>Prescribed Quantities in Which to be Packed</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td><strong>Baby Food</strong></td>
                        <td>100g, 200g, 300g, 400g, 500g, 600g, 700g, 800g, 900g, 1 kg, 2 kg, 5 kg, 10 kg.</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td><strong>Biscuits</strong></td>
                        <td>25g, 50g, 75g, 100g, 150g, 200g, 250g, 300g, and thereafter in multiples of 100g up to 1 kg.</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td><strong>Tea &amp; Coffee</strong></td>
                        <td>Tea: 25g, 50g, 100g, 125g, 250g, 500g, 1kg and multiples of 1kg. Coffee: 25g, 50g, 100g, 200g, 250g, 500g, 1kg.</td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td><strong>Edible Oils, Vanaspati, Ghee, Butter Oil</strong></td>
                        <td>50g, 100g, 200g, 500g, 1 kg, 2 kg, 3 kg, 5 kg and thereafter in multiples of 5 kg. If declared by volume, equivalent mass must be declared.</td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td><strong>Rice, Flour, Atta, Rawa &amp; Suji</strong></td>
                        <td>100g, 200g, 500g, 1kg, 2kg, 5kg and thereafter in multiples of 5 kg.</td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td><strong>Salt</strong></td>
                        <td>Below 50g in multiples of 10g; 50g, 100g, 200g, 500g, 750g, 1 kg, 2 kg, 5 kg and thereafter in multiples of 5 kg.</td>
                      </tr>
                      <tr>
                        <td>7</td>
                        <td><strong>Soaps (Laundry &amp; Toilet)</strong></td>
                        <td>Laundry Soap: 50g, 75g, 100g, multiples of 50g. Toilet Soap: 25g, 50g, 75g, 100g, 125g, 150g, multiples of 50g.</td>
                      </tr>
                      <tr>
                        <td>8</td>
                        <td><strong>Cement in Bags</strong></td>
                        <td>1 kg, 2 kg, 5 kg, 10 kg, 20 kg, 25 kg, 40 kg (white cement only), and 50 kg.</td>
                      </tr>
                      <tr>
                        <td>9</td>
                        <td><strong>Aerated Soft Drinks &amp; Mineral Water</strong></td>
                        <td>Soft drinks: 65ml, 100ml, 125ml, 150ml, 200ml, 250ml, 300ml, 330ml (cans), 500ml, 750ml, 1L, 1.5L, 2L, 3L, 4L, 5L.</td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <div style={{ padding: '0.85rem 1rem', backgroundColor: '#FFFBEB', border: '1px solid #FDE68A', borderTop: 'none', fontSize: '0.76rem', color: '#92400E' }}>
                  <strong>Rule 5 Proviso on Non-Standard Pack Sizes:</strong> If a commodity specified in Second Schedule is packed in a non-standard size, a prominent declaration must be made on the label: <code style={{ fontWeight: 700 }}>'Not a standard pack size under the Legal Metrology (Packaged Commodities) Rules, 2011'</code>.
                </div>
              </div>
            )}

            {/* TAB CONTENT 5: SCHEDULES V, VI & VII (INSPECTION PROTOCOLS & FORMS A & B) */}
            {activeTab === 'inspection' && (
              <div className="fade-in" style={{ display: 'flex', flexDirection: 'column', gap: '1.5rem' }}>
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(min(100%, 320px), 1fr))', gap: '1rem' }}>
                  
                  <div className="schedule-card">
                    <div className="schedule-card-header">
                      <strong style={{ fontSize: '0.82rem', color: 'var(--slate-900)' }}>THE FIFTH SCHEDULE [See Rule 19]</strong>
                      <span className="gazette-tag">Sample Size Protocol</span>
                    </div>
                    <div style={{ padding: '1rem', fontSize: '0.8rem', color: 'var(--slate-700)', lineHeight: 1.6 }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', padding: '0.5rem 0', borderBottom: '1px solid var(--slate-200)' }}>
                        <span>Lot Size Less than 4,000 packages:</span>
                        <strong style={{ color: 'var(--govt-navy)' }}>Sample Size = 32</strong>
                      </div>
                      <div style={{ display: 'flex', justifyContent: 'space-between', padding: '0.5rem 0', borderBottom: '1px solid var(--slate-200)' }}>
                        <span>Lot Size More than 4,000 packages:</span>
                        <strong style={{ color: 'var(--govt-navy)' }}>Sample Size = 80</strong>
                      </div>
                      <p style={{ marginTop: '0.75rem', fontSize: '0.74rem', color: 'var(--slate-500)', margin: '0.75rem 0 0 0' }}>
                        Samples must be selected at random from top, bottom, center, right, left, front and rear of stocks in warehouse or packing lines.
                      </p>
                    </div>
                  </div>

                  <div className="schedule-card">
                    <div className="schedule-card-header">
                      <strong style={{ fontSize: '0.82rem', color: 'var(--slate-900)' }}>THE SIXTH SCHEDULE [See Rule 19]</strong>
                      <span className="gazette-tag">Net Quantity Determination</span>
                    </div>
                    <div style={{ padding: '1rem', fontSize: '0.8rem', color: 'var(--slate-700)', lineHeight: 1.6 }}>
                      <p style={{ margin: 0 }}>
                        Specifies standard test equipment, verified weights, tare weight determination across sample packages, statistical average net quantity, and destructive/non-destructive testing methods at factory depots.
                      </p>
                      <div style={{ marginTop: '0.75rem', padding: '0.5rem', backgroundColor: 'var(--slate-50)', borderRadius: '2px', border: '1px solid var(--slate-200)', fontSize: '0.72rem', color: 'var(--slate-600)' }}>
                        Tare weight must not exceed 0.3 of maximum permissible error; otherwise detailed 5-sample tare averaging applies.
                      </div>
                    </div>
                  </div>

                </div>

                {/* Form A & Form B Overview */}
                <div className="schedule-card">
                  <div className="schedule-card-header">
                    <strong style={{ fontSize: '0.82rem', color: 'var(--slate-900)' }}>THE SEVENTH SCHEDULE — Statutory Inspection Data Sheets (Pages 46 &amp; 47)</strong>
                    <span className="gazette-tag">Form A (Weight) &amp; Form B (Volume/Length)</span>
                  </div>
                  <div style={{ padding: '1.25rem', display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(min(100%, 300px), 1fr))', gap: '1.25rem', fontSize: '0.8rem' }}>
                    
                    <div style={{ border: '1px solid var(--slate-200)', padding: '1rem', borderRadius: '2px', backgroundColor: 'var(--slate-50)' }}>
                      <div style={{ fontWeight: 800, color: 'var(--govt-navy)', marginBottom: '0.5rem', fontSize: '0.85rem' }}>
                        FORM A: Weight Checking Data Sheet
                      </div>
                      <ul style={{ paddingLeft: '1.25rem', margin: 0, display: 'flex', flexDirection: 'column', gap: '0.3rem', color: 'var(--slate-600)' }}>
                        <li><strong>Section A:</strong> Particulars of package, Manufacturer/Packer name, address, price, month, year</li>
                        <li><strong>Section B:</strong> Commodity classification, lot size, sample size, MPE in percentage</li>
                        <li><strong>Section C:</strong> 1 to 200 sample serial ledger (Gross Wt, Tare Wt, Net Wt, Error)</li>
                        <li><strong>Section D:</strong> Results: Declared Wt vs Average Wt</li>
                        <li><strong>Section E &amp; F:</strong> General compliance comments, Officer &amp; Witness signatures</li>
                      </ul>
                    </div>

                    <div style={{ border: '1px solid var(--slate-200)', padding: '1rem', borderRadius: '2px', backgroundColor: 'var(--slate-50)' }}>
                      <div style={{ fontWeight: 800, color: 'var(--govt-navy)', marginBottom: '0.5rem', fontSize: '0.85rem' }}>
                        FORM B: Volume / Length Checking Data Sheet
                      </div>
                      <ul style={{ paddingLeft: '1.25rem', margin: 0, display: 'flex', flexDirection: 'column', gap: '0.3rem', color: 'var(--slate-600)' }}>
                        <li><strong>Section A:</strong> Particulars of liquid or linear package, Price, Month, Year</li>
                        <li><strong>Section B:</strong> Lot size, sample size, MPE under Schedule I Table-I / Table-II</li>
                        <li><strong>Section C:</strong> Volume at stated reference temperature, gross/tare measurements</li>
                        <li><strong>Section D:</strong> Declared Volume/Length vs Average calculated quantity</li>
                        <li><strong>Section E &amp; F:</strong> Verification remarks, Place, Date, Designation, Signatures</li>
                      </ul>
                    </div>

                  </div>
                </div>

              </div>
            )}

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
                PCR 2011 Automated Verification Pipeline
              </h2>
              <p style={{ fontSize: '0.9rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                Every digital marketplace listing crawl and on-ground field inspection operates through an automated 4-stage pipeline directly enforcing G.S.R. 202(E) mandates.
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
                  Surveillance &amp; Ingestion
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  Stealth e-commerce scrapers and on-ground field officers ingest high-resolution packaging photo carousels, barcode numbers, and merchant metadata under Section 15 of the Act.
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
                  Surface Detection &amp; Neural OCR
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  ComplianceEngine vision microservice executes packaging surface distortion correction, multilingual text segmentation, and high-accuracy Tesseract OCR across all packaging panels.
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
                  PCR 2011 Rule Verification
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  Algorithms evaluate Rule 6 declarations, check Rule 7 Table-I &amp; Table-II numeral height ratios, verify Rule 13 standard SI units, and calculate First Schedule Maximum Permissible Error (MPE).
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
                  AC Adjudication &amp; Notice Issuance
                </h3>
                <p style={{ fontSize: '0.82rem', color: 'var(--slate-600)', lineHeight: 1.6 }}>
                  Assistant Controllers review flagged violation dossiers, issue digital Show-Cause notices under Rule 20, schedule Section 49 compounding proceedings, or sanction prosecution under Section 36.
                </p>
              </div>

            </div>

          </div>
        </section>

        {/* SECTION 5: LEGAL PENALTIES & SYSTEM SPECIFICATIONS */}
        <section id="infrastructure" style={{
          backgroundColor: '#FFFFFF',
          borderTop: '1px solid var(--slate-300)',
          padding: '3.5rem 1.5rem'
        }}>
          <div className="container-govt">
            
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(min(100%, 460px), 1fr))', gap: '2.5rem' }}>
              
              {/* Statutory Legal Admissibility & Penalties */}
              <div style={{ border: '1px solid var(--slate-300)', borderTop: '3px solid var(--govt-maroon)', padding: '1.75rem', borderRadius: '2px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.65rem', marginBottom: '0.85rem' }}>
                  <IconScale size={20} className="text-red-900" />
                  <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: 'var(--slate-900)' }}>
                    Statutory Penalties (Rule 32 &amp; Legal Metrology Act, 2009)
                  </h3>
                </div>
                <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1rem' }}>
                  Contraventions of the Legal Metrology (Packaged Commodities) Rules, 2011 attract punitive actions under the Act:
                </p>
                <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.65rem', fontSize: '0.8rem', color: 'var(--slate-700)' }}>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '100px' }}>Rule 32(1):</span>
                    <span>Contravention of registration provisions (Rules 27 to 31) punishable with a fine of ₹4,000.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '100px' }}>Rule 32(2):</span>
                    <span>Contravention of any other provision punishable with a statutory fine of ₹2,000.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '100px' }}>Section 36(1):</span>
                    <span>Selling, distributing or pre-packing non-standard packages punishable with fine up to ₹25,000 (first offense), up to ₹50,000 (second offense), and up to ₹1,00,000 or imprisonment up to 1 year for subsequent offenses.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ fontWeight: 700, color: 'var(--govt-maroon)', minWidth: '100px' }}>Section 49:</span>
                    <span>Compounding of offenses before trial by designated Legal Metrology Officers upon payment of statutory compounding sum.</span>
                  </li>
                </ul>
              </div>

              {/* Technical Specifications & Microservice Pipeline */}
              <div style={{ border: '1px solid var(--slate-300)', borderTop: '3px solid var(--govt-navy)', padding: '1.75rem', borderRadius: '2px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.65rem', marginBottom: '0.85rem' }}>
                  <IconServer size={20} className="text-blue-900" />
                  <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: 'var(--slate-900)' }}>
                    System Architecture &amp; Computing Services
                  </h3>
                </div>
                <p style={{ fontSize: '0.84rem', color: 'var(--slate-600)', lineHeight: 1.6, marginBottom: '1rem' }}>
                  Decoupled microservice architecture designed for high availability, 24/7 background keep-alive monitoring, and rapid horizontal scaling:
                </p>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '0.75rem', fontSize: '0.8rem', color: 'var(--slate-700)' }}>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.65rem 0.85rem', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <strong>CLM Directorate Admin API:</strong> Express.js multi-tier governance backend managing user provisioning, Rule 29 central register, and audit logs.
                  </div>
                  <div style={{ backgroundColor: 'var(--slate-50)', padding: '0.65rem 0.85rem', border: '1px solid var(--slate-200)', borderRadius: '2px' }}>
                    <strong>Senior Inspector Adjudication API:</strong> Decision engine managing violation queues, digital notice drafting, and Section 49 compounding registers.
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
                    Ministry of Consumer Affairs, Food &amp; Public Distribution, Government of India
                  </p>
                  <p style={{ color: 'rgba(255, 255, 255, 0.55)', fontSize: '0.7rem', margin: '0.2rem 0 0 0' }}>
                    Administered under The Legal Metrology (Packaged Commodities) Rules, 2011 · Notification G.S.R. 202(E)
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
                  Designed, Developed &amp; Maintained for National Regulatory Enforcement
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

      {/* Official Government Policy Dialog Modal */}
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
