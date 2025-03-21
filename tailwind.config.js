module.exports = {
  content: ["./**/*.html", "./**/*.md", "./config.toml"],
  theme: {
    extend: {
      colors: {
        tlgray: {
          200: "#E5E7EB",
          400: "#9CA3AF",
          700: "#374151",
          800: "#1F2937"
        },
        blue: {
          400: "#60A5FA",
          600: "#2563EB",
          800: "#1E40AF"
        }
      }
    }
  },
  variants: {},
  plugins: [require("@tailwindcss/typography")],
};
