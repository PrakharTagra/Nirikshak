/**
 * Stage 6 in the revised architecture: Declaration Extraction.
 *
 * OCR is performed directly on the preprocessed image. This stage converts
 * OCR lines into the exact declarations contract consumed by the rule engine.
 *
 * Providers:
 *   - regex: deterministic local fallback (no API key)
 *   - groq: Groq structured-output LLM (recommended)
 */
'use strict';

const logger = require('../utils/logger');
const config = require('../config');
const { extractDeclarationsWithGroq } = require('./groqDeclarationExtractor');

const PATTERNS = {
  mrp: /\bm\.?r\.?p\.?\b|maximum\s+retail\s+price|max\.?\s*retail\s*price/i,
  netQuantity: /\bnet\s*(wt|weight|qty|quantity)\b|\b\d+(?:\.\d+)?\s*(unit|units|n\b|u\b|piece|pieces|g|kg|ml|l|litre|liter)\b/i,
  mfgDate: /\bmfg\b|manufactured\s+on|packed\s+on|pkd\.?\s*on|month\s*&\s*year\s*of\s*manufacture|\b(?:0[1-9]|1[0-2])\/\d{4}\b/i,
  manufacturer: /\bmfd\.?\s*by\b|manufactured\s+by|manufactured\s+for|marketed\s+by|marketed\s*,\s*supported\s+by|packed\s+by/i,
  packer: /\bpacked\s+by\b|\bpacker\b/i,
  importer: /\bimported\s+by\b|\bimporter\b/i,
  consumerCare: /complaint|customer\s*care|helpline|toll[\s-]?free|@[\w.-]+\.[a-z]{2,}|\b\d{4}[- ]?\d{3}[- ]?\d{4}\b|\b1800[- ]?\d{3}[- ]?\d{4}\b/i,
};

function classifyLine(text) {
  if (PATTERNS.mrp.test(text)) return 'mrp';
  if (PATTERNS.netQuantity.test(text)) return 'netQuantity';
  if (PATTERNS.importer.test(text)) return 'importer';
  if (PATTERNS.packer.test(text)) return 'packer';
  if (PATTERNS.manufacturer.test(text)) return 'manufacturer';
  if (PATTERNS.mfgDate.test(text)) return 'mfgDate';
  if (PATTERNS.consumerCare.test(text)) return 'consumerCare';
  return 'commodityName';
}

function parseNetQuantity(text) {
  // 1. Check for count/number units first (e.g. "Net Quantity: 1 Unit", "1 N", "1 U", "1 Piece")
  const countMatch = text.match(/(?:net\s*(?:quantity|qty)?[:\s]*)?(\d+(?:\.\d+)?)\s*(units?|u\b|n\b|pieces?|pcs?|nos?)\b/i);
  if (countMatch) {
    const rawUnit = countMatch[2].toLowerCase();
    const symbolUsed = rawUnit === 'n' ? 'N' : rawUnit === 'u' ? 'U' : rawUnit.startsWith('unit') ? 'Unit' : rawUnit;
    return { value: parseFloat(countMatch[1]), unit: rawUnit, unitKind: 'number', symbolUsed };
  }
  // 2. Check for mass or volume units
  const match = text.match(/(\d+(?:\.\d+)?)\s*(kg|kgs|g|gm|gms|grams?|ml|l|litres?|liters?)\b/i);
  if (!match) return { value: null, unit: null, unitKind: null, symbolUsed: null };
  let unit = match[2].toLowerCase();
  let unitKind = 'mass';
  if (unit.startsWith('kg')) { unit = 'kg'; }
  else if (unit.startsWith('g')) { unit = 'g'; }
  else if (unit.startsWith('l')) { unit = 'l'; unitKind = 'volume'; }
  else { unit = 'ml'; unitKind = 'volume'; }
  return { value: parseFloat(match[1]), unit, unitKind, symbolUsed: unit };
}

function normalizeToKgOrL(value, unit) {
  if (value == null) return null;
  if (unit === 'g' || unit === 'ml') return value / 1000;
  return value;
}

const DATE_REGEX = /\b(?:0?[1-9]|[12]\d|3[01])\s*[-/.]\s*(?:0?[1-9]|1[0-2])\s*[-/.]\s*(?:\d{2}|\d{4})\b|\b(?:0?[1-9]|1[0-2])\s*[-/.]\s*(?:\d{2}|\d{4})\b|\b(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?)\s*[- ,.]*\s*\d{4}\b/i;

function regexExtract(ocrResult, detection) {
  logger.info('stage6_declarationExtraction', 'Using deterministic regex extraction fallback');
  const lines = (ocrResult.lines || []).map((l, idx) => ({
    ...l,
    index: idx,
    fieldHint: l.fieldHint || classifyLine(l.text),
  }));

  const fullText = lines.map((l) => l.text).join('\n');
  const getIndex = (hint) => lines.findIndex((l) => l.fieldHint === hint);

  // 1. MRP: Look on the MRP line first to avoid grabbing quantity numbers from previous line
  const mrpIdx = getIndex('mrp');
  let mrpValue = null;
  let mrpRaw = '';
  if (mrpIdx !== -1) {
    const mrpLineText = lines[mrpIdx].text;
    mrpRaw = mrpLineText;
    const directPriceMatch =
      mrpLineText.match(/(?:₹|rs\.?|inr)\s*(\d+(?:\.\d{1,2})?)/i) ||
      mrpLineText.match(/(?:price|unit)?[\s:]+(\d+(?:\.\d{1,2})?)\s*(?:\/-|\b)/i) ||
      mrpLineText.match(/(\d+(?:\.\d{1,2})?)\s*\/-/);
    if (directPriceMatch && parseFloat(directPriceMatch[1]) > 0) {
      mrpValue = parseFloat(directPriceMatch[1]);
    } else {
      // Look at subsequent lines (not previous line, which often has net quantity)
      for (let j = mrpIdx + 1; j <= Math.min(lines.length - 1, mrpIdx + 2); j++) {
        const nextMatch =
          lines[j].text.match(/(?:₹|rs\.?|inr)\s*(\d+(?:\.\d{1,2})?)/i) ||
          lines[j].text.match(/(\d+(?:\.\d{1,2})?)\s*\/-/);
        if (nextMatch && parseFloat(nextMatch[1]) > 0) {
          mrpValue = parseFloat(nextMatch[1]);
          mrpRaw = `${mrpRaw} ${lines[j].text}`;
          break;
        }
      }
    }
  }
  const inclusiveOfTaxesStated = /incl(?:usive)?\.?\s*(?:of\s*)?all\s*t[a-z]*x/i.test(fullText);

  // 2. Net Quantity
  const qtyIdx = getIndex('netQuantity');
  let qty = { value: null, unit: null, unitKind: null, symbolUsed: null };
  let qtyRaw = '';
  if (qtyIdx !== -1) {
    for (let j = Math.max(0, qtyIdx - 1); j <= Math.min(lines.length - 1, qtyIdx + 2); j++) {
      const parsed = parseNetQuantity(lines[j].text);
      if (parsed.value != null) {
        qty = parsed;
        qtyRaw = lines[j].text;
        break;
      }
    }
  }
  if (qty.value == null) {
    // Global fallback across full text (first check countable, then weight/volume)
    const globalCountMatch = fullText.match(/(?:net\s*(?:quantity|qty)?[:\s]*)?(\d+(?:\.\d+)?)\s*(units?|u\b|n\b|pieces?|pcs?)\b/i);
    if (globalCountMatch) {
      qty = parseNetQuantity(globalCountMatch[0]);
      qtyRaw = globalCountMatch[0];
    } else {
      const globalMatch = fullText.match(/(\d+(?:\.\d+)?)\s*(kg|g|gm|ml|l|litre|liter)\b/i);
      if (globalMatch) {
        qty = parseNetQuantity(globalMatch[0]);
        qtyRaw = globalMatch[0];
      }
    }
  }

  // 3. Manufacturing Date
  const mfgIdx = getIndex('mfgDate');
  let mfgDateVal = null;
  let mfgRaw = '';
  if (mfgIdx !== -1) {
    for (let j = Math.max(0, mfgIdx - 1); j <= Math.min(lines.length - 1, mfgIdx + 2); j++) {
      const dateMatch = lines[j].text.match(DATE_REGEX);
      if (dateMatch) {
        mfgDateVal = dateMatch[0];
        mfgRaw = lines[j].text;
        break;
      }
    }
  } else {
    const globalDate = fullText.match(DATE_REGEX);
    if (globalDate) {
      mfgDateVal = globalDate[0];
      mfgRaw = globalDate[0];
    }
  }

  // 4. Manufacturer
  const mfrIdx = getIndex('manufacturer');
  const mfrLine = mfrIdx !== -1 ? lines[mfrIdx] : null;
  let mfrName = mfrLine?.text || null;
  let mfrAddress = false;
  if (mfrLine) {
    const combinedMfrText = lines
      .slice(mfrIdx, Math.min(lines.length, mfrIdx + 4))
      .map((l) => l.text)
      .join(' ');
    const hasAddressSignal =
      /\b[1-9]\d{5}\b/i.test(combinedMfrText) ||
      /india|road|street|estate|sector|phase|nagar|delhi|mumbai|bangalore/i.test(combinedMfrText) ||
      combinedMfrText.length > 35;
    mfrAddress = hasAddressSignal ? combinedMfrText : false;
  }

  // 5. Commodity Name
  const nameIdx = lines.findIndex((l) => /generic\s+name|item\s+name|product\s*name/i.test(l.text));
  let nameLine = nameIdx !== -1 ? lines[nameIdx] : null;
  let nameValue = nameLine ? nameLine.text.replace(/^(?:generic|item|product)\s+name[\s:]*/i, '').trim() : null;
  if (!nameValue) {
    const fallbackNameIdx = getIndex('commodityName');
    nameLine = fallbackNameIdx !== -1 ? lines[fallbackNameIdx] : null;
    nameValue = nameLine?.text || null;
  }

  // 6. Consumer Care
  const careIdx = getIndex('consumerCare');
  let phone = null;
  let email = null;
  let careRaw = '';
  if (careIdx !== -1) {
    const careText = lines
      .slice(Math.max(0, careIdx - 1), Math.min(lines.length, careIdx + 4))
      .map((l) => l.text)
      .join(' ');
    careRaw = careText;
    const phoneMatch = careText.match(/(?:\+?91[\s-]?)?[6-9]\d{9}|1800[\s-]?\d{3,4}[\s-]?\d{3,4}|\b0?\d{2,4}[- ]?\d{6,8}\b/);
    if (phoneMatch) phone = phoneMatch[0];
    const emailMatch = careText.match(/[\w.-]+@[\w.-]+\.[a-z]{2,}/i);
    if (emailMatch) email = emailMatch[0];
  }

  const qualifiedWhenPacked = /when\s+packed/i.test(fullText);
  const standardLine = lines.find((l) => /non[\s-]?standard\s+size|not\s+a\s+standard\s+pack\s+size/i.test(l.text));
  const dimLine = lines.find((l) => /\b\d+\s*x\s*\d+\s*(?:x\s*\d+)?\s*(?:mm|cm|m|inch|in)\b|box\s+size|dimensions?/i.test(l.text));

  return {
    commodityClassification: {
      brandName: null,
      genericName: nameValue,
      scheduleCategory: null,
      physicalForm: qty.unitKind === 'number' ? 'countable' : (qty.unit === 'g' || qty.unit === 'kg' ? 'solid' : (qty.unit === 'ml' || qty.unit === 'l' ? 'liquid' : null)),
      isFoodArticle: false,
      isIndustrialOrInstitutional: false,
      isImported: false,
      countryOfOrigin: null,
      dimensionsRelevant: !!dimLine,
      manufacturerIsNotPacker: false,
    },
    manufacturer: { present: !!mfrLine, name: mfrName, address: mfrAddress, mark: null },
    packer: { present: false, name: null, address: false, mark: null },
    importer: { present: false, name: null, address: false, mark: null },
    commodityName: { present: !!nameValue, value: nameValue, perProductBreakdown: false },
    netQuantity: {
      present: qty.value != null,
      value: qty.value,
      unit: qty.unit,
      qualifiedWhenPacked,
      unitKind: qty.unitKind,
      rawText: qtyRaw,
      onTagCardOrTapeDevice: false,
      symbolUsed: qty.symbolUsed,
    },
    mfgDate: {
      present: !!mfgDateVal,
      value: mfgDateVal,
      rawText: mfgRaw,
      usedIndividualSticker: false,
      isMrpReductionSticker: false,
    },
    mrp: {
      present: mrpValue != null,
      value: mrpValue,
      currency: 'INR',
      rawText: mrpRaw,
      inclusiveOfTaxesStated,
      stickerReducedMrp: false,
      stickerCoversOriginalMrp: false,
    },
    dimensions: {
      present: !!dimLine,
      rawText: dimLine?.text || '',
      perPieceDeclared: false,
      numberOfPiecesDeclared: false,
      perPieceDimensionAndRSP: false,
      numberOfBags: null,
      linearDimensions: dimLine?.text || null,
      numberOfContainers: null,
      lengthWidthDepth: dimLine?.text || null,
      diameter: null,
      standardCapacityReferenceIncluded: false,
    },
    consumerCare: {
      present: !!(phone || email || careRaw),
      name: null,
      address: null,
      telephone: phone,
      email: email,
      rawText: careRaw,
    },
    standardPackDeclaration: { present: !!standardLine, rawText: standardLine?.text || '' },
    sheetCount: { present: false, value: null, dimensionsPerSheet: null, rawText: '' },
    multiComponentDeclarationHandled: false,
  };
}

async function extract(ocrResult, detection) {
  const provider = config.providers.extraction || 'regex';

  if (provider === 'groq') {
    logger.info('stage6_declarationExtraction', `Using Groq structured extraction (${config.groq.model})`);
    try {
      return await extractDeclarationsWithGroq(ocrResult);
    } catch (error) {
      if (!config.groq.fallbackToRegex) throw error;
      logger.warn('stage6_declarationExtraction', `Groq extraction failed; falling back to regex: ${error.message}`);
    }
  }

  return regexExtract(ocrResult, detection);
}

module.exports = { extract, regexExtract, classifyLine };
