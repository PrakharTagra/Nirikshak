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
        pieceCount: nullableNumber,
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
- Brand Name: The commercial brand or trademark (e.g., "Scalpe Pro", "INTEX", "Cadbury", "Britannia", "Samsung", "boAt", "Sony", "Parle").
  * Look for "Brand: <Name>", "Brand <Name>", or "Visit the <Name> Store".
  * STRICT PROHIBITION: NEVER extract marketing badges, trust slogans, or advertising copy such as "Top Brand indicates high quality", "Top Brand", "Best Seller", or "Amazon's Choice" as the Brand Name!
- Generic Commodity Name: The generic or common identity of the commodity (e.g., "Anti dandruff shampoo", "Wireless Mini USB Adapter", "Milk Chocolate", "Biscuits", "Bluetooth Earphones", "LED Television", "Wheat Flour", "Cashew Kernels").
  * Do NOT include leading colons, hyphens, or labels like "Generic Name:" in the value. E.g. return "Anti dandruff shampoo", NOT ": Anti dandruff shampoo".
- "commodityName.perProductBreakdown": true for multi-product or combination packages containing distinct commodities (e.g., machine/device + refills, shaver + foam, kit) that declare names and numbers/quantities of each product.
- If a package contains multiple pieces of the SAME commodity (e.g. 3 refills of vaporiser), perProductBreakdown is false.

2. MANUFACTURER, PACKER, IMPORTER (Rule 6(1)(a)):
- Look for "Manufacturer:", "Manufacturer Contact Information:", "Manufactured by", "Mfd. by", "Mfg by", "Produced by", "Marketed by", "Manufactured For", "Supported By", "Packed by", "Pkd. by", "Imported by", "Imp. by".
- "name": Full legal company name (e.g., "Glenmark Pharmaceuticals Ltd.", "Intex Technologies (India) Ltd.").
- "address": The complete postal address string observed in text (building, street, city, pin code, state, country).
  * If only the manufacturer name is provided on an online listing without a separate street address, set address to false.
  * STRICT PROHIBITION: NEVER extract CSS code, styling rules (e.g. "color:#565959!important;"), or HTML markup as an address!
- In Indian retail packages, if a brand assumes manufacturer responsibility ("Manufactured For" / "Marketed By"), extract it under "manufacturer".
- If a separate contract packer is declared, populate "packer". If imported, populate "importer".

3. NET QUANTITY (Rule 6(1)(c), Rule 11, Rule 12, Rule 13, Rule 24, Rule 28):
- PRIMARY Net Quantity: The declared quantity of the specific commodity sold in the package (e.g., "200 ml", "200.0 Milliliters", "Net Quantity: 1 Unit", "Net Qty: 1 N", "100 g", "500 ml", "90 ml").
- CRITICAL E-COMMERCE VARIANT / MULTI-SIZE RULE:
  * Online product pages often show selectable buttons for multiple size options (e.g. "100 ml", "200 ml", "400 ml", "650 ml").
  * You MUST extract the net quantity of the CURRENT PRODUCT VARIANT being inspected (declared under "Size:", "Net Quantity:", "Liquid Volume:", "Item Weight:", or in the main product title).
  * NEVER sum up multiple alternate size options, and NEVER treat multiple size buttons as piece counts!
  * For a single container/bottle, "pieceCount" MUST be 1.
- CRITICAL MULTI-PIECE / MULTI-PRODUCT PACK INSTRUCTION:
  * ONLY when a packaged commodity explicitly declares multiple identical items inside (e.g., "Pack of 3", "2 Numbers x 45 ml = 90 ml", "3 x 100 g = 300 g"):
  * "value": MUST be the TOTAL aggregated net quantity of the package (e.g. 90, NOT 45; 300, NOT 100).
  * "pieceCount": total number of pieces inside (e.g. 2, 3, 4).
  * "rawText": include the full declaration including piece counts and breakdown.
- DO NOT confuse dimensions or box specifications (e.g., "Item Dimensions: 7.3 x 4 x 17.5 cm", "Box Size: 85x14x85 mm") with net quantity!
- "value": numeric float (e.g. 200, 1, 100, 500, 1.5).
- "unit": normalized unit string (e.g. "ml", "l", "g", "kg", "unit", "n", "u", "piece").
- "unitKind": "volume" for liquids (ml/l), "mass" for weight (g/kg), "number" for countable items (unit/piece/N).
- "symbolUsed": The exact unit symbol as printed on the package (e.g., "Milliliters", "ml", "Unit", "N", "g").
- "qualifiedWhenPacked": true only if accompanied by words like "when packed" or "when packaged".

4. RETAIL SALE PRICE / MRP (Rule 6(1)(e), Rule 2(m)):
- Look for "MRP", "M.R.P.", "Maximum Retail Price", "Max. Retail Price", "Rs.", "₹", "INR", and stamped price markings.
- "value": numeric float of the retail price in Rupees (e.g., 336 or 336.00). Do NOT confuse discount prices or per-ml unit rates with the primary MRP.
- "currency": "INR", "Rs.", or "₹".
- "inclusiveOfTaxesStated": true if "inclusive of all taxes", "incl. of all taxes", "incl. of taxes", "incl. all taxes", "(Inclusive of all taxes)", etc. is stated near the price.
- "rawText": Full raw price snippet.

5. MONTH & YEAR OF MANUFACTURE / PACKING (Rule 6(1)(d), Rule 6(10)):
- STATUTORY REQUIREMENT: The date MUST strictly be accompanied by an explicit statutory label such as:
  * "Manufactured date" / "Date of manufacture" / "Mfg Date" / "MFD" / "MFG" / "Manufactured on"
  * "Month & Year of Manufacture" / "Month and Year of Manufacture"
  * "Packed on" / "Date of Packing" / "PKD"
  * "Imported on" / "Date of Import"
- STRICT PROHIBITIONS:
  * NEVER extract "Date First Available" (this is an Amazon web catalog listing date, NOT a manufacturing date under Legal Metrology Rules!).
  * NEVER extract shipping/delivery estimates (e.g. "Get it Sep 8 - 10", "Delivery by Friday").
  * NEVER extract "Best Before", "Expiry Date", "Use By", or warranty/shelf-life dates as manufacturing date.
  * NEVER extract registration numbers, license numbers, or certificate numbers (e.g. "Regn. No.: CIR-131142/2015", "Lic No. 100...") as a manufacturing date!
  * NEVER extract bare numbers or date stamps that lack an explicit statutory manufacturing/packing label.
- On Digital Marketplace / E-Commerce listings, month and year of manufacture is EXEMPT per Rule 6(10). If not explicitly declared on the webpage with a statutory label, you MUST return:
  "mfgDate": { "present": false, "value": null, "rawText": null, "usedIndividualSticker": false, "isMrpReductionSticker": false }

6. CONSUMER CARE / COMPLAINTS (Rule 6(2)):
- Look for "Consumer Complaints", "Customer Care", "Helpline", "Contact:", phone numbers, emails, addresses.
- STRICT PROHIBITION: Barcodes, EAN-13 codes, ASINs, model numbers, or part numbers (e.g., "8904091136056", "B0BLM3Q44F") are NOT telephone numbers! NEVER extract an EAN barcode or model number as telephone!
- "present": true if any customer care contact is provided.
- "name": company or designation (e.g., "Customer Care Cell, Glenmark Pharmaceuticals Ltd.").
- "address": postal address for consumer complaints.
- "telephone": customer care phone number (e.g., "0120-489-5555", "1800-...").
- "email": customer care email (e.g., "customercare@glenmark.com").
- "website": customer care website if declared.
- "rawText": entire consumer care snippet.

7. DIMENSIONS (Rule 6(1)(f), Rules 14-17):
- Look for sizes like "Item Dimensions: 7.3 x 4 x 17.5 cm", "Box Size: ...", finished sizes.
- "present": true if dimensions are declared.
- "lengthWidthDepth": e.g., "7.3 x 4 x 17.5 cm".
- "linearDimensions": e.g., "7.3 x 4 x 17.5 cm".

8. STANDARD PACK DECLARATION (Rule 5 proviso):
- "present": ONLY true if the package explicitly states "Not a standard pack size" or "Non standard size under the Legal Metrology (Packaged Commodities) Rules, 2011". Leave false for general compliance statements.

9. COMMODITY CLASSIFICATION:
- "brandName": extracted commercial brand (e.g., "Scalpe Pro").
- "genericName": generic commodity name (e.g., "Anti dandruff shampoo").
- "scheduleCategory": matching Second Schedule category if applicable, else null.
- "physicalForm": "semi_solid" (for face wash, cleansers, creams, gels, scrubs, pastes, lotions, wax, ointments), "viscous" (for honey, condensed milk, heavy syrup), "liquid" (for shampoo, oil, juice, water, thin fluid), "solid" (for soap, tablets, powder), "countable", "linear", or "area". IMPORTANT: Face wash, cleansers, scrubs, creams, lotions, and gels MUST be classified as "semi_solid".
- "isFoodArticle": true if food or beverage, false otherwise.
- "isImported": true if manufactured outside India.
- "countryOfOrigin": e.g., "India" if declared.
- "dimensionsRelevant": true if dimensions are declared.`;

function buildUserPrompt(ocrResult) {
  const isMulti = ocrResult?.isMultiImage || (ocrResult?.lines || []).some((l) => l.imageIndex > 0);

  const formattedLines = (ocrResult?.lines || [])
    .map((l, index) => {
      const panel = l.imageIndex != null ? `[Panel ${l.imageIndex + 1}] ` : '';
      return `${panel}${l.id ?? index}: ${String(l.text || '').trim()}`;
    })
    .filter((l) => l.length > 2)
    .join('\n');

  // If formattedLines is present, use it directly without duplicating full text to stay within TPM limits
  const contentText = formattedLines.length > 0 ? formattedLines : (ocrResult?.text || '');

  return [
    'Extract Legal Metrology mandatory package declarations and commodity classification from the listing/OCR lines below.',
    isMulti
      ? 'The input contains text extracted from MULTIPLE PANELS or sections. Combine all into one unified declaration.'
      : 'All lines are from the product listing/package.',
    '',
    'CRITICAL REMINDERS:',
    '1. Set brandName to the actual brand (e.g. "Scalpe Pro"). NEVER use marketing slogans like "Top Brand indicates high quality".',
    '2. Set commodityName to the GENERIC product identity (e.g. "Anti dandruff shampoo"), NOT the brand name.',
    '3. For e-commerce listings with multiple size variants, extract the NET QUANTITY of the currently selected item (e.g. 200 ml), NOT other variant sizes or a sum of options.',
    '4. Extract Manufacturer legal name (e.g. "Glenmark Pharmaceuticals Ltd."). Do not output CSS as address.',
    '5. Barcodes and model numbers (e.g. 8904091136056) are NOT phone numbers.',
    '6. Return strictly valid JSON conforming to the schema.',
    '',
    'PRODUCT TEXT / OCR LINES:',
    contentText,
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
  let brandName = cClas.brandName || null;
  if (brandName && /top\s+brand\s+indicates|indicates\s+high\s+quality|top\s+brand/i.test(brandName)) {
    const brandMatch = rawOcrText.match(/(?:visit\s+the\s+([A-Za-z0-9\s&'-]+?)\s+store|\bbrand[\s:]+([A-Za-z0-9\s&'-]+))/i);
    if (brandMatch) {
      const candidate = (brandMatch[1] || brandMatch[2] || '').trim();
      brandName = !/indicates|trusted|about|high\s+quality/i.test(candidate) ? candidate : null;
    } else {
      brandName = null;
    }
  }

  const classification = {
    brandName: brandName,
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

  // 2. Commodity Name: ensure generic name is prioritized over brand and clean of punctuation
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
  if (commValue) {
    commValue = commValue.replace(/^[\s:·•_—-]+/, '').replace(/[\s:·•_—-]+$/, '').trim();
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
    if (typeof addr === 'string' && addr.trim().length > 0) {
      const trimmed = addr.trim();
      if (/color:|!important|#[0-9a-f]{6}|\{|\}/i.test(trimmed)) return false;
      return trimmed;
    }
    if (addr === true) return true;
    return false;
  };

  const isInvalidMfrName = (name) => {
    if (!name || typeof name !== 'string') return true;
    const trimmed = name.trim().toLowerCase();
    return (
      trimmed.length < 3 ||
      /^(?:address\.?|works\s+address|manufacturer\s+address|contact|info|details|see\s+first.*|refer\s+first.*|for\s+works.*)$/i.test(trimmed) ||
      /refer\s+first.*batch/i.test(trimmed) ||
      trimmed === 'address.' ||
      trimmed === 'address' ||
      trimmed === 'works'
    );
  };

  let mfrName = rawMfr.name || null;
  if (isInvalidMfrName(mfrName) && rawOcrText) {
    const legalMfrMatch =
      rawOcrText.match(/(?:manufactured\s*(?:&|and)?\s*marketed\s*by|manufactured\s+by|marketed\s+by|mfd\.?\s*by|mfg\.?\s*by|produced\s*by)[\s:]*([^\n\r,;]+(?:pvt\.?\s*ltd\.?|ltd\.?|limited|dairy|products|technologies|corporation|industries|enterprises|co\.)?)/i) ||
      rawOcrText.match(/([A-Z][A-Za-z0-9\s&'-]+(?:Pvt\.?\s*Ltd\.?|Ltd\.?|Limited|Dairy|Products|Technologies|Enterprises|Corporation|Industries))/);
    if (legalMfrMatch && !isInvalidMfrName(legalMfrMatch[1])) {
      mfrName = legalMfrMatch[1].trim();
    } else {
      const mfrMatch = rawOcrText.match(/(?:Manufacturer\s*Contact\s*Information|Manufacturer)[\s:]+([^\n\r,;]+)/i);
      if (mfrMatch && !isInvalidMfrName(mfrMatch[1])) {
        mfrName = mfrMatch[1].trim();
      }
    }
  }

  const isInvalidMfrAddress = (addr) => {
    if (!addr || typeof addr !== 'string') return true;
    const trimmed = addr.trim().toLowerCase();
    return (
      trimmed.length < 5 ||
      trimmed === 'address.' ||
      trimmed === 'address' ||
      trimmed === 'info' ||
      trimmed === 'details' ||
      /color\s*:\s*#|!important|\{[^}]*\}/i.test(trimmed) ||
      /\b(?:expiry|best\s*before|use\s*by|regn\.?\s*no|cir-\d+|transfluthrin|active\s*ingredient)\b/i.test(trimmed)
    );
  };

  let mfrAddress = normalizeAddress(rawMfr.address);
  if (isInvalidMfrAddress(mfrAddress) && rawOcrText) {
    const addrMatch =
      rawOcrText.match(/(?:Regd\.?\s*Office|Office|Works|Factory)?[\s:]*([^\n\r]+(?:Haryana|Delhi|Gujarat|Maharashtra|Karnataka|Tamil\s*Nadu|Telangana|Uttar\s*Pradesh|Rajasthan|Punjab|Assam|Himachal\s*Pradesh|West\s*Bengal|India)[^\n\r]*\b\d{6}\b[^\n\r]*)/i) ||
      rawOcrText.match(/([^\n\r]+(?:\b\d{6}\b|\b[1-9]\d{2}\s*\d{3}\b)[^\n\r]*)/);
    if (addrMatch && !isInvalidMfrAddress(addrMatch[0])) {
      mfrAddress = addrMatch[0].trim();
    } else {
      mfrAddress = false;
    }
  } else if (isInvalidMfrAddress(mfrAddress)) {
    mfrAddress = false;
  }

  const mfrPresent = !!(rawMfr.present || mfrName || mfrAddress);
  d.manufacturer = {
    present: mfrPresent,
    name: mfrName,
    address: mfrAddress,
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
  let pieceCount = qty.pieceCount != null ? Number(qty.pieceCount) : null;
  if (pieceCount != null && isNaN(pieceCount)) pieceCount = null;

  // Multi-piece reconciliation layer: extract multi-piece facts from raw OCR text
  const { extractMultiPieceFacts } = require('./netQuantityClearanceLayer');
  const multiPiece = extractMultiPieceFacts(
    (rawOcrText || '').split('\n').map((t, idx) => ({ id: idx, text: t.trim() }))
  );

  if (multiPiece.pieceCount && !pieceCount) {
    pieceCount = multiPiece.pieceCount;
  }

  // If LLM mapped only the first piece (e.g. numVal == 45 when 2 Numbers x 45 ml = 90 ml is declared)
  if (multiPiece.totalValue != null && multiPiece.pieceCount && multiPiece.pieceCount > 1) {
    if (numVal == null || (multiPiece.pieces.length > 0 && numVal === multiPiece.pieces[0].value && multiPiece.totalValue > numVal)) {
      logger.info(
        'groqDeclarationExtractor',
        `Reconciled multi-piece net quantity from first piece (${numVal}) to total quantity (${multiPiece.totalValue} ${multiPiece.totalUnit || unit}) across ${multiPiece.pieceCount} pieces.`
      );
      numVal = multiPiece.totalValue;
      if (multiPiece.totalUnit) unit = multiPiece.totalUnit;
    }
  }

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
    rawText: qty.rawText || multiPiece.rawText || '',
    qualifiedWhenPacked: !!qty.qualifiedWhenPacked,
    onTagCardOrTapeDevice: !!qty.onTagCardOrTapeDevice,
    symbolUsed: symbolUsed,
    pieceCount: pieceCount,
    pieces: multiPiece.pieces || [],
  };

  // Multi-product combination reconciliation:
  // When packaging contains multiple distinct items (e.g. machine/device + liquid refills),
  // identify per-product breakdown and set physicalForm to 'combination' to prevent false single-unit violations.
  const hasDeviceAndRefill =
    /(?:device|machine|plug|dispenser)\b/i.test(rawOcrText) &&
    /(?:refills?|liquid|ml\b|50\s*ml|25\s*ml)\b/i.test(rawOcrText);
  const hasComboSlogan = /(?:device|machine)\s*(?:\+|and|&)\s*\d*\s*refills?/i.test(rawOcrText);
  const hasMultiProductDeclared =
    multiPiece.hasPerProductBreakdown ||
    hasComboSlogan ||
    (hasDeviceAndRefill && (multiPiece.pieces.length >= 2 || /(?:1|l|I)\s*u\b[^\n]*device/i.test(rawOcrText)));

  if (hasMultiProductDeclared) {
    d.commodityName.perProductBreakdown = true;
    classification.physicalForm = 'combination';
  } else if (classification.physicalForm === 'countable' && unitKind === 'volume' && /(?:refill|liquid|ml\b|l\b)/i.test(rawOcrText)) {
    // If package has multiple refills of the same liquid, physical form is liquid under Rule 24 (multi-piece)
    classification.physicalForm = 'liquid';
  } else if (/\b(?:face\s*wash|facewash|cleanser|scrub|cream|gel|paste|lotion|ointment|wax|balm)\b/i.test(`${d.commodityName?.value || ''} ${classification.genericName || ''} ${rawOcrText}`)) {
    classification.physicalForm = 'semi_solid';
  }

  // 5. Manufacturing / Packing Date (Rule 6(1)(d) strictly requires statutory labeling)
  const STATUTORY_MFG_LABELS = /\b(?:manufactur(?:ed\s+date|e\s+date|ed\s+on)|date\s+of\s+manufacture|mfg\.?\s*date|date\s+of\s+mfg|\bmfd\b|\bmfg\b|month\s*(?:&|and)\s*year\s*of\s*manufacture|packed\s+on|date\s+of\s+packing|\bpkd\b|pre-?packed\s+on|imported\s+on|date\s+of\s+import)\b/i;
  const DISALLOWED_DATE_CONTEXTS = /\b(?:date\s+first\s+available|delivery|get\s+it|order\s+within|best\s+before|expiry|exp\.?\s*date|use\s+by|validity|shelf\s+life)\b/i;

  let mfgVal = rawMfg.value || null;
  let mfgRaw = String(rawMfg.rawText || '');

  // Reject delivery windows, registration numbers, or invalid month values (> 12)
  if (typeof mfgVal === 'string') {
    const cleanMfg = mfgVal.trim();
    const slashParts = cleanMfg.split(/[/-]/);
    if (slashParts.length === 2 && parseInt(slashParts[0], 10) > 12) {
      mfgVal = null;
      mfgRaw = '';
    } else if (
      /^\d{1,2}\s*-\s*\d{1,2}$/.test(cleanMfg) ||
      !/\d{2,4}|\b(?:jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)\b/i.test(cleanMfg) ||
      /regn|cir-|lic\b|no\.\s*:/i.test(mfgRaw)
    ) {
      mfgVal = null;
      mfgRaw = '';
    }
  }

  // Reject if from disallowed context without a genuine statutory label
  if (mfgRaw && DISALLOWED_DATE_CONTEXTS.test(mfgRaw) && !STATUTORY_MFG_LABELS.test(mfgRaw)) {
    mfgVal = null;
    mfgRaw = '';
  }

  const hasStatutoryInOcr = rawOcrText && STATUTORY_MFG_LABELS.test(rawOcrText);
  let isMfgValid = false;

  if (mfgVal) {
    const hasStatutoryLabel = STATUTORY_MFG_LABELS.test(mfgRaw) || STATUTORY_MFG_LABELS.test(mfgVal) || hasStatutoryInOcr;
    if (hasStatutoryLabel && !DISALLOWED_DATE_CONTEXTS.test(mfgRaw)) {
      isMfgValid = true;
      if (!mfgRaw) mfgRaw = `Mfg. Date: ${mfgVal}`;
    } else {
      mfgVal = null;
      mfgRaw = '';
    }
  }

  // Fallback if mfgVal was not extracted by LLM but rawOcrText explicitly has statutory label and date
  if (!mfgVal && hasStatutoryInOcr) {
    const statutoryMatch =
      rawOcrText.match(new RegExp(STATUTORY_MFG_LABELS.source + '[\\s:]*(?:[A-Za-z0-9_.-]+[\\s:]*)*?([A-Za-z]+\\s+\\d{4}|\\d{1,2}[/-]\\d{1,2}[/-]\\d{2,4}|\\d{1,2}[/-]\\d{2,4})', 'i')) ||
      rawOcrText.match(/(?:mfg\.?\s*date|mfd\.?|date\s+of\s+mfg)[\s\S]{1,40}?(\d{1,2}[/-]\d{1,2}[/-]\d{2,4}|\d{1,2}[/-]\d{2,4})/i) ||
      rawOcrText.match(/(\d{1,2}[/-]\d{1,2}[/-]\d{2,4})/);
    if (statutoryMatch) {
      mfgVal = statutoryMatch[1].trim();
      mfgRaw = statutoryMatch[0].trim();
      isMfgValid = true;
    }
  }

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
    const mrpMatch =
      rawOcrText.match(
        /(?:Maximum\s+Retail\s+Price|MRP|M\.R\.P\.)[^:\n]*[:\s]+(?:for\s+[^\n:]+[:\s]+)?(?:Rs\.?|₹|INR)?\s*(\d+(?:\.\d{1,2})?)/i
      ) ||
      rawOcrText.match(/(?:MRP|Price)?[:\s]*(?:Rs\.?|₹|INR)?\s*(\d+(?:\.\d{1,2})?)\s*(?:\(Inclusive\s+of\s+all\s+taxes\)|inclusive)/i) ||
      rawOcrText.match(/(\d+)%\s+(\d+(?:\.\d{1,2})?)\s*(?:₹|Rs\.?)\s*(\d+(?:\.\d{1,2})?)/i) ||
      rawOcrText.match(/(?:₹|Rs\.?)\s*(\d+(?:\.\d{1,2})?)\s+(\d+)%\s+(\d+(?:\.\d{1,2})?)/i);
    if (mrpMatch) {
      mrpVal = parseFloat(mrpMatch[2] || mrpMatch[1]);
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
  // Discard if telephone is actually an EAN barcode or model number (e.g. 8904091136056 or 11+ digits)
  if (telephone && (/\b\d{11,14}\b/.test(telephone) || /8904091136/.test(telephone))) {
    telephone = null;
  }
  if (!telephone) {
    // Only match phone numbers with word boundaries and not part of a model/part number line
    const phoneMatch = combinedCareText.match(
      /(?:\+?91[\s-]?)?[6-9]\d{9}(?!\d)|1800[\s-]?\d{3,4}[\s-]?\d{3,4}|\b0\d{2,4}[- ]?\d{6,8}\b/
    );
    if (phoneMatch && !/model|part|asin|barcode|ean|upc|fssai|lic/i.test(phoneMatch[0])) {
      telephone = phoneMatch[0].trim();
    }
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
  const fallbackModel = config?.groq?.fallbackModel || (modelToUse === 'openai/gpt-oss-120b' ? 'openai/gpt-oss-20b' : 'openai/gpt-oss-120b');

  logger.info('groqDeclarationExtractor', `Calling Groq chat completions using model ${modelToUse}...`);

  let response;
  try {
    response = await client.chat.completions.create({
      model: modelToUse,
      temperature: 0,
      messages: [
        { role: 'system', content: SYSTEM_PROMPT },
        { role: 'user', content: buildUserPrompt(ocrResult) },
      ],
      response_format: { type: 'json_object' },
    });
  } catch (err) {
    const isRateOrTokenLimit = err.status === 413 || err.status === 429 || /rate_limit|too large|tpm/i.test(err.message);
    if (isRateOrTokenLimit && fallbackModel && fallbackModel !== modelToUse) {
      logger.warn('groqDeclarationExtractor', `Model ${modelToUse} rate/TPM limit reached (${err.message}). Retrying with fallback model ${fallbackModel}...`);
      response = await client.chat.completions.create({
        model: fallbackModel,
        temperature: 0,
        messages: [
          { role: 'system', content: SYSTEM_PROMPT },
          { role: 'user', content: buildUserPrompt(ocrResult) },
        ],
        response_format: { type: 'json_object' },
      });
    } else {
      throw err;
    }
  }

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
