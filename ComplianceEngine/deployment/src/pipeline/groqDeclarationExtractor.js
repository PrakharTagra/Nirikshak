/**
 * groqDeclarationExtractor.js
 *
 * Stage 6 (Declaration Extraction): converts OCR lines into the exact
 * declarations shape consumed by the Legal Metrology rule engine.
 *
 * The model is intentionally NOT asked to decide compliance. It only
 * extracts facts explicitly present in OCR and returns structured JSON.
 */
'use strict';

const MODEL = process.env.GROQ_MODEL || 'openai/gpt-oss-20b';

const nullableBoolean = { type: ['boolean', 'null'] };
const nullableString = { type: ['string', 'null'] };
const nullableNumber = { type: ['number', 'null'] };

const DECLARATION_SCHEMA = {
  type: 'object',
  additionalProperties: false,
  properties: {
    manufacturer: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, name: nullableString, address: nullableBoolean, mark: nullableString },
      required: ['present', 'name', 'address', 'mark'],
    },
    packer: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, name: nullableString, address: nullableBoolean, mark: nullableString },
      required: ['present', 'name', 'address', 'mark'],
    },
    importer: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, name: nullableString, address: nullableBoolean, mark: nullableString },
      required: ['present', 'name', 'address', 'mark'],
    },
    commodityName: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, value: nullableString, perProductBreakdown: nullableBoolean },
      required: ['present', 'value', 'perProductBreakdown'],
    },
    netQuantity: {
      type: 'object', additionalProperties: false,
      properties: {
        present: { type: 'boolean' }, value: nullableNumber, unit: nullableString,
        qualifiedWhenPacked: nullableBoolean, unitKind: nullableString,
        rawText: { type: 'string' }, onTagCardOrTapeDevice: nullableBoolean, symbolUsed: nullableString,
      },
      required: ['present', 'value', 'unit', 'qualifiedWhenPacked', 'unitKind', 'rawText', 'onTagCardOrTapeDevice', 'symbolUsed'],
    },
    mfgDate: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, value: nullableString, rawText: { type: 'string' }, usedIndividualSticker: nullableBoolean, isMrpReductionSticker: nullableBoolean },
      required: ['present', 'value', 'rawText', 'usedIndividualSticker', 'isMrpReductionSticker'],
    },
    mrp: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, value: nullableNumber, currency: nullableString, rawText: { type: 'string' }, inclusiveOfTaxesStated: nullableBoolean, stickerReducedMrp: nullableBoolean, stickerCoversOriginalMrp: nullableBoolean },
      required: ['present', 'value', 'currency', 'rawText', 'inclusiveOfTaxesStated', 'stickerReducedMrp', 'stickerCoversOriginalMrp'],
    },
    dimensions: {
      type: 'object', additionalProperties: false,
      properties: {
        present: { type: 'boolean' }, rawText: { type: 'string' }, perPieceDeclared: nullableBoolean,
        numberOfPiecesDeclared: nullableBoolean, perPieceDimensionAndRSP: nullableBoolean,
        numberOfBags: nullableNumber, linearDimensions: nullableString, numberOfContainers: nullableNumber,
        lengthWidthDepth: nullableString, diameter: nullableString, standardCapacityReferenceIncluded: nullableBoolean,
      },
      required: ['present', 'rawText', 'perPieceDeclared', 'numberOfPiecesDeclared', 'perPieceDimensionAndRSP', 'numberOfBags', 'linearDimensions', 'numberOfContainers', 'lengthWidthDepth', 'diameter', 'standardCapacityReferenceIncluded'],
    },
    consumerCare: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, name: nullableString, address: nullableString, telephone: nullableString, email: nullableString, rawText: { type: 'string' } },
      required: ['present', 'name', 'address', 'telephone', 'email', 'rawText'],
    },
    standardPackDeclaration: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, rawText: { type: 'string' } },
      required: ['present', 'rawText'],
    },
    sheetCount: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, value: nullableNumber, dimensionsPerSheet: nullableString, rawText: { type: 'string' } },
      required: ['present', 'value', 'dimensionsPerSheet', 'rawText'],
    },
    multiComponentDeclarationHandled: nullableBoolean,
  },
  required: ['manufacturer', 'packer', 'importer', 'commodityName', 'netQuantity', 'mfgDate', 'mrp', 'dimensions', 'consumerCare', 'standardPackDeclaration', 'sheetCount', 'multiComponentDeclarationHandled'],
};

function buildUserPrompt(ocrResult) {
  const isMulti = ocrResult?.isMultiImage || (ocrResult?.lines || []).some((l) => l.imageIndex > 0);

  // Format OCR lines concisely without huge bounding box dumps to stay well within token limits
  const formattedLines = (ocrResult?.lines || [])
    .map((l, index) => {
      const panel = l.imageIndex != null ? `[Panel ${l.imageIndex + 1}] ` : '';
      return `${panel}${l.id ?? index}: ${String(l.text || '').trim()}`;
    })
    .filter((l) => l.length > 2)
    .join('\n');

  return [
    'Extract Legal Metrology mandatory package declarations from the OCR lines below.',
    isMulti
      ? 'The input contains OCR text extracted from MULTIPLE PANELS of a single packaged commodity. Declarations may appear on different panels (e.g. brand/name on Panel 1, stamped MFD/MRP on Panel 2). Combine all panels into one unified declaration.'
      : 'All lines are from the package label/surfaces.',
    'IMPORTANT RULES:',
    '1. Variable batch coding (MFD, MRP, Batch No, USP) is often rubber-stamped or printed online via continuous inkjet, causing vertical/horizontal line shifts. Associate dates (e.g. 05/2025, 09/2026) with mfgDate, and prices (e.g. Rs. 175.00, 99.00) with mrp.',
    '2. Check for "inclusive of all taxes" (or typos like "incl.of allttaxes") near the MRP.',
    '3. If a field is not present on any panel, set present=false and null/false for its attributes.',
    '4. Return strictly valid JSON conforming to the schema.',
    '',
    'OCR TEXT LINES:',
    formattedLines,
  ].join('\n');
}

function cleanBooleans(obj) {
  if (!obj || typeof obj !== 'object') return obj;
  for (const key of Object.keys(obj)) {
    if (typeof obj[key] === 'object' && obj[key] !== null) {
      cleanBooleans(obj[key]);
    } else if (obj[key] === null && (
      key.startsWith('is') || key.endsWith('Declared') || key.endsWith('Stated') ||
      key.endsWith('Handled') || key === 'address' || key === 'perProductBreakdown' ||
      key === 'qualifiedWhenPacked' || key === 'onTagCardOrTapeDevice' ||
      key === 'usedIndividualSticker' || key === 'isMrpReductionSticker' ||
      key === 'stickerReducedMrp' || key === 'stickerCoversOriginalMrp' ||
      key === 'standardCapacityReferenceIncluded'
    )) {
      obj[key] = false;
    }
  }
  return obj;
}

const SYSTEM_PROMPT = `You are an expert Legal Metrology declaration extraction service.
Extract facts from OCR text only. Do not make compliance decisions and do not hallucinate missing information.
Return a JSON object with this EXACT structure:
{
  "manufacturer": { "present": boolean, "name": string or null, "address": string or boolean or null, "mark": string or null },
  "packer": { "present": boolean, "name": string or null, "address": string or boolean or null, "mark": string or null },
  "importer": { "present": boolean, "name": string or null, "address": string or boolean or null, "mark": string or null },
  "commodityName": { "present": boolean, "value": string or null, "perProductBreakdown": boolean },
  "netQuantity": { "present": boolean, "value": number or null, "unit": string or null, "unitKind": "mass"|"volume"|null, "rawText": string, "qualifiedWhenPacked": boolean },
  "mfgDate": { "present": boolean, "value": string or null, "rawText": string, "usedIndividualSticker": boolean, "isMrpReductionSticker": boolean },
  "mrp": { "present": boolean, "value": number or null, "currency": string or null, "rawText": string, "inclusiveOfTaxesStated": boolean },
  "dimensions": { "present": boolean, "rawText": string },
  "consumerCare": { "present": boolean, "name": string or null, "address": string or null, "telephone": string or null, "email": string or null, "rawText": string },
  "standardPackDeclaration": { "present": boolean, "rawText": string },
  "sheetCount": { "present": boolean, "value": number or null, "rawText": string },
  "multiComponentDeclarationHandled": boolean
}
IMPORTANT:
- Variable batch codes (MRP, MFD/PKD, Batch No, USP) are printed online via continuous inkjet or rubber stamps and may be vertically or horizontally shifted from their label names. Associate numbers with their respective fields (e.g. 05/2025 with mfgDate, 175.00 with mrp).
- Always verify if "inclusive of all taxes" or "incl. of all taxes" is stated for MRP.
- For manufacturer address, include the full address string observed in the text.
- "usedIndividualSticker": false by default. Only set to true if an actual separate paper/plastic adhesive sticker was affixed over the package. Direct online printing, inkjet coding, or rubber stamps are NOT stickers.`;

function ensureFieldDefaults(parsed) {
  const d = parsed || {};

  d.manufacturer = {
    present: !!d.manufacturer?.present,
    name: d.manufacturer?.name || null,
    address: d.manufacturer?.address ? (typeof d.manufacturer.address === 'string' ? d.manufacturer.address : true) : false,
    mark: d.manufacturer?.mark || null,
  };

  d.packer = {
    present: !!d.packer?.present,
    name: d.packer?.name || null,
    address: !!d.packer?.address,
    mark: d.packer?.mark || null,
  };

  d.importer = {
    present: !!d.importer?.present,
    name: d.importer?.name || null,
    address: !!d.importer?.address,
    mark: d.importer?.mark || null,
  };

  d.commodityName = {
    present: !!d.commodityName?.present,
    value: d.commodityName?.value || null,
    perProductBreakdown: !!d.commodityName?.perProductBreakdown,
  };

  const qty = d.netQuantity || {};
  let numVal = qty.value != null ? Number(qty.value) : null;
  if (numVal != null && isNaN(numVal)) numVal = null;
  const unit = qty.unit ? String(qty.unit).toLowerCase() : null;
  d.netQuantity = {
    present: !!qty.present,
    value: numVal,
    unit: unit,
    unitKind: qty.unitKind || (unit === 'g' || unit === 'kg' ? 'mass' : unit === 'ml' || unit === 'l' ? 'volume' : null),
    rawText: qty.rawText || '',
    qualifiedWhenPacked: !!qty.qualifiedWhenPacked,
  };

  d.mfgDate = {
    present: !!d.mfgDate?.present,
    value: d.mfgDate?.value || null,
    rawText: d.mfgDate?.rawText || '',
    usedIndividualSticker: !!d.mfgDate?.usedIndividualSticker,
    isMrpReductionSticker: !!d.mfgDate?.isMrpReductionSticker,
  };

  const mrp = d.mrp || {};
  let mrpVal = mrp.value != null ? Number(mrp.value) : null;
  if (mrpVal != null && isNaN(mrpVal)) mrpVal = null;
  d.mrp = {
    present: !!mrp.present,
    value: mrpVal,
    currency: mrp.currency || 'INR',
    rawText: mrp.rawText || '',
    inclusiveOfTaxesStated: !!mrp.inclusiveOfTaxesStated,
    stickerReducedMrp: false,
    stickerCoversOriginalMrp: false,
  };

  d.dimensions = {
    present: !!d.dimensions?.present,
    rawText: d.dimensions?.rawText || '',
    perPieceDeclared: false,
    numberOfPiecesDeclared: false,
    perPieceDimensionAndRSP: false,
    numberOfBags: null,
    linearDimensions: null,
    numberOfContainers: null,
    lengthWidthDepth: null,
    diameter: null,
    standardCapacityReferenceIncluded: false,
  };

  d.consumerCare = {
    present: !!d.consumerCare?.present,
    name: d.consumerCare?.name || null,
    address: d.consumerCare?.address || null,
    telephone: d.consumerCare?.telephone || null,
    email: d.consumerCare?.email || null,
    rawText: d.consumerCare?.rawText || '',
  };

  d.standardPackDeclaration = {
    present: !!d.standardPackDeclaration?.present,
    rawText: d.standardPackDeclaration?.rawText || '',
  };

  d.sheetCount = {
    present: !!d.sheetCount?.present,
    value: d.sheetCount?.value != null ? Number(d.sheetCount.value) : null,
    dimensionsPerSheet: null,
    rawText: d.sheetCount?.rawText || '',
  };

  d.multiComponentDeclarationHandled = !!d.multiComponentDeclarationHandled;

  return cleanBooleans(d);
}

async function extractDeclarationsWithGroq(ocrResult) {
  if (!process.env.GROQ_API_KEY) {
    throw new Error('GROQ_API_KEY is not set. Set it in the environment before using EXTRACTION_PROVIDER=groq.');
  }

  const Groq = require('groq-sdk');
  const client = new Groq({ apiKey: process.env.GROQ_API_KEY });
  const response = await client.chat.completions.create({
    model: MODEL,
    temperature: 0,
    messages: [
      { role: 'system', content: SYSTEM_PROMPT },
      { role: 'user', content: buildUserPrompt(ocrResult) },
    ],
    response_format: { type: 'json_object' },
  });

  const content = response.choices?.[0]?.message?.content;
  if (!content) throw new Error('Groq returned an empty extraction response.');

  const parsed = JSON.parse(content);
  return ensureFieldDefaults(parsed);
}

module.exports = {
  extractDeclarationsWithGroq,
  DECLARATION_SCHEMA,
  buildUserPrompt,
  ensureFieldDefaults,
};
