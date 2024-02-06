#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Error: Project name is required as argument."
    exit 1
fi
npm create vite@latest $1 -- --template react
cd $1
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
# npm install react-router-dom localforage match-sorter sort-by
npm i prop-types
npm install react-router-dom localforage match-sorter sort-by
echo "" > tailwind.config.js
echo '/** @type {import("tailwindcss").Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}' >> tailwind.config.js
echo "import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
export default defineConfig({
  server: { host: '0.0.0.0' },
  plugins: [react()],
})" > vite.config.js
#goind to src file
cd src
mkdir Components
echo "" > index.css
echo "" > App.css
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" >> index.css
#getting out of src file
cd ..
code .
npm run dev
