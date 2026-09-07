import React from "react";
import { EMBLEM_BASE64, LOGO_BASE64 } from "../assets/emblemBase64.js";

export default function Emblem({ size = 48, className = "", style = {} }) {
  const src = LOGO_BASE64 || EMBLEM_BASE64;

  return (
    <div 
      className={`inline-flex items-center justify-center select-none shrink-0 ${className}`} 
      style={{ ...style }}
    >
      <img
        src={src}
        alt="NIRIKSHAK — Legal Metrology Inspection & Compliance App"
        width={size}
        height={size}
        style={{
          height: `${size}px`,
          width: `${size}px`,
          maxHeight: `${size}px`,
          maxWidth: `${size}px`,
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

export { Emblem as Logo };
