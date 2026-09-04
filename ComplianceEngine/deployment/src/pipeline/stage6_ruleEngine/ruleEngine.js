/**
 * ruleEngine.js
 * Strict, rule-by-rule compliance engine for the
 * Legal Metrology (Packaged Commodities) Rules, 2011.
 *
 * Input:  a structured "package record" (see README.md / index.js for
 *         the exact shape) — this is what Stage 6 (OCR + NLP
 *         extraction) of the pipeline is expected to produce.
 * Output: { applicable, exemptionReason, violations[], compliant }
 *
 * Every violation is tagged with the exact rule/sub-rule it comes
 * from, its severity, and a human-readable message, so it maps
 * 1:1 onto the compliance checklist and can be dropped straight
 * into a report template (Stage 9).
 *
 * SEVERITY LEGEND
 *   critical - direct contravention of a mandatory declaration rule
 *   major    - format/manner violation (font size, placement, unit)
 *   minor    - administrative/registration-adjacent issue
 */

'use strict';

const {
  getMPEFromFirstSchedule,
  normalizeToGramsOrMl,
  getMinNumeralHeightMm,
  SECOND_SCHEDULE,
  THIRD_SCHEDULE,
  FOURTH_SCHEDULE,
} = require('./schedules');

function violation(rule, message, severity = 'major', field = null) {
  return { rule, message, severity, field };
}

/* ==================================================================
 * SECTION 1 — Applicability & blanket exemptions (Rule 3, Rule 26)
 * ================================================================== */
function checkApplicability(pkg) {
  const c = pkg.commodity || {};

  // Rule 3 — Chapter II does not apply beyond these thresholds
  const overThreshold =
    c.weightOrVolumeKgOrL > 25 &&
    !(c.isCementOrFertilizerBag && c.weightOrVolumeKgOrL <= 50);
  if (overThreshold) {
    return {
      applicable: false,
      exemptionReason:
        'Rule 3(a) — package exceeds 25 kg/25 litre (cement/fertilizer bag exception up to 50kg not met).',
    };
  }
  if (c.isIndustrialConsumer || c.isInstitutionalConsumer) {
    return {
      applicable: false,
      exemptionReason: 'Rule 3(b) — commodity is meant for an industrial or institutional consumer.',
    };
  }

  // Rule 26 — blanket exemptions from the entire Rules (applies only "if sold by weight or measure")
  const isCountable = c.physicalForm === 'countable' || ['unit', 'units', 'n', 'u', 'piece', 'pieces', 'nos', 'no'].includes((c.netQuantityUnit || '').toLowerCase());
  if (!isCountable && c.netQuantityValue != null && c.netQuantityUnit) {
    const isWeightOrVolume = ['g', 'kg', 'ml', 'l'].includes((c.netQuantityUnit || '').toLowerCase());
    if (isWeightOrVolume) {
      const norm = normalizeToGramsOrMl(c.netQuantityValue, c.netQuantityUnit);
      if (norm <= 10) {
        return {
          applicable: false,
          exemptionReason: 'Rule 26(a) — net weight/measure is 10g/10ml or less (sold by weight or measure).',
        };
      }
    }
  }
  if (c.isFastFoodByRestaurantOrHotel) {
    return { applicable: false, exemptionReason: 'Rule 26(b) — fast food packed by a restaurant/hotel.' };
  }
  if (c.isDrugsPriceControlFormulation) {
    return {
      applicable: false,
      exemptionReason: 'Rule 26(c) — scheduled/non-scheduled formulation under the Drugs (Price Control) Order, 1995.',
    };
  }
  if (c.isAgriculturalProduceOver50kg) {
    return { applicable: false, exemptionReason: 'Rule 26(d) — agricultural farm produce in packages above 50 kg.' };
  }

  return { applicable: true, exemptionReason: null };
}

/* ==================================================================
 * SECTION 2 — Mandatory declarations (Rule 6)
 * ================================================================== */
function checkMandatoryDeclarations(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const d = pkg.declarations || {};
  const isFiveCcOrLess = (c.packageCapacityCC || Infinity) <= 5;

  // 6(1)(a) — manufacturer / packer / importer name & address
  if (!c.isFoodArticle) {
    // Explanation III: food articles follow PFA Act instead
    const hasManufacturer = !!(d.manufacturer && d.manufacturer.present);
    const hasPacker = !!(d.packer && d.packer.present);
    const hasImporter = !!(d.importer && d.importer.present);

    if (isFiveCcOrLess) {
      const hasIdentifyingMark = d.manufacturer?.mark || d.packer?.mark || d.importer?.mark;
      if (!hasIdentifyingMark) {
        v.push(
          violation(
            'Rule 10(1) proviso',
            'Package ≤5cc must at least bear an identifying mark/inscription for manufacturer, packer, or importer.',
            'critical',
            'manufacturer'
          )
        );
      }
    } else {
      if (!hasManufacturer) {
        v.push(violation('Rule 6(1)(a)', 'Missing name & address of the manufacturer.', 'critical', 'manufacturer'));
      } else if (!d.manufacturer.address) {
        v.push(violation('Rule 6(1)(a) / Rule 10(1)', 'Manufacturer name present but complete address missing.', 'critical', 'manufacturer'));
      }
      if (c.manufacturerIsNotPacker && !hasPacker) {
        v.push(violation('Rule 6(1)(a)', 'Manufacturer is not the packer — packer name & address must also be declared.', 'critical', 'packer'));
      }
      if (c.isImportedPackage && !hasImporter) {
        v.push(violation('Rule 6(1)(a)', 'Imported package missing importer name & address.', 'critical', 'importer'));
      }
      if (c.isImportedPackage && c.manufacturedOutsideIndiaButPackedInIndia && !hasPacker && !hasImporter) {
        v.push(
          violation(
            'Rule 10(1) proviso 2',
            'Commodity manufactured outside India and packed in India must show packer\'s or importer\'s complete Indian address on the PDP.',
            'critical',
            'packer'
          )
        );
      }
    }
  }

  // 6(1)(b) — common/generic name, and per-product breakdown for multi-product packs
  if (!d.commodityName || !d.commodityName.present) {
    v.push(violation('Rule 6(1)(b)', 'Missing common/generic name of the commodity.', 'critical', 'commodityName'));
  }
  if (c.isMultiProductPackage && !d.commodityName?.perProductBreakdown) {
    v.push(
      violation(
        'Rule 6(1)(b)',
        'Multi-product package must declare name and number/quantity of each product.',
        'critical',
        'commodityName'
      )
    );
  }

  // 6(1)(c) — net quantity
  if (!d.netQuantity || !d.netQuantity.present) {
    v.push(violation('Rule 6(1)(c)', 'Missing net quantity declaration.', 'critical', 'netQuantity'));
  }

  // 6(1)(d) — month & year of manufacture/pre-packing/import
  const exemptFromDateDeclaration =
    c.isBidiOrIncenseStick ||
    (c.isLPGCylinder && (c.lpgWeightKg === 14.2 || c.lpgWeightKg === 5) && c.isPublicSectorUndertaking) ||
    c.isFoodArticle || // PFA Act applies instead
    c.isSeedUnderSeedsAct;
  if (!exemptFromDateDeclaration) {
    if (!d.mfgDate || !d.mfgDate.present) {
      v.push(violation('Rule 6(1)(d)', 'Missing month & year of manufacture/pre-packing/import.', 'critical', 'mfgDate'));
    } else if (d.mfgDate.usedIndividualSticker && !d.mfgDate.isMrpReductionSticker) {
      v.push(
        violation(
          'Rule 6(3)',
          'Individual stickers may not be used to alter/make the date declaration.',
          'critical',
          'mfgDate'
        )
      );
    }
  }

  // 6(1)(e) — retail sale price (MRP)
  const exemptFromMRP =
    c.isBidiPackage || (c.isLPGCylinder && c.priceUnderAdministrativePriceMechanism);
  if (!exemptFromMRP) {
    if (!d.mrp || !d.mrp.present) {
      v.push(violation('Rule 6(1)(e)', 'Missing Retail Sale Price (MRP) declaration.', 'critical', 'mrp'));
    } else if (!d.mrp.inclusiveOfTaxesStated) {
      v.push(
        violation(
          'Rule 2(m)',
          'MRP must be declared as "Maximum/Max. retail price ... inclusive of all taxes" or "MRP Rs.../₹... incl. of all taxes".',
          'major',
          'mrp'
        )
      );
    }
    if (c.isAlcoholicBeverage && !c.stateExciseLawsRequireRSP) {
      // Fine per PDF proviso: state excise applies; if it doesn't require RSP, these rules do.
      // No extra violation here beyond the standard MRP check above.
    }
  }
  if (d.mrp?.stickerReducedMrp && d.mrp?.stickerCoversOriginalMrp) {
    v.push(
      violation(
        'Rule 6(3) proviso',
        'A sticker reducing MRP must not cover the original manufacturer/packer MRP declaration.',
        'critical',
        'mrp'
      )
    );
  }

  // 6(1)(f) — dimensions, where relevant
  if (c.dimensionsAreRelevant && (!d.dimensions || !d.dimensions.present)) {
    v.push(violation('Rule 6(1)(f)', 'Dimensions of the commodity are relevant but not declared.', 'major', 'dimensions'));
  }
  if (c.dimensionsAreRelevant && c.hasMultiplePiecesDifferentDimensions && !d.dimensions?.perPieceDeclared) {
    v.push(
      violation(
        'Rule 6(1)(f)',
        'Package contains pieces of different dimensions — each piece\'s dimension must be separately declared.',
        'major',
        'dimensions'
      )
    );
  }

  // 6(2) — consumer care details
  if (!d.consumerCare || !d.consumerCare.present) {
    v.push(
      violation(
        'Rule 6(2)',
        'Missing name, address, telephone number (and e-mail, if available) for consumer complaints.',
        'critical',
        'consumerCare'
      )
    );
  }

  // 6(5) — multi-component commodity packed in 2+ units
  if (c.isMultiComponentInSeparateUnits && !d.multiComponentDeclarationHandled) {
    v.push(
      violation(
        'Rule 6(5)',
        'Multi-component commodity packed in separate units must carry the required declaration on the main package (with info about accompanying packages) or on each individual package with intimation on the main package. If sold as spare parts, all declarations must appear on each package.',
        'major',
        'declarations'
      )
    );
  }

  return v;
}

/* ==================================================================
 * SECTION 3 — Principal Display Panel & font size (Rule 7)
 * ================================================================== */
function checkPDPAndFontSize(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const m = pkg.labelMetrics || {};

  // Rule 7(4) exception — skip entirely if another law already governs this info
  if (c.declarationGovernedByOtherLaw) return v;

  const declaredByWeightOrVolume = ['g', 'kg', 'ml', 'l'].includes((c.netQuantityUnit || '').toLowerCase());
  const referenceQty = declaredByWeightOrVolume ? c.netQuantityValue : m.pdpAreaCm2;
  const referenceUnit = declaredByWeightOrVolume ? c.netQuantityUnit : 'cm2';

  if (referenceQty != null && m.numeralHeightMm) {
    const requiredMinMm = getMinNumeralHeightMm(
      referenceQty,
      referenceUnit,
      !!m.isBlownFormedMoldedEmbossedOrPerforated
    );
    ['rsp', 'netQty'].forEach((field) => {
      const actual = m.numeralHeightMm[field];
      if (actual == null) return;
      if (requiredMinMm != null && actual < requiredMinMm) {
        v.push(
          violation(
            'Rule 7(2)',
            `${field === 'rsp' ? 'MRP' : 'Net quantity'} numeral height is ${actual}mm; minimum required is ${requiredMinMm}mm for this quantity band.`,
            'major',
            field
          )
        );
      }
      // Absolute floor per Rule 7(3)
      const absoluteFloor = m.isBlownFormedMoldedEmbossedOrPerforated ? 2 : 1;
      if (actual < absoluteFloor) {
        v.push(
          violation(
            'Rule 7(3)',
            `${field === 'rsp' ? 'MRP' : 'Net quantity'} numeral height ${actual}mm is below the absolute minimum of ${absoluteFloor}mm.`,
            'major',
            field
          )
        );
      }
    });
  }

  // Rule 7(3) proviso — width >= 1/3 height (except numeral '1' and letters i, I, l)
  if (m.numeralWidthMm && m.numeralHeightMm) {
    ['rsp', 'netQty'].forEach((field) => {
      const w = m.numeralWidthMm[field];
      const h = m.numeralHeightMm[field];
      if (w == null || h == null) return;
      if (w < h / 3 && !m.isExemptCharacterShape) {
        v.push(
          violation(
            'Rule 7(3) proviso',
            `${field === 'rsp' ? 'MRP' : 'Net quantity'} numeral width (${w}mm) is less than one-third of its height (${h}mm).`,
            'minor',
            field
          )
        );
      }
    });
  }

  return v;
}

/* ==================================================================
 * SECTION 4 — Manner & placement of declarations (Rules 8, 9)
 * ================================================================== */
function checkMannerAndPlacement(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const m = pkg.labelMetrics || {};

  // Rule 8(1) — declarations on PDP, with clear space around quantity declaration
  if (m.quantityDeclarationSurroundingAreaHasPrintedInfo) {
    v.push(
      violation(
        'Rule 8(1) proviso',
        'Area surrounding the quantity declaration is not free of other printed information (must be clear above/below by ≥ numeral height, left/right by ≥ 2x numeral height).',
        'minor',
        'netQuantity'
      )
    );
  }

  // Rule 8(2) — returnable beverage bottle exception
  if (c.isReturnableBeverageBottle) {
    if (!m.rspOnCrownCapOrBottle) {
      v.push(
        violation(
          'Rule 8(2)',
          'Returnable soft-drink/beverage bottle must show RSP on the crown cap or the bottle (or both), in the form "MRP Rs..../₹...".',
          'major',
          'mrp'
        )
      );
    }
  }

  // Rule 9(1)(a) — legible & prominent (subjective; flagged if explicitly marked illegible)
  if (m.legibilityIssue) {
    v.push(violation('Rule 9(1)(a)', 'Declaration is not legible/prominent.', 'major', 'general'));
  }

  // Rule 9(1)(b) — RSP & net quantity numerals must contrast with background
  if (m.contrastOk === false && !m.isBlownFormedMoldedOnGlassOrPlastic) {
    v.push(
      violation(
        'Rule 9(1)(b)',
        'RSP/net quantity numerals do not contrast conspicuously with the label background.',
        'major',
        'general'
      )
    );
  }

  // Rule 9(1)(b) proviso (b) — handwritten declarations must be clear/unambiguous/legible
  if (m.isHandwrittenOrHandScript && !m.handwritingIsClearUnambiguousLegible) {
    v.push(
      violation(
        'Rule 9(1)(b) proviso',
        'Hand-written/hand-script declaration is not clear, unambiguous, and legible.',
        'major',
        'general'
      )
    );
  }

  // Rule 9(2) — no declaration readable only through a liquid commodity
  if (m.declarationOnlyReadableThroughLiquid) {
    v.push(
      violation(
        'Rule 9(2)',
        'Declaration is only readable by looking through the liquid commodity — not permitted.',
        'major',
        'general'
      )
    );
  }

  // Rule 9(3) — outer container/wrapper must repeat declarations
  if (c.hasOutsideContainerOrWrapper) {
    const transparentAndReadable = m.wrapperTransparentAndDeclarationsReadableThrough;
    const innerHasNoOuterCoverDeclaration = m.innerPackageHasNoOuterCoverDeclaration;
    if (!transparentAndReadable && !innerHasNoOuterCoverDeclaration && !m.outerContainerHasAllDeclarations) {
      v.push(
        violation(
          'Rule 9(3)',
          'Outer container/wrapper does not repeat all required declarations (and is not transparent with readable inner declarations).',
          'major',
          'general'
        )
      );
    }
  }

  // Rule 9(4) — Hindi (Devnagri) or English
  const langs = (m.languageUsed || []).map((l) => l.toLowerCase());
  if (langs.length > 0 && !langs.includes('hindi') && !langs.includes('english')) {
    v.push(
      violation(
        'Rule 9(4)',
        'Declarations must be in Hindi (Devnagri script) or English (other languages may be used in addition, not instead).',
        'critical',
        'general'
      )
    );
  }

  return v;
}

/* ==================================================================
 * SECTION 5 — Quantity declaration: general provisions (Rule 11)
 * ================================================================== */
function checkQuantityGeneralProvisions(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const d = pkg.declarations || {};

  if (!d.netQuantity || !d.netQuantity.qualifiedWhenPacked) return v;

  const category = (c.category || '').toLowerCase();
  const isThirdScheduleItem = THIRD_SCHEDULE.some((item) => category.includes(item.split(' ')[0]));

  if (!isThirdScheduleItem) {
    v.push(
      violation(
        'Rule 11(2)/(3)/(4)',
        `"When packed" qualifier used on net quantity, but "${c.category}" is not listed in the Third Schedule (only soaps, lotions, and cream [other than cream of milk] may use this qualifier).`,
        'critical',
        'netQuantity'
      )
    );
  }

  return v;
}

/* ==================================================================
 * SECTION 6 — Manner of quantity declaration (Rule 12)
 * ================================================================== */
const PROHIBITED_QUANTITY_WORDS = ['minimum', 'not less than', 'average', 'about', 'approximately'];

function checkQuantityMannerAndUnits(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const d = pkg.declarations || {};

  // Rule 12(6) — no exaggerated/misleading/inadequate wording
  const rawText = (d.netQuantity?.rawText || '').toLowerCase();
  const foundProhibited = PROHIBITED_QUANTITY_WORDS.find((w) => rawText.includes(w));
  if (foundProhibited) {
    v.push(
      violation(
        'Rule 12(6)',
        `Quantity declaration contains prohibited/misleading wording: "${foundProhibited}".`,
        'critical',
        'netQuantity'
      )
    );
  }

  // Rule 12(2) — unit of declaration; Fourth Schedule overrides the default scheme
  const category = (c.category || '').toLowerCase();
  const fourthScheduleEntry = Object.keys(FOURTH_SCHEDULE).find((k) => category.includes(k.split(',')[0].split('(')[0].trim()));
  if (fourthScheduleEntry) {
    const requiredUnitKind = FOURTH_SCHEDULE[fourthScheduleEntry];
    if (d.netQuantity?.unitKind && d.netQuantity.unitKind !== requiredUnitKind) {
      v.push(
        violation(
          'Rule 12(2) / Fourth Schedule',
          `"${c.category}" must be declared in unit-kind "${requiredUnitKind}" per the Fourth Schedule; found "${d.netQuantity.unitKind}".`,
          'major',
          'netQuantity'
        )
      );
    }
  } else {
    // Default scheme, sub-rule (2)(a)-(e)
    const expectedByPhysicalForm = {
      solid: 'mass',
      semi_solid: 'mass',
      viscous: 'mass',
      solid_liquid_mixture: 'mass',
      linear: 'length',
      area: 'area',
      liquid: 'volume',
      cubic: 'volume',
      countable: 'number',
    };
    const expected = expectedByPhysicalForm[c.physicalForm];
    if (expected && d.netQuantity?.unitKind && d.netQuantity.unitKind !== expected) {
      v.push(
        violation(
          'Rule 12(2)',
          `Physical form "${c.physicalForm}" requires unit-kind "${expected}"; found "${d.netQuantity.unitKind}".`,
          'major',
          'netQuantity'
        )
      );
    }
  }

  // Rule 12(4) — dimensions/number declaration when weight/measure/number alone is insufficient
  if (c.weightAloneInsufficientForConsumerInfo && !d.dimensions?.present) {
    v.push(
      violation(
        'Rule 12(4)',
        'Weight/measure/number declaration alone does not give full information on dimensions/number — an accompanying declaration is required.',
        'major',
        'dimensions'
      )
    );
  }

  // Rule 12(7) — ≤5cc quantity declaration must be on a tag/card/tape device
  if ((c.packageCapacityCC || Infinity) <= 5 && !d.netQuantity?.onTagCardOrTapeDevice) {
    v.push(
      violation(
        'Rule 12(7)',
        'Packages of capacity ≤5cc must have the quantity declaration on a tag/card/tape/similar device affixed so it cannot be removed without opening the container.',
        'major',
        'netQuantity'
      )
    );
  }

  // Rule 13(4) — no dozen/score/gross/great gross
  const bannedCounts = ['dozen', 'score', 'gross', 'great gross'];
  if (bannedCounts.some((w) => rawText.includes(w))) {
    v.push(
      violation(
        'Rule 13(4)',
        'Package uses a non-SI count word (dozen/score/gross/great gross) — not permitted.',
        'major',
        'netQuantity'
      )
    );
  }

  // Rule 13(5) — SI units only; number symbol must be N or U
  if (d.netQuantity?.unitKind === 'number' && d.netQuantity?.symbolUsed && !['N', 'U'].includes(d.netQuantity.symbolUsed)) {
    v.push(
      violation(
        'Rule 13(5)(ii)',
        `Items sold by number must use symbol "N" or "U"; found "${d.netQuantity.symbolUsed}".`,
        'minor',
        'netQuantity'
      )
    );
  }

  return v;
}

/* ==================================================================
 * SECTION 7 — Dimension & sheet-count declarations (Rules 14-17)
 * ================================================================== */
function checkDimensionAndSheetDeclarations(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const d = pkg.declarations || {};

  const rule14Categories = [
    'bed-sheet', 'hemmed fabric', 'dhoti', 'saree', 'napkin', 'pillow-cover', 'towel', 'table cloth',
  ];
  if (rule14Categories.some((cat) => (c.category || '').toLowerCase().includes(cat))) {
    if (!d.dimensions?.present || !d.dimensions?.numberOfPiecesDeclared) {
      v.push(
        violation(
          'Rule 14',
          'Fabric-type commodity must declare the number and finished-size dimensions of pieces.',
          'major',
          'dimensions'
        )
      );
    }
    if (c.hasMultiplePiecesDifferentDimensions) {
      if (!d.dimensions?.perPieceDimensionAndRSP) {
        v.push(
          violation(
            'Rule 14 proviso',
            'Package has pieces of different dimensions — dimension and RSP of each piece must be declared and marked on each individual piece.',
            'major',
            'dimensions'
          )
        );
      }
    }
  }

  if (c.priceRelatedToDimensionsOrWeight && !d.dimensions?.present) {
    v.push(
      violation(
        'Rule 15',
        'Dimensions/weight have a relationship to price — the quantity declaration must include such dimensions/weight/combination.',
        'major',
        'dimensions'
      )
    );
  }

  const sheetCategories = ['aluminium foil', 'aluminum foil', 'facial tissue', 'waxed paper', 'toilet paper'];
  if (sheetCategories.some((cat) => (c.category || '').toLowerCase().includes(cat)) || c.isSheetTypeCommodity) {
    if (!d.sheetCount || !d.sheetCount.present) {
      v.push(violation('Rule 16', 'Sheet-type commodity missing declaration of number of usable sheets.', 'major', 'sheetCount'));
    }
    if (!d.sheetCount?.dimensionsPerSheet) {
      v.push(violation('Rule 16', 'Sheet-type commodity missing per-sheet dimensions.', 'major', 'sheetCount'));
    }
  }

  if (c.isContainerTypeCommodity) {
    const shape = c.containerShape; // 'bag' | 'rect' | 'round'
    if (shape === 'bag' && (!d.dimensions?.numberOfBags || !d.dimensions?.linearDimensions)) {
      v.push(violation('Rule 17(i)', 'Bag-type container commodity missing number of bags + linear dimensions.', 'major', 'dimensions'));
    }
    if (shape === 'rect' && (!d.dimensions?.numberOfContainers || !d.dimensions?.lengthWidthDepth)) {
      v.push(violation('Rule 17(ii)', 'Rectangular container commodity missing number + length/width/(depth).', 'major', 'dimensions'));
    }
    if (shape === 'round' && (!d.dimensions?.numberOfContainers || !d.dimensions?.diameter)) {
      v.push(violation('Rule 17(iii)', 'Round container commodity missing number + diameter/(depth).', 'major', 'dimensions'));
    }
    if (c.containerCapacityLinkedToLabelReference && !d.dimensions?.standardCapacityReferenceIncluded) {
      v.push(
        violation(
          'Rule 17(iv)',
          'Container\'s standard weight/measure capability reference must be included in the quantity declaration.',
          'minor',
          'dimensions'
        )
      );
    }
  }

  return v;
}

/* ==================================================================
 * SECTION 8 — Standard package sizes (Rule 5, Second Schedule)
 * ================================================================== */
function checkStandardPackageSize(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const d = pkg.declarations || {};

  const entry = SECOND_SCHEDULE[(c.category || '').toLowerCase()];
  if (!entry) return v; // commodity not covered by the Second Schedule

  // Second Schedule sizes are recorded in g or ml — normalize the
  // declared quantity to the same base unit before comparing, so
  // e.g. "1kg" correctly matches the schedule's "1000" (g) entry.
  const isGramOrMlSchedule = entry.unit === 'g' || entry.unit === 'ml' || entry.unit === 'g_or_ml';
  const qty = isGramOrMlSchedule ? normalizeToGramsOrMl(c.netQuantityValue, c.netQuantityUnit) : c.netQuantityValue;
  const inSchedule =
    entry.fixedSizes.includes(qty) ||
    (entry.thereafterMultipleOf &&
      qty > Math.max(...entry.fixedSizes) &&
      qty % entry.thereafterMultipleOf === 0 &&
      (!entry.thereafterUpTo || qty <= entry.thereafterUpTo));

  if (!inSchedule) {
    if (!d.standardPackDeclaration || !d.standardPackDeclaration.present) {
      v.push(
        violation(
          'Rule 5 proviso',
          `Package size (${c.netQuantityValue}${c.netQuantityUnit} = ${qty}${entry.unit === 'g_or_ml' ? 'g/ml' : entry.unit}) is not a Second Schedule standard size for "${c.category}", and the label does not carry the required "Not a standard pack size" / "non standard size under the Legal Metrology (packaged Commodities) Rules, 2011" declaration.`,
          'critical',
          'netQuantity'
        )
      );
    }
  }

  return v;
}

/* ==================================================================
 * SECTION 9 — Maximum Permissible Error / lot testing (Rules 19, 22)
 * ================================================================== */
function checkMaximumPermissibleError(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const samples = pkg.quantitySamples || [];

  if (samples.length === 0) return v; // no lot sample data provided — cannot test

  const mpe = getMPEFromFirstSchedule(c.netQuantityValue, c.netQuantityUnit);
  if (!mpe) return v;

  const declared = c.netQuantityValue;
  const measurements = samples.map((s) => s.measuredQty);
  const average = measurements.reduce((a, b) => a + b, 0) / measurements.length;

  // Rule 19(4)(a) / 19(6)(a) — statistical average must be >= declared quantity
  if (average < declared) {
    v.push(
      violation(
        'Rule 19(4)(a) / 19(6)(a)',
        `Statistical average of sampled net quantity (${average.toFixed(2)}) is less than the declared quantity (${declared}).`,
        'critical',
        'netQuantity'
      )
    );
  }

  // Rule 19(4)(b) / 19(6)(b) / 22 — no single sample's deficiency may exceed MPE
  const isExemptWhenPacked = c.netQuantityQualifiedWhenPacked && c.deficiencyDueToEnvironmentalConditions;
  samples.forEach((s, idx) => {
    const deficiency = declared - s.measuredQty;
    if (deficiency <= 0) return; // no deficiency (or a surplus) — fine
    const allowedDeficiency =
      mpe.type === 'fixed' ? mpe.value : declared * (mpe.value / 100);
    if (deficiency > allowedDeficiency && !isExemptWhenPacked) {
      v.push(
        violation(
          'Rule 19(4)(b) / Rule 22',
          `Sample #${idx + 1} deficiency of ${deficiency.toFixed(2)} exceeds the Maximum Permissible Error of ${allowedDeficiency.toFixed(2)} for this declared quantity.`,
          'critical',
          'netQuantity'
        )
      );
    }
  });

  return v;
}

/* ==================================================================
 * SECTION 10 — Wholesale package declarations (Rule 24)
 * ================================================================== */
function checkWholesalePackage(pkg) {
  const v = [];
  const c = pkg.commodity || {};
  const d = pkg.declarations || {};

  if (!c.isWholesalePackage) return v;
  if (c.similarDeclarationRequiredByOtherLaw) return v; // Rule 24 proviso

  if (!d.manufacturer?.present && !d.importer?.present && !d.packer?.present) {
    v.push(violation('Rule 24(a)', 'Wholesale package missing name & address of manufacturer/importer/packer.', 'critical', 'manufacturer'));
  }
  if (!d.commodityName?.present) {
    v.push(violation('Rule 24(b)', 'Wholesale package missing identity of the commodity contained.', 'critical', 'commodityName'));
  }
  if (!pkg.wholesale || (pkg.wholesale.retailPackageCount == null && pkg.wholesale.netQuantity == null)) {
    v.push(
      violation(
        'Rule 24(c)',
        'Wholesale package missing total number of retail packages, or net quantity in standard units.',
        'critical',
        'netQuantity'
      )
    );
  }

  return v;
}

/* ==================================================================
 * SECTION 11 — Export packages (Rule 25)
 * ================================================================== */
function checkExportPackage(pkg) {
  const v = [];
  const c = pkg.commodity || {};

  if (c.isExportPackage && c.soldInIndia && !c.repackedOrRelabeledPerChapterII) {
    v.push(
      violation(
        'Rule 25',
        'Export package sold in India without being re-packed/re-labeled per Chapter II — liable to seizure.',
        'critical',
        'general'
      )
    );
  }
  return v;
}

/* ==================================================================
 * MASTER RUNNER
 * ================================================================== */
function runComplianceCheck(pkg) {
  const { applicable, exemptionReason } = checkApplicability(pkg);
  if (!applicable) {
    return { applicable: false, exemptionReason, violations: [], compliant: true };
  }

  const violations = [
    ...checkMandatoryDeclarations(pkg),
    ...checkPDPAndFontSize(pkg),
    ...checkMannerAndPlacement(pkg),
    ...checkQuantityGeneralProvisions(pkg),
    ...checkQuantityMannerAndUnits(pkg),
    ...checkDimensionAndSheetDeclarations(pkg),
    ...checkStandardPackageSize(pkg),
    ...checkMaximumPermissibleError(pkg),
    ...checkWholesalePackage(pkg),
    ...checkExportPackage(pkg),
  ];

  return {
    applicable: true,
    exemptionReason: null,
    violations,
    compliant: violations.length === 0,
    summary: {
      total: violations.length,
      critical: violations.filter((x) => x.severity === 'critical').length,
      major: violations.filter((x) => x.severity === 'major').length,
      minor: violations.filter((x) => x.severity === 'minor').length,
    },
  };
}

module.exports = {
  checkApplicability,
  checkMandatoryDeclarations,
  checkPDPAndFontSize,
  checkMannerAndPlacement,
  checkQuantityGeneralProvisions,
  checkQuantityMannerAndUnits,
  checkDimensionAndSheetDeclarations,
  checkStandardPackageSize,
  checkMaximumPermissibleError,
  checkWholesalePackage,
  checkExportPackage,
  runComplianceCheck,
};