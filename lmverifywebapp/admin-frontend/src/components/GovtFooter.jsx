export default function GovtFooter() {
  return (
    <footer className="mt-auto flex flex-col">
      {/* Tricolor stripe */}
      <div className="h-[9px] w-full flex flex-col">
        <div className="h-[3px] w-full bg-saffron" />
        <div className="h-[3px] w-full bg-white" />
        <div className="h-[3px] w-full bg-india-green" />
      </div>
      
      <div className="bg-govt-dark text-white/80 py-8 px-4 md:px-8 text-sm">
        <div className="max-w-7xl mx-auto flex flex-col gap-6 text-center md:text-left">
          <p>
            Content Owned and Maintained by Department of Consumer Affairs,<br className="hidden md:block"/>
            Ministry of Consumer Affairs, Food & Public Distribution, Government of India
          </p>
          
          <p className="font-medium text-white">
            Designed and Developed under Smart India Hackathon 2024
          </p>
          
          <div className="flex flex-col md:flex-row justify-between items-center border-t border-white/20 pt-6 gap-4">
            <p className="text-xs">
              © {new Date().getFullYear()} Government of India. All rights reserved.
            </p>
            <div className="flex gap-4 text-xs">
              <a href="#" className="hover:text-white hover:underline">Privacy Policy</a>
              <a href="#" className="hover:text-white hover:underline">Terms of Use</a>
              <a href="#" className="hover:text-white hover:underline">Accessibility</a>
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
