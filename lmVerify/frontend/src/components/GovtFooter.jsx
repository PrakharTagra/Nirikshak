import React from "react";

export default function GovtFooter() {
  return (
    <footer className="w-full flex flex-col mt-auto">
      {/* Tricolor Stripe */}
      <div className="flex flex-col w-full">
        <div className="h-[2px] bg-saffron w-full" />
        <div className="h-[2px] bg-white w-full" />
        <div className="h-[2px] bg-india-green w-full" />
      </div>

      {/* Dark Navy Background */}
      <div className="bg-govt-dark text-white px-4 py-8 text-center text-xs leading-relaxed">
        <p className="mb-2 font-medium">
          Content Owned and Maintained by Department of Consumer Affairs, Ministry of Consumer Affairs, Food &amp; Public Distribution, Government of India
        </p>
        <p className="mb-4 text-white/70">
          Nirikshak Digital Marketplace Surveillance System — Designed and Developed under Smart India Hackathon 2024
        </p>
        <div className="flex justify-center gap-6 text-white/70 text-xs">
          <a href="#" className="hover:text-white hover:underline">Privacy Policy</a>
          <a href="#" className="hover:text-white hover:underline">Terms of Service</a>
          <a href="#" className="hover:text-white hover:underline">Hyperlinking Policy</a>
          <a href="#" className="hover:text-white hover:underline">Copyright © 2024-2026</a>
        </div>
      </div>
    </footer>
  );
}
