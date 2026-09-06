/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,jsx}"],
  theme: {
    extend: {
      colors: {
        "govt-navy": "#06038D",
        "govt-dark": "#012A4A",
        "govt-maroon": "#8B1A1A",
        "govt-cream": "#FAFAF5",
        "govt-light-blue": "#F0F4FF",
        saffron: "#FF9933",
        "india-green": "#138808",
        brand: {
          50: "#fff7ed",
          100: "#ffedd5",
          500: "#ea580c",
          600: "#c2410c",
        },
      },
      fontFamily: {
        sans: ["'Noto Sans'", "'Noto Sans Devanagari'", "system-ui", "sans-serif"],
      },
    },
  },
  plugins: [],
};
