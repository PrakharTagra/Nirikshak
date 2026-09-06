/**
 * Deployment pipeline after intentional removal of Stage 3 (PDP detection).
 *
 * Stage 2 -> real OpenCV preprocessing service
 * Stage 4 -> real PaddleOCR running directly on Stage-2 output
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
const { annotateNetQuantityImage } = require('./netQuantityImageAnnotator');
const { generateAllViolationEvidences } = require('./violationEvidenceAnnotator');
const logger = require('../utils/logger');
const fs = require('fs');
const path = require('path');
const config = require('../config');
const { allocateProductId } = require('../utils/productId');
const { ensureDirs } = require('../utils/fileHelpers');

function buildPackageRecord(declarations, labelMetrics, options = {}) {
  // Reconcile multi-piece facts from the intermediate layer if LLM extracted only the first piece
  const multiPiece = labelMetrics?.netQuantityMultiPiece || {};
  if (multiPiece.pieceCount && !declarations.netQuantity?.pieceCount) {
    declarations.netQuantity = declarations.netQuantity || {};
    declarations.netQuantity.pieceCount = multiPiece.pieceCount;
    declarations.netQuantity.pieces = multiPiece.pieces || [];
  }
  if (
    multiPiece.totalValue != null &&
    multiPiece.pieceCount > 1 &&
    declarations.netQuantity?.value != null &&
    multiPiece.pieces?.length > 0 &&
    declarations.netQuantity.value === multiPiece.pieces[0].value &&
    multiPiece.totalValue > declarations.netQuantity.value
  ) {
    declarations.netQuantity.value = multiPiece.totalValue;
    if (multiPiece.totalUnit) declarations.netQuantity.unit = multiPiece.totalUnit;
  }

  const qty = declarations.netQuantity || {};
  const unit = qty.unit || null;
  const value = qty.value ?? null;
  const isWeightOrVolume = unit === 'g' || unit === 'ml' || unit === 'kg' || unit === 'l';
  const normalized = value == null ? null : (unit === 'g' || unit === 'ml' ? value / 1000 : isWeightOrVolume ? value : null);
  const classification = declarations.commodityClassification || {};

  const isDigitalMarketplace = !!(
    options.isDigitalMarketplace ||
    options.isEcommerce ||
    classification.isDigitalMarketplace ||
    classification.isEcommerce
  );

  // Infer physicalForm if not provided or reconcile for combination packages
  let physicalForm = classification.physicalForm || null;
  if (declarations.commodityName?.perProductBreakdown || classification.physicalForm === 'combination') {
    physicalForm = 'combination';
  } else if (!physicalForm) {
    if (qty.unitKind === 'number' || ['unit', 'units', 'n', 'u', 'piece', 'pieces', 'nos'].includes((unit || '').toLowerCase())) {
      physicalForm = 'countable';
    } else if (unit === 'g' || unit === 'kg') {
      physicalForm = 'solid';
    } else if (unit === 'ml' || unit === 'l') {
      physicalForm = 'liquid';
    }
  } else if (physicalForm === 'countable' && (unit === 'ml' || unit === 'l' || qty.unitKind === 'volume')) {
    physicalForm = 'combination';
  }

  // Manufacturer is not packer check
  const mfrName = declarations.manufacturer?.name;
  const pkrName = declarations.packer?.name;
  const mfrNotPacker = !!classification.manufacturerIsNotPacker ||
    (declarations.manufacturer?.present && declarations.packer?.present && mfrName && pkrName && mfrName.toLowerCase() !== pkrName.toLowerCase());

  const hasMultiplePieces = (qty.pieceCount != null && qty.pieceCount > 1) || !!declarations.commodityName?.perProductBreakdown;

  return {
    commodity: {
      category: classification.scheduleCategory || declarations.commodityName?.value || 'unknown',
      genericName: declarations.commodityName?.value || null,
      brandName: classification.brandName || null,
      physicalForm: physicalForm,
      netQuantityValue: value,
      netQuantityUnit: unit,
      pieceCount: qty.pieceCount || null,
      weightOrVolumeKgOrL: normalized,
      isCementOrFertilizerBag: false,
      isIndustrialConsumer: !!classification.isIndustrialOrInstitutional,
      isInstitutionalConsumer: !!classification.isIndustrialOrInstitutional,
      isFoodArticle: !!classification.isFoodArticle,
      isMultiProductPackage: hasMultiplePieces,
      manufacturerIsNotPacker: mfrNotPacker,
      isImportedPackage: !!declarations.importer?.present || !!classification.isImported,
      countryOfOrigin: classification.countryOfOrigin || null,
      isDigitalMarketplace: isDigitalMarketplace,
      isEcommerce: isDigitalMarketplace,
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
 * Runs preprocessing and PaddleOCR concurrently, combines text across panels,
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

  // 6. Use an ephemeral workspace in OS tmpdir (zero disk footprint on backend)
  const os = require('os');
  const { uploadImage, uploadPdf } = require('../utils/cloudinary');
  const productId = preprocessed.productId ?? allocateProductId(config.paths.outputRoot);
  const tempProductDir = path.join(
    os.tmpdir(),
    'nirikshak_pipeline',
    `run_${productId}_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`
  );
  ensureDirs(tempProductDir);

  let uploadedPreprocessedUrls = [];
  let cloudViolationEvidences = [];
  let annotatedNetQuantityUrl = null;
  let pdfCloudinaryUrl = null;

  try {
    fs.writeFileSync(path.join(tempProductDir, 'raw_extracted_text.txt'), ocrResult.text || '', 'utf8');

    // Write preprocessed images to ephemeral workspace for annotation & PDF generation
    const preprocessedImages = [];
    (preprocessed.items || []).forEach((item, idx) => {
      const destName = paths.length > 1 ? `preprocessed_${idx + 1}.png` : 'preprocessed.png';
      const destPath = path.join(tempProductDir, destName);
      if (item.image_base64) {
        fs.writeFileSync(destPath, Buffer.from(item.image_base64, 'base64'));
      } else if (item.path && fs.existsSync(item.path)) {
        if (path.resolve(item.path) !== path.resolve(destPath)) {
          fs.copyFileSync(item.path, destPath);
          try { fs.rmSync(item.path, { force: true }); } catch (_) {}
        }
      }
      preprocessedImages.push(destPath);
    });

    // 7. Generate annotated image with bounding box around Net Quantity & spatial requirements
    let annotatedImagePath = null;
    if (labelMetrics?.netQuantityBox && preprocessedImages.length > 0) {
      const pIdx = labelMetrics.panelIndex != null && labelMetrics.panelIndex < preprocessedImages.length ? labelMetrics.panelIndex : 0;
      const sourcePanelImg = preprocessedImages[pIdx] || preprocessedImages[0];
      const outAnnotatedName = 'net_quantity_bounding_box.png';
      const targetAnnotatedPath = path.join(tempProductDir, outAnnotatedName);

      annotatedImagePath = await annotateNetQuantityImage({
        imagePath: sourcePanelImg,
        outputPath: targetAnnotatedPath,
        netQuantityBox: labelMetrics.netQuantityBox,
        exclusionBox: labelMetrics.exclusionBox,
        intrusions: labelMetrics.clearanceDetails?.intrusions || [],
        numeralHeightPx: labelMetrics.clearanceDetails?.numeralHeightPx || 20,
        numeralHeightMm: labelMetrics.clearanceDetails?.numeralHeightMm || null,
      });
    }

    // 7b. Generate bounding-boxed evidence images for ALL violations
    const violationEvidences = await generateAllViolationEvidences({
      violations: complianceResult.violations || [],
      declarations,
      ocrResult,
      labelMetrics,
      preprocessedImages,
      productDir: tempProductDir,
      productId,
    });

    fs.writeFileSync(
      path.join(tempProductDir, 'mapped.json'),
      JSON.stringify(
        {
          productId,
          sourceImages: paths.map((p) => path.basename(p)),
          declarations,
          packageRecord,
          complianceResult,
          panels: ocrResult.perImage || [],
          annotatedNetQuantityImage: annotatedImagePath ? path.basename(annotatedImagePath) : null,
          violationEvidences,
        },
        null,
        2
      ),
      'utf8'
    );

    // 8. Generate unified PDF compliance report
    const reportPath = await generateReport({
      imagePath: paths[0],
      imagePaths: paths,
      packageRecord,
      complianceResult,
      productDir: tempProductDir,
    });

    // 9. Upload ALL assets directly to Cloudinary
    logger.info('orchestrator', `Uploading preprocessed images and evidence crops to Cloudinary...`);
    for (let i = 0; i < preprocessedImages.length; i++) {
      const imgPath = preprocessedImages[i];
      if (fs.existsSync(imgPath)) {
        const url = await uploadImage(imgPath, 'compliance_engine/preprocessed');
        if (url) uploadedPreprocessedUrls.push(url);
      }
    }

    if (annotatedImagePath && fs.existsSync(annotatedImagePath)) {
      annotatedNetQuantityUrl = await uploadImage(annotatedImagePath, 'compliance_engine/evidence');
    }

    for (const ev of violationEvidences) {
      let evUrl = null;
      if (ev.annotatedImagePath && fs.existsSync(ev.annotatedImagePath)) {
        evUrl = await uploadImage(ev.annotatedImagePath, 'compliance_engine/evidence');
      }
      cloudViolationEvidences.push({
        findingId: ev.findingId,
        findingIndex: ev.findingIndex,
        rule: ev.rule,
        field: ev.field,
        severity: ev.severity,
        message: ev.message,
        panelIndex: ev.panelIndex,
        evidenceUrl: evUrl,
      });
    }

    if (reportPath && fs.existsSync(reportPath)) {
      pdfCloudinaryUrl = await uploadPdf(reportPath, 'compliance_reports');
    }
  } finally {
    // 10. Guaranteed cleanup: completely wipe ephemeral workspace (0 bytes left on server disk)
    try {
      fs.rmSync(tempProductDir, { recursive: true, force: true });
      logger.info('orchestrator', `Cleaned up ephemeral workspace: ${tempProductDir}`);
    } catch (cleanErr) {
      logger.warn('orchestrator', `Ephemeral workspace cleanup note: ${cleanErr.message}`);
    }
  }

  // 11. Extract accurate commodity/brand product name
  const detectedProductName =
    declarations.commodityName?.value ||
    declarations.commodityClassification?.genericName ||
    declarations.commodityClassification?.brandName ||
    packageRecord.commodity?.genericName ||
    packageRecord.commodity?.brandName ||
    null;

  const status = !complianceResult.applicable
    ? 'EXEMPT'
    : complianceResult.compliant
    ? 'COMPLIANT'
    : 'NON-COMPLIANT';

  logger.info(
    'orchestrator',
    `--- Finished product_${productId} (${paths.length} panel(s)): ${status} (${complianceResult.summary?.total || 0} issues). All assets uploaded to Cloudinary. ---`
  );

  return {
    productId,
    detectedProductName,
    status,
    pdfUrl: pdfCloudinaryUrl,
    cloudinaryUrl: pdfCloudinaryUrl,
    preprocessedImages: uploadedPreprocessedUrls,
    annotatedNetQuantityUrl,
    violationEvidences: cloudViolationEvidences,
    declarations,
    packageRecord,
    complianceResult,
    summary: {
      status,
      totalViolations: complianceResult.summary?.total ?? (complianceResult.violations?.length || 0),
      criticalViolations: complianceResult.summary?.critical ?? 0,
      majorViolations: complianceResult.summary?.major ?? 0,
      minorViolations: complianceResult.summary?.minor ?? 0,
    },
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
