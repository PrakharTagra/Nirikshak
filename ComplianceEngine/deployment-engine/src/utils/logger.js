/**
 * utils/logger.js
 * Minimal leveled logger — no dependency needed for a CLI/service tool.
 */

'use strict';

function timestamp() {
  return new Date().toISOString();
}

function log(level, stage, message, extra) {
  const line = `[${timestamp()}] [${level.toUpperCase()}]${stage ? ` [${stage}]` : ''} ${message}`;
  if (level === 'error') {
    console.error(line, extra !== undefined ? extra : '');
  } else {
    console.log(line, extra !== undefined ? extra : '');
  }
}

module.exports = {
  info: (stage, message, extra) => log('info', stage, message, extra),
  warn: (stage, message, extra) => log('warn', stage, message, extra),
  error: (stage, message, extra) => log('error', stage, message, extra),
};
