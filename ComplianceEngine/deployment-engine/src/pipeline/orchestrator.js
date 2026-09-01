/**
 * pipeline/orchestrator.js
 * Runs Stage 1 through Stage 7 for a single image and returns the
 * generated PDF report path plus the intermediate data (useful for
 * dashboards/DB persistence in the full system — this deployment
 * engine only handles image-in -> PDF-out, per the current scope).
 */

'use strict';

const { preprocessImage } = require('./stage1_preprocess');
const { detectLabel } = require('./stage2_labelDetection');
const { extractText } = require('./stage3_ocr');
const { analyzeFont } = require('./stage4_fontAnalysis');
const { extract } = require('./stage5_extraction');
const { runComplianceCheck } = require('./stage6_ruleEngine');
const { generateReport } = require('./stage7_report');
const logger = require('../utils/logger');

async function runPipelineForImage(imagePath) {
  logger.info('orchestrator', `--- Starting pipeline for ${imagePath} ---`);

  const preprocessed = await preprocessImage(imagePath);
  const detection = await detectLabel(preprocessed);
  const ocrResult = await extractText(preprocessed, detection);
  const labelMetrics = analyzeFont(ocrResult, detection);
  const packageRecord = extract(ocrResult, detection);
  packageRecord.labelMetrics = labelMetrics;

  const complianceResult = runComplianceCheck(packageRecord);

  const reportPath = await generateReport({ imagePath, packageRecord, complianceResult });

  logger.info(
    'orchestrator',
    `--- Finished ${imagePath}: ${complianceResult.applicable ? (complianceResult.compliant ? 'COMPLIANT' : `NON-COMPLIANT (${complianceResult.summary.total} issues)`) : 'NOT APPLICABLE'} ---`
  );

  return { imagePath, reportPath, packageRecord, complianceResult };
}

async function runPipelineForBatch(imagePaths) {
  const results = [];
  for (const imagePath of imagePaths) {
    // Sequential on purpose: keeps logs readable and avoids overloading
    // OCR/detection providers that may have rate limits in production.
    // eslint-disable-next-line no-await-in-loop
    results.push(await runPipelineForImage(imagePath));
  }
  return results;
}

module.exports = { runPipelineForImage, runPipelineForBatch };
