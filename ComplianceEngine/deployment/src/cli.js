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
const readline = require('readline');
const { runPipelineForProduct, runPipelineForBatch } = require('./pipeline/orchestrator');

function promptForDimensions() {
  return new Promise((resolve) => {
    if (!process.stdin.isTTY) {
      return resolve(null);
    }
    const rl = readline.createInterface({
      input: process.stdin,
      output: process.stdout,
    });
    rl.question(
      '\nEnter packaging/box dimensions (e.g., "120x80x40 mm" or "10x5x15 cm") [Press Enter to auto-detect from label]: ',
      (answer) => {
        rl.close();
        const trimmed = answer.trim();
        resolve(trimmed || null);
      }
    );
  });
}

async function main() {
  ensureDirs(config.paths.input, config.paths.output, config.paths.temp);

  const rawArgs = process.argv.slice(2);
  const isBatchMode = rawArgs.includes('--batch');
  const isProductMode = rawArgs.includes('--product');

  // Check for explicit --pkg-dimensions argument
  const pkgDimIdx = rawArgs.findIndex((a) => a === '--pkg-dimensions' || a.startsWith('--pkg-dimensions='));
  let packageDimensions = null;
  if (pkgDimIdx !== -1) {
    const arg = rawArgs[pkgDimIdx];
    if (arg.includes('=')) {
      packageDimensions = arg.split('=')[1];
    } else if (rawArgs[pkgDimIdx + 1] && !rawArgs[pkgDimIdx + 1].startsWith('--')) {
      packageDimensions = rawArgs[pkgDimIdx + 1];
    }
  }

  const fileArgs = rawArgs.filter((a, idx) => {
    if (a.startsWith('--')) return false;
    if (idx > 0 && rawArgs[idx - 1] === '--pkg-dimensions') return false;
    return true;
  });

  if (!packageDimensions && process.stdin.isTTY) {
    packageDimensions = await promptForDimensions();
  }

  const pipelineOptions = { packageDimensions };

  const targetDir = fileArgs.length === 1 && fs.existsSync(fileArgs[0]) && fs.statSync(fileArgs[0]).isDirectory()
    ? fileArgs[0]
    : fileArgs.length === 0
    ? config.paths.input
    : null;

  // Check if directory contains product subfolders (e.g. input/product_A/front.jpg, input/product_A/bottom.jpg)
  if (targetDir && fs.existsSync(targetDir)) {
    const subdirs = fs.readdirSync(targetDir, { withFileTypes: true })
      .filter((d) => d.isDirectory())
      .map((d) => path.join(targetDir, d.name));

    const productGroups = subdirs
      .map((dir) => ({ name: path.basename(dir), images: listImageFiles(dir) }))
      .filter((g) => g.images.length > 0);

    if (productGroups.length > 0) {
      logger.info('cli', `Found ${productGroups.length} product subfolder(s) in ${targetDir}. Running each product with its panel images concurrently...`);
      const results = await Promise.all(
        productGroups.map(async (g) => {
          logger.info('cli', `Processing product "${g.name}" with ${g.images.length} panel(s)...`);
          const res = await runPipelineForProduct(g.images, pipelineOptions);
          return { name: g.name, ...res };
        })
      );


      console.log('\n=== Multi-Product Inspection Summary ===');
      results.forEach((r) => {
        const status = !r.complianceResult.applicable
          ? 'NOT APPLICABLE'
          : r.complianceResult.compliant
          ? 'COMPLIANT'
          : `NON-COMPLIANT (${r.complianceResult.summary.total} issue(s))`;
        console.log(`[${r.name}] -> product_${r.productId} -> ${status} -> ${r.reportPath}`);
      });
      return;
    }
  }

  // Case B: Gather images from target folder or explicit file arguments
  let images = [];

  if (fileArgs.length === 0) {
    images = listImageFiles(config.paths.input);
    if (images.length === 0) {
      logger.warn(
        'cli',
        `No images found in ${config.paths.input}.\n\n` +
        `HOW TO RUN ON PRODUCTS:\n` +
        `  1. Inspect a product folder with multiple panel images (e.g. front, crimp, back):\n` +
        `     node src/cli.js path/to/product_folder\n` +
        `  2. Inspect multiple independent products concurrently in batch:\n` +
        `     node src/cli.js --batch prod1.jpg prod2.jpg prod3.jpg (or node src/cli.js --batch path/to/folder)\n` +
        `  3. Inspect a root folder containing multiple product subfolders:\n` +
        `     node src/cli.js input/\n`
      );
      return;
    }
  } else if (fileArgs.length === 1 && fs.existsSync(fileArgs[0]) && fs.statSync(fileArgs[0]).isDirectory()) {
    images = listImageFiles(fileArgs[0]);
  } else {
    images = fileArgs.filter((p) => {
      const exists = fs.existsSync(p);
      if (!exists) logger.warn('cli', `File not found, skipping: ${p}`);
      return exists;
    });
  }

  if (images.length === 0) {
    logger.error('cli', 'No valid image files found.');
    process.exitCode = 1;
    return;
  }

  // By default, if multiple panel images belong to a folder or were passed together,
  // evaluate them as ONE product package unless the user explicitly requested --batch.
  const isDirectFolder = fileArgs.length === 1 && fs.existsSync(fileArgs[0]) && fs.statSync(fileArgs[0]).isDirectory();
  const treatAsSingleProduct = isProductMode || (!isBatchMode && (images.length > 1 || isDirectFolder));

  if (treatAsSingleProduct) {
    const productName = isDirectFolder ? path.basename(fileArgs[0]) : 'package';
    logger.info('cli', `Processing ${images.length} image(s) as ONE product package ("${productName}") concurrently...`);
    const r = await runPipelineForProduct(images, pipelineOptions);

    console.log('\n=== Multi-Panel Product Inspection Summary ===');
    const status = !r.complianceResult.applicable
      ? 'NOT APPLICABLE'
      : r.complianceResult.compliant
      ? 'COMPLIANT'
      : `NON-COMPLIANT (${r.complianceResult.summary.total} issue(s))`;
    console.log(`Product Name: ${productName}`);
    console.log(`Product ID  : product_${r.productId}`);
    console.log(`Panels (${images.length}): ${images.map((p) => path.basename(p)).join(', ')}`);
    console.log(`Preprocessed: ${r.preprocessedImages.map((p) => path.basename(p)).join(', ')} (in ${r.productDir})`);
    console.log(`Status      : ${status}`);
    console.log(`Report PDF  : ${r.reportPath}`);
    if (!r.complianceResult.compliant) {
      console.log('Violations  :');
      r.complianceResult.violations.forEach((v, idx) => {
        console.log(`  ${idx + 1}. [${v.severity.toUpperCase()}] ${v.rule}: ${v.message}`);
      });
    }
  } else {
    logger.info('cli', `Processing ${images.length} independent product image(s) concurrently in batch...`);
    const results = await runPipelineForBatch(images, pipelineOptions);

    console.log('\n=== Batch Run Summary ===');
    results.forEach((r) => {
      const status = !r.complianceResult.applicable
        ? 'NOT APPLICABLE'
        : r.complianceResult.compliant
        ? 'COMPLIANT'
        : `NON-COMPLIANT (${r.complianceResult.summary.total} issue(s))`;
      console.log(`${path.basename(r.imagePath)} -> ${status} -> ${r.reportPath}`);
    });
  }
}

main().catch((err) => {
  logger.error('cli', 'Fatal error', err);
  process.exitCode = 1;
});
