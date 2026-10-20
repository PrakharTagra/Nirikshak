import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function spaFallbackPlugin(subpath) {
  return {
    name: 'spa-fallback',
    closeBundle() {
      const distDir = path.resolve(__dirname, 'dist');
      const indexPath = path.join(distDir, 'index.html');
      const notFoundPath = path.join(distDir, '404.html');
      if (fs.existsSync(indexPath)) {
        fs.copyFileSync(indexPath, notFoundPath);
      }
      if (subpath) {
        const subDir = path.join(distDir, subpath);
        if (!fs.existsSync(subDir)) fs.mkdirSync(subDir, { recursive: true });
        if (fs.existsSync(indexPath)) {
          fs.copyFileSync(indexPath, path.join(subDir, 'index.html'));
          fs.copyFileSync(indexPath, path.join(subDir, '404.html'));
        }
        const assetsDir = path.join(distDir, 'assets');
        const subAssetsDir = path.join(subDir, 'assets');
        if (fs.existsSync(assetsDir)) {
          if (!fs.existsSync(subAssetsDir)) fs.mkdirSync(subAssetsDir, { recursive: true });
          for (const file of fs.readdirSync(assetsDir)) {
            fs.copyFileSync(path.join(assetsDir, file), path.join(subAssetsDir, file));
          }
        }
      }
    },
  };
}

export default defineConfig({
  base: process.env.VITE_BASE_PATH || '/ac/',
  plugins: [react(), tailwindcss(), spaFallbackPlugin('ac')],
  envDir: '..',
  server: { port: 5172, strictPort: true },
});
