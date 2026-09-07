import React from "react";
import { EMBLEM_BASE64 } from "../assets/emblemBase64.js";

export default function Emblem({ size = 48, className = "", style = {} }) {
  const src = EMBLEM_BASE64;

  // Aspect ratio of the official emblem is 500 : 797 (~ 1 : 1.594)
  const width = Math.round(size * (500 / 797));

  return (
    <div 
      className={`inline-flex items-center justify-center select-none shrink-0 ${className}`} 
      style={{ ...style }}
    >
      <img
        src={src}
        alt="State Emblem of India — Satyameva Jayate"
        width={width}
        height={size}
        style={{
          height: `${size}px`,
          width: "auto",
          maxHeight: `${size}px`,
          objectFit: "contain",
        }}
        className="transition-transform duration-200"
        loading="eager"
        decoding="async"
        draggable={false}
      />
    </div>
  );
}
