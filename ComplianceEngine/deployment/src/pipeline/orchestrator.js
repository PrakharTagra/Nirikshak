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

function saveJsonArtifact(imagePath, suffix, data) {
  fs.mkdirSync(config.paths.output, { recursive: true });
  const base = path.basename(imagePath, path.extname(imagePath)).replace(/[^a-zA-Z0-9._-]+/g, '_');
  const outPath = path.join(config.paths.output, `${base}_${suffix}.json`);
  fs.writeFileSync(outPath, JSON.stringify(data, null, 2), 'utf8');
  logger.info('artifacts', `JSON written: ${outPath}`);
  return outPath;
}

async function runPipelineForImage(imagePath) {
  logger.info('orchestrator', `--- Starting pipeline for ${imagePath} ---`);

  const preprocessed = await preprocessImage(imagePath);
  const ocrResult = await extractText(preprocessed);
  const labelMetrics = analyzeFont(ocrResult);
  const declarations = await extract(ocrResult, null);
  const packageRecord = buildPackageRecord(declarations, labelMetrics);
  const complianceResult = runComplianceCheck(packageRecord);

  const artifactBase = { imagePath, preprocessedImagePath: preprocessed.path };
  const artifactPaths = {
    preprocess: saveJsonArtifact(imagePath, 'preprocess', { ...artifactBase, metadata: preprocessed.metadata }),
    ocr: saveJsonArtifact(imagePath, 'ocr', { ...artifactBase, ocrResult }),
    fontAnalysis: saveJsonArtifact(imagePath, 'font_analysis', { ...artifactBase, labelMetrics }),
    declarations: saveJsonArtifact(imagePath, 'declarations', { ...artifactBase, declarations }),
    compliance: saveJsonArtifact(imagePath, 'compliance', { ...artifactBase, packageRecord, complianceResult }),
    pipeline: saveJsonArtifact(imagePath, 'pipeline', { ...artifactBase, ocrResult, labelMetrics, declarations, packageRecord, complianceResult }),
  };

  const reportPath = await generateReport({ imagePath, packageRecord, complianceResult });

  logger.info(
    'orchestrator',
    `--- Finished ${imagePath}: ${complianceResult.applicable ? (complianceResult.compliant ? 'COMPLIANT' : `NON-COMPLIANT (${complianceResult.summary.total} issues)`) : 'NOT APPLICABLE'} ---`
  );

  return {
    imagePath,
    preprocessedImagePath: preprocessed.path,
    preprocessMetadata: preprocessed.metadata,
    ocrResult,
    reportPath,
    packageRecord,
    complianceResult,
    artifactPaths,
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
