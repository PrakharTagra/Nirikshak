/**
 * providers/detection/mockDetectionProvider.js
 * Stands in for a real object-detection model (e.g. YOLOv8) that would
 * locate the Principal Display Panel (PDP) within the full package
 * photo and establish a pixel-to-mm calibration scale.
 *
 * Picks a demo scenario from the filename so the pipeline produces
 * varied, realistic-looking output without needing a trained model or
 * network access. Replace `detect()` with a real inference call for
 * production — the return shape is the contract every later stage
 * relies on.
 */

'use strict';

const SCENARIOS = {
  compliant: {
    category: 'salt',
    physicalForm: 'solid',
    pxPerMm: 12,
    isBlownFormedMoldedEmbossedOrPerforated: false,
  },
  noncompliant: {
    category: 'biscuits',
    physicalForm: 'solid',
    pxPerMm: 12,
    isBlownFormedMoldedEmbossedOrPerforated: false,
  },
  default: {
    category: 'unknown',
    physicalForm: 'solid',
    pxPerMm: 10,
    isBlownFormedMoldedEmbossedOrPerforated: false,
  },
};

function pickScenario(imagePath) {
  const lower = imagePath.toLowerCase();
  if (lower.includes('noncompliant') || lower.includes('non_compliant')) return SCENARIOS.noncompliant;
  if (lower.includes('compliant')) return SCENARIOS.compliant;
  return SCENARIOS.default;
}

async function detect(preprocessed) {
  const scenario = pickScenario(preprocessed.path);
  // A real detector would return the PDP's bounding box in pixels;
  // here we just assume the whole frame is the PDP crop for the demo.
  const pdpBoxPx = { x: 0, y: 0, width: preprocessed.width, height: preprocessed.height };
  const pdpAreaCm2 = (pdpBoxPx.width / scenario.pxPerMm / 10) * (pdpBoxPx.height / scenario.pxPerMm / 10);

  return {
    category: scenario.category,
    physicalForm: scenario.physicalForm,
    pdpBoxPx,
    pxPerMm: scenario.pxPerMm,
    pdpAreaCm2,
    isBlownFormedMoldedEmbossedOrPerforated: scenario.isBlownFormedMoldedEmbossedOrPerforated,
  };
}

module.exports = { detect };
