import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          primary: "#6366f1", // Indigo-500
          secondary: "#ec4899", // Pink-500
          dark: "#0f172a", // Slate-900
          surface: "#f8fafc",
        },
        seo: {
          good: "#10b981",
          warning: "#f59e0b",
          critical: "#ef4444",
        }
      },
      fontFamily: {
        sans: ['Inter', 'Sarabun', 'sans-serif'], // Including Sarabun for Thai market support
      },
    },
  },
  plugins: [require("@tailwindcss/typography"), require("tailwindcss-animate")],
};
export default config;