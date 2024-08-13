/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,js}",
    "./node_modules/flowbite/**/*.js"
  ],
  theme: {
    extend: {
      flex: {
        '2': '2 2 0%'
      }
    },
  },
  plugins: [
    require("flowbite/plugin")
  ],
}

