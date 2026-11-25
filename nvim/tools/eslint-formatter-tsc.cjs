// ESLint formatter that prints problems in tsc's "--pretty false" format,
// so Neovim's :make can read tsc and ESLint output with one errorformat:
//   src/file.ts(4,12): error Unexpected any. [@typescript-eslint/no-explicit-any]
// Used by after/ftplugin/typescript.lua.
const path = require("node:path");

module.exports = function (results) {
  const lines = [];
  for (const result of results) {
    const file = path.relative(process.cwd(), result.filePath);
    for (const msg of result.messages) {
      const type = msg.severity === 2 ? "error" : "warning";
      const rule = msg.ruleId ? ` [${msg.ruleId}]` : "";
      const text = msg.message.replace(/\s*\n\s*/g, " ");
      lines.push(`${file}(${msg.line ?? 1},${msg.column ?? 1}): ${type} ${text}${rule}`);
    }
  }
  return lines.join("\n");
};
