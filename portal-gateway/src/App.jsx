import React, { useState, useEffect } from 'react';

export default function App() {
  const [copiedRole, setCopiedRole] = useState(null);
  const [pulseTime, setPulseTime] = useState(new Date().toLocaleTimeString());

  useEffect(() => {
    const timer = setInterval(() => setPulseTime(new Date().toLocaleTimeString()), 1000);
    return () => clearInterval(timer);
  }, []);

  const copyCreds = (role, user, pass) => {
    navigator.clipboard.writeText(`Username: ${user}\nPassword: ${pass}`);
    setCopiedRole(role);
    setTimeout(() => setCopiedRole(null), 2000);
  };

  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column' }}>
      <div className="tricolor-stripe" />

      {/* Top Banner */}
      <header style={{
        background: 'linear-gradient(180deg, rgba(11,19,43,0.95) 0%, rgba(15,23,42,0.9) 100%)',
        borderBottom: '1px solid rgba(255,255,255,0.08)',
        padding: '1.25rem 2rem',
        backdropFilter: 'blur(10px)',
        position: 'sticky',
        top: 0,
        zIndex: 50
      }}>
        <div style={{ maxWidth: '1280px', margin: '0 auto', display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '1rem' }}>
            <div style={{
              width: '46px',
              height: '46px',
              borderRadius: '50%',
              background: 'radial-gradient(circle, #06038D 0%, #030140 100%)',
              border: '2px solid #FF9933',
              display: 'flex',
              alignItems: 'center',
              justifyContent: 'center',
              fontSize: '1.5rem',
              boxShadow: '0 0 15px rgba(255,153,51,0.3)'
            }}>
              ⚖️
            </div>
            <div>
              <div style={{ fontSize: '0.72rem', letterSpacing: '0.12em', color: '#FF9933', fontWeight: 700, textTransform: 'uppercase' }}>
                GOVERNMENT OF INDIA · MINISTRY OF CONSUMER AFFAIRS
              </div>
              <div style={{ fontSize: '1.25rem', fontWeight: 800, color: '#FFFFFF', letterSpacing: '0.04em' }}>
                निरीक्षक · NIRIKSHAK
              </div>
              <div style={{ fontSize: '0.75rem', color: '#94A3B8' }}>
                National Legal Metrology Digital Verification & Statutory Enforcement Gateway
              </div>
            </div>
          </div>

          <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
            <div style={{
              display: 'inline-flex',
              alignItems: 'center',
              gap: '0.5rem',
              background: 'rgba(19, 136, 8, 0.12)',
              border: '1px solid rgba(19, 136, 8, 0.35)',
              padding: '0.4rem 0.85rem',
              borderRadius: '9999px',
              fontSize: '0.75rem',
              color: '#4ADE80',
              fontWeight: 600
            }}>
              <span style={{ width: '8px', height: '8px', borderRadius: '50%', background: '#4ADE80', display: 'inline-block', boxShadow: '0 0 8px #4ADE80' }} />
              Vercel Services Active · {pulseTime}
            </div>
          </div>
        </div>
      </header>

      {/* Main Container */}
      <main style={{ maxWidth: '1280px', margin: '0 auto', padding: '2.5rem 1.5rem', flex: 1, width: '100%' }}>
        
        {/* Hero Section */}
        <div style={{ textAlign: 'center', marginBottom: '3rem' }}>
          <div style={{
            display: 'inline-block',
            background: 'rgba(255, 153, 51, 0.1)',
            border: '1px solid rgba(255, 153, 51, 0.3)',
            color: '#FF9933',
            fontSize: '0.75rem',
            fontWeight: 700,
            textTransform: 'uppercase',
            letterSpacing: '0.1em',
            padding: '0.35rem 1rem',
            borderRadius: '9999px',
            marginBottom: '1rem'
          }}>
            Multi-Service Sovereign Deployment Architecture
          </div>
          <h1 style={{ fontSize: 'clamp(1.75rem, 4vw, 2.75rem)', fontWeight: 800, color: '#FFFFFF', lineHeight: 1.2, marginBottom: '1rem' }}>
            Unified Legal Metrology Command & Enforcement Portal
          </h1>
          <p style={{ maxWidth: '780px', margin: '0 auto', fontSize: '1rem', color: '#94A3B8', lineHeight: 1.6 }}>
            Seamless multi-portal infrastructure under The Legal Metrology Act, 2009 & Packaged Commodities Rules, 2011.
            Select your assigned officer command console to proceed.
          </p>
        </div>

        {/* 3 Core Roles Grid */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))', gap: '1.75rem', marginBottom: '3rem' }}>
          
          {/* Card 1: Admin */}
          <div style={{
            background: 'linear-gradient(160deg, #0F172A 0%, #1E293B 100%)',
            border: '1px solid rgba(255, 153, 51, 0.25)',
            borderRadius: '16px',
            padding: '2rem',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'space-between',
            boxShadow: '0 10px 25px -5px rgba(0,0,0,0.5)',
            transition: 'transform 0.2s ease, border-color 0.2s ease',
            position: 'relative',
            overflow: 'hidden'
          }}>
            <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: '4px', background: '#FF9933' }} />
            <div>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.25rem' }}>
                <span style={{ fontSize: '2.5rem' }}>🏛️</span>
                <span style={{ background: 'rgba(255,153,51,0.15)', color: '#FF9933', padding: '0.25rem 0.65rem', borderRadius: '6px', fontSize: '0.7rem', fontWeight: 700, letterSpacing: '0.05em' }}>
                  CENTRAL DIRECTIVE
                </span>
              </div>
              <h2 style={{ fontSize: '1.35rem', fontWeight: 800, color: '#FFFFFF', marginBottom: '0.5rem' }}>
                National CLM Admin
              </h2>
              <div style={{ fontSize: '0.8rem', color: '#CBD5E1', marginBottom: '1rem', fontWeight: 600 }}>
                Controller of Legal Metrology Directorate
              </div>
              <p style={{ fontSize: '0.85rem', color: '#94A3B8', marginBottom: '1.5rem', lineHeight: 1.5 }}>
                Issue jurisdiction mandates, provision enforcement credentials, monitor national compliance indices, and supervise immutable audit trails.
              </p>
            </div>

            <div>
              <div style={{ background: 'rgba(0,0,0,0.3)', border: '1px solid rgba(255,255,255,0.06)', borderRadius: '8px', padding: '0.75rem', marginBottom: '1.25rem' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.25rem' }}>
                  <span style={{ fontSize: '0.7rem', color: '#64748B', fontWeight: 700 }}>OFFICIAL LOGIN</span>
                  <button onClick={() => copyCreds('ADMIN', 'prakhar.admin', 'Admin@123')} style={{ background: 'none', border: 'none', color: '#FF9933', fontSize: '0.7rem', fontWeight: 600, cursor: 'pointer' }}>
                    {copiedRole === 'ADMIN' ? '✓ Copied' : 'Copy Demo Creds'}
                  </button>
                </div>
                <div style={{ fontFamily: 'JetBrains Mono, monospace', fontSize: '0.78rem', color: '#E2E8F0' }}>
                  prakhar.admin <span style={{ color: '#64748B' }}>/</span> Admin@123
                </div>
              </div>

              <a href="/admin/login" style={{
                display: 'block',
                textAlign: 'center',
                background: 'linear-gradient(135deg, #FF9933 0%, #E67E22 100%)',
                color: '#070B19',
                padding: '0.85rem 1.25rem',
                borderRadius: '10px',
                fontWeight: 800,
                fontSize: '0.9rem',
                boxShadow: '0 4px 15px rgba(255,153,51,0.3)',
                transition: 'opacity 0.2s'
              }}>
                Access CLM Admin Console →
              </a>
            </div>
          </div>

          {/* Card 2: Senior Inspector AC */}
          <div style={{
            background: 'linear-gradient(160deg, #0F172A 0%, #1E293B 100%)',
            border: '1px solid rgba(59, 130, 246, 0.25)',
            borderRadius: '16px',
            padding: '2rem',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'space-between',
            boxShadow: '0 10px 25px -5px rgba(0,0,0,0.5)',
            position: 'relative',
            overflow: 'hidden'
          }}>
            <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: '4px', background: '#3B82F6' }} />
            <div>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.25rem' }}>
                <span style={{ fontSize: '2.5rem' }}>⚖️</span>
                <span style={{ background: 'rgba(59,130,246,0.15)', color: '#60A5FA', padding: '0.25rem 0.65rem', borderRadius: '6px', fontSize: '0.7rem', fontWeight: 700, letterSpacing: '0.05em' }}>
                  APPELLATE & REVIEW
                </span>
              </div>
              <h2 style={{ fontSize: '1.35rem', fontWeight: 800, color: '#FFFFFF', marginBottom: '0.5rem' }}>
                Assistant Controller (AC)
              </h2>
              <div style={{ fontSize: '0.8rem', color: '#CBD5E1', marginBottom: '1rem', fontWeight: 600 }}>
                Senior Enforcement & Adjudication Unit
              </div>
              <p style={{ fontSize: '0.85rem', color: '#94A3B8', marginBottom: '1.5rem', lineHeight: 1.5 }}>
                Review live field and e-commerce statutory violations queue, approve notices, initiate compounding proceedings, or dismiss invalid claims.
              </p>
            </div>

            <div>
              <div style={{ background: 'rgba(0,0,0,0.3)', border: '1px solid rgba(255,255,255,0.06)', borderRadius: '8px', padding: '0.75rem', marginBottom: '1.25rem' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.25rem' }}>
                  <span style={{ fontSize: '0.7rem', color: '#64748B', fontWeight: 700 }}>OFFICIAL LOGIN</span>
                  <button onClick={() => copyCreds('AC', 'preet.ac', 'Ac@12345')} style={{ background: 'none', border: 'none', color: '#60A5FA', fontSize: '0.7rem', fontWeight: 600, cursor: 'pointer' }}>
                    {copiedRole === 'AC' ? '✓ Copied' : 'Copy Demo Creds'}
                  </button>
                </div>
                <div style={{ fontFamily: 'JetBrains Mono, monospace', fontSize: '0.78rem', color: '#E2E8F0' }}>
                  preet.ac <span style={{ color: '#64748B' }}>/</span> Ac@12345
                </div>
              </div>

              <a href="/ac/login" style={{
                display: 'block',
                textAlign: 'center',
                background: 'linear-gradient(135deg, #2563EB 0%, #1D4ED8 100%)',
                color: '#FFFFFF',
                padding: '0.85rem 1.25rem',
                borderRadius: '10px',
                fontWeight: 800,
                fontSize: '0.9rem',
                boxShadow: '0 4px 15px rgba(37,99,235,0.3)',
                transition: 'opacity 0.2s'
              }}>
                Access AC Review Console →
              </a>
            </div>
          </div>

          {/* Card 3: DMI Inspector */}
          <div style={{
            background: 'linear-gradient(160deg, #0F172A 0%, #1E293B 100%)',
            border: '1px solid rgba(19, 136, 8, 0.35)',
            borderRadius: '16px',
            padding: '2rem',
            display: 'flex',
            flexDirection: 'column',
            justifyContent: 'space-between',
            boxShadow: '0 10px 25px -5px rgba(0,0,0,0.5)',
            position: 'relative',
            overflow: 'hidden'
          }}>
            <div style={{ position: 'absolute', top: 0, left: 0, right: 0, height: '4px', background: '#138808' }} />
            <div>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1.25rem' }}>
                <span style={{ fontSize: '2.5rem' }}>🔍</span>
                <span style={{ background: 'rgba(19,136,8,0.15)', color: '#4ADE80', padding: '0.25rem 0.65rem', borderRadius: '6px', fontSize: '0.7rem', fontWeight: 700, letterSpacing: '0.05em' }}>
                  E-COMMERCE ENFORCEMENT
                </span>
              </div>
              <h2 style={{ fontSize: '1.35rem', fontWeight: 800, color: '#FFFFFF', marginBottom: '0.5rem' }}>
                Digital Metrology Inspector
              </h2>
              <div style={{ fontSize: '0.8rem', color: '#CBD5E1', marginBottom: '1rem', fontWeight: 600 }}>
                Digital Marketplace Inspectorate (DMI)
              </div>
              <p style={{ fontSize: '0.85rem', color: '#94A3B8', marginBottom: '1.5rem', lineHeight: 1.5 }}>
                Crawl live marketplace listings (Amazon, Flipkart, etc.), perform automated rule checks, extract mandatory declarations, and file statutory violation reports.
              </p>
            </div>

            <div>
              <div style={{ background: 'rgba(0,0,0,0.3)', border: '1px solid rgba(255,255,255,0.06)', borderRadius: '8px', padding: '0.75rem', marginBottom: '1.25rem' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.25rem' }}>
                  <span style={{ fontSize: '0.7rem', color: '#64748B', fontWeight: 700 }}>OFFICIAL LOGIN</span>
                  <button onClick={() => copyCreds('DMI', 'ridhi.dmi', 'Dmi@12345')} style={{ background: 'none', border: 'none', color: '#4ADE80', fontSize: '0.7rem', fontWeight: 600, cursor: 'pointer' }}>
                    {copiedRole === 'DMI' ? '✓ Copied' : 'Copy Demo Creds'}
                  </button>
                </div>
                <div style={{ fontFamily: 'JetBrains Mono, monospace', fontSize: '0.78rem', color: '#E2E8F0' }}>
                  ridhi.dmi <span style={{ color: '#64748B' }}>/</span> Dmi@12345
                </div>
              </div>

              <a href="/dmi/login" style={{
                display: 'block',
                textAlign: 'center',
                background: 'linear-gradient(135deg, #16A34A 0%, #15803D 100%)',
                color: '#FFFFFF',
                padding: '0.85rem 1.25rem',
                borderRadius: '10px',
                fontWeight: 800,
                fontSize: '0.9rem',
                boxShadow: '0 4px 15px rgba(22,163,74,0.3)',
                transition: 'opacity 0.2s'
              }}>
                Access DMI Web Scanner →
              </a>
            </div>
          </div>

        </div>

        {/* Multi-Service Engineering Status & Mobile APK Section */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))', gap: '1.5rem', marginBottom: '3rem' }}>
          
          {/* Mobile APK Panel */}
          <div style={{
            background: 'rgba(15,23,42,0.7)',
            border: '1px solid rgba(255,255,255,0.08)',
            borderRadius: '14px',
            padding: '1.75rem'
          }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem' }}>
              <span style={{ fontSize: '1.75rem' }}>📱</span>
              <div>
                <h3 style={{ fontSize: '1.1rem', fontWeight: 700, color: '#FFFFFF' }}>Nirikshak Android Field Inspector App</h3>
                <div style={{ fontSize: '0.75rem', color: '#94A3B8' }}>Offline-Capable Mobile Enforcement Suite</div>
              </div>
            </div>
            <p style={{ fontSize: '0.85rem', color: '#94A3B8', marginBottom: '1.25rem', lineHeight: 1.5 }}>
              Dedicated mobile client for on-ground Legal Metrology Officers. Features offline inspection capture, geo-stamping, packaging dimension verification, and sync.
            </p>
            <div style={{ display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
              <a href="/api/apk/health" target="_blank" rel="noreferrer" style={{
                display: 'inline-flex',
                alignItems: 'center',
                gap: '0.5rem',
                background: 'rgba(255,255,255,0.06)',
                border: '1px solid rgba(255,255,255,0.12)',
                color: '#E2E8F0',
                padding: '0.5rem 1rem',
                borderRadius: '8px',
                fontSize: '0.8rem',
                fontWeight: 600
              }}>
                API Health: /api/apk/health ↗
              </a>
            </div>
          </div>

          {/* Render Services Isolation Card */}
          <div style={{
            background: 'rgba(15,23,42,0.7)',
            border: '1px solid rgba(255,255,255,0.08)',
            borderRadius: '14px',
            padding: '1.75rem'
          }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '1rem' }}>
              <span style={{ fontSize: '1.75rem' }}>⚡</span>
              <div>
                <h3 style={{ fontSize: '1.1rem', fontWeight: 700, color: '#FFFFFF' }}>Isolated Render Compute Services</h3>
                <div style={{ fontSize: '0.75rem', color: '#94A3B8' }}>Heavy ML & Browser Crawling Engines</div>
              </div>
            </div>
            <ul style={{ listStyle: 'none', fontSize: '0.85rem', color: '#94A3B8', spaceY: '0.5rem', display: 'flex', flexDirection: 'column', gap: '0.65rem' }}>
              <li style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                <span style={{ color: '#10B981' }}>●</span>
                <span><strong>ComplianceEngine:</strong> Python/Tesseract OCR, packaging image segmentation & NLP parser.</span>
              </li>
              <li style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                <span style={{ color: '#10B981' }}>●</span>
                <span><strong>Local Scraper:</strong> Headless Chromium / Puppeteer dynamic e-commerce crawler.</span>
              </li>
            </ul>
          </div>

        </div>

      </main>

      {/* Footer */}
      <footer style={{
        background: '#070B19',
        borderTop: '1px solid rgba(255,255,255,0.06)',
        padding: '1.75rem 2rem',
        textAlign: 'center',
        fontSize: '0.8rem',
        color: '#64748B'
      }}>
        <div style={{ maxWidth: '1280px', margin: '0 auto', display: 'flex', justifyContent: 'space-between', alignItems: 'center', flexWrap: 'wrap', gap: '1rem' }}>
          <div>
            © 2026 Department of Consumer Affairs, Government of India. All Rights Reserved.
          </div>
          <div style={{ display: 'flex', gap: '1.5rem', fontSize: '0.75rem' }}>
            <span>The Legal Metrology Act, 2009</span>
            <span>Legal Metrology (Packaged Commodities) Rules, 2011</span>
          </div>
        </div>
      </footer>
    </div>
  );
}
