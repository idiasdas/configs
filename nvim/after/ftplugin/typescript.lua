-- :make type-checks the whole project with tsc and, when the project has an
-- ESLint config, lints it too. All problems go to the quickfix list.
local make = "npx --no-install tsc --noEmit --pretty false"

local eslint_root = vim.fs.root(0, {
    "eslint.config.js",
    "eslint.config.mjs",
    "eslint.config.cjs",
    "eslint.config.ts",
    "eslint.config.mts",
    "eslint.config.cts",
})
if eslint_root then
    local formatter = vim.fn.stdpath("config") .. "/tools/eslint-formatter-tsc.cjs"
    -- Parentheses so both commands' output goes through :make's pipe to the error file
    make = "(" .. make .. "; npx --no-install eslint --format " .. vim.fn.shellescape(formatter) .. " .)"
end

vim.opt_local.makeprg = make
vim.opt_local.errorformat = table.concat({
    "%f %#(%l\\,%c): %trror TS%n: %m", -- tsc:    src/a.ts(7,9): error TS2532: Object is possibly 'undefined'.
    "%f %#(%l\\,%c): %trror %m",       -- eslint: src/a.ts(4,12): error Unexpected any. [rule]
    "%f %#(%l\\,%c): %tarning %m",     -- eslint warning
    "%trror TS%n: %m",                 -- tsc errors without a file (e.g. bad tsconfig)
    "%-G%.%#",                         -- ignore everything else
}, ",")

-- Match Prettier's default indentation
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2
