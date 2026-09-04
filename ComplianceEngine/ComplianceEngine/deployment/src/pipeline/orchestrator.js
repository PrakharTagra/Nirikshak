/**
 * Deployment pipeline after intentional removal of Stage 3 (PDP detection).
 *
 * Stage 2 -> real OpenCV preprocessing service
 * Stage 4 -> real RapidOCR running directly on Stage-2 output
 * Stage 5 -> font/readability analysis
 * Stage 6 -> Groq structured declaration extraction
 * Stage 7 -> deterministic Legal Metrology rule engine
 * Stage 8 -> PDF report
 */
'use strict';

const { preprocessImage } = require('./stage2_preprocessing');
const { extractText } = require('./stage4_ocr');
const { analyzeFont } = require('./stage5_fontAnalysis');
const { extract } = require('./stage5_extraction');
const { runComplianceCheck } = require('./stage6_ruleEngine');
const { generateReport } = require('./stage7_report');
const logger = require('../utils/logger');
const fs = require('fs');
const path = require('path');
const config = require('../config');
const { allocateProductId } = require('../utils/productId');
const { ensureDirs } = require('../utils/fileHelpers');

function buildPackageRecord(declarations, labelMetrics) {
  const qty = declarations.netQuantity || {};
  const unit = qty.unit || null;
  const value = qty.value ?? null;
  const normalized = value == null ? null : (unit === 'g' || unit === 'ml' ? value / 1000 : value);

  return {
    commodity: {
      category: declarations.commodityName?.value || 'unknown',
      physicalForm: null,
      netQuantityValue: value,
      netQuantityUnit: unit,
      weightOrVolumeKgOrL: normalized,
      isCementOrFertilizerBag: false,
      isIndustrialConsumer: false,
      isInstitutionalConsumer: false,
      isFoodArticle: false,
      isMultiProductPackage: false,
      manufacturerIsNotPacker: false,
      isImportedPackage: !!declarations.importer?.present,
      manufacturedOutsideIndiaButPackedInIndia: false,
      isBidiOrIncenseStick: false,
      isBidiPackage: false,
      isLPGCylinder: false,
      lpgWeightKg: null,
      isPublicSectorUndertaking: false,
      priceUnderAdministrativePriceMechanism: false,
      isReturnableBeverageBottle: false,
      isAlcoholicBeverage: false,
      isExportPackage: false,
      soldInIndia: true,
      repackedOrRelabeledPerChapterII: false,
      isWholesalePackage: false,
      similarDeclarationRequiredByOtherLaw: false,
      isFastFoodByRestaurantOrHotel: false,
      isDrugsPriceControlFormulation: false,
      isAgriculturalProduceOver50kg: false,
      packageCapacityCC: unit === 'ml' ? value : null,
      dimensionsAreRelevant: !!declarations.dimensions?.present,
      hasMultiplePiecesDifferentDimensions: false,
      isMultiComponentInSeparateUnits: false,
      hasOutsideContainerOrWrapper: false,
      declarationGovernedByOtherLaw: false,
      weightAloneInsufficientForConsumerInfo: false,
      isSheetTypeCommodity: !!declarations.sheetCount?.present,
      isContainerTypeCommodity: false,
      containerShape: null,
      containerCapacityLinkedToLabelReference: false,
      priceRelatedToDimensionsOrWeight: false,
      netQuantityQualifiedWhenPacked: !!qty.qualifiedWhenPacked,
      deficiencyDueToEnvironmentalConditions: false,
      isBlownFormedMoldedEmbossedOrPerforated: false,
    },
    declarations,
    labelMetrics,
    quantitySamples: [],
    wholesale: { retailPackageCount: null, netQuantity: null },
  };
}

async function runPipelineForImage(imagePath) {
  logger.info('orchestrator', `--- Starting pipeline for ${imagePath} ---`);

  const preprocessed = await preprocessImage(imagePath);
  const ocrResult = await extractText(preprocessed);
  const labelMetrics = analyzeFont(ocrResult);
  const declarations = await extract(ocrResult, null);
  const packageRecord = buildPackageRecord(declarations, labelMetrics);
  const complianceResult = runComplianceCheck(packageRecord);

  // Reuse the product_<n> number STAGE-2 already allocated for this scan
  // (so output/STAGE-2/product_<n>/ and output/deployment/product_<n>/
  // line up), falling back to a fresh id if STAGE-2 didn't provide one.
  const productId = preprocessed.productId ?? allocateProductId(config.paths.outputRoot);
  const productDir = path.join(config.paths.output, `product_${productId}`);
  ensureDirs(productDir);

  fs.writeFileSync(path.join(productDir, 'raw_extracted_text.txt'), ocrResult.text || '', 'utf8');

  fs.writeFileSync(
    path.join(productDir, 'mapped.json'),
    JSON.stringify({ declarations, packageRecord, complianceResult }, null, 2),
    'utf8'
  );

  const preprocessedImagePath = path.join(productDir, 'preprocessed.png');
  fs.copyFileSync(preprocessed.path, preprocessedImagePath);
  fs.rmSync(preprocessed.path, { force: true }); // drop the scratch copy in temp/

  const reportPath = await generateReport({ imagePath, packageRecord, complianceResult, productDir });

  logger.info(
    'orchestrator',
    `--- Finished ${imagePath}: ${complianceResult.applicable ? (complianceResult.compliant ? 'COMPLIANT' : `NON-COMPLIANT (${complianceResult.summary.total} issues)`) : 'NOT APPLICABLE'} ---`
  );

  return {
    imagePath,
    productId,
    productDir,
    preprocessedImagePath,
    preprocessMetadata: preprocessed.metadata,
    ocrResult,
    reportPath,
    packageRecord,
    complianceResult,
  };
}

async function runPipelineForBatch(imagePaths) {
  const results = [];
  for (const imagePath of imagePaths) {
    // eslint-disable-next-line no-await-in-loop
    results.push(await runPipelineForImage(imagePath));
  }
  return results;
}

module.exports = { runPipelineForImage, runPipelineForBatch };
