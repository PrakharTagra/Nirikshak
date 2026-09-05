export default function GovtFooter() {
  return (
    <footer className="w-full flex flex-col mt-auto">
      {/* Tricolor Stripe */}
      <div className="flex flex-col w-full">
        <div className="h-[2px] bg-saffron w-full"></div>
        <div className="h-[2px] bg-white w-full"></div>
        <div className="h-[2px] bg-india-green w-full"></div>
      </div>
      
      {/* Dark Navy Background */}
      <div className="bg-govt-dark text-white px-4 py-8 text-center text-xs leading-relaxed">
        <p className="mb-2">
          Content Owned and Maintained by Department of Consumer Affairs, Ministry of Consumer Affairs, Food & Public Distribution, Government of India
        </p>
        <p className="mb-4">
          Designed and Developed under Smart India Hackathon 2024
        </p>
        <div className="flex justify-center gap-4 text-white/70">
          <a href="#" className="hover:underline">Privacy Policy</a>
          <a href="#" className="hover:underline">Terms of Use</a>
          <a href="#" className="hover:underline">Copyright © 2024</a>
        </div>
      </div>
    </footer>
  );
}
