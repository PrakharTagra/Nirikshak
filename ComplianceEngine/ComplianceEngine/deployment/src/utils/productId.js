/**
 * utils/productId.js
 * Atomically allocates the next product_<n> id from the counter file shared
 * with the STAGE-2 Python service (output/.product_counter), so the same
 * scan gets a matching product_<n> folder name in every service's output.
 */
'use strict';

const fs = require('fs');
const path = require('path');

function acquireLock(lockPath) {
  // 'wx' = O_CREAT | O_EXCL -- fails if the file already exists, same
  // atomic-create semantics used by the Python allocator in STAGE-2.
  for (;;) {
    try {
      return fs.openSync(lockPath, 'wx');
    } catch (err) {
      if (err.code !== 'EEXIST') throw err;
      // brief busy-wait; contention here is momentary (one HTTP request at a time)
      const until = Date.now() + 20;
      while (Date.now() < until) { /* spin */ }
    }
  }
}

function allocateProductId(outputRoot) {
  fs.mkdirSync(outputRoot, { recursive: true });
  const counterPath = path.join(outputRoot, '.product_counter');
  const lockPath = path.join(outputRoot, '.product_counter.lock');

  const lockFd = acquireLock(lockPath);
  try {
    const current = fs.existsSync(counterPath)
      ? parseInt(fs.readFileSync(counterPath, 'utf8').trim() || '0', 10)
      : 0;
    const next = current + 1;
    fs.writeFileSync(counterPath, String(next), 'utf8');
    return next;
  } finally {
    fs.closeSync(lockFd);
    fs.unlinkSync(lockPath);
  }
}

module.exports = { allocateProductId };
