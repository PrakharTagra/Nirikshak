/**
 * Legal Metrology (Packaged Commodities) Rules, 2011 — checklist used to
 * drive the LLM extraction pipeline in llmCompliance.js.
 *
 * This file is the single source of truth for:
 *   1. the declarations/format-rules/scope-gates shown to the model in the
 *      system prompt, and
 *   2. the JSON schema the model is forced to answer with (via tool use),
 *
 * so the prompt and the parser can never drift out of sync with each other.
 */

// ---------------------------------------------------------------------------
// 1. Scope gates (Rule 3, Rule 26) — checked BEFORE the declaration checklist
// ---------------------------------------------------------------------------
export const SCOPE_GATES = [
  {
    key: "institutional_industrial",
    label: "Institutional/industrial consumer purchase",
    effect: "not_applicable",
    description:
      "Package is sold to an institutional or industrial consumer rather than a retail consumer.",
  },
  {
    key: "net_qty_le_10",
    label: "Net quantity ≤ 10 g / 10 ml",
    effect: "fully_exempt",
    description: "Packages at or below 10 g or 10 ml are fully exempt from Rule 6.",
  },
  {
    key: "net_qty_10_to_20",
    label: "Net quantity 10–20 g / 10–20 ml",
    effect: "partial_exemption",
    description:
      "Only MRP and net quantity are required declarations; the rest of the Rule 6 checklist does not apply.",
  },
  {
    key: "fast_food",
    label: "Fast food sold by restaurants/hotels",
    effect: "not_applicable",
    description: "Freshly prepared fast food sold directly by a restaurant or hotel.",
  },
  {
    key: "dpco_formulation",
    label: "DPCO-1995-covered formulation",
    effect: "not_applicable",
    description: "Drug formulation covered by the Drugs (Prices Control) Order, 1995.",
  },
  {
    key: "farm_produce_over_50kg",
    label: "Agricultural farm produce over 50 kg",
    effect: "not_applicable",
    description: "Agricultural farm produce packed in quantities greater than 50 kg.",
  },
];

// ---------------------------------------------------------------------------
// 2. Mandatory declarations on every package (Rule 6)
// ---------------------------------------------------------------------------
export const DECLARATIONS = [
  {
    id: 1,
    key: "manufacturer_packer_importer",
    label: "Manufacturer's name & address",
    rule: "Rule 6(1)(a), Rule 10",
    description:
      "Manufacturer's name & address — plus packer's name/address if different, and importer's name/address if imported.",
  },
  {
    id: 2,
    key: "common_generic_name",
    label: "Common/generic name of the commodity",
    rule: "Rule 6(1)(b)",
    description: "The common or generic name of the commodity.",
  },
  {
    id: 3,
    key: "net_quantity",
    label: "Net quantity in standard units",
    rule: "Rule 6(1)(c)",
    description: "Net quantity in standard units — weight, volume, length, area, or number.",
  },
  {
    id: 4,
    key: "manufacture_date",
    label: "Month & year of manufacture / pre-packing / import",
    rule: "Rule 6(1)(d)",
    description: "Month and year of manufacture, pre-packing, or import.",
  },
  {
    id: 5,
    key: "mrp",
    label: "Retail Sale Price (MRP), inclusive of all taxes",
    rule: "Rule 6(1)(e), Rule 2(m)",
    description: "Maximum Retail Price, inclusive of all taxes.",
  },
  {
    id: 6,
    key: "dimensions",
    label: "Dimensions",
    rule: "Rule 6(1)(f)",
    description: "Dimensions — where size is relevant to the commodity.",
  },
  {
    id: 7,
    key: "consumer_complaint_contact",
    label: "Consumer complaint contact",
    rule: "Rule 6(2)",
    description: "Consumer complaint contact — name, address, phone, email if available.",
  },
];

// ---------------------------------------------------------------------------
// 3. Format / presentation rules that ride along with the declarations
// ---------------------------------------------------------------------------
export const FORMAT_RULES = [
  {
    key: "definite_plain_conspicuous",
    label: "Declarations are definite, plain and conspicuous",
    rule: "Rule 7",
    description:
      "No vague qualifiers like \"minimum\", \"about\", \"approximately\" are allowed for numerals.",
  },
  {
    key: "numeral_height",
    label: "Numeral height on the Principal Display Panel",
    rule: "Rule 7(2), Tables I & II",
    description:
      "Minimum numeral height thresholds depending on net quantity/area — only checkable from a physical/image inspection, not listing text.",
  },
  {
    key: "single_sticker_mrp",
    label: "Only one sticker permitted to reduce MRP",
    rule: "Rule 6(3)-(4)",
    description:
      "Stickers cannot be used to alter or fabricate a required declaration, and only one sticker is allowed to reduce MRP.",
  },
  {
    key: "si_units",
    label: "Units follow SI conventions",
    rule: "Rule 13",
    description: "E.g. grams below 1 kg, kilograms at or above 1 kg.",
  },
  {
    key: "banned_counting_terms",
    label: "Banned counting terms",
    rule: "Rule 13(4)",
    description: '"Dozen", "score", "gross", "great gross" style counting terms are banned.',
  },
];

// ---------------------------------------------------------------------------
// 4. System prompt builder
// ---------------------------------------------------------------------------
export function buildSystemPrompt() {
  const gates = SCOPE_GATES.map(
    (g) => `- ${g.label} → ${g.effect.replace(/_/g, " ")}. ${g.description}`
  ).join("\n");

  const decls = DECLARATIONS.map(
    (d) => `${d.id}. [${d.key}] ${d.label} (${d.rule}) — ${d.description}`
  ).join("\n");

  const formats = FORMAT_RULES.map(
    (f) => `- [${f.key}] ${f.label} (${f.rule}) — ${f.description}`
  ).join("\n");

  return `You are a Legal Metrology (Packaged Commodities) Rules, 2011 compliance
auditor for e-commerce product listings in India. You will be given the
complete raw text scraped from a single product listing page (title,
bullet points, description, specification tables, etc. — everything
visible on the page, concatenated). You do not get to ask follow-up
questions; work only from the text given.

STEP 1 — SCOPE GATES (Rule 3, Rule 26). Check these BEFORE the checklist:
${gates}

If a gate other than "10-20 g/ml" applies, the listing is out of scope —
set scope.excluded = true, give the matching scope.exclusionReason, and
still return the declarations array but mark every item's status as
"not_applicable" with a one-line note referencing the gate.

If the 10-20 g/ml partial exemption applies, only declarations #3 (net
quantity) and #5 (MRP) are required — mark the rest "not_applicable".

STEP 2 — MANDATORY DECLARATIONS (Rule 6), only when in scope:
${decls}

For each declaration, search the raw text for the corresponding
information. Extract the exact value as it appears (don't paraphrase
numbers or names). If you can't find it, value must be null and status
"missing". Never guess or fabricate a value that isn't actually present
in the text.

STEP 3 — FORMAT / PRESENTATION RULES that ride along with the checklist:
${formats}

Note: numeral height (Rule 7(2)) requires physical/image measurement and
can essentially never be verified from listing text alone — mark it
"unknown" unless the text explicitly states numeral sizes. For the other
format rules, flag violations you can actually see in the text (e.g. the
word "approx" next to a numeral, "per dozen" pricing, a unit written as
"1000g" instead of "1 kg").

STEP 4 — OVERALL STATUS:
- "exempt" if scope.excluded is true (full exemption or not-applicable gate)
- "compliant" if every applicable declaration is present and no format
  violations were found
- "non_compliant" if zero applicable declarations were found
- "partial" otherwise

Respond ONLY by calling the legal_metrology_report tool with your
findings. Do not add commentary outside the tool call.`;
}
