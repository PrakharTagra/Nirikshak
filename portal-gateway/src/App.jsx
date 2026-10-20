import React, { useState } from 'react';

const POLICIES = {
  helpline: {
    title: 'National Consumer Helpline (NCH)',
    badge: 'Department of Consumer Affairs, Government of India',
    content: (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.85rem', color: '#334155', lineHeight: 1.6 }}>
        <div style={{ background: '#EFF6FF', borderLeft: '4px solid #06038D', padding: '0.85rem 1.25rem', borderRadius: '0 8px 8px 0' }}>
          <p style={{ fontWeight: 800, color: '#06038D', fontSize: '1rem', margin: 0 }}>Toll-Free National Helpline: 1915</p>
          <p style={{ margin: '0.25rem 0 0 0', color: '#475569', fontSize: '0.82rem' }}>
            Operated by the Department of Consumer Affairs, Ministry of Consumer Affairs, Food & Public Distribution.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.5rem' }}>Statutory Consumer Redressal Channels</h4>
          <ul style={{ paddingLeft: '1.25rem', display: 'flex', flexDirection: 'column', gap: '0.35rem' }}>
            <li><strong>Toll-Free Helpline:</strong> 1915 or 1800-11-4000 (Available 8:00 AM to 8:00 PM, all days except National Holidays)</li>
            <li><strong>SMS Helpline:</strong> Send SMS to 8800001915</li>
            <li><strong>National Consumer Portal:</strong> consumerhelpline.gov.in</li>
            <li><strong>UMANG Mobile App:</strong> Integrated NCH Services available pan-India</li>
          </ul>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.5rem' }}>Report Legal Metrology Discrepancies</h4>
          <p>
            Citizens may report discrepancies regarding non-standard weights, absence of mandatory declarations (MRP, Net Quantity, Country of Origin, Manufacturer Details), and overcharging on packaged commodities. Verified complaints are automatically routed to the designated State Controllers of Legal Metrology.
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
    badge: 'Guidelines for Indian Government Websites (GIGW)',
    content: (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.85rem', color: '#334155', lineHeight: 1.6 }}>
        <p>
          This portal does not automatically capture personal identifiable information without explicit authorization. Administrative and officer sessions are strictly recorded for statutory audit trails mandated under the Legal Metrology Act, 2009.
        </p>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.5rem' }}>Information Recorded & Purpose</h4>
          <p>
            For appointed officers and inspectors, this system cryptographically records administrative session IDs, inspection timestamps, geolocations, and statutory decisions strictly for verification logs mandated under Section 15 of the Act.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.5rem' }}>Data Security & Storage</h4>
          <p>
            All transmissions are secured via TLS 1.3 encryption. Inspection dossiers, packaging images, and violation registers are archived in secured National Informatics Centre (NIC) cloud infrastructure in compliance with the Information Technology Act, 2000.
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
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.85rem', color: '#334155', lineHeight: 1.6 }}>
        <div style={{ background: '#FFFBEB', borderLeft: '4px solid #D97706', padding: '0.85rem 1.25rem', borderRadius: '0 8px 8px 0' }}>
          <p style={{ fontWeight: 800, color: '#78350F', margin: 0 }}>Restricted Official Government System</p>
          <p style={{ margin: '0.25rem 0 0 0', color: '#92400E', fontSize: '0.82rem' }}>
            This platform is designated exclusively for appointed Controllers, Assistant Controllers, and authorized Legal Metrology Officers.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.5rem' }}>Evidentiary Legal Validity</h4>
          <p>
            Inspection dossiers, OCR extraction records, and sanction orders issued through NIRIKSHAK carry evidentiary value under the Legal Metrology Act, 2009 and the Bharatiya Sakshya Adhiniyam, 2023. Every decision, sanction, or compound notice is cryptographically signed and non-repudiable.
          </p>
        </div>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.5rem' }}>Penal Provisions for Unauthorized Access</h4>
          <p>
            Unauthorized access, credential sharing, tampering with inspection records, or attempting unauthorized penetrations is an offense punishable under Sections 43 and 66 of the Information Technology Act, 2000 and Section 318 of BNS.
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
    badge: 'Government Web Standards',
    content: (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', fontSize: '0.85rem', color: '#334155', lineHeight: 1.6 }}>
        <div>
          <h4 style={{ fontWeight: 700, color: '#0F172A', marginBottom: '0.5rem' }}>Links to External Websites</h4>
          <p>
            Links to external government portals (such as BIS, FSSAI, National Consumer Helpline, and State Directorates) are provided strictly for official regulatory reference and statutory coordination. The Department does not endorse or guarantee the availability of external links.
          </p>
        </div>
        <div style={{ borderTop: '1px solid #E2E8F0', paddingTop: '0.75rem', fontSize: '0.75rem', color: '#64748B' }}>
          Guidelines for Indian Government Websites (GIGW) Compliance.
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
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column', background: 'var(--govt-cream)' }}>
      {/* Tier 1: Official National Utility Bar */}
      <div style={{
        background: '#012A4A',
        color: '#FFFFFF',
        fontSize: '0.75rem',
        padding: '0.35rem 1.5rem',
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        flexWrap: 'wrap',
        gap: '0.75rem',
        borderBottom: '1px solid rgba(255,255,255,0.1)'
      }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
          <img src="/emblem.png" alt="State Emblem of India" style={{ height: '16px', filter: 'brightness(0) invert(1)' }} />
          <span style={{ fontWeight: 600, letterSpacing: '0.04em' }}>
            भारत सरकार | GOVERNMENT OF INDIA
          </span>
        </div>
        <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.25rem', background: 'rgba(0,0,0,0.2)', padding: '0.15rem 0.4rem', borderRadius: '4px' }}>
            <button
              onClick={() => handleFontSize(-1)}
              title="Decrease text size"
              style={{
                background: fontSizeLevel === -1 ? '#FFFFFF' : 'transparent',
                color: fontSizeLevel === -1 ? '#012A4A' : '#FFFFFF',
                border: 'none',
                borderRadius: '2px',
                padding: '0.1rem 0.35rem',
                fontSize: '0.7rem',
                fontWeight: 700,
                cursor: 'pointer'
              }}
            >
              A-
            </button>
            <button
              onClick={() => handleFontSize(0)}
              title="Reset text size"
              style={{
                background: fontSizeLevel === 0 ? '#FFFFFF' : 'transparent',
                color: fontSizeLevel === 0 ? '#012A4A' : '#FFFFFF',
                border: 'none',
                borderRadius: '2px',
                padding: '0.1rem 0.35rem',
                fontSize: '0.7rem',
                fontWeight: 700,
                cursor: 'pointer'
              }}
            >
              A
            </button>
            <button
              onClick={() => handleFontSize(1)}
              title="Increase text size"
              style={{
                background: fontSizeLevel === 1 ? '#FFFFFF' : 'transparent',
                color: fontSizeLevel === 1 ? '#012A4A' : '#FFFFFF',
                border: 'none',
                borderRadius: '2px',
                padding: '0.1rem 0.35rem',
                fontSize: '0.7rem',
                fontWeight: 700,
                cursor: 'pointer'
              }}
            >
              A+
            </button>
          </div>
          <a href="#about" style={{ color: 'rgba(255,255,255,0.85)', fontSize: '0.75rem', fontWeight: 500 }}>
            Skip to Content
          </a>
          <span style={{ color: 'rgba(255,255,255,0.3)' }}>|</span>
          <button
            onClick={openPolicy('helpline')}
            style={{ background: 'none', border: 'none', color: '#FCD34D', fontSize: '0.75rem', fontWeight: 700, cursor: 'pointer', display: 'flex', alignItems: 'center', gap: '0.35rem' }}
          >
            <span>📞</span> National Helpline: 1915
          </button>
        </div>
      </div>

      {/* Tier 2: Main Ministry Brand Banner */}
      <header style={{
        background: '#06038D',
        color: '#FFFFFF',
        padding: '1rem 2rem',
        borderBottom: '1px solid rgba(255,255,255,0.08)'
      }}>
        <div style={{ maxWidth: '1360px', margin: '0 auto', display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1.25rem' }}>
          
          {/* Left: Official Indian Emblem & Ministry Title */}
          <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
            <div style={{
              background: '#FFFFFF',
              padding: '0.35rem',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: '0 2px 8px rgba(0,0,0,0.2)'
            }}>
              <img
                src="/emblem.png"
                alt="State Emblem of India"
                style={{ height: '62px', width: 'auto', objectFit: 'contain' }}
              />
            </div>
            <div>
              <div style={{ fontSize: '1.15rem', fontWeight: 700, color: '#FFFFFF', lineHeight: 1.25 }}>
                उपभोक्ता मामले विभाग
              </div>
              <div style={{ fontSize: '1rem', fontWeight: 800, textTransform: 'uppercase', letterSpacing: '0.04em', color: '#FFFFFF', lineHeight: 1.25 }}>
                Department of Consumer Affairs
              </div>
              <div style={{ fontSize: '0.78rem', color: 'rgba(255,255,255,0.85)', marginTop: '0.15rem' }}>
                Ministry of Consumer Affairs, Food & Public Distribution · Government of India
              </div>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginTop: '0.3rem' }}>
                <span style={{ fontSize: '0.72rem', fontWeight: 700, color: '#FCD34D', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                  Legal Metrology Division
                </span>
                <span style={{ color: 'rgba(255,255,255,0.4)', fontSize: '0.72rem' }}>•</span>
                <span style={{ fontSize: '0.72rem', color: 'rgba(255,255,255,0.8)' }}>विधिक मापविज्ञान प्रभाग</span>
              </div>
            </div>
          </div>

          {/* Right: Nirikshak Brand & Portal Seal */}
          <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
            <div style={{ textAlign: 'right' }}>
              <div style={{ fontSize: '1.5rem', fontWeight: 800, color: '#FFFFFF', letterSpacing: '0.04em' }}>
                निरीक्षक <span style={{ fontWeight: 400, opacity: 0.6 }}>·</span> NIRIKSHAK
              </div>
              <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#FCD34D', textTransform: 'uppercase', letterSpacing: '0.08em', display: 'flex', alignItems: 'center', justifyContent: 'flex-end', gap: '0.4rem' }}>
                <span style={{ width: '6px', height: '6px', borderRadius: '50%', background: '#FF9933' }} />
                National Legal Metrology Digital Verification System
              </div>
              <div style={{ fontSize: '0.72rem', color: 'rgba(255,255,255,0.7)', marginTop: '0.15rem' }}>
                The Legal Metrology Act, 2009 & Packaged Commodities Rules, 2011
              </div>
            </div>
            <div style={{
              background: '#FFFFFF',
              padding: '0.35rem',
              borderRadius: '8px',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              boxShadow: '0 2px 8px rgba(0,0,0,0.2)'
            }}>
              <img
                src="/nirikshak_logo.png"
                alt="Nirikshak Official Logo"
                style={{ height: '62px', width: 'auto', objectFit: 'contain' }}
              />
            </div>
          </div>

        </div>
      </header>

      {/* Tier 3: National Tricolor Ribbon */}
      <div className="tricolor-stripe">
        <div className="saffron" />
        <div className="white" />
        <div className="green" />
      </div>

      {/* Sticky Secondary Navigation Bar */}
      <nav style={{
        background: '#FFFFFF',
        borderBottom: '1px solid #E2E8F0',
        padding: '0.65rem 2rem',
        position: 'sticky',
        top: 0,
        zIndex: 40,
        boxShadow: '0 2px 6px rgba(0,0,0,0.04)'
      }}>
        <div style={{ maxWidth: '1360px', margin: '0 auto', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          
          <div style={{ display: 'flex', alignItems: 'center', gap: '1.75rem', flexWrap: 'wrap' }}>
            <a href="#about" style={{ fontSize: '0.86rem', fontWeight: 600, color: '#1E293B' }}>
              About NIRIKSHAK
            </a>
            <a href="#importance" style={{ fontSize: '0.86rem', fontWeight: 600, color: '#1E293B' }}>
              Why It Matters
            </a>
            <a href="#how-it-works" style={{ fontSize: '0.86rem', fontWeight: 600, color: '#1E293B' }}>
              How It Functions
            </a>
            <a href="#statutory-rules" style={{ fontSize: '0.86rem', fontWeight: 600, color: '#1E293B' }}>
              Statutory Declarations
            </a>
            <a href="#portals" style={{ fontSize: '0.86rem', fontWeight: 600, color: '#1E293B' }}>
              Officer Portals
            </a>
            <a href="#infrastructure" style={{ fontSize: '0.86rem', fontWeight: 600, color: '#1E293B' }}>
              Infrastructure
            </a>
          </div>

          {/* Interactive Officer Sign-In Dropdown */}
          <div style={{ position: 'relative' }}>
            <button
              onClick={() => setLoginMenuOpen(!loginMenuOpen)}
              style={{
                background: '#06038D',
                color: '#FFFFFF',
                border: 'none',
                padding: '0.6rem 1.25rem',
                borderRadius: '6px',
                fontWeight: 700,
                fontSize: '0.86rem',
                cursor: 'pointer',
                display: 'flex',
                alignItems: 'center',
                gap: '0.6rem',
                boxShadow: '0 2px 8px rgba(6,3,141,0.25)',
                transition: 'background 0.2s'
              }}
            >
              <span>🏛️</span>
              <span>Officer Login / पोर्टल लॉगिन</span>
              <span style={{ fontSize: '0.7rem' }}>{loginMenuOpen ? '▲' : '▼'}</span>
            </button>

            {/* Dropdown Menu (Strictly 3 Official Options, No Demo Creds) */}
            {loginMenuOpen && (
              <div style={{
                position: 'absolute',
                right: 0,
                top: 'calc(100% + 8px)',
                width: '340px',
                background: '#FFFFFF',
                borderRadius: '10px',
                boxShadow: '0 12px 30px rgba(0,0,0,0.15)',
                border: '1px solid #CBD5E1',
                overflow: 'hidden',
                zIndex: 50,
                animation: 'fadeIn 0.15s ease'
              }}>
                <div style={{ background: '#012A4A', padding: '0.75rem 1rem', color: '#FFFFFF' }}>
                  <div style={{ fontSize: '0.72rem', color: '#FCD34D', fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                    Government Authorization Gateway
                  </div>
                  <div style={{ fontSize: '0.88rem', fontWeight: 700 }}>
                    Select Designated Departmental Portal
                  </div>
                </div>

                <div style={{ padding: '0.5rem' }}>
                  
                  {/* Option 1: CLM Admin */}
                  <a
                    href="/admin/login"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.85rem',
                      padding: '0.75rem 0.85rem',
                      borderRadius: '6px',
                      transition: 'background 0.15s',
                      borderBottom: '1px solid #F1F5F9'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.background = '#F8FAFC'}
                    onMouseLeave={(e) => e.currentTarget.style.background = 'transparent'}
                  >
                    <div style={{
                      width: '38px',
                      height: '38px',
                      borderRadius: '8px',
                      background: '#FEF3C7',
                      color: '#92400E',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontSize: '1.25rem',
                      flexShrink: 0
                    }}>
                      🏛️
                    </div>
                    <div>
                      <div style={{ fontSize: '0.86rem', fontWeight: 700, color: '#0F172A' }}>
                        CLM Admin Portal
                      </div>
                      <div style={{ fontSize: '0.75rem', color: '#64748B' }}>
                        Controller of Legal Metrology Directorate
                      </div>
                    </div>
                  </a>

                  {/* Option 2: AC Review */}
                  <a
                    href="/ac/login"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.85rem',
                      padding: '0.75rem 0.85rem',
                      borderRadius: '6px',
                      transition: 'background 0.15s',
                      borderBottom: '1px solid #F1F5F9'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.background = '#F8FAFC'}
                    onMouseLeave={(e) => e.currentTarget.style.background = 'transparent'}
                  >
                    <div style={{
                      width: '38px',
                      height: '38px',
                      borderRadius: '8px',
                      background: '#DBEAFE',
                      color: '#1E40AF',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontSize: '1.25rem',
                      flexShrink: 0
                    }}>
                      ⚖️
                    </div>
                    <div>
                      <div style={{ fontSize: '0.86rem', fontWeight: 700, color: '#0F172A' }}>
                        Assistant Controller (AC) Portal
                      </div>
                      <div style={{ fontSize: '0.75rem', color: '#64748B' }}>
                        Senior Enforcement & Adjudication Unit
                      </div>
                    </div>
                  </a>

                  {/* Option 3: DMI Inspector */}
                  <a
                    href="/dmi/login"
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '0.85rem',
                      padding: '0.75rem 0.85rem',
                      borderRadius: '6px',
                      transition: 'background 0.15s'
                    }}
                    onMouseEnter={(e) => e.currentTarget.style.background = '#F8FAFC'}
                    onMouseLeave={(e) => e.currentTarget.style.background = 'transparent'}
                  >
                    <div style={{
                      width: '38px',
                      height: '38px',
                      borderRadius: '8px',
                      background: '#DCFCE7',
                      color: '#166534',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontSize: '1.25rem',
                      flexShrink: 0
                    }}>
                      🔍
                    </div>
                    <div>
                      <div style={{ fontSize: '0.86rem', fontWeight: 700, color: '#0F172A' }}>
                        Digital Inspector (DMI) Portal
                      </div>
                      <div style={{ fontSize: '0.75rem', color: '#64748B' }}>
                        E-Commerce Crawling & Physical Package OCR
                      </div>
                    </div>
                  </a>

                </div>

                <div style={{ background: '#F8FAFC', padding: '0.6rem 0.85rem', borderTop: '1px solid #E2E8F0', fontSize: '0.72rem', color: '#64748B', textAlign: 'center' }}>
                  🔒 Authorized Officers Only · Encrypted TLS 1.3
                </div>
              </div>
            )}
          </div>

        </div>
      </nav>

      {/* Main Content Body */}
      <main style={{ flex: 1 }}>

        {/* HERO BANNER SECTION */}
        <section style={{
          background: 'linear-gradient(180deg, #FFFFFF 0%, #F1F5F9 100%)',
          borderBottom: '1px solid #E2E8F0',
          padding: '3.5rem 2rem 3rem 2rem'
        }}>
          <div style={{ maxWidth: '1360px', margin: '0 auto', display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(360px, 1fr))', gap: '3rem', alignItems: 'center' }}>
            
            <div>
              <div style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.5rem',
                background: '#FEF3C7',
                border: '1px solid #FDE68A',
                color: '#92400E',
                fontSize: '0.75rem',
                fontWeight: 700,
                textTransform: 'uppercase',
                letterSpacing: '0.08em',
                padding: '0.35rem 0.85rem',
                borderRadius: '9999px',
                marginBottom: '1.25rem'
              }}>
                <span>⚖️</span>
                <span>Statutory Legal Metrology Digital Infrastructure</span>
              </div>
              <h1 style={{
                fontSize: 'clamp(2rem, 3.5vw, 2.85rem)',
                fontWeight: 800,
                color: '#06038D',
                lineHeight: 1.2,
                marginBottom: '1rem',
                letterSpacing: '-0.02em'
              }}>
                National Legal Metrology Digital Verification & Enforcement Framework
              </h1>
              <p style={{ fontSize: '1.05rem', color: '#334155', lineHeight: 1.65, marginBottom: '2rem' }}>
                NIRIKSHAK (निरीक्षक) is an indigenous, sovereign technology platform under the Department of Consumer Affairs, Government of India. Engineered to enforce <strong>The Legal Metrology Act, 2009</strong> and <strong>The Legal Metrology (Packaged Commodities) Rules, 2011</strong> across physical marketplaces and digital e-commerce ecosystems through automated computer vision, high-res packaging OCR, and evidentiary legal workflows.
              </p>

              <div style={{ display: 'flex', gap: '1rem', flexWrap: 'wrap' }}>
                <a
                  href="#portals"
                  style={{
                    background: '#06038D',
                    color: '#FFFFFF',
                    padding: '0.85rem 1.75rem',
                    borderRadius: '8px',
                    fontWeight: 700,
                    fontSize: '0.95rem',
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '0.5rem',
                    boxShadow: '0 4px 12px rgba(6,3,141,0.25)'
                  }}
                >
                  <span>🏛️</span>
                  <span>Enter Officer Portals</span>
                </a>
                <a
                  href="#how-it-works"
                  style={{
                    background: '#FFFFFF',
                    color: '#0F172A',
                    border: '1px solid #CBD5E1',
                    padding: '0.85rem 1.75rem',
                    borderRadius: '8px',
                    fontWeight: 700,
                    fontSize: '0.95rem',
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '0.5rem',
                    boxShadow: '0 2px 6px rgba(0,0,0,0.04)'
                  }}
                >
                  <span>📜</span>
                  <span>System Architecture & Pipeline</span>
                </a>
              </div>
            </div>

            {/* Live Statutory Mandate Snapshot Card */}
            <div style={{
              background: '#FFFFFF',
              border: '1px solid #CBD5E1',
              borderRadius: '16px',
              padding: '2rem',
              boxShadow: '0 10px 30px rgba(0,0,0,0.06)',
              position: 'relative'
            }}>
              <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: '4px', background: 'linear-gradient(90deg, #FF9933 0%, #FFFFFF 50%, #138808 100%)' }} />
              
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '1.25rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.65rem' }}>
                  <img src="/emblem.png" alt="Emblem" style={{ height: '36px' }} />
                  <div>
                    <div style={{ fontSize: '0.82rem', fontWeight: 800, color: '#0F172A' }}>STATUTORY RECOGNITION</div>
                    <div style={{ fontSize: '0.72rem', color: '#64748B' }}>Evidentiary Legal Validity</div>
                  </div>
                </div>
                <span style={{ background: '#ECFDF5', color: '#065F46', padding: '0.25rem 0.65rem', borderRadius: '9999px', fontSize: '0.72rem', fontWeight: 700 }}>
                  Active National System
                </span>
              </div>

              <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '1rem', marginBottom: '1.25rem' }}>
                <div style={{ background: '#F8FAFC', border: '1px solid #E2E8F0', padding: '1rem', borderRadius: '10px' }}>
                  <div style={{ fontSize: '1.65rem', fontWeight: 800, color: '#06038D' }}>42+</div>
                  <div style={{ fontSize: '0.76rem', color: '#64748B', fontWeight: 600 }}>Statutory Rules Audited</div>
                </div>
                <div style={{ background: '#F8FAFC', border: '1px solid #E2E8F0', padding: '1rem', borderRadius: '10px' }}>
                  <div style={{ fontSize: '1.65rem', fontWeight: 800, color: '#138808' }}>100%</div>
                  <div style={{ fontSize: '0.76rem', color: '#64748B', fontWeight: 600 }}>Standard Unit Enforcement</div>
                </div>
                <div style={{ background: '#F8FAFC', border: '1px solid #E2E8F0', padding: '1rem', borderRadius: '10px' }}>
                  <div style={{ fontSize: '1.65rem', fontWeight: 800, color: '#D97706' }}>E-Commerce</div>
                  <div style={{ fontSize: '0.76rem', color: '#64748B', fontWeight: 600 }}>Automated Crawler Engine</div>
                </div>
                <div style={{ background: '#F8FAFC', border: '1px solid #E2E8F0', padding: '1rem', borderRadius: '10px' }}>
                  <div style={{ fontSize: '1.65rem', fontWeight: 800, color: '#7C3AED' }}>Offline APK</div>
                  <div style={{ fontSize: '0.76rem', color: '#64748B', fontWeight: 600 }}>On-Ground Field Suite</div>
                </div>
              </div>

              <div style={{ background: '#EFF6FF', border: '1px solid #BFDBFE', padding: '0.85rem', borderRadius: '8px', fontSize: '0.8rem', color: '#1E40AF', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                <span>🛡️</span>
                <span><strong>Section 15 & 36 Admissibility:</strong> Timestamped OCR dossiers generate tamper-proof digital evidence.</span>
              </div>
            </div>

          </div>
        </section>

        {/* SECTION 1: WHAT IS NIRIKSHAK */}
        <section id="about" style={{ padding: '4rem 2rem', maxWidth: '1360px', margin: '0 auto' }}>
          <div style={{ textAlign: 'center', maxWidth: '860px', margin: '0 auto 3rem auto' }}>
            <div style={{ color: '#06038D', fontWeight: 800, fontSize: '0.82rem', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: '0.5rem' }}>
              Statutory Overview & Purpose
            </div>
            <h2 style={{ fontSize: '2.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '1rem' }}>
              What is NIRIKSHAK?
            </h2>
            <p style={{ fontSize: '1rem', color: '#475569', lineHeight: 1.7 }}>
              NIRIKSHAK is the unified digital verification, surveillance, and enforcement infrastructure designed by the <strong>Department of Consumer Affairs, Government of India</strong>. Built to modernize the enforcement of the Legal Metrology (Packaged Commodities) Rules, 2011, Nirikshak eliminates manual bottlenecks by deploying high-throughput computer vision, optical character recognition (OCR), and hierarchical judicial notice management.
            </p>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(340px, 1fr))', gap: '2rem' }}>
            
            <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '14px', padding: '2rem', boxShadow: '0 4px 14px rgba(0,0,0,0.03)' }}>
              <div style={{ width: '48px', height: '48px', borderRadius: '10px', background: '#EEF2FF', color: '#06038D', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '1.5rem', marginBottom: '1.25rem' }}>
                ⚖️
              </div>
              <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.75rem' }}>
                The Legal Metrology Mandate
              </h3>
              <p style={{ fontSize: '0.9rem', color: '#475569', lineHeight: 1.65 }}>
                Under The Legal Metrology Act, 2009, no person or corporate entity shall pre-pack, distribute, sell, or expose for sale any packaged commodity unless every package carries mandatory statutory declarations (MRP inclusive of all taxes, net quantity, unit sale price, month/year of manufacture, country of origin, and consumer care details).
              </p>
            </div>

            <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '14px', padding: '2rem', boxShadow: '0 4px 14px rgba(0,0,0,0.03)' }}>
              <div style={{ width: '48px', height: '48px', borderRadius: '10px', background: '#ECFDF5', color: '#138808', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '1.5rem', marginBottom: '1.25rem' }}>
                🌐
              </div>
              <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.75rem' }}>
                Omnichannel E-Commerce Audit
              </h3>
              <p style={{ fontSize: '0.9rem', color: '#475569', lineHeight: 1.65 }}>
                E-commerce marketplaces (Amazon, Flipkart, Quick-Commerce apps) are subject to Rule 6(10) of the Packaged Commodities Rules. Nirikshak crawls marketplace listings at machine speed, parsing structured JSON-LD and packaging photo carousels to verify that digital listings mirror physical packaging standards.
              </p>
            </div>

            <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '14px', padding: '2rem', boxShadow: '0 4px 14px rgba(0,0,0,0.03)' }}>
              <div style={{ width: '48px', height: '48px', borderRadius: '10px', background: '#FEF3C7', color: '#D97706', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '1.5rem', marginBottom: '1.25rem' }}>
                📱
              </div>
              <h3 style={{ fontSize: '1.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.75rem' }}>
                Field Enforcement Mobility
              </h3>
              <p style={{ fontSize: '0.9rem', color: '#475569', lineHeight: 1.65 }}>
                On-ground Legal Metrology Officers operate the companion Nirikshak Android Mobile Application. Equipped with offline barcode scanning, GPS geotagging, and camera packaging dimension verification, field inspection reports sync seamlessly into the state adjudication queue.
              </p>
            </div>

          </div>
        </section>

        {/* SECTION 2: WHY IS NIRIKSHAK IMPORTANT */}
        <section id="importance" style={{ background: '#F1F5F9', padding: '4rem 2rem', borderTop: '1px solid #E2E8F0', borderBottom: '1px solid #E2E8F0' }}>
          <div style={{ maxWidth: '1360px', margin: '0 auto' }}>
            
            <div style={{ textAlign: 'center', maxWidth: '860px', margin: '0 auto 3rem auto' }}>
              <div style={{ color: '#06038D', fontWeight: 800, fontSize: '0.82rem', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: '0.5rem' }}>
                Consumer Protection & Economic Fairness
              </div>
              <h2 style={{ fontSize: '2.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '1rem' }}>
                Why is NIRIKSHAK Crucial for India?
              </h2>
              <p style={{ fontSize: '1rem', color: '#475569', lineHeight: 1.7 }}>
                Ensuring precision, truthfulness, and transparency across consumer products is vital to national economic integrity and citizen welfare.
              </p>
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(300px, 1fr))', gap: '1.75rem' }}>
              
              <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '12px', padding: '1.75rem' }}>
                <div style={{ color: '#06038D', fontSize: '1.75rem', marginBottom: '0.75rem' }}>🛡️</div>
                <h4 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Protection of 1.4 Billion Consumers</h4>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6 }}>
                  Guarantees that consumers are not shortchanged through deceptive packaging, short weight, concealed prices, or missing dates of expiry and manufacture.
                </p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '12px', padding: '1.75rem' }}>
                <div style={{ color: '#06038D', fontSize: '1.75rem', marginBottom: '0.75rem' }}>🇮🇳</div>
                <h4 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Country of Origin Transparency</h4>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6 }}>
                  Strictly enforces sovereign Country of Origin declarations across physical and online listings, protecting domestic manufacturers and informing buyer decisions.
                </p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '12px', padding: '1.75rem' }}>
                <div style={{ color: '#06038D', fontSize: '1.75rem', marginBottom: '0.75rem' }}>🏷️</div>
                <h4 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Standardized MRP & No Hidden Taxes</h4>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6 }}>
                  Under Rule 18, MRP is strictly inclusive of all taxes. Nirikshak prohibits arbitrary surge pricing above the printed maximum retail price.
                </p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '12px', padding: '1.75rem' }}>
                <div style={{ color: '#06038D', fontSize: '1.75rem', marginBottom: '0.75rem' }}>⚡</div>
                <h4 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Swift Adjudication & Compounding</h4>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6 }}>
                  Reduces resolution times from months to days. Automatically formats statutory notices, hearing summons, and compounding orders under Section 49.
                </p>
              </div>

            </div>

          </div>
        </section>

        {/* SECTION 3: HOW NIRIKSHAK FUNCTIONS (THE 4-STAGE PIPELINE) */}
        <section id="how-it-works" style={{ padding: '4rem 2rem', maxWidth: '1360px', margin: '0 auto' }}>
          <div style={{ textAlign: 'center', maxWidth: '860px', margin: '0 auto 3.5rem auto' }}>
            <div style={{ color: '#06038D', fontWeight: 800, fontSize: '0.82rem', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: '0.5rem' }}>
              End-to-End Operational Lifecycle
            </div>
            <h2 style={{ fontSize: '2.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '1rem' }}>
              How NIRIKSHAK Functions
            </h2>
            <p style={{ fontSize: '1rem', color: '#475569', lineHeight: 1.7 }}>
              From initial ingestion to judicial notice issuance, Nirikshak executes an automated 4-stage pipeline.
            </p>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(280px, 1fr))', gap: '2rem', position: 'relative' }}>
            
            {/* Step 1 */}
            <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '14px', padding: '2rem', boxShadow: '0 4px 12px rgba(0,0,0,0.03)', position: 'relative' }}>
              <div style={{ background: '#06038D', color: '#FFFFFF', width: '36px', height: '36px', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 800, fontSize: '1rem', marginBottom: '1.25rem' }}>
                1
              </div>
              <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>
                Surveillance & Ingestion
              </h3>
              <p style={{ fontSize: '0.86rem', color: '#475569', lineHeight: 1.6 }}>
                Digital marketplace crawlers and field officers scan packaged products, streaming high-res photos, barcodes, and listing HTML into the processing queue.
              </p>
            </div>

            {/* Step 2 */}
            <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '14px', padding: '2rem', boxShadow: '0 4px 12px rgba(0,0,0,0.03)', position: 'relative' }}>
              <div style={{ background: '#06038D', color: '#FFFFFF', width: '36px', height: '36px', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 800, fontSize: '1rem', marginBottom: '1.25rem' }}>
                2
              </div>
              <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>
                Multimodal Neural OCR
              </h3>
              <p style={{ fontSize: '0.86rem', color: '#475569', lineHeight: 1.6 }}>
                ComplianceEngine microservice performs neural OCR, image text segmentation, and NLP key-value extraction across packaging angles.
              </p>
            </div>

            {/* Step 3 */}
            <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '14px', padding: '2rem', boxShadow: '0 4px 12px rgba(0,0,0,0.03)', position: 'relative' }}>
              <div style={{ background: '#06038D', color: '#FFFFFF', width: '36px', height: '36px', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 800, fontSize: '1rem', marginBottom: '1.25rem' }}>
                3
              </div>
              <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>
                Rule Verification Engine
              </h3>
              <p style={{ fontSize: '0.86rem', color: '#475569', lineHeight: 1.6 }}>
                Validates extracted declarations against statutory rules (Rule 6 declarations, Rule 26 standard weights, metric unit symbols, and tax inclusivity).
              </p>
            </div>

            {/* Step 4 */}
            <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '14px', padding: '2rem', boxShadow: '0 4px 12px rgba(0,0,0,0.03)', position: 'relative' }}>
              <div style={{ background: '#06038D', color: '#FFFFFF', width: '36px', height: '36px', borderRadius: '50%', display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 800, fontSize: '1rem', marginBottom: '1.25rem' }}>
                4
              </div>
              <h3 style={{ fontSize: '1.15rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>
                Adjudication & Notices
              </h3>
              <p style={{ fontSize: '0.86rem', color: '#475569', lineHeight: 1.6 }}>
                Assistant Controllers review flagged violations, issue digital Show-Cause notices, approve compounding orders, or forward for legal prosecution.
              </p>
            </div>

          </div>
        </section>

        {/* SECTION 4: MANDATORY STATUTORY DECLARATIONS */}
        <section id="statutory-rules" style={{ background: '#F8FAFC', padding: '4rem 2rem', borderTop: '1px solid #E2E8F0', borderBottom: '1px solid #E2E8F0' }}>
          <div style={{ maxWidth: '1360px', margin: '0 auto' }}>
            
            <div style={{ textAlign: 'center', maxWidth: '860px', margin: '0 auto 3rem auto' }}>
              <div style={{ color: '#06038D', fontWeight: 800, fontSize: '0.82rem', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: '0.5rem' }}>
                Legal Metrology (Packaged Commodities) Rules, 2011
              </div>
              <h2 style={{ fontSize: '2.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '1rem' }}>
                Mandatory Declarations on Every Pre-Packaged Commodity
              </h2>
              <p style={{ fontSize: '1rem', color: '#475569', lineHeight: 1.7 }}>
                Under Rule 6 of PCR 2011, every pre-packed commodity sold in India must display the following 7 statutory declarations clearly on the principal display panel.
              </p>
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))', gap: '1.5rem' }}>
              
              <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '10px', padding: '1.5rem' }}>
                <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#06038D', textTransform: 'uppercase', marginBottom: '0.35rem' }}>Mandate 1 · Rule 6(1)(a)</div>
                <h4 style={{ fontSize: '1rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Name & Physical Address</h4>
                <p style={{ fontSize: '0.85rem', color: '#64748B' }}>Complete physical address of the Manufacturer, Packer, or Importer with pin code and city.</p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '10px', padding: '1.5rem' }}>
                <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#06038D', textTransform: 'uppercase', marginBottom: '0.35rem' }}>Mandate 2 · Rule 6(1)(aa)</div>
                <h4 style={{ fontSize: '1rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Country of Origin</h4>
                <p style={{ fontSize: '0.85rem', color: '#64748B' }}>Unambiguous Country of Origin declaration for both imported and domestically produced commodities.</p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '10px', padding: '1.5rem' }}>
                <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#06038D', textTransform: 'uppercase', marginBottom: '0.35rem' }}>Mandate 3 · Rule 6(1)(b)</div>
                <h4 style={{ fontSize: '1rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Generic Name of Commodity</h4>
                <p style={{ fontSize: '0.85rem', color: '#64748B' }}>Common, trade, or generic name describing the actual nature of the enclosed commodity.</p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '10px', padding: '1.5rem' }}>
                <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#06038D', textTransform: 'uppercase', marginBottom: '0.35rem' }}>Mandate 4 · Rule 6(1)(c) & (e)</div>
                <h4 style={{ fontSize: '1rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Net Quantity & Unit Sale Price (USP)</h4>
                <p style={{ fontSize: '0.85rem', color: '#64748B' }}>Net quantity declared in standard metric units (g, kg, ml, l, or number) alongside Unit Sale Price.</p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '10px', padding: '1.5rem' }}>
                <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#06038D', textTransform: 'uppercase', marginBottom: '0.35rem' }}>Mandate 5 · Rule 6(1)(d)</div>
                <h4 style={{ fontSize: '1rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Month & Year of Manufacture / Packing</h4>
                <p style={{ fontSize: '0.85rem', color: '#64748B' }}>Month and year of manufacture, packing, or import clearly stated for consumer freshness verification.</p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '10px', padding: '1.5rem' }}>
                <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#06038D', textTransform: 'uppercase', marginBottom: '0.35rem' }}>Mandate 6 · Rule 6(1)(da) & Rule 18</div>
                <h4 style={{ fontSize: '1rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Maximum Retail Price (MRP)</h4>
                <p style={{ fontSize: '0.85rem', color: '#64748B' }}>Single consolidated MRP declared clearly with the statutory words "(Inclusive of all taxes)".</p>
              </div>

              <div style={{ background: '#FFFFFF', border: '1px solid #E2E8F0', borderRadius: '10px', padding: '1.5rem' }}>
                <div style={{ fontSize: '0.75rem', fontWeight: 700, color: '#06038D', textTransform: 'uppercase', marginBottom: '0.35rem' }}>Mandate 7 · Rule 6(1)(n)</div>
                <h4 style={{ fontSize: '1rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>Consumer Care & Redressal Info</h4>
                <p style={{ fontSize: '0.85rem', color: '#64748B' }}>Name, physical address, telephone number, and email ID of the grievance redressal officer.</p>
              </div>

            </div>

          </div>
        </section>

        {/* SECTION 5: OFFICIAL OFFICER PORTALS (NO DEMO CREDS, PROPER GOVERNMENT LOOK) */}
        <section id="portals" style={{ padding: '4.5rem 2rem', maxWidth: '1360px', margin: '0 auto' }}>
          
          <div style={{ textAlign: 'center', maxWidth: '860px', margin: '0 auto 3rem auto' }}>
            <div style={{
              display: 'inline-block',
              background: '#06038D',
              color: '#FFFFFF',
              fontSize: '0.75rem',
              fontWeight: 700,
              textTransform: 'uppercase',
              letterSpacing: '0.1em',
              padding: '0.3rem 0.85rem',
              borderRadius: '4px',
              marginBottom: '0.75rem'
            }}>
              OFFICER COMMAND ACCESS
            </div>
            <h2 style={{ fontSize: '2.35rem', fontWeight: 800, color: '#0F172A', marginBottom: '1rem' }}>
              Designated Departmental Portals
            </h2>
            <p style={{ fontSize: '1rem', color: '#475569', lineHeight: 1.7 }}>
              Select your assigned statutory jurisdiction to proceed to your departmental authentication console. Access is strictly governed under the Information Technology Act, 2000 and Section 15 of the Legal Metrology Act, 2009.
            </p>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(360px, 1fr))', gap: '2rem', marginBottom: '2.5rem' }}>
            
            {/* Card 1: CLM Admin */}
            <div style={{
              background: '#FFFFFF',
              border: '1px solid #CBD5E1',
              borderRadius: '16px',
              padding: '2.25rem',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              boxShadow: '0 6px 20px rgba(0,0,0,0.04)',
              position: 'relative',
              overflow: 'hidden'
            }}>
              <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: '5px', background: '#FF9933' }} />
              <div>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.25rem' }}>
                  <span style={{ fontSize: '2.5rem' }}>🏛️</span>
                  <span style={{ background: '#FEF3C7', color: '#92400E', padding: '0.3rem 0.75rem', borderRadius: '6px', fontSize: '0.72rem', fontWeight: 800, letterSpacing: '0.05em' }}>
                    CENTRAL DIRECTIVE
                  </span>
                </div>
                <h3 style={{ fontSize: '1.4rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>
                  Controller of Legal Metrology (CLM)
                </h3>
                <div style={{ fontSize: '0.82rem', color: '#06038D', fontWeight: 700, marginBottom: '1rem' }}>
                  National Directorate Level Administration
                </div>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6, marginBottom: '1.75rem' }}>
                  Apex regulatory console. Issue sovereign policy directives, provision departmental inspector credentials, monitor national compliance indices across states, and supervise cryptographic audit logs.
                </p>
              </div>

              <div>
                <div style={{ background: '#F8FAFC', border: '1px solid #E2E8F0', padding: '0.85rem', borderRadius: '8px', marginBottom: '1.25rem', fontSize: '0.78rem', color: '#64748B' }}>
                  🔒 <strong>Restricted:</strong> Authorized Central & State Directorate Officers Only.
                </div>
                <a
                  href="/admin/login"
                  style={{
                    display: 'block',
                    textAlign: 'center',
                    background: '#06038D',
                    color: '#FFFFFF',
                    padding: '0.9rem 1.25rem',
                    borderRadius: '8px',
                    fontWeight: 700,
                    fontSize: '0.92rem',
                    boxShadow: '0 4px 12px rgba(6,3,141,0.2)',
                    transition: 'opacity 0.2s'
                  }}
                >
                  Access CLM Admin Console →
                </a>
              </div>
            </div>

            {/* Card 2: Assistant Controller */}
            <div style={{
              background: '#FFFFFF',
              border: '1px solid #CBD5E1',
              borderRadius: '16px',
              padding: '2.25rem',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              boxShadow: '0 6px 20px rgba(0,0,0,0.04)',
              position: 'relative',
              overflow: 'hidden'
            }}>
              <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: '5px', background: '#2563EB' }} />
              <div>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.25rem' }}>
                  <span style={{ fontSize: '2.5rem' }}>⚖️</span>
                  <span style={{ background: '#DBEAFE', color: '#1E40AF', padding: '0.3rem 0.75rem', borderRadius: '6px', fontSize: '0.72rem', fontWeight: 800, letterSpacing: '0.05em' }}>
                    APPELLATE & REVIEW
                  </span>
                </div>
                <h3 style={{ fontSize: '1.4rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>
                  Assistant Controller (AC)
                </h3>
                <div style={{ fontSize: '0.82rem', color: '#2563EB', fontWeight: 700, marginBottom: '1rem' }}>
                  Senior Enforcement & Adjudication Unit
                </div>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6, marginBottom: '1.75rem' }}>
                  Senior supervisory adjudication portal. Review live field and e-commerce statutory violation queues, approve digital Show-Cause notices, initiate compounding proceedings under Section 49, or dismiss invalid claims.
                </p>
              </div>

              <div>
                <div style={{ background: '#F8FAFC', border: '1px solid #E2E8F0', padding: '0.85rem', borderRadius: '8px', marginBottom: '1.25rem', fontSize: '0.78rem', color: '#64748B' }}>
                  🔒 <strong>Restricted:</strong> Appointed Assistant Controllers & Senior Inspectors Only.
                </div>
                <a
                  href="/ac/login"
                  style={{
                    display: 'block',
                    textAlign: 'center',
                    background: '#1D4ED8',
                    color: '#FFFFFF',
                    padding: '0.9rem 1.25rem',
                    borderRadius: '8px',
                    fontWeight: 700,
                    fontSize: '0.92rem',
                    boxShadow: '0 4px 12px rgba(29,78,216,0.2)',
                    transition: 'opacity 0.2s'
                  }}
                >
                  Access AC Review Console →
                </a>
              </div>
            </div>

            {/* Card 3: DMI Scanner */}
            <div style={{
              background: '#FFFFFF',
              border: '1px solid #CBD5E1',
              borderRadius: '16px',
              padding: '2.25rem',
              display: 'flex',
              flexDirection: 'column',
              justifyContent: 'space-between',
              boxShadow: '0 6px 20px rgba(0,0,0,0.04)',
              position: 'relative',
              overflow: 'hidden'
            }}>
              <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: '5px', background: '#138808' }} />
              <div>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.25rem' }}>
                  <span style={{ fontSize: '2.5rem' }}>🔍</span>
                  <span style={{ background: '#DCFCE7', color: '#166534', padding: '0.3rem 0.75rem', borderRadius: '6px', fontSize: '0.72rem', fontWeight: 800, letterSpacing: '0.05em' }}>
                    MARKETPLACE ENFORCEMENT
                  </span>
                </div>
                <h3 style={{ fontSize: '1.4rem', fontWeight: 800, color: '#0F172A', marginBottom: '0.5rem' }}>
                  Digital Metrology Inspector (DMI)
                </h3>
                <div style={{ fontSize: '0.82rem', color: '#138808', fontWeight: 700, marginBottom: '1rem' }}>
                  E-Commerce Crawling & Physical Package OCR
                </div>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6, marginBottom: '1.75rem' }}>
                  Operational inspectorate console. Crawl live marketplace listings (Amazon, Flipkart, etc.), perform automated neural OCR on packaging image carousels, extract statutory declarations, and file violation dossiers.
                </p>
              </div>

              <div>
                <div style={{ background: '#F8FAFC', border: '1px solid #E2E8F0', padding: '0.85rem', borderRadius: '8px', marginBottom: '1.25rem', fontSize: '0.78rem', color: '#64748B' }}>
                  🔒 <strong>Restricted:</strong> Authorized Legal Metrology Inspection Officers Only.
                </div>
                <a
                  href="/dmi/login"
                  style={{
                    display: 'block',
                    textAlign: 'center',
                    background: '#15803D',
                    color: '#FFFFFF',
                    padding: '0.9rem 1.25rem',
                    borderRadius: '8px',
                    fontWeight: 700,
                    fontSize: '0.92rem',
                    boxShadow: '0 4px 12px rgba(21,128,61,0.2)',
                    transition: 'opacity 0.2s'
                  }}
                >
                  Access DMI Web Scanner →
                </a>
              </div>
            </div>

          </div>

          {/* Official Security Disclaimer Warning */}
          <div style={{
            background: '#FFFBEB',
            border: '1px solid #FCD34D',
            borderRadius: '10px',
            padding: '1.25rem 1.5rem',
            display: 'flex',
            alignItems: 'center',
            gap: '1rem'
          }}>
            <span style={{ fontSize: '1.5rem' }}>⚠️</span>
            <div style={{ fontSize: '0.84rem', color: '#78350F', lineHeight: 1.5 }}>
              <strong>RESTRICTED OFFICIAL SYSTEM NOTICE:</strong> This is a secure Government of India computing platform. Unauthorized access, probing, tampering, or credential sharing is strictly prohibited and constitutes a cognizable offense punishable under Sections 43, 65, and 66 of the Information Technology Act, 2000 and Section 318 of Bharatiya Nyaya Sanhita (BNS).
            </div>
          </div>

        </section>

        {/* SECTION 6: MULTI-SERVICE ARCHITECTURE & FIELD MOBILE APP */}
        <section id="infrastructure" style={{ background: '#F1F5F9', padding: '4rem 2rem', borderTop: '1px solid #E2E8F0' }}>
          <div style={{ maxWidth: '1360px', margin: '0 auto' }}>
            
            <div style={{ textAlign: 'center', maxWidth: '860px', margin: '0 auto 3rem auto' }}>
              <div style={{ color: '#06038D', fontWeight: 800, fontSize: '0.82rem', textTransform: 'uppercase', letterSpacing: '0.1em', marginBottom: '0.5rem' }}>
                Technology & Computing Architecture
              </div>
              <h2 style={{ fontSize: '2.25rem', fontWeight: 800, color: '#0F172A', marginBottom: '1rem' }}>
                Sovereign Multi-Service Infrastructure
              </h2>
              <p style={{ fontSize: '1rem', color: '#475569', lineHeight: 1.7 }}>
                Decoupled microservice architecture designed for high-throughput compliance scanning and 24/7 uptime.
              </p>
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(360px, 1fr))', gap: '2rem' }}>
              
              {/* Field APK Suite */}
              <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '14px', padding: '2rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '1rem' }}>
                  <span style={{ fontSize: '2rem' }}>📱</span>
                  <div>
                    <h3 style={{ fontSize: '1.2rem', fontWeight: 800, color: '#0F172A' }}>Nirikshak Android Field Inspector Suite</h3>
                    <div style={{ fontSize: '0.78rem', color: '#64748B' }}>Offline Mobile Enforcement Application</div>
                  </div>
                </div>
                <p style={{ fontSize: '0.88rem', color: '#475569', lineHeight: 1.6, marginBottom: '1.25rem' }}>
                  Engineered specifically for field officers visiting physical manufacturing plants, distribution warehouses, and retail outlets. Features local SQLite offline caching, camera barcode decoding, GPS geo-stamping, and cryptographic sync.
                </p>
                <div style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
                  <a
                    href="/api/apk/health"
                    target="_blank"
                    rel="noreferrer"
                    style={{
                      display: 'inline-flex',
                      alignItems: 'center',
                      gap: '0.5rem',
                      background: '#F1F5F9',
                      border: '1px solid #CBD5E1',
                      color: '#0F172A',
                      padding: '0.5rem 1rem',
                      borderRadius: '6px',
                      fontSize: '0.8rem',
                      fontWeight: 700
                    }}
                  >
                    APK API Health Check ↗
                  </a>
                </div>
              </div>

              {/* High-Compute ML & Crawler Engine */}
              <div style={{ background: '#FFFFFF', border: '1px solid #CBD5E1', borderRadius: '14px', padding: '2rem' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '1rem' }}>
                  <span style={{ fontSize: '2rem' }}>⚡</span>
                  <div>
                    <h3 style={{ fontSize: '1.2rem', fontWeight: 800, color: '#0F172A' }}>Dedicated Neural & Crawler Microservices</h3>
                    <div style={{ fontSize: '0.78rem', color: '#64748B' }}>High-Throughput Vision & Scraping Pipeline</div>
                  </div>
                </div>
                <ul style={{ listStyle: 'none', padding: 0, margin: 0, display: 'flex', flexDirection: 'column', gap: '0.75rem', fontSize: '0.88rem', color: '#475569' }}>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ color: '#138808', fontWeight: 800 }}>✔</span>
                    <span><strong>ComplianceEngine Microservice:</strong> High-precision Tesseract OCR, packaging surface distortion correction, and rule evaluation engine.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ color: '#138808', fontWeight: 800 }}>✔</span>
                    <span><strong>Dynamic Marketplace Crawler:</strong> High-fidelity stealth HTTP crawling bypassing bot blocks to extract uncompressed 1500px packaging images.</span>
                  </li>
                  <li style={{ display: 'flex', alignItems: 'flex-start', gap: '0.5rem' }}>
                    <span style={{ color: '#138808', fontWeight: 800 }}>✔</span>
                    <span><strong>Automated Keep-Alive Monitoring:</strong> 24/7 background self-pinging eliminating server dormancy.</span>
                  </li>
                </ul>
              </div>

            </div>

          </div>
        </section>

      </main>

      {/* Official Government Footer */}
      <footer style={{ background: '#012A4A', color: '#FFFFFF', borderTop: '3px solid #FF9933', padding: '3rem 2rem 1.5rem 2rem' }}>
        <div style={{ maxWidth: '1360px', margin: '0 auto' }}>
          
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', flexWrap: 'wrap', gap: '2rem', paddingBottom: '2.5rem', borderBottom: '1px solid rgba(255,255,255,0.1)' }}>
            
            <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem' }}>
              <div style={{ background: '#FFFFFF', padding: '0.35rem', borderRadius: '8px' }}>
                <img src="/emblem.png" alt="Emblem" style={{ height: '54px' }} />
              </div>
              <div>
                <div style={{ fontSize: '1rem', fontWeight: 800, color: '#FFFFFF' }}>Department of Consumer Affairs</div>
                <div style={{ fontSize: '0.82rem', color: 'rgba(255,255,255,0.8)' }}>Ministry of Consumer Affairs, Food & Public Distribution</div>
                <div style={{ fontSize: '0.75rem', color: '#FCD34D', marginTop: '0.2rem' }}>Government of India</div>
              </div>
            </div>

            <div style={{ textAlign: 'right' }}>
              <div style={{ display: 'inline-flex', alignItems: 'center', gap: '0.5rem', background: 'rgba(255,255,255,0.08)', padding: '0.35rem 0.85rem', borderRadius: '6px', fontSize: '0.78rem', fontWeight: 600, border: '1px solid rgba(255,255,255,0.15)' }}>
                <span>🏛️</span> Digital India Initiative
              </div>
              <div style={{ fontSize: '0.78rem', color: 'rgba(255,255,255,0.7)', marginTop: '0.5rem' }}>
                Designed, Developed & Maintained for National Regulatory Enforcement
              </div>
              <div style={{ fontSize: '0.72rem', color: 'rgba(255,255,255,0.5)' }}>
                Guidelines for Indian Government Websites (GIGW) Standard
              </div>
            </div>

          </div>

          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem', paddingTop: '1.5rem', fontSize: '0.78rem', color: 'rgba(255,255,255,0.7)' }}>
            <div>
              © {new Date().getFullYear()} Department of Consumer Affairs, Government of India. All Rights Reserved.
            </div>
            <div style={{ display: 'flex', alignItems: 'center', gap: '1.25rem', flexWrap: 'wrap' }}>
              <button
                onClick={openPolicy('helpline')}
                style={{ background: 'none', border: 'none', color: '#FCD34D', cursor: 'pointer', fontWeight: 600 }}
              >
                National Consumer Helpline (1915)
              </button>
              <span>•</span>
              <button
                onClick={openPolicy('privacy')}
                style={{ background: 'none', border: 'none', color: '#FFFFFF', cursor: 'pointer' }}
              >
                Privacy Policy
              </button>
              <span>•</span>
              <button
                onClick={openPolicy('terms')}
                style={{ background: 'none', border: 'none', color: '#FFFFFF', cursor: 'pointer' }}
              >
                Terms of Service
              </button>
              <span>•</span>
              <button
                onClick={openPolicy('hyperlink')}
                style={{ background: 'none', border: 'none', color: '#FFFFFF', cursor: 'pointer' }}
              >
                Hyperlink Policy
              </button>
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
            background: 'rgba(0,0,0,0.6)',
            backdropFilter: 'blur(3px)',
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
              background: '#FFFFFF',
              borderRadius: '12px',
              maxWidth: '640px',
              width: '100%',
              boxShadow: '0 20px 40px rgba(0,0,0,0.25)',
              border: '1px solid #CBD5E1',
              overflow: 'hidden'
            }}
          >
            {/* Modal Header */}
            <div style={{ background: '#06038D', color: '#FFFFFF', padding: '1rem 1.25rem', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
                <img src="/emblem.png" alt="Emblem" style={{ height: '32px', filter: 'brightness(0) invert(1)' }} />
                <div>
                  <h3 style={{ fontSize: '0.95rem', fontWeight: 800, margin: 0, color: '#FFFFFF' }}>
                    {POLICIES[activePolicy].title}
                  </h3>
                  <div style={{ fontSize: '0.72rem', color: '#FCD34D', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                    {POLICIES[activePolicy].badge}
                  </div>
                </div>
              </div>
              <button
                onClick={closePolicy}
                aria-label="Close dialog"
                style={{ background: 'none', border: 'none', color: '#FFFFFF', fontSize: '1.25rem', cursor: 'pointer', padding: '0.25rem' }}
              >
                ✕
              </button>
            </div>

            {/* Modal Tricolor */}
            <div className="tricolor-stripe">
              <div className="saffron" />
              <div className="white" />
              <div className="green" />
            </div>

            {/* Modal Body */}
            <div style={{ padding: '1.5rem', maxHeight: '70vh', overflowY: 'auto' }}>
              {POLICIES[activePolicy].content}
            </div>

            {/* Modal Footer */}
            <div style={{ background: '#F8FAFC', borderTop: '1px solid #E2E8F0', padding: '0.75rem 1.25rem', textAlign: 'right' }}>
              <button
                onClick={closePolicy}
                style={{
                  background: '#012A4A',
                  color: '#FFFFFF',
                  border: 'none',
                  padding: '0.5rem 1.25rem',
                  borderRadius: '6px',
                  fontWeight: 600,
                  fontSize: '0.82rem',
                  cursor: 'pointer'
                }}
              >
                Close / बंद करें
              </button>
            </div>
          </div>
        </div>
      )}

    </div>
  );
}
