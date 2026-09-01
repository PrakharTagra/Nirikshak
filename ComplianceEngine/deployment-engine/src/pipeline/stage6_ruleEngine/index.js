/**
 * pipeline/stage6_ruleEngine/index.js
 * Thin re-export so the orchestrator can `require('./stage6_ruleEngine')`
 * without knowing the internal file layout. The engine itself
 * (ruleEngine.js + schedules.js) is unchanged from the standalone
 * rule-engine package delivered earlier — copied in here as this
 * pipeline's Stage 6.
 */

'use strict';

module.exports = require('./ruleEngine');
