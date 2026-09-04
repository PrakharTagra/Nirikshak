#!/usr/bin/env node
require('dotenv').config();
/**
 * src/cli.js
 * Entry point: images in -> PDF compliance reports out.
 *
 * Usage:
 *   node src/cli.js                     # process every image in the input/ folder
 *   node src/cli.js path/to/image.jpg   # process a single image
 *   node src/cli.js path/to/folder      # process every image in a given folder
 */

'use strict';

const fs = require('fs');
const path = require('path');
const config = require('./config');
const logger = require('./utils/logger');
const { ensureDirs, listImageFiles } = require('./utils/fileHelpers');
const { runPipelineForBatch } = require('./pipeline/orchestrator');

async function main() {
  ensureDirs(config.paths.input, config.paths.output, config.paths.temp);

  const arg = process.argv[2];
  let images = [];

  if (!arg) {
    images = listImageFiles(config.paths.input);
    if (images.length === 0) {
      logger.warn('cli', `No images found in ${config.paths.input}. Drop image files there, or pass a path as an argument.`);
      return;
    }
  } else if (fs.existsSync(arg) && fs.statSync(arg).isDirectory()) {
    images = listImageFiles(arg);
  } else if (fs.existsSync(arg)) {
    images = [arg];
  } else {
    logger.error('cli', `Path not found: ${arg}`);
    process.exitCode = 1;
    return;
  }

  logger.info('cli', `Processing ${images.length} image(s)...`);
  const results = await runPipelineForBatch(images);

  console.log('\n=== Run Summary ===');
  results.forEach((r) => {
    const status = !r.complianceResult.applicable
      ? 'NOT APPLICABLE'
      : r.complianceResult.compliant
      ? 'COMPLIANT'
      : `NON-COMPLIANT (${r.complianceResult.summary.total} issue(s))`;
    console.log(`${path.basename(r.imagePath)} -> ${status} -> ${r.reportPath}`);
  });
}

main().catch((err) => {
  logger.error('cli', 'Fatal error', err);
  process.exitCode = 1;
});
