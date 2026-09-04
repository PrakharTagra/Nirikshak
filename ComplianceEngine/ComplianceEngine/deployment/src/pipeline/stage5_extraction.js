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
  netQuantity: /\bnet\s*(wt|weight|qty|quantity)\b|\b\d+(?:\.\d+)?\s*(g|kg|ml|l|litre|liter)\b/i,
  mfgDate: /\bmfg\b|manufactured\s+on|packed\s+on|pkd\.?\s*on|\b(?:0[1-9]|1[0-2])\/\d{4}\b/i,
  manufacturer: /\bmfd\.?\s*by\b|manufactured\s+by|marketed\s+by|packed\s+by/i,
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
  const match = text.match(/(\d+(?:\.\d+)?)\s*(kg|g|ml|l|litre|liter)\b/i);
  if (!match) return { value: null, unit: null };
  let unit = match[2].toLowerCase();
  if (unit === 'litre' || unit === 'liter') unit = 'l';
  return { value: parseFloat(match[1]), unit };
}

function normalizeToKgOrL(value, unit) {
  if (value == null) return null;
  if (unit === 'g' || unit === 'ml') return value / 1000;
  return value;
}

function parseMrp(text) {
  const match = text.match(/(?:₹|rs\.?|inr)?\s*(\d+(?:\.\d+)?)/i);
  const inclusive = /inclusive|incl\.?\s*of\s*all\s*taxes/i.test(text);
  return { value: match ? parseFloat(match[1]) : null, inclusiveOfTaxesStated: inclusive };
}

function regexExtract(ocrResult, detection) {
  logger.info('stage6_declarationExtraction', 'Using deterministic regex extraction fallback');
  const lines = (ocrResult.lines || []).map((l) => ({ ...l, fieldHint: l.fieldHint || classifyLine(l.text) }));
  const get = (hint) => lines.find((l) => l.fieldHint === hint);
  const mrpLine = get('mrp');
  const qtyLine = get('netQuantity');
  const mfgLine = get('mfgDate');
  const mfrLine = get('manufacturer');
  const packerLine = get('packer');
  const importerLine = get('importer');
  const careLine = get('consumerCare');
  const nameLine = get('commodityName');
  const qty = qtyLine ? parseNetQuantity(qtyLine.text) : { value: null, unit: null };
  const mrp = mrpLine ? parseMrp(mrpLine.text) : { value: null, inclusiveOfTaxesStated: false };
  const qualifiedWhenPacked = qtyLine ? /when\s+packed/i.test(qtyLine.text) : false;
  const standardLine = lines.find((l) => /non[\s-]?standard\s+size|not\s+a\s+standard\s+pack\s+size/i.test(l.text));

  return {
    manufacturer: { present: !!mfrLine, name: mfrLine?.text || null, address: !!(mfrLine && (/\d{6}/.test(mfrLine.text) || mfrLine.text.length > 40)), mark: null },
    packer: { present: !!packerLine, name: packerLine?.text || null, address: false, mark: null },
    importer: { present: !!importerLine, name: importerLine?.text || null, address: false, mark: null },
    commodityName: { present: !!nameLine, value: nameLine?.text || null, perProductBreakdown: false },
    netQuantity: { present: !!qtyLine, value: qty.value, unit: qty.unit, qualifiedWhenPacked, unitKind: qty.unit === 'g' || qty.unit === 'kg' ? 'mass' : qty.unit === 'ml' || qty.unit === 'l' ? 'volume' : null, rawText: qtyLine?.text || '', onTagCardOrTapeDevice: false, symbolUsed: null },
    mfgDate: { present: !!mfgLine, value: mfgLine?.text || null, rawText: mfgLine?.text || '', usedIndividualSticker: false, isMrpReductionSticker: false },
    mrp: { present: !!mrpLine, value: mrp.value, currency: mrpLine ? 'INR' : null, rawText: mrpLine?.text || '', inclusiveOfTaxesStated: mrp.inclusiveOfTaxesStated, stickerReducedMrp: false, stickerCoversOriginalMrp: false },
    dimensions: { present: false, rawText: '', perPieceDeclared: false, numberOfPiecesDeclared: false, perPieceDimensionAndRSP: false, numberOfBags: null, linearDimensions: null, numberOfContainers: null, lengthWidthDepth: null, diameter: null, standardCapacityReferenceIncluded: false },
    consumerCare: { present: !!careLine, name: null, address: null, telephone: null, email: null, rawText: careLine?.text || '' },
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
