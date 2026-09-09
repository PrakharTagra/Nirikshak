/**
 * deterministicExtractor.js
 *
 * Deterministic Statutory Declaration Extractor grounded in the
 * Legal Metrology (Packaged Commodities) Rules, 2011.
 *
 * Extracts fields with 100% (or near-100%) syntactic regularity:
 *   - Retail Sale Price (MRP) & Tax Clause: Rule 2(m), Rule 6(1)(e), Rule 8(2)
 *   - Net Quantity & Statutory Units: Rule 6(1)(c), Rule 11, Rule 12, Rule 13
 *   - Prohibited Net Qty Qualifiers: Rule 11(2)-(3), Rule 12(6) ("when packed", "approx")
 *   - Manufacturing / Packing / Import Date: Rule 6(1)(d), Explanation I
 *   - Consumer Care Contacts: Rule 6(2) (email, 1800 toll-free, standard phone, website)
 *   - Postal PIN Code: Rule 10(1) (6-digit Indian PIN)
 *   - Non-Standard Pack Disclaimer: Rule 5, Second Schedule
 *   - Usable Sheets & Dimensions: Rule 14, 16, 17
 */
'use strict';

const logger = require('../utils/logger');
const { extractMultiPieceFacts } = require('./netQuantityClearanceLayer');

// 1. STATUTORY PATTERNS (Legal Metrology Rules, 2011)

// Rule 2(m) & Rule 8(2): "MRP Rs..../ ₹.... incl., of all taxes"
const MRP_PREFIX = /(?:m\.?r\.?p\.?|max(?:imum)?\.?\s*retail\s*price|maximum\s*price)\b/i;
const MRP_VALUE_PATTERN = /(?:m\.?r\.?p\.?|max(?:imum)?\.?\s*retail\s*price)[\s.:]*(?:for\s+[^\n:]+[:\s]+)?(?:rs\.?|inr|₹)?\s*(\d+(?:,\d{3})*(?:\.\d{1,2})?)/i;
const DIRECT_PRICE_PATTERN = /(?:₹|rs\.?|inr)\s*(\d+(?:,\d{3})*(?:\.\d{1,2})?)(?:\s*\/-|\b)/i;
const TAX_INCLUSIVE_PATTERN = /incl(?:usive)?\.?\s*(?:of\s*)?all\s*t[a-z]*x(?:es)?/i;
const UNIT_SALE_PRICE_PATTERN = /(?:unit\s+sale\s+price|u\.?s\.?p\.?)[\s.:]*(?:₹|rs\.?|inr)?\s*(\d+(?:\.\d{1,2})?)\s*(?:\/|\s*per\s*)\s*(g|kg|ml|l|litre|liter|piece|unit|n|u)\b/i;

// Rule 6(1)(c) & Rule 13: Units of weight, measure, or number
// Allowed units: g, kg, ml, l, cm, m, N, U, unit, pieces
// Prohibited units: dozen, gross, score (Rule 13(4))
const PROHIBITED_UNITS_PATTERN = /\b(?:dozen|gross|score)\b/i;
const PROHIBITED_QTY_WORDS = /\b(?:when\s+packed|approx(?:imate)?|not\s+less\s+than|minimum|average)\b/i;

// Rule 6(1)(d): Month & Year of manufacture/packing/import
const STATUTORY_MFG_LABELS = /\b(?:manufactur(?:ed\s+date|e\s+date|ed\s+on)|date\s+of\s+manufacture|mfg\.?\s*date|date\s+of\s+mfg|\bmfd\b|\bmfg\b|month\s*(?:&|and)\s*year\s*of\s*manufacture|packed\s+on|date\s+of\s+packing|\bpkd\b|pre-?packed\s+on|imported\s+on|date\s+of\s+import)\b/i;
const DISALLOWED_DATE_REGEX = /\b(?:date\s+first\s+available|delivery|get\s+it|order\s+within|best\s+before|expiry|exp\.?\s*date|use\s+by|validity|shelf\s+life|warranty)\b/i;

// Standard Date patterns (MM/YY, MM/YYYY, Month YYYY, DD/MM/YYYY)
const DATE_FORMAT_REGEX = /\b(?:0?[1-9]|[12]\d|3[01])\s*[-/.]\s*(?:0?[1-9]|1[0-2])\s*[-/.]\s*(?:\d{4}|\d{2})\b|\b(?:0?[1-9]|1[0-2])\s*[-/.]\s*(?:\d{4}|\d{2})\b|\b(?:Jan(?:uary)?|Feb(?:ruary)?|Mar(?:ch)?|Apr(?:il)?|May|Jun(?:e)?|Jul(?:y)?|Aug(?:ust)?|Sep(?:tember)?|Oct(?:ober)?|Nov(?:ember)?|Dec(?:ember)?)\s*[- ,.]*\s*(?:\d{4}|\d{2})\b/i;

// Rule 6(2): Consumer Care details
const EMAIL_REGEX = /\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b/;
const TOLL_FREE_REGEX = /\b1800[-\s]?\d{3}[-\s]?\d{3,4}\b/;
const STANDARD_PHONE_REGEX = /(?<!\d)(?:(?:\+?91[\s-]?)?[6-9]\d{9}|0\d{2,4}[-\s]?\d{6,8})(?!\d)/;
const WEBSITE_REGEX = /\b(?:https?:\/\/)?(?:www\.)[a-z0-9.-]+\.[a-z]{2,}(?:\/[^\s]*)?/i;
const CONSUMER_CARE_ANCHOR = /\b(?:consumer\s*(?:care|cell|complaints?)|customer\s*(?:care|support|service)|grievance|toll[\s-]?free|helpline|for\s+(?:consumer\s+)?complaints)\b/i;

// Rule 10(1): Postal PIN code
const PIN_CODE_REGEX = /(?<![#&a-zA-Z\d])[1-9]\d{5}(?![a-zA-Z\d])/;

// Rule 5: Non-standard pack size declaration
const NON_STD_PACK_REGEX = /\b(?:not\s+a\s+standard\s+pack\s+size|non[\s-]?standard\s+(?:pack\s+)?size)\b/i;

// Rule 16: Usable sheets
const USABLE_SHEETS_REGEX = /(\d+)\s*(?:usable\s+)?(?:sheets?|pulls?|wipes?)\b/i;

// Rule 14 & 17: Dimensions
const DIMENSIONS_REGEX = /\b(\d+(?:\.\d+)?)\s*(?:cm|mm|m)\s*[xX×]\s*(\d+(?:\.\d+)?)\s*(?:cm|mm|m)(?:\s*[xX×]\s*(\d+(?:\.\d+)?)\s*(?:cm|mm|m))?\b/i;

/**
 * Parses numeric value from a string that might include commas (e.g. "1,299.00")
 */
function parsePrice(valStr) {
  if (!valStr) return null;
  const cleaned = String(valStr).replace(/,/g, '').trim();
  const num = parseFloat(cleaned);
  return isNaN(num) ? null : num;
}

/**
 * Deterministically extracts Net Quantity from OCR text.
 */
function extractDeterministicNetQuantity(lines, fullText) {
  // 1. Check for multi-piece cluster facts first
  const multiPiece = extractMultiPieceFacts(lines);
  if (multiPiece.totalValue != null) {
    const unit = multiPiece.totalUnit || 'ml';
    const unitKind = ['ml', 'l'].includes(unit) ? 'volume' : (['g', 'kg'].includes(unit) ? 'mass' : 'number');
    return {
      present: true,
      value: multiPiece.totalValue,
      unit: unit,
      unitKind: unitKind,
      symbolUsed: unit,
      pieceCount: multiPiece.pieceCount || null,
      pieces: multiPiece.pieces || [],
      rawText: multiPiece.rawText,
      confidence: 'HIGH',
    };
  }

  // 2. Line-by-line check with Net Quantity keyword priority
  for (const line of lines) {
    const t = line.text || '';
    if (PROHIBITED_UNITS_PATTERN.test(t)) {
      // Illegal unit like dozen
      const match = t.match(/(\d+)\s*(dozen|gross|score)/i);
      if (match) {
        return {
          present: true,
          value: parseFloat(match[1]),
          unit: match[2].toLowerCase(),
          unitKind: 'illegal',
          symbolUsed: match[2],
          pieceCount: null,
          pieces: [],
          rawText: t,
          confidence: 'HIGH',
        };
      }
    }

    // Explicit "Net Quantity:" or "Net Wt:" line
    const qtyLineMatch = t.match(/(?:net\s*(?:quantity|qty\.?|wt\.?|weight)[\s.:]*)(\d+(?:\.\d+)?)\s*(kg|g|gm|gms|grams?|ml|l|litres?|liters?|u\b|n\b|units?|pieces?|pcs?)\b/i);
    if (qtyLineMatch) {
      const rawUnit = qtyLineMatch[2].toLowerCase();
      let unit = rawUnit;
      let unitKind = 'mass';
      let symbolUsed = qtyLineMatch[2];

      if (['u', 'n', 'unit', 'units', 'piece', 'pieces', 'pcs'].includes(rawUnit)) {
        unit = rawUnit === 'n' ? 'N' : (rawUnit === 'u' ? 'U' : (rawUnit.startsWith('unit') ? 'Unit' : rawUnit));
        unitKind = 'number';
        symbolUsed = unit;
      } else if (unit.startsWith('kg')) {
        unit = 'kg';
      } else if (unit.startsWith('g')) {
        unit = 'g';
      } else if (unit.startsWith('l')) {
        unit = 'l';
        unitKind = 'volume';
      } else {
        unit = 'ml';
        unitKind = 'volume';
      }

      return {
        present: true,
        value: parseFloat(qtyLineMatch[1]),
        unit,
        unitKind,
        symbolUsed,
        pieceCount: unitKind === 'number' ? parseFloat(qtyLineMatch[1]) : 1,
        pieces: [],
        rawText: t,
        confidence: 'HIGH',
      };
    }
  }

  // 3. Fallback: Global regex over fullText
  const globalCount = fullText.match(/(?:net\s*(?:quantity|qty)?[\s.:]*)?(\d+(?:\.\d+)?)\s*(units?|u\b|n\b|pieces?|pcs?)\b/i);
  if (globalCount) {
    const rawUnit = globalCount[2].toLowerCase();
    const symbolUsed = rawUnit === 'n' ? 'N' : (rawUnit === 'u' ? 'U' : (rawUnit.startsWith('unit') ? 'Unit' : rawUnit));
    return {
      present: true,
      value: parseFloat(globalCount[1]),
      unit: rawUnit,
      unitKind: 'number',
      symbolUsed,
      pieceCount: parseFloat(globalCount[1]),
      pieces: [],
      rawText: globalCount[0],
      confidence: 'MEDIUM',
    };
  }

  const globalWeight = fullText.match(/(?:net\s*(?:wt\.?|weight|quantity|qty)?[\s.:]*)(\d+(?:\.\d+)?)\s*(kg|g|gm|ml|l|litres?|liters?)\b/i);
  if (globalWeight) {
    let unit = globalWeight[2].toLowerCase();
    let unitKind = 'mass';
    if (unit.startsWith('l')) { unit = 'l'; unitKind = 'volume'; }
    else if (unit.startsWith('ml')) { unit = 'ml'; unitKind = 'volume'; }
    else if (unit.startsWith('kg')) { unit = 'kg'; }
    else { unit = 'g'; }

    return {
      present: true,
      value: parseFloat(globalWeight[1]),
      unit,
      unitKind,
      symbolUsed: unit,
      pieceCount: 1,
      pieces: [],
      rawText: globalWeight[0],
      confidence: 'MEDIUM',
    };
  }

  return {
    present: false,
    value: null,
    unit: null,
    unitKind: null,
    symbolUsed: null,
    pieceCount: null,
    pieces: [],
    rawText: '',
    confidence: 'NONE',
  };
}

/**
 * Deterministically extracts MRP and related statutory tax clauses.
 */
function extractDeterministicMrp(lines, fullText) {
  let mrpValue = null;
  let mrpRaw = '';
  let confidence = 'NONE';

  // 1. Check lines with explicit MRP prefix
  for (let i = 0; i < lines.length; i++) {
    const lineText = lines[i].text || '';
    if (MRP_PREFIX.test(lineText)) {
      const match = lineText.match(MRP_VALUE_PATTERN) || lineText.match(DIRECT_PRICE_PATTERN);
      if (match) {
        const val = parsePrice(match[1]);
        if (val && val > 0) {
          mrpValue = val;
          mrpRaw = lineText;
          confidence = 'HIGH';
          break;
        }
      }
      // If line has "MRP" but value is on the immediately adjacent line (common in multi-column OCR)
      for (let j = i + 1; j <= Math.min(lines.length - 1, i + 2); j++) {
        const nextMatch = lines[j].text.match(DIRECT_PRICE_PATTERN) || lines[j].text.match(/^(\d+(?:\.\d{1,2})?)\s*(?:\/-)?$/);
        if (nextMatch) {
          const val = parsePrice(nextMatch[1]);
          if (val && val > 0) {
            mrpValue = val;
            mrpRaw = `${lineText} ${lines[j].text}`.trim();
            confidence = 'HIGH';
            break;
          }
        }
      }
      if (mrpValue != null) break;
    }
  }

  // 2. Global fallback across fullText
  if (mrpValue == null) {
    const globalMatch = fullText.match(MRP_VALUE_PATTERN);
    if (globalMatch) {
      const val = parsePrice(globalMatch[1]);
      if (val && val > 0) {
        mrpValue = val;
        mrpRaw = globalMatch[0];
        confidence = 'HIGH';
      }
    }
  }

  if (mrpValue == null) {
    // Check for standalone price like "₹ 199.00" or "Rs. 250/-"
    const standalonePrice = fullText.match(/(?:₹|rs\.?|inr)\s*(\d+(?:,\d{3})*(?:\.\d{1,2})?)\s*(?:\/-|\b)/i);
    if (standalonePrice) {
      const val = parsePrice(standalonePrice[1]);
      if (val && val > 0) {
        mrpValue = val;
        mrpRaw = standalonePrice[0];
        confidence = 'MEDIUM';
      }
    }
  }

  const inclusiveOfTaxesStated = TAX_INCLUSIVE_PATTERN.test(`${mrpRaw} ${fullText}`);
  const uspMatch = fullText.match(UNIT_SALE_PRICE_PATTERN);
  const unitSalePrice = uspMatch ? uspMatch[0].trim() : null;

  return {
    present: mrpValue != null,
    value: mrpValue,
    currency: 'INR',
    rawText: mrpRaw ? mrpRaw.slice(0, 250) : '',
    inclusiveOfTaxesStated,
    unitSalePrice,
    confidence,
  };
}

/**
 * Deterministically extracts Manufacturing / Packing / Import Date.
 */
function extractDeterministicMfgDate(lines, fullText) {
  let mfgVal = null;
  let mfgRaw = '';
  let confidence = 'NONE';

  // 1. Line-by-line inspection for statutory label
  for (let i = 0; i < lines.length; i++) {
    const text = lines[i].text || '';
    if (STATUTORY_MFG_LABELS.test(text) && !DISALLOWED_DATE_REGEX.test(text)) {
      const dateMatch = text.match(DATE_FORMAT_REGEX);
      if (dateMatch) {
        mfgVal = dateMatch[0].trim();
        mfgRaw = text;
        confidence = 'HIGH';
        break;
      }
      // Check next lines for the date value
      for (let j = i + 1; j <= Math.min(lines.length - 1, i + 4); j++) {
        if (DISALLOWED_DATE_REGEX.test(lines[j].text)) continue;
        const adjDate = lines[j].text.match(DATE_FORMAT_REGEX);
        if (adjDate) {
          mfgVal = adjDate[0].trim();
          mfgRaw = `${text} ${lines[j].text}`.trim();
          confidence = 'HIGH';
          break;
        }
      }
      if (mfgVal) break;
    }
  }

  // 2. Global proximity match
  if (!mfgVal && STATUTORY_MFG_LABELS.test(fullText)) {
    const globalMatch = fullText.match(new RegExp('(?:' + STATUTORY_MFG_LABELS.source + ')[\\s\\S]{1,50}?(' + DATE_FORMAT_REGEX.source + ')', 'i'));
    if (globalMatch && !DISALLOWED_DATE_REGEX.test(globalMatch[0])) {
      mfgVal = globalMatch[1].trim();
      mfgRaw = globalMatch[0].trim();
      confidence = 'HIGH';
    }
  }

  return {
    present: !!mfgVal,
    value: mfgVal,
    rawText: mfgRaw ? mfgRaw.slice(0, 250) : '',
    confidence,
  };
}

/**
 * Deterministically extracts Consumer Care details (Email, Phone, Web, PIN Code).
 */
function extractDeterministicConsumerCare(lines, fullText) {
  let email = null;
  let telephone = null;
  let website = null;
  let pinCode = null;
  let careRaw = '';
  let confidence = 'NONE';

  // 1. Standard RFC email pattern
  const emailMatch = fullText.match(EMAIL_REGEX);
  if (emailMatch) {
    email = emailMatch[0].trim();
  }

  // 2. Toll-Free or Indian Phone number
  // Look in proximity to consumer care keywords first to avoid capturing barcode digits
  const careLines = lines.filter((l) => CONSUMER_CARE_ANCHOR.test(l.text));
  if (careLines.length > 0) {
    const careSnippet = careLines.map((l) => l.text).join(' ');
    careRaw = careSnippet;
    const tfMatch = careSnippet.match(TOLL_FREE_REGEX);
    if (tfMatch) {
      telephone = tfMatch[0].trim();
    } else {
      const phoneMatch = careSnippet.match(STANDARD_PHONE_REGEX);
      if (phoneMatch && !/^(?:890|0890)\d{6,10}$/.test(phoneMatch[0].replace(/\D/g, ''))) {
        telephone = phoneMatch[0].trim();
      }
    }
  }

  // Global phone fallback if not found in care lines
  if (!telephone) {
    const tfMatch = fullText.match(TOLL_FREE_REGEX);
    if (tfMatch) {
      telephone = tfMatch[0].trim();
    } else {
      const phoneMatch = fullText.match(STANDARD_PHONE_REGEX);
      if (phoneMatch && !/model|part|asin|barcode|ean|upc|fssai|lic|batch/i.test(fullText.slice(Math.max(0, phoneMatch.index - 30), phoneMatch.index + 30))) {
        if (!/^(?:890|0890)\d{6,10}$/.test(phoneMatch[0].replace(/\D/g, ''))) {
          telephone = phoneMatch[0].trim();
        }
      }
    }
  }

  // 3. Website
  const webMatch = fullText.match(WEBSITE_REGEX);
  if (webMatch) {
    website = webMatch[0].trim();
  }

  // 4. PIN code
  const pinMatch = fullText.match(PIN_CODE_REGEX);
  if (pinMatch) {
    pinCode = pinMatch[0];
  }

  if (email || telephone) {
    confidence = 'HIGH';
  } else if (careRaw) {
    confidence = 'MEDIUM';
  }

  return {
    present: !!(email || telephone || careRaw),
    name: null,
    address: null,
    telephone,
    email,
    website,
    pinCode,
    rawText: careRaw ? careRaw.slice(0, 250) : (email || telephone || ''),
    confidence,
  };
}

/**
 * Deterministically extracts Dimensions, Usable Sheet Count, and Standard Pack status.
 */
function extractDeterministicDimensionsAndPack(lines, fullText) {
  // Dimensions
  const dimMatch = fullText.match(DIMENSIONS_REGEX);
  const dimPresent = !!dimMatch;
  const linearDimensions = dimMatch ? dimMatch[0].trim() : null;

  // Sheet count (Rule 16)
  const sheetMatch = fullText.match(USABLE_SHEETS_REGEX);
  const sheetPresent = !!sheetMatch;
  const sheetValue = sheetMatch ? parseInt(sheetMatch[1], 10) : null;

  // Standard pack declaration (Rule 5)
  const stdPackPresent = NON_STD_PACK_REGEX.test(fullText);

  // Prohibited words in Net Quantity (Rule 11(2), 12(6))
  const prohibitedWordsFound = PROHIBITED_QTY_WORDS.test(fullText);

  return {
    dimensions: {
      present: dimPresent,
      rawText: linearDimensions || '',
      linearDimensions,
      lengthWidthDepth: linearDimensions,
      confidence: dimPresent ? 'HIGH' : 'NONE',
    },
    sheetCount: {
      present: sheetPresent,
      value: sheetValue,
      rawText: sheetMatch ? sheetMatch[0].trim() : '',
      confidence: sheetPresent ? 'HIGH' : 'NONE',
    },
    standardPackDeclaration: {
      present: stdPackPresent,
      rawText: stdPackPresent ? (fullText.match(NON_STD_PACK_REGEX)?.[0] || '') : '',
      confidence: stdPackPresent ? 'HIGH' : 'NONE',
    },
    prohibitedWordsFound,
  };
}

/**
 * Main Deterministic Extraction Function.
 *
 * @param {Object} ocrResult Normalized OCR representation containing `lines` and `text`.
 * @returns {Object} Structured deterministic extraction with confidence ratings.
 */
function deterministicExtract(ocrResult) {
  const lines = ocrResult?.lines || [];
  const fullText = ocrResult?.text || lines.map((l) => l.text).join('\n');

  logger.info('deterministicExtractor', 'Executing statutory regex extraction on OCR text');

  const netQuantity = extractDeterministicNetQuantity(lines, fullText);
  const mrp = extractDeterministicMrp(lines, fullText);
  const mfgDate = extractDeterministicMfgDate(lines, fullText);
  const consumerCare = extractDeterministicConsumerCare(lines, fullText);
  const aux = extractDeterministicDimensionsAndPack(lines, fullText);

  // Assess overall deterministic completeness
  const coreFieldsHighConfidence =
    netQuantity.confidence === 'HIGH' &&
    mrp.confidence === 'HIGH';

  return {
    mrp,
    netQuantity,
    mfgDate,
    consumerCare,
    dimensions: aux.dimensions,
    sheetCount: aux.sheetCount,
    standardPackDeclaration: aux.standardPackDeclaration,
    prohibitedWordsFound: aux.prohibitedWordsFound,
    coreFieldsHighConfidence,
  };
}

module.exports = {
  deterministicExtract,
  extractDeterministicNetQuantity,
  extractDeterministicMrp,
  extractDeterministicMfgDate,
  extractDeterministicConsumerCare,
  extractDeterministicDimensionsAndPack,
  PATTERNS: {
    MRP_PREFIX,
    MRP_VALUE_PATTERN,
    TAX_INCLUSIVE_PATTERN,
    STATUTORY_MFG_LABELS,
    EMAIL_REGEX,
    TOLL_FREE_REGEX,
    STANDARD_PHONE_REGEX,
    PIN_CODE_REGEX,
    NON_STD_PACK_REGEX,
  },
};
