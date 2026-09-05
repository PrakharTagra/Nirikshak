import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  plugins: [react(), tailwindcss()],
  envDir: '..',                 // VITE_ vars repo-root .env se
  server: { port: 5171, strictPort: true },
});