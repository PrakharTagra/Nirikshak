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

const config = require('../config');
const logger = require('../utils/logger');

function getGroqModel() {
  return process.env.GROQ_MODEL || config?.groq?.model || 'openai/gpt-oss-120b';
}

const nullableBoolean = { type: ['boolean', 'null'] };
const nullableString = { type: ['string', 'null'] };
const nullableNumber = { type: ['number', 'null'] };
const stringOrBooleanOrNull = { type: ['string', 'boolean', 'null'] };

const DECLARATION_SCHEMA = {
  type: 'object',
  additionalProperties: false,
  properties: {
    commodityClassification: {
      type: 'object',
      additionalProperties: false,
      properties: {
        brandName: nullableString,
        genericName: nullableString,
        scheduleCategory: nullableString,
        physicalForm: nullableString,
        isFoodArticle: nullableBoolean,
        isIndustrialOrInstitutional: nullableBoolean,
        isImported: nullableBoolean,
        countryOfOrigin: nullableString,
        dimensionsRelevant: nullableBoolean,
        manufacturerIsNotPacker: nullableBoolean,
      },
      required: [
        'brandName',
        'genericName',
        'scheduleCategory',
        'physicalForm',
        'isFoodArticle',
        'isIndustrialOrInstitutional',
        'isImported',
        'countryOfOrigin',
        'dimensionsRelevant',
        'manufacturerIsNotPacker',
      ],
    },
    manufacturer: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        name: nullableString,
        address: stringOrBooleanOrNull,
        mark: nullableString,
        rawText: nullableString,
      },
      required: ['present', 'name', 'address', 'mark'],
    },
    packer: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        name: nullableString,
        address: stringOrBooleanOrNull,
        mark: nullableString,
        rawText: nullableString,
      },
      required: ['present', 'name', 'address', 'mark'],
    },
    importer: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        name: nullableString,
        address: stringOrBooleanOrNull,
        mark: nullableString,
        rawText: nullableString,
      },
      required: ['present', 'name', 'address', 'mark'],
    },
    commodityName: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        value: nullableString,
        perProductBreakdown: nullableBoolean,
        rawText: nullableString,
      },
      required: ['present', 'value', 'perProductBreakdown'],
    },
    netQuantity: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        value: nullableNumber,
        unit: nullableString,
        qualifiedWhenPacked: nullableBoolean,
        unitKind: nullableString,
        rawText: { type: 'string' },
        onTagCardOrTapeDevice: nullableBoolean,
        symbolUsed: nullableString,
        secondaryWeight: nullableString,
      },
      required: [
        'present',
        'value',
        'unit',
        'qualifiedWhenPacked',
        'unitKind',
        'rawText',
        'onTagCardOrTapeDevice',
        'symbolUsed',
      ],
    },
    mfgDate: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        value: nullableString,
        rawText: { type: 'string' },
        usedIndividualSticker: nullableBoolean,
        isMrpReductionSticker: nullableBoolean,
      },
      required: ['present', 'value', 'rawText', 'usedIndividualSticker', 'isMrpReductionSticker'],
    },
    mrp: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        value: nullableNumber,
        currency: nullableString,
        rawText: { type: 'string' },
        inclusiveOfTaxesStated: nullableBoolean,
        unitSalePrice: nullableString,
        stickerReducedMrp: nullableBoolean,
        stickerCoversOriginalMrp: nullableBoolean,
      },
      required: [
        'present',
        'value',
        'currency',
        'rawText',
        'inclusiveOfTaxesStated',
        'stickerReducedMrp',
        'stickerCoversOriginalMrp',
      ],
    },
    dimensions: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        rawText: { type: 'string' },
        perPieceDeclared: nullableBoolean,
        numberOfPiecesDeclared: nullableBoolean,
        perPieceDimensionAndRSP: nullableBoolean,
        numberOfBags: nullableNumber,
        linearDimensions: nullableString,
        numberOfContainers: nullableNumber,
        lengthWidthDepth: nullableString,
        diameter: nullableString,
        standardCapacityReferenceIncluded: nullableBoolean,
      },
      required: [
        'present',
        'rawText',
        'perPieceDeclared',
        'numberOfPiecesDeclared',
        'perPieceDimensionAndRSP',
        'numberOfBags',
        'linearDimensions',
        'numberOfContainers',
        'lengthWidthDepth',
        'diameter',
        'standardCapacityReferenceIncluded',
      ],
    },
    consumerCare: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        name: nullableString,
        address: nullableString,
        telephone: nullableString,
        email: nullableString,
        website: nullableString,
        rawText: { type: 'string' },
      },
      required: ['present', 'name', 'address', 'telephone', 'email', 'rawText'],
    },
    standardPackDeclaration: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        rawText: { type: 'string' },
      },
      required: ['present', 'rawText'],
    },
    sheetCount: {
      type: 'object',
      additionalProperties: false,
      properties: {
        present: { type: 'boolean' },
        value: nullableNumber,
        dimensionsPerSheet: nullableString,
        rawText: { type: 'string' },
      },
      required: ['present', 'value', 'dimensionsPerSheet', 'rawText'],
    },
    multiComponentDeclarationHandled: nullableBoolean,
  },
  required: [
    'commodityClassification',
    'manufacturer',
    'packer',
    'importer',
    'commodityName',
    'netQuantity',
    'mfgDate',
    'mrp',
    'dimensions',
    'consumerCare',
    'standardPackDeclaration',
    'sheetCount',
    'multiComponentDeclarationHandled',
  ],
};

const SYSTEM_PROMPT = `You are an expert Legal Metrology compliance extraction service specializing in the Legal Metrology (Packaged Commodities) Rules, 2011 (India).
Your sole task is to extract factual package declarations from OCR text and return a strictly conformant JSON object.
Do NOT decide compliance or violations. Only extract facts present on the packaging panels.

MANDATORY JSON KEY NAMES:
Top-level JSON keys MUST be exactly:
- "commodityClassification"
- "commodityName"
- "manufacturer" (If 'Manufactured For' or 'Marketed By' is declared, set present: true, extract name and address under 'manufacturer')
- "packer"
- "importer"
- "netQuantity"
- "mfgDate" (NEVER use 'monthYearOfManufacture', MUST be 'mfgDate')
- "mrp" (NEVER use 'retailPrice', MUST be 'mrp')
- "dimensions"
- "consumerCare"
- "standardPackDeclaration"
- "sheetCount"
- "multiComponentDeclarationHandled"

CRITICAL INSTRUCTIONS BY DECLARATION:

1. COMMODITY NAME vs. BRAND NAME (Rule 6(1)(b)):
- Brand Name: The commercial brand or trademark (e.g., "INTEX", "Cadbury", "Britannia", "Samsung", "boAt", "Sony", "Parle").
- Generic Commodity Name: The generic or common identity of the commodity (e.g., "Wireless Mini USB Adapter", "Milk Chocolate", "Biscuits", "Bluetooth Earphones", "LED Television", "Wheat Flour").
- Look for labels like "Generic Name:", "Item Name:", "Product:", "Commodity:".
- "commodityName.value" MUST be the common or generic name (e.g., "Wireless Mini USB Adapter"), NOT the brand!
- Record the brand separately in "commodityClassification.brandName".
- "commodityName.perProductBreakdown": true only for multi-product packages containing distinct commodities declaring names and quantities of each.

2. MANUFACTURER, PACKER, IMPORTER (Rule 6(1)(a)):
- Look for "Manufactured by", "Mfd. by", "Mfg by", "Produced by", "Marketed by", "Manufactured For", "Supported By", "Packed by", "Pkd. by", "Imported by", "Imp. by".
- In Indian retail packages, brands commonly state "Marketed, Supported By and Manufactured For: <Company Name>, Address: <Address>". Under Rule 6(1)(a) Explanation 1, if a brand/marketer assumes manufacturer responsibility ("Manufactured For" / "Marketed By"), extract it under "manufacturer" (and if a separate contract packer/manufacturer is also declared, extract them under "packer").
- "name": Full legal company name (e.g., "Intex Technologies (India) Ltd.").
- "address": The complete postal address string observed in text (building, street, industrial area, city, pin code, state, country, e.g., "A-61, Okhla Ind. Area, Phase II, New Delhi-110020 (India)").
- If an entity is present but no address is printed, set address to false.
- If a separate packer is declared, populate "packer". If imported, populate "importer".

3. NET QUANTITY (Rule 6(1)(c), Rule 11, Rule 12, Rule 13):
- PRIMARY Net Quantity: The declared quantity of commodity sold in the package (e.g., "Net Quantity: 1 Unit", "Net Qty: 1 N", "100 g", "500 ml", "1 Piece").
- DO NOT confuse auxiliary box specifications (e.g., "Box Size: 85x14x85 mm, Net Weight: 6 gm, Gross Weight: 18 gm") with the primary net quantity for a countable electronic/hardware item (which is "1 Unit" or "1 N").
- "value": numeric float (e.g. 1, 100, 500, 1.5).
- "unit": normalized unit string (e.g. "unit", "n", "u", "g", "kg", "ml", "l", "m", "cm", "piece").
- "unitKind":
    * "number" for countable items sold by piece/count/unit/N/U.
    * "mass" for weight in g or kg.
    * "volume" for liquid measure in ml or l.
    * "length" for linear measure in m or cm.
    * "area" for area in sq.m or sq.cm.
- "symbolUsed": The exact unit symbol as printed on the package (e.g., "Unit", "N", "U", "g", "gm", "kg", "ml", "piece").
- "qualifiedWhenPacked": true only if accompanied by words like "when packed" or "when packaged".

4. RETAIL SALE PRICE / MRP (Rule 6(1)(e), Rule 2(m)):
- Look for "MRP", "M.R.P.", "Maximum Retail Price", "Max. Retail Price", "Rs.", "₹", "INR", and stamped/inkjet price markings.
- CRITICAL ANTI-CONFUSION RULE: Do NOT confuse unit counts (e.g., "for 1 Unit: 999.00/-" or "per unit") with the price! The price is 999.00, NOT 1!
- "value": numeric float of the retail price in Rupees (e.g., 999 or 999.00).
- "currency": "INR", "Rs.", or "₹".
- "inclusiveOfTaxesStated": true if "inclusive of all taxes", "incl. of all taxes", "incl. of taxes", "incl. all taxes", "(Inclusive of all taxes)", etc. is stated near the MRP.
- "rawText": Full raw text snippet.

5. MONTH & YEAR OF MANUFACTURE / PACKING (Rule 6(1)(d)):
- STATUTORY REQUIREMENT: The date MUST strictly be accompanied by an explicit statutory label such as:
  * "Manufactured date" / "Date of manufacture" / "Mfg Date" / "MFD" / "MFG" / "Manufactured on"
  * "Month & Year of Manufacture" / "Month and Year of Manufacture"
  * "Packed on" / "Date of Packing" / "PKD"
  * "Imported on" / "Date of Import"
- STRICT PROHIBITIONS:
  * NEVER extract "Date First Available" (this is an Amazon web catalog listing date, NOT a manufacturing date under Legal Metrology Rules!).
  * NEVER extract shipping/delivery estimates (e.g. "Get it Sep 8 - 10", "Delivery by Friday").
  * NEVER extract "Best Before", "Expiry Date", "Use By", or warranty/shelf-life dates as manufacturing date.
  * NEVER extract bare numbers or date stamps that lack an explicit statutory manufacturing/packing label.
- If no explicit statutory manufacturing or packing label ("MFD", "Manufactured date", "PKD", etc.) is declared, you MUST return:
  "mfgDate": { "present": false, "value": null, "rawText": null, "usedIndividualSticker": false, "isMrpReductionSticker": false }
- "value": the extracted date string (e.g., "February 2026" or "02/2026").
- "usedIndividualSticker": false by default. Only true if an actual adhesive paper sticker was affixed over the surface to alter the date. Direct inkjet coding or stamping is NOT a sticker.

6. CONSUMER CARE / COMPLAINTS (Rule 6(2)):
- Look for "Consumer Complaints", "Customer Care", "Helpline", "Contact:", phone numbers, emails, addresses.
- "present": true if any consumer complaint contact is provided.
- "name": company or designation (e.g., "Customer Care Cell, Intex Technologies (India) Ltd.").
- "address": postal address for consumer complaints.
- "telephone": customer care phone number (e.g., "0120-489-5555", "1800-...").
- "email": customer care email (e.g., "info@intex.in").
- "website": customer care website if declared (e.g., "www.intex.in").
- "rawText": entire consumer care paragraph.

7. DIMENSIONS (Rule 6(1)(f), Rules 14-17):
- Look for sizes like "Box Size: 85 x 14 x 85 mm", "Dimensions: ...", finished sizes of garments/fabrics.
- "present": true if dimensions are declared.
- "rawText": full dimension declaration.
- "lengthWidthDepth": e.g., "85 x 14 x 85 mm".
- "linearDimensions": e.g., "85 x 14 x 85 mm".

8. STANDARD PACK DECLARATION (Rule 5 proviso):
- "present": ONLY true if the package explicitly states "Not a standard pack size" or "Non standard size under the Legal Metrology (Packaged Commodities) Rules, 2011".
- General compliance statements like "In compliance with Legal Metrology Act" or "Rule 2 of Legal Metrology" are NOT standard pack declarations. Leave standardPackDeclaration.present: false for general statements!

9. COMMODITY CLASSIFICATION:
- "brandName": extracted brand (e.g., "INTEX").
- "genericName": generic commodity name (e.g., "Wireless Mini USB Adapter").
- "scheduleCategory": If the product matches an item in the Second Schedule, give the exact key:
  ("baby food", "weaning food", "biscuits", "bread (including brown bread, excluding bun)", "butter and margarine (un-canned)", "cereals and pulses", "coffee", "tea", "reconstituted beverage materials", "edible oils, vanaspati, ghee, butter oil", "milk powder", "non-soapy detergents (powder)", "rice (powdered), flour, atta, rawa, suji", "salt", "soap - laundry", "soap - non-soapy detergent cakes/bars", "soap - toilet (incl. bath soap cakes)", "aerated soft drinks / non-alcoholic beverages", "mineral water and drinking water", "cement in bags", "paint, varnish etc. - (a) paint (other than paste/solid), varnish, stains, enamels", "paint, varnish etc. - (b) paste paint and solid paint", "paint, varnish etc. - (c) base paint"). Otherwise null.
- "physicalForm": "countable" (for electronics, hardware, garments, goods sold by piece/count/units), "solid", "liquid", "semi_solid", "viscous", "linear", or "area".
- "isFoodArticle": true if food or beverage, false otherwise.
- "isImported": true if manufactured outside India.
- "countryOfOrigin": e.g., "India", "China", etc. if declared.
- "dimensionsRelevant": true if dimensions are declared or typically required for this item.`;

function buildUserPrompt(ocrResult) {
  const isMulti = ocrResult?.isMultiImage || (ocrResult?.lines || []).some((l) => l.imageIndex > 0);

  const formattedLines = (ocrResult?.lines || [])
    .map((l, index) => {
      const panel = l.imageIndex != null ? `[Panel ${l.imageIndex + 1}] ` : '';
      return `${panel}${l.id ?? index}: ${String(l.text || '').trim()}`;
    })
    .filter((l) => l.length > 2)
    .join('\n');

  const rawParagraphs = ocrResult?.text ? `\n\nFULL EXTRACTED TEXT ACROSS PANELS:\n${ocrResult.text}` : '';

  return [
    'Extract Legal Metrology mandatory package declarations and commodity classification from the OCR lines below.',
    isMulti
      ? 'The input contains OCR text extracted from MULTIPLE PANELS of a single packaged commodity. Combine all panels into one unified declaration.'
      : 'All lines are from the package label/surfaces.',
    '',
    'CRITICAL REMINDERS:',
    '1. Set commodityName to the GENERIC/COMMON product name (e.g. "Wireless Mini USB Adapter"), NOT the brand name (e.g. "INTEX").',
    '2. For countable commodities (e.g. adapters, cables, electronics), net quantity is the sold unit count ("1 Unit", unitKind: "number"), NOT the package gross/net weight ("6 gm").',
    '3. For MRP, do not confuse the unit count with the price figure (e.g. "for 1 Unit: 999.00" has price 999.00, not 1).',
    '4. Populate consumer care telephone and email into their individual fields if present.',
    '5. General legal disclaimers like "In compliance with Legal Metrology Act" are NOT standard pack declarations (Rule 5). Keep standardPackDeclaration.present: false unless it explicitly says "Not a standard pack size".',
    '6. Return strictly valid JSON conforming to the schema.',
    '',
    'OCR TEXT LINES:',
    formattedLines,
    rawParagraphs,
  ].join('\n');
}

function cleanBooleans(obj) {
  if (!obj || typeof obj !== 'object') return obj;
  for (const key of Object.keys(obj)) {
    if (typeof obj[key] === 'object' && obj[key] !== null) {
      cleanBooleans(obj[key]);
    } else if (
      obj[key] === null &&
      (key.startsWith('is') ||
        key.endsWith('Declared') ||
        key.endsWith('Stated') ||
        key.endsWith('Handled') ||
        key === 'perProductBreakdown' ||
        key === 'qualifiedWhenPacked' ||
        key === 'onTagCardOrTapeDevice' ||
        key === 'usedIndividualSticker' ||
        key === 'isMrpReductionSticker' ||
        key === 'stickerReducedMrp' ||
        key === 'stickerCoversOriginalMrp' ||
        key === 'standardCapacityReferenceIncluded')
    ) {
      obj[key] = false;
    }
  }
  return obj;
}

/**
 * Normalizes and heals raw LLM output, applying deterministic safeguards
 * against common extraction pitfalls (e.g. unit/mrp confusion, regex recovery).
 */
function ensureFieldDefaults(parsed, rawOcrText = '') {
  const d = parsed || {};

  // 1. Commodity Classification
  const cClas = d.commodityClassification || {};
  const classification = {
    brandName: cClas.brandName || null,
    genericName: cClas.genericName || null,
    scheduleCategory: cClas.scheduleCategory || null,
    physicalForm: cClas.physicalForm || null,
    isFoodArticle: !!cClas.isFoodArticle,
    isIndustrialOrInstitutional: !!cClas.isIndustrialOrInstitutional,
    isImported: !!cClas.isImported,
    countryOfOrigin: cClas.countryOfOrigin || null,
    dimensionsRelevant: !!cClas.dimensionsRelevant,
    manufacturerIsNotPacker: !!cClas.manufacturerIsNotPacker,
  };

  // 2. Commodity Name: ensure generic name is prioritized over brand
  const comm = d.commodityName || {};
  let commValue = comm.value || classification.genericName || null;
  if (
    classification.brandName &&
    commValue &&
    commValue.trim().toLowerCase() === classification.brandName.trim().toLowerCase() &&
    classification.genericName
  ) {
    commValue = classification.genericName;
  }
  d.commodityName = {
    present: !!(comm.present || commValue),
    value: commValue,
    perProductBreakdown: !!comm.perProductBreakdown,
    rawText: comm.rawText || '',
  };

  // 0. Handle potential key aliases if model deviated slightly
  const rawMrp = d.mrp || d.retailPrice || d.rsp || d.maximumRetailPrice || {};
  const rawMfg = d.mfgDate || d.monthYearOfManufacture || d.mfdDate || d.dateOfMfg || d.mfg || {};
  const rawMfr = d.manufacturer || {};
  const rawPkr = d.packer || {};
  const rawImp = d.importer || {};

  // 3. Manufacturer, Packer, Importer
  const normalizeAddress = (addr) => {
    if (typeof addr === 'string' && addr.trim().length > 0) return addr.trim();
    if (addr === true) return true;
    return false;
  };

  const mfrPresent = !!(rawMfr.present || rawMfr.name || rawMfr.address);
  d.manufacturer = {
    present: mfrPresent,
    name: rawMfr.name || null,
    address: normalizeAddress(rawMfr.address),
    mark: rawMfr.mark || null,
    rawText: rawMfr.rawText || '',
  };

  const pkrPresent = !!(rawPkr.present || rawPkr.name || rawPkr.address);
  d.packer = {
    present: pkrPresent,
    name: rawPkr.name || null,
    address: normalizeAddress(rawPkr.address),
    mark: rawPkr.mark || null,
    rawText: rawPkr.rawText || '',
  };

  const impPresent = !!(rawImp.present || rawImp.name || rawImp.address);
  d.importer = {
    present: impPresent,
    name: rawImp.name || null,
    address: normalizeAddress(rawImp.address),
    mark: rawImp.mark || null,
    rawText: rawImp.rawText || '',
  };

  // 4. Net Quantity
  const qty = d.netQuantity || {};
  let numVal = qty.value != null ? Number(qty.value) : null;
  if (numVal != null && isNaN(numVal)) numVal = null;
  let unit = qty.unit ? String(qty.unit).toLowerCase().trim() : null;

  const isCountUnit = ['unit', 'units', 'n', 'u', 'piece', 'pieces', 'nos', 'no'].includes(unit);
  let unitKind = qty.unitKind || null;
  if (isCountUnit) {
    unitKind = 'number';
  } else if (unit === 'g' || unit === 'kg') {
    unitKind = 'mass';
  } else if (unit === 'ml' || unit === 'l' || unit === 'litre' || unit === 'liter') {
    unitKind = 'volume';
  } else if (unit === 'm' || unit === 'cm') {
    unitKind = 'length';
  }

  // Symbol used check (Rule 13(5)(ii) expects "N" or "U")
  let symbolUsed = qty.symbolUsed || null;
  if (!symbolUsed && isCountUnit) {
    if (unit === 'n') symbolUsed = 'N';
    else if (unit === 'u') symbolUsed = 'U';
    else if (unit === 'unit' || unit === 'units') symbolUsed = 'Unit';
    else symbolUsed = unit;
  }

  d.netQuantity = {
    present: !!(qty.present || numVal != null),
    value: numVal,
    unit: unit,
    unitKind: unitKind,
    rawText: qty.rawText || '',
    qualifiedWhenPacked: !!qty.qualifiedWhenPacked,
    onTagCardOrTapeDevice: !!qty.onTagCardOrTapeDevice,
    symbolUsed: symbolUsed,
  };

  // 5. Manufacturing / Packing Date (Rule 6(1)(d) strictly requires statutory labeling)
  const STATUTORY_MFG_LABELS = /\b(?:manufactur(?:ed\s+date|e\s+date|ed\s+on)|date\s+of\s+manufacture|mfg\.?\s*date|date\s+of\s+mfg|\bmfd\b|\bmfg\b|month\s*(?:&|and)\s*year\s*of\s*manufacture|packed\s+on|date\s+of\s+packing|\bpkd\b|pre-?packed\s+on|imported\s+on|date\s+of\s+import)\b/i;
  const DISALLOWED_DATE_CONTEXTS = /\b(?:date\s+first\s+available|delivery|get\s+it|order\s+within|best\s+before|expiry|exp\.?\s*date|use\s+by|validity|shelf\s+life)\b/i;

  let mfgVal = rawMfg.value || null;
  let mfgRaw = String(rawMfg.rawText || '');

  // Reject delivery windows or bare number ranges (e.g. "8 - 10")
  if (typeof mfgVal === 'string') {
    const cleanMfg = mfgVal.trim();
    if (/^\d{1,2}\s*-\s*\d{1,2}$/.test(cleanMfg) || !/\d{4}|\b(?:jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)\b/i.test(cleanMfg)) {
      mfgVal = null;
      mfgRaw = '';
    }
  }

  // Reject if from disallowed context without a genuine statutory label
  if (mfgRaw && DISALLOWED_DATE_CONTEXTS.test(mfgRaw) && !STATUTORY_MFG_LABELS.test(mfgRaw)) {
    mfgVal = null;
    mfgRaw = '';
  }

  // Enforce that candidate value/rawText actually has statutory labeling
  if (mfgVal) {
    const hasStatutoryLabel = STATUTORY_MFG_LABELS.test(mfgRaw) || STATUTORY_MFG_LABELS.test(mfgVal);
    if (!hasStatutoryLabel) {
      if (rawOcrText && STATUTORY_MFG_LABELS.test(rawOcrText)) {
        const statutoryMatch = rawOcrText.match(
          new RegExp(STATUTORY_MFG_LABELS.source + '[\\s:]*([A-Za-z]+\\s+\\d{4}|\\d{1,2}[/-]\\d{2,4})', 'i')
        );
        if (statutoryMatch) {
          mfgVal = statutoryMatch[1].trim();
          mfgRaw = statutoryMatch[0].trim();
        } else {
          mfgVal = null;
          mfgRaw = '';
        }
      } else {
        mfgVal = null;
        mfgRaw = '';
      }
    }
  }

  // Fallback only if rawOcrText explicitly has a statutory label
  if (!mfgVal && rawOcrText && STATUTORY_MFG_LABELS.test(rawOcrText)) {
    const statutoryMatch = rawOcrText.match(
      new RegExp(STATUTORY_MFG_LABELS.source + '[\\s:]*([A-Za-z]+\\s+\\d{4}|\\d{1,2}[/-]\\d{2,4})', 'i')
    );
    if (statutoryMatch) {
      mfgVal = statutoryMatch[1].trim();
      if (!mfgRaw) mfgRaw = statutoryMatch[0].trim();
    }
  }

  const isMfgValid = !!(mfgVal && STATUTORY_MFG_LABELS.test(mfgRaw || mfgVal));

  d.mfgDate = {
    present: isMfgValid,
    value: isMfgValid ? mfgVal : null,
    rawText: isMfgValid ? mfgRaw : '',
    usedIndividualSticker: isMfgValid ? !!rawMfg.usedIndividualSticker : false,
    isMrpReductionSticker: isMfgValid ? !!rawMfg.isMrpReductionSticker : false,
  };

  // 6. MRP: Safeguard against unit-count confusion (e.g. "for 1 Unit: 999.00" -> value: 1)
  let mrpVal = rawMrp.value != null ? Number(rawMrp.value) : null;
  if (mrpVal != null && isNaN(mrpVal)) mrpVal = null;
  let mrpRaw = String(rawMrp.rawText || '');

  if (!mrpVal && rawOcrText) {
    const mrpMatch = rawOcrText.match(
      /(?:Maximum\s+Retail\s+Price|MRP|M\.R\.P\.)[^:\n]*[:\s]+(?:for\s+[^\n:]+[:\s]+)?(?:Rs\.?|₹|INR)?\s*(\d+(?:\.\d{1,2})?)/i
    );
    if (mrpMatch) {
      mrpVal = parseFloat(mrpMatch[1]);
      if (!mrpRaw) mrpRaw = mrpMatch[0].trim();
    }
  }
  if ((mrpVal === null || mrpVal <= 5) && mrpRaw) {
    // Look for a higher price figure in mrpRaw (e.g. 999.00, Rs. 175, ₹99)
    const priceMatch = mrpRaw.match(/(?:₹|rs\.?|inr|price)?\s*(\d{2,}(?:\.\d{1,2})?)/i);
    if (priceMatch && parseFloat(priceMatch[1]) > (mrpVal || 0)) {
      mrpVal = parseFloat(priceMatch[1]);
    }
  }

  const inclusiveOfTaxesStated = rawMrp.inclusiveOfTaxesStated != null
    ? !!rawMrp.inclusiveOfTaxesStated
    : /incl(?:usive)?\.?\s*(?:of\s*)?all\s*t[a-z]*x/i.test(`${mrpRaw} ${rawOcrText}`);

  d.mrp = {
    present: !!(mrpVal != null || rawMrp.present),
    value: mrpVal,
    currency: rawMrp.currency || 'INR',
    rawText: mrpRaw,
    inclusiveOfTaxesStated: inclusiveOfTaxesStated,
    stickerReducedMrp: false,
    stickerCoversOriginalMrp: false,
  };

  // 7. Dimensions
  d.dimensions = {
    present: !!(d.dimensions?.present || d.dimensions?.rawText),
    rawText: d.dimensions?.rawText || '',
    perPieceDeclared: !!d.dimensions?.perPieceDeclared,
    numberOfPiecesDeclared: !!d.dimensions?.numberOfPiecesDeclared,
    perPieceDimensionAndRSP: !!d.dimensions?.perPieceDimensionAndRSP,
    numberOfBags: d.dimensions?.numberOfBags != null ? Number(d.dimensions.numberOfBags) : null,
    linearDimensions: d.dimensions?.linearDimensions || null,
    numberOfContainers: d.dimensions?.numberOfContainers != null ? Number(d.dimensions.numberOfContainers) : null,
    lengthWidthDepth: d.dimensions?.lengthWidthDepth || null,
    diameter: d.dimensions?.diameter || null,
    standardCapacityReferenceIncluded: false,
  };

  // 8. Consumer Care: Safeguard regex recovery if LLM didn't split phone/email
  const care = d.consumerCare || {};
  const careRaw = String(care.rawText || '');
  const combinedCareText = `${careRaw}\n${rawOcrText}`;

  let telephone = care.telephone || null;
  if (!telephone) {
    const phoneMatch = combinedCareText.match(
      /(?:\+?91[\s-]?)?[6-9]\d{9}|1800[\s-]?\d{3,4}[\s-]?\d{3,4}|\b0\d{2,4}[- ]?\d{6,8}\b/
    );
    if (phoneMatch) telephone = phoneMatch[0].trim();
  }

  let email = care.email || null;
  if (!email) {
    const emailMatch = combinedCareText.match(/[\w.-]+@[\w.-]+\.[a-z]{2,}/i);
    if (emailMatch) email = emailMatch[0].trim();
  }

  d.consumerCare = {
    present: !!(care.present || telephone || email || care.address || careRaw),
    name: care.name || null,
    address: care.address || null,
    telephone: telephone,
    email: email,
    website: care.website || null,
    rawText: careRaw,
  };

  // 9. Standard Pack Declaration (Rule 5 proviso):
  // Reset present to false if it's merely a general compliance statement
  const stdDecl = d.standardPackDeclaration || {};
  const stdRaw = String(stdDecl.rawText || '');
  let isTrueStdPack = !!stdDecl.present;
  if (
    isTrueStdPack &&
    !/not\s+a\s+standard|non[\s-]?standard\s+size|non[\s-]?standard\s+pack/i.test(stdRaw) &&
    /in\s+compliance\s+with|legal\s+metrology\s+act/i.test(stdRaw)
  ) {
    isTrueStdPack = false;
  }
  d.standardPackDeclaration = {
    present: isTrueStdPack,
    rawText: stdRaw,
  };

  // 10. Sheet count
  d.sheetCount = {
    present: !!d.sheetCount?.present,
    value: d.sheetCount?.value != null ? Number(d.sheetCount.value) : null,
    dimensionsPerSheet: d.sheetCount?.dimensionsPerSheet || null,
    rawText: d.sheetCount?.rawText || '',
  };

  d.multiComponentDeclarationHandled = !!d.multiComponentDeclarationHandled;
  d.commodityClassification = classification;

  return cleanBooleans(d);
}

async function extractDeclarationsWithGroq(ocrResult) {
  if (!process.env.GROQ_API_KEY) {
    throw new Error('GROQ_API_KEY is not set. Set it in the environment before using EXTRACTION_PROVIDER=groq.');
  }

  const Groq = require('groq-sdk');
  const client = new Groq({ apiKey: process.env.GROQ_API_KEY });
  const modelToUse = getGroqModel();

  logger.info('groqDeclarationExtractor', `Calling Groq chat completions using model ${modelToUse}...`);

  const response = await client.chat.completions.create({
    model: modelToUse,
    temperature: 0,
    messages: [
      { role: 'system', content: SYSTEM_PROMPT },
      { role: 'user', content: buildUserPrompt(ocrResult) },
    ],
    response_format: { type: 'json_object' },
  });

  const content = response.choices?.[0]?.message?.content;
  if (!content) throw new Error('Groq returned an empty extraction response.');

  let parsed;
  try {
    parsed = JSON.parse(content);
  } catch (err) {
    throw new Error(`Failed to parse Groq response as JSON: ${err.message}. Raw: ${content.slice(0, 200)}`);
  }

  const rawOcrText = ocrResult?.text || (ocrResult?.lines || []).map((l) => l.text).join('\n');
  return ensureFieldDefaults(parsed, rawOcrText);
}

module.exports = {
  extractDeclarationsWithGroq,
  DECLARATION_SCHEMA,
  SYSTEM_PROMPT,
  buildUserPrompt,
  ensureFieldDefaults,
  getGroqModel,
};
