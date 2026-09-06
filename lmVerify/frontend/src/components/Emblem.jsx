import React from "react";

export default function Emblem({ size = 48, className = "", light = false }) {
  const color = light ? "#FFFFFF" : "#06038D";
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 100 120"
      width={size}
      height={size * 1.2}
      className={className}
      aria-label="National Emblem of India — Satyamev Jayate"
      role="img"
    >
      {/* Ashoka Chakra — 24-spoke wheel */}
      <circle cx="50" cy="50" r="38" fill="none" stroke={color} strokeWidth="3" />
      <circle cx="50" cy="50" r="8" fill={color} />
      {Array.from({ length: 24 }).map((_, i) => {
        const angle = (i * 15 * Math.PI) / 180;
        const x1 = 50 + 10 * Math.cos(angle);
        const y1 = 50 + 10 * Math.sin(angle);
        const x2 = 50 + 36 * Math.cos(angle);
        const y2 = 50 + 36 * Math.sin(angle);
        return <line key={i} x1={x1} y1={y1} x2={x2} y2={y2} stroke={color} strokeWidth="1.5" />;
      })}
      {/* Three lions silhouette — simplified pillars */}
      <rect x="35" y="2" width="30" height="10" rx="5" fill={color} />
      <rect x="30" y="10" width="40" height="3" fill={color} />
      {/* Motto */}
      <text
        x="50"
        y="105"
        textAnchor="middle"
        fill={color}
        fontSize="6.5"
        fontFamily="'Inter', 'Helvetica', sans-serif"
        fontWeight="700"
        letterSpacing="0.5"
      >
        TRUTH ALONE TRIUMPHS
      </text>
    </svg>
  );
}
