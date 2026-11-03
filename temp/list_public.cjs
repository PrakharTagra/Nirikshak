const fs = require('fs');
const path = require('path');

const publicDirs = [
  'portal-gateway/public',
  'lmverifywebapp/admin-frontend/public',
  'lmverifywebapp/senior-inspector-frontend/public',
  'lmVerify/frontend/public'
];

publicDirs.forEach(d => {
  if (fs.existsSync(d)) {
    console.log(`=== ${d} ===`);
    fs.readdirSync(d).forEach(f => console.log('  ' + f));
  }
});
