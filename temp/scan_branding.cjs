const fs = require('fs');
const path = require('path');

const dirs = [
  'portal-gateway',
  'lmverifywebapp',
  'lmVerify'
];

const patterns = [
  { name: 'Government of India', regex: /Government of India/i },
  { name: 'भारत सरकार', regex: /भारत सरकार/i },
  { name: 'Ministry of Consumer Affairs', regex: /Ministry of Consumer Affairs/i },
  { name: 'Department of Consumer Affairs', regex: /Department of Consumer Affairs/i },
  { name: 'Government Authorized', regex: /Government Authorized/i },
  { name: 'Official Government', regex: /Official Government/i },
  { name: 'Government Enforcement', regex: /Government Enforcement/i },
  { name: 'Government Registry', regex: /Government Registry/i },
  { name: 'Govt. of India', regex: /Govt\.? of India/i },
  { name: 'National Metrology Portal', regex: /National Metrology Portal/i },
  { name: 'Ashoka', regex: /Ashoka/i },
  { name: 'Lion Capital', regex: /Lion Capital/i },
  { name: 'Satyameva', regex: /Satyameva/i }
];

const resultsByFile = {};

function scanDir(dir) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (['node_modules', 'dist', '.git', 'build'].includes(entry.name)) continue;
    if (entry.isDirectory()) {
      scanDir(fullPath);
    } else if (/\.(jsx?|tsx?|html|json|css|svg)$/i.test(entry.name)) {
      const content = fs.readFileSync(fullPath, 'utf8');
      const lines = content.split('\n');
      lines.forEach((line, idx) => {
        if (line.length > 500) return; // skip base64 / minified lines
        for (const { name, regex } of patterns) {
          if (regex.test(line)) {
            if (!resultsByFile[fullPath]) resultsByFile[fullPath] = [];
            resultsByFile[fullPath].push({ lineNum: idx + 1, pattern: name, text: line.trim() });
            break;
          }
        }
      });
    }
  }
}

for (const d of dirs) {
  if (fs.existsSync(d)) {
    scanDir(d);
  }
}

for (const [filePath, matches] of Object.entries(resultsByFile)) {
  console.log(`\n=== ${filePath} (${matches.length} matches) ===`);
  matches.forEach(m => console.log(`  L${m.lineNum} [${m.pattern}]: ${m.text}`));
}
