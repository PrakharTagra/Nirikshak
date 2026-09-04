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

const { preprocessImage, preprocessImagesBatch } = require('./stage2_preprocessing');
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
  const isWeightOrVolume = unit === 'g' || unit === 'ml' || unit === 'kg' || unit === 'l';
  const normalized = value == null ? null : (unit === 'g' || unit === 'ml' ? value / 1000 : isWeightOrVolume ? value : null);
  const classification = declarations.commodityClassification || {};

  // Infer physicalForm if not provided
  let physicalForm = classification.physicalForm || null;
  if (!physicalForm) {
    if (qty.unitKind === 'number' || ['unit', 'units', 'n', 'u', 'piece', 'pieces', 'nos'].includes((unit || '').toLowerCase())) {
      physicalForm = 'countable';
    } else if (unit === 'g' || unit === 'kg') {
      physicalForm = 'solid';
    } else if (unit === 'ml' || unit === 'l') {
      physicalForm = 'liquid';
    }
  }

  // Manufacturer is not packer check
  const mfrName = declarations.manufacturer?.name;
  const pkrName = declarations.packer?.name;
  const mfrNotPacker = !!classification.manufacturerIsNotPacker ||
    (declarations.manufacturer?.present && declarations.packer?.present && mfrName && pkrName && mfrName.toLowerCase() !== pkrName.toLowerCase());

  return {
    commodity: {
      category: classification.scheduleCategory || declarations.commodityName?.value || 'unknown',
      genericName: declarations.commodityName?.value || null,
      brandName: classification.brandName || null,
      physicalForm: physicalForm,
      netQuantityValue: value,
      netQuantityUnit: unit,
      weightOrVolumeKgOrL: normalized,
      isCementOrFertilizerBag: false,
      isIndustrialConsumer: !!classification.isIndustrialOrInstitutional,
      isInstitutionalConsumer: !!classification.isIndustrialOrInstitutional,
      isFoodArticle: !!classification.isFoodArticle,
      isMultiProductPackage: !!declarations.commodityName?.perProductBreakdown,
      manufacturerIsNotPacker: mfrNotPacker,
      isImportedPackage: !!declarations.importer?.present || !!classification.isImported,
      countryOfOrigin: classification.countryOfOrigin || null,
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
      dimensionsAreRelevant: !!declarations.dimensions?.present || !!classification.dimensionsRelevant,
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

/**
 * Process multiple images/panels representing a single packaged commodity at a single time.
 * Runs preprocessing and RapidOCR concurrently, combines text across panels,
 * extracts declarations holistically, and produces a single unified compliance report.
 */
async function runPipelineForProduct(imagePaths = [], options = {}) {
  const paths = Array.isArray(imagePaths) ? imagePaths : [imagePaths];
  if (paths.length === 0) {
    throw new Error('No image paths provided for product inspection.');
  }

  logger.info(
    'orchestrator',
    `--- Starting concurrent multi-panel pipeline for product (${paths.length} panel/image(s)) ---`
  );

  // 1. Run Stage 2 preprocessing and Stage 4 OCR on all images concurrently
  const preprocessed = await preprocessImagesBatch(paths);

  // 2. Convert combined Python OCR output to normalized OCR representation
  const ocrResult = await extractText(preprocessed);

  // 3. Stage 5: Analyze font geometry across all extracted regions
  const labelMetrics = analyzeFont(ocrResult, options);

  // 4. Stage 6: Unified declaration extraction (Groq / regex) across all panels
  const declarations = await extract(ocrResult, null);

  // 5. Stage 7: Codified Legal Metrology rule engine
  const packageRecord = buildPackageRecord(declarations, labelMetrics);
  const complianceResult = runComplianceCheck(packageRecord);

  // 6. Persistence in product_<n> directory
  const productId = preprocessed.productId ?? allocateProductId(config.paths.outputRoot);
  const productDir = path.join(config.paths.output, `product_${productId}`);
  ensureDirs(productDir);

  fs.writeFileSync(path.join(productDir, 'raw_extracted_text.txt'), ocrResult.text || '', 'utf8');

  fs.writeFileSync(
    path.join(productDir, 'mapped.json'),
    JSON.stringify(
      {
        productId,
        sourceImages: paths.map((p) => path.basename(p)),
        declarations,
        packageRecord,
        complianceResult,
        panels: ocrResult.perImage || [],
      },
      null,
      2
    ),
    'utf8'
  );

  // Copy preprocessed images into product directory
  const preprocessedImages = [];
  (preprocessed.items || []).forEach((item, idx) => {
    const destName = paths.length > 1 ? `preprocessed_${idx + 1}.png` : 'preprocessed.png';
    const destPath = path.join(productDir, destName);
    if (item.path && fs.existsSync(item.path)) {
      if (path.resolve(item.path) !== path.resolve(destPath)) {
        fs.copyFileSync(item.path, destPath);
        fs.rmSync(item.path, { force: true });
      }
    }
    preprocessedImages.push(destPath);
  });

  // 7. Generate unified PDF compliance report
  const reportPath = await generateReport({
    imagePath: paths[0],
    imagePaths: paths,
    packageRecord,
    complianceResult,
    productDir,
  });

  logger.info(
    'orchestrator',
    `--- Finished product_${productId} (${paths.length} panel(s)): ${
      complianceResult.applicable
        ? complianceResult.compliant
          ? 'COMPLIANT'
          : `NON-COMPLIANT (${complianceResult.summary.total} issues)`
        : 'NOT APPLICABLE'
    } ---`
  );

  return {
    productId,
    imagePaths: paths,
    imagePath: paths[0],
    productDir,
    preprocessedImages,
    preprocessedImagePath: preprocessedImages[0] || null,
    ocrResult,
    reportPath,
    packageRecord,
    complianceResult,
  };
}

async function runPipelineForImage(imagePath, options = {}) {
  return runPipelineForProduct([imagePath], options);
}

/**
 * Process multiple independent products concurrently in parallel.
 */
async function runPipelineForBatch(imagePaths, options = {}) {
  logger.info('orchestrator', `Processing batch of ${imagePaths.length} products concurrently...`);
  return Promise.all(imagePaths.map((imagePath) => runPipelineForImage(imagePath, options)));
}

module.exports = { runPipelineForProduct, runPipelineForImage, runPipelineForBatch, buildPackageRecord };
