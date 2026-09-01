import Groq from "groq-sdk";
import {
  DECLARATIONS,
  FORMAT_RULES,
  SCOPE_GATES,
  buildSystemPrompt,
} from "./legalMetrologyChecklist.js";

// The whole point of this pipeline: no chunking, no vector search, no
// retrieval step. The complete raw listing text is sent to the LLM in a
// single call, and the LLM does the "retrieval" itself by reading the
// whole page and filling out a structured report against the checklist
// baked into the system prompt (legalMetrologyChecklist.js).

let client = null;
function getClient() {
  if (!client) {
    if (!process.env.GROQ_API_KEY) {
      throw new Error(
        "GROQ_API_KEY is not set. Add it to local-scraper/.env before running a compliance check."
      );
    }
    client = new Groq({ apiKey: process.env.GROQ_API_KEY });
  }
  return client;
}

// Any current Groq model with solid tool-calling support works here.
// Groq deprecated its Llama chat models (llama-3.3-70b-versatile,
// llama-3.1-8b-instant), so openai/gpt-oss-120b is the default now — it
// supports function calling and structured outputs. Override via .env if
// you'd rather use something else (e.g. openai/gpt-oss-20b for a smaller/
// cheaper model, or moonshotai/kimi-k2-instruct). Check
// https://console.groq.com/docs/models for what's currently live —
// Groq's lineup changes more often than most providers'.
const MODEL = process.env.GROQ_MODEL || "openai/gpt-oss-120b";

// Groq's tool-call JSON-schema validation is stricter than Anthropic's about
// type unions, so nullable fields are modeled as plain strings ("" = not
// found) rather than type: ["string", "null"], and normalized back to null
// in enrichReport() below.
const REPORT_TOOL = {
  type: "function",
  function: {
    name: "legal_metrology_report",
    description:
      "Structured Legal Metrology compliance report extracted from a single product listing's raw text.",
    parameters: {
      type: "object",
      additionalProperties: false,
      required: ["scope", "declarations", "formatChecks", "overallStatus", "summary"],
      properties: {
        scope: {
          type: "object",
          additionalProperties: false,
          required: ["excluded", "exclusionReason", "partialExemption", "notes"],
          properties: {
            excluded: { type: "boolean" },
            exclusionReason: {
              type: "string",
              enum: [...SCOPE_GATES.map((g) => g.key), ""],
              description: "Key of the matching scope gate, or empty string if none apply.",
            },
            partialExemption: {
              type: "boolean",
              description: "True only for the 10-20 g/ml partial-exemption gate.",
            },
            notes: { type: "string" },
          },
        },
        declarations: {
          type: "array",
          items: {
            type: "object",
            additionalProperties: false,
            required: ["id", "key", "status", "value", "evidence", "issues"],
            properties: {
              id: { type: "integer" },
              key: {
                type: "string",
                enum: DECLARATIONS.map((d) => d.key),
              },
              value: {
                type: "string",
                description: "Exact extracted value, or empty string if not found.",
              },
              status: {
                type: "string",
                enum: ["present", "missing", "not_applicable"],
              },
              evidence: {
                type: "string",
                description:
                  "Short verbatim-adjacent snippet of the text this was pulled from, or empty string.",
              },
              issues: {
                type: "array",
                items: { type: "string" },
                description:
                  "Any format problems with this specific value, e.g. vague qualifier, wrong SI unit.",
              },
            },
          },
        },
        formatChecks: {
          type: "array",
          items: {
            type: "object",
            additionalProperties: false,
            required: ["key", "status", "details"],
            properties: {
              key: {
                type: "string",
                enum: FORMAT_RULES.map((f) => f.key),
              },
              status: {
                type: "string",
                enum: ["pass", "fail", "unknown", "not_applicable"],
              },
              details: { type: "string" },
            },
          },
        },
        overallStatus: {
          type: "string",
          enum: ["compliant", "partial", "non_compliant", "exempt"],
        },
        summary: {
          type: "string",
          description: "1-3 sentence plain-language summary of the findings.",
        },
      },
    },
  },
};

/**
 * Run the single-pass extraction: complete raw listing text in, structured
 * Legal Metrology compliance report out.
 *
 * @param {string} rawText - the full concatenated visible text of the listing
 * @param {{ url?: string, platform?: string }} [context]
 * @returns {Promise<object>} the parsed legal_metrology_report tool-call
 *   arguments, enriched with the static checklist metadata (labels/rules/
 *   descriptions) so the frontend doesn't need its own copy of the rulebook.
 */
export async function runComplianceExtraction(rawText, context = {}) {
  if (!rawText || !rawText.trim()) {
    throw new Error("runComplianceExtraction: rawText is empty — nothing to analyze.");
  }

  const groq = getClient();

  const userContent = [
    context.url ? `Listing URL: ${context.url}` : null,
    context.platform ? `Platform: ${context.platform}` : null,
    "",
    "=== RAW LISTING TEXT (verbatim, complete) ===",
    rawText,
  ]
    .filter((line) => line !== null)
    .join("\n");

  const response = await groq.chat.completions.create({
    model: MODEL,
    max_tokens: 4096,
    temperature: 0,
    messages: [
      { role: "system", content: buildSystemPrompt() },
      { role: "user", content: userContent },
    ],
    tools: [REPORT_TOOL],
    tool_choice: { type: "function", function: { name: "legal_metrology_report" } },
  });

  const toolCall = response.choices?.[0]?.message?.tool_calls?.[0];

  if (!toolCall || toolCall.function?.name !== "legal_metrology_report") {
    throw new Error("The model did not return a structured report. Try again.");
  }

  let parsed;
  try {
    parsed = JSON.parse(toolCall.function.arguments);
  } catch {
    throw new Error("The model returned malformed JSON for the compliance report.");
  }

  return enrichReport(parsed);
}

// Merges the model's findings with the static checklist metadata (label,
// rule citation, description) so every consumer of this report — the API
// response, the frontend table — has everything in one object without
// re-importing the checklist module. Also normalizes Groq's "" (empty
// string = not found) sentinel back into null.
function enrichReport(report) {
  const declarationById = new Map(DECLARATIONS.map((d) => [d.key, d]));
  const formatById = new Map(FORMAT_RULES.map((f) => [f.key, f]));
  const gateById = new Map(SCOPE_GATES.map((g) => [g.key, g]));

  const orNull = (v) => (v === "" || v === undefined ? null : v);

  return {
    ...report,
    scope: {
      ...report.scope,
      exclusionReason: orNull(report.scope?.exclusionReason),
      exclusionGate: report.scope?.exclusionReason
        ? gateById.get(report.scope.exclusionReason) || null
        : null,
    },
    declarations: (report.declarations || []).map((d) => ({
      ...declarationById.get(d.key),
      ...d,
      value: orNull(d.value),
      evidence: orNull(d.evidence),
      found: d.status === "present",
    })),
    formatChecks: (report.formatChecks || []).map((f) => ({
      ...formatById.get(f.key),
      ...f,
    })),
  };
}
