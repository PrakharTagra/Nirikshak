/**
 * pipeline/stage5_extraction.js
 * Turns OCR lines (Stage 3/4) into the structured "package record"
 * that the Stage 6 rule engine consumes (see rule-engine/README.md
 * for the full schema).
 *
 * Works two ways:
 *   1. If a line already has `fieldHint` (as the mock OCR provider
 *      supplies), it's used directly.
 *   2. Otherwise (real OCR providers), `classifyLine()` below applies
 *      regex-based classification as a first pass. Replace/augment
 *      this with a trained NER model (spaCy / transformers) for
 *      production accuracy — this function is the single integration
 *      point for that swap.
 */

'use strict';

const logger = require('../utils/logger');

const PATTERNS = {
  mrp: /\bm\.?r\.?p\.?\b|maximum\s+retail\s+price|max\.?\s+retail\s+price/i,
  netQuantity: /\bnet\s*(wt|weight|qty|quantity)\b|\b\d+(\.\d+)?\s?(g|kg|ml|l|litre|liter)\b/i,
  mfgDate: /\bmfg\b|manufactured\s+on|packed\s+on|pkd\.?\s*on|\b(0[1-9]|1[0-2])\/\d{4}\b/i,
  manufacturer: /\bmfd\.?\s*by\b|manufactured\s+by|marketed\s+by|packed\s+by/i,
  consumerCare: /complaint|customer\s*care|helpline|toll[\s-]?free|@[\w.-]+\.[a-z]{2,}|\b\d{4}[- ]?\d{3}[- ]?\d{4}\b|\b1800[- ]?\d{3}[- ]?\d{4}\b/i,
};

function classifyLine(text) {
  if (PATTERNS.mrp.test(text)) return 'mrp';
  if (PATTERNS.netQuantity.test(text)) return 'netQuantity';
  if (PATTERNS.manufacturer.test(text)) return 'manufacturer';
  if (PATTERNS.mfgDate.test(text)) return 'mfgDate';
  if (PATTERNS.consumerCare.test(text)) return 'consumerCare';
  return 'commodityName'; // fallback assumption for an unclassified line
}

function taggedLines(ocrResult) {
  return (ocrResult.lines || []).map((l) => ({
    ...l,
    fieldHint: l.fieldHint || classifyLine(l.text),
  }));
}

function parseNetQuantity(text) {
  const match = text.match(/(\d+(?:\.\d+)?)\s*(kg|g|ml|l|litre|liter)\b/i);
  if (!match) return { value: null, unit: null };
  let unit = match[2].toLowerCase();
  if (unit === 'litre' || unit === 'liter') unit = 'l';
  return { value: parseFloat(match[1]), unit };
}

function normalizeToKgOrL(value, unit) {
  if (value == null) return null;
  if (unit === 'g') return value / 1000;
  if (unit === 'ml') return value / 1000;
  return value; // already kg or l
}

function parseMrp(text) {
  const match = text.match(/(\d+(?:\.\d+)?)/);
  const inclusive = /inclusive|incl\.?\s*of\s*all\s*taxes/i.test(text);
  return { value: match ? parseFloat(match[1]) : null, inclusiveOfTaxesStated: inclusive };
}

function extract(ocrResult, detection) {
  logger.info('stage5_extraction', 'Classifying & parsing declaration fields');
  const lines = taggedLines(ocrResult);

  const get = (hint) => lines.find((l) => l.fieldHint === hint);

  const mrpLine = get('mrp');
  const qtyLine = get('netQuantity');
  const mfgLine = get('mfgDate');
  const mfrLine = get('manufacturer');
  const careLine = get('consumerCare');
  const nameLine = get('commodityName');

  const qty = qtyLine ? parseNetQuantity(qtyLine.text) : { value: null, unit: null };
  const mrp = mrpLine ? parseMrp(mrpLine.text) : { value: null, inclusiveOfTaxesStated: false };

  const qualifiedWhenPacked = qtyLine ? /when\s+packed/i.test(qtyLine.text) : false;
  const standardPackDeclarationPresent = lines.some((l) => /non[\s-]?standard\s+size|not\s+a\s+standard\s+pack\s+size/i.test(l.text));

  const packageRecord = {
    commodity: {
      category: detection.category,
      physicalForm: detection.physicalForm,
      netQuantityValue: qty.value,
      netQuantityUnit: qty.unit,
      weightOrVolumeKgOrL: normalizeToKgOrL(qty.value, qty.unit),
      isFoodArticle: false, // category->PFA lookup is a production TODO (see README)
      isCosmetic: false,
      isSeedUnderSeedsAct: false,
      isAlcoholicBeverage: false,
      isBidiOrIncenseStick: /bidi|incense/i.test(detection.category),
      isBidiPackage: /bidi/i.test(detection.category),
      isLPGCylinder: /lpg/i.test(detection.category),
      lpgWeightKg: null,
      isPublicSectorUndertaking: false,
      priceUnderAdministrativePriceMechanism: false,
      isReturnableBeverageBottle: false,
      isExportPackage: false,
      soldInIndia: true,
      repackedOrRelabeledPerChapterII: false,
      isWholesalePackage: false,
      similarDeclarationRequiredByOtherLaw: false,
      isIndustrialConsumer: false,
      isInstitutionalConsumer: false,
      isCementOrFertilizerBag: /cement|fertilizer/i.test(detection.category),
      isFastFoodByRestaurantOrHotel: false,
      isDrugsPriceControlFormulation: false,
      isAgriculturalProduceOver50kg: false,
      packageCapacityCC: qty.unit === 'ml' ? qty.value : 500, // best-effort; solids default above the ≤5cc threshold
      isMultiProductPackage: false,
      manufacturerIsNotPacker: false,
      isImportedPackage: false,
      manufacturedOutsideIndiaButPackedInIndia: false,
      dimensionsAreRelevant: false,
      hasMultiplePiecesDifferentDimensions: false,
      isMultiComponentInSeparateUnits: false,
      hasOutsideContainerOrWrapper: false,
      declarationGovernedByOtherLaw: false,
      weightAloneInsufficientForConsumerInfo: false,
      isSheetTypeCommodity: false,
      isContainerTypeCommodity: false,
      containerShape: null,
      containerCapacityLinkedToLabelReference: false,
      priceRelatedToDimensionsOrWeight: false,
      netQuantityQualifiedWhenPacked: qualifiedWhenPacked,
      deficiencyDueToEnvironmentalConditions: false,
    },
    declarations: {
      manufacturer: {
        present: !!mfrLine,
        address: mfrLine ? mfrLine.text.length > 40 || /\d{6}/.test(mfrLine.text) : false, // heuristic: PIN code or long line implies an address is present
        mark: null,
      },
      packer: { present: false, address: false },
      importer: { present: false, address: false },
      commodityName: { present: !!nameLine, perProductBreakdown: false },
      netQuantity: {
        present: !!qtyLine,
        qualifiedWhenPacked,
        unitKind: qty.unit === 'g' || qty.unit === 'kg' ? 'mass' : qty.unit === 'ml' || qty.unit === 'l' ? 'volume' : null,
        rawText: qtyLine ? qtyLine.text : '',
        onTagCardOrTapeDevice: false,
        symbolUsed: null,
      },
      mfgDate: { present: !!mfgLine, usedIndividualSticker: false, isMrpReductionSticker: false },
      mrp: {
        present: !!mrpLine,
        inclusiveOfTaxesStated: mrp.inclusiveOfTaxesStated,
        stickerReducedMrp: false,
        stickerCoversOriginalMrp: false,
      },
      dimensions: {
        present: false,
        perPieceDeclared: false,
        numberOfPiecesDeclared: false,
        perPieceDimensionAndRSP: false,
        numberOfBags: null,
        linearDimensions: null,
        numberOfContainers: null,
        lengthWidthDepth: null,
        diameter: null,
        standardCapacityReferenceIncluded: false,
      },
      consumerCare: { present: !!careLine },
      standardPackDeclaration: { present: standardPackDeclarationPresent },
      sheetCount: { present: false, dimensionsPerSheet: false },
      multiComponentDeclarationHandled: false,
    },
    quantitySamples: [], // populate if the inspector supplies multi-unit lot measurements
    wholesale: { retailPackageCount: null, netQuantity: null },
  };

  return packageRecord;
}

module.exports = { extract };
