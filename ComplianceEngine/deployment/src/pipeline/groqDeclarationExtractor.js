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

const nullableString = { type: ['string', 'null'] };
const nullableNumber = { type: ['number', 'null'] };

const DECLARATION_SCHEMA = {
  type: 'object',
  additionalProperties: false,
  properties: {
    manufacturer: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, name: nullableString, address: { type: 'boolean' }, mark: nullableString },
      required: ['present', 'name', 'address', 'mark'],
    },
    packer: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, name: nullableString, address: { type: 'boolean' }, mark: nullableString },
      required: ['present', 'name', 'address', 'mark'],
    },
    importer: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, name: nullableString, address: { type: 'boolean' }, mark: nullableString },
      required: ['present', 'name', 'address', 'mark'],
    },
    commodityName: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, value: nullableString, perProductBreakdown: { type: 'boolean' } },
      required: ['present', 'value', 'perProductBreakdown'],
    },
    netQuantity: {
      type: 'object', additionalProperties: false,
      properties: {
        present: { type: 'boolean' }, value: nullableNumber, unit: nullableString,
        qualifiedWhenPacked: { type: 'boolean' }, unitKind: nullableString,
        rawText: { type: 'string' }, onTagCardOrTapeDevice: { type: 'boolean' }, symbolUsed: nullableString,
      },
      required: ['present', 'value', 'unit', 'qualifiedWhenPacked', 'unitKind', 'rawText', 'onTagCardOrTapeDevice', 'symbolUsed'],
    },
    mfgDate: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, value: nullableString, rawText: { type: 'string' }, usedIndividualSticker: { type: 'boolean' }, isMrpReductionSticker: { type: 'boolean' } },
      required: ['present', 'value', 'rawText', 'usedIndividualSticker', 'isMrpReductionSticker'],
    },
    mrp: {
      type: 'object', additionalProperties: false,
      properties: { present: { type: 'boolean' }, value: nullableNumber, currency: nullableString, rawText: { type: 'string' }, inclusiveOfTaxesStated: { type: 'boolean' }, stickerReducedMrp: { type: 'boolean' }, stickerCoversOriginalMrp: { type: 'boolean' } },
      required: ['present', 'value', 'currency', 'rawText', 'inclusiveOfTaxesStated', 'stickerReducedMrp', 'stickerCoversOriginalMrp'],
    },
    dimensions: {
      type: 'object', additionalProperties: false,
      properties: {
        present: { type: 'boolean' }, rawText: { type: 'string' }, perPieceDeclared: { type: 'boolean' },
        numberOfPiecesDeclared: { type: 'boolean' }, perPieceDimensionAndRSP: { type: 'boolean' },
        numberOfBags: nullableNumber, linearDimensions: nullableString, numberOfContainers: nullableNumber,
        lengthWidthDepth: nullableString, diameter: nullableString, standardCapacityReferenceIncluded: { type: 'boolean' },
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
    multiComponentDeclarationHandled: { type: 'boolean' },
  },
  required: ['manufacturer', 'packer', 'importer', 'commodityName', 'netQuantity', 'mfgDate', 'mrp', 'dimensions', 'consumerCare', 'standardPackDeclaration', 'sheetCount', 'multiComponentDeclarationHandled'],
};

function buildUserPrompt(ocrResult) {
  const lines = (ocrResult?.lines || []).map((line, index) => ({
    id: index,
    text: String(line.text || ''),
    confidence: line.confidence ?? null,
    bbox: line.bbox ?? null,
    heightPx: line.heightPx ?? null,
    heightMm: line.heightMm ?? null,
    language: line.language ?? null,
  }));

  return [
    'Extract Legal Metrology package declarations from the OCR records below.',
    'Use ONLY information explicitly present in the OCR. Never invent or infer a name, address, date, quantity, price, contact, or declaration.',
    'If a field is absent, use present=false and null/empty values as allowed by the schema.',
    'A manufacturer/packer/importer address boolean is true only when an address is actually present in the corresponding OCR text.',
    'Distinguish manufacturer, packer and importer from explicit wording such as manufactured by, packed by, imported by, imported and marketed by, etc.',
    'For net quantity, normalize units to g, kg, ml, or l and classify unitKind as mass or volume.',
    'For MRP, currency should normally be INR when ₹, Rs, INR or equivalent Indian notation is present.',
    'Return only the schema-defined JSON object.',
    '',
    'OCR RECORDS:',
    JSON.stringify(lines, null, 2),
  ].join('\n');
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
      {
        role: 'system',
        content: 'You are a precise Legal Metrology declaration extraction service. Extract facts from OCR only. Do not make compliance decisions and do not hallucinate missing information.',
      },
      { role: 'user', content: buildUserPrompt(ocrResult) },
    ],
    response_format: {
      type: 'json_schema',
      json_schema: {
        name: 'legal_metrology_declarations',
        strict: true,
        schema: DECLARATION_SCHEMA,
      },
    },
  });

  const content = response.choices?.[0]?.message?.content;
  if (!content) throw new Error('Groq returned an empty extraction response.');

  return JSON.parse(content);
}

module.exports = {
  extractDeclarationsWithGroq,
  DECLARATION_SCHEMA,
  buildUserPrompt,
};
