return {
    cmd = function(dispatchers, config)
        local root = config.root_dir or vim.fn.getcwd()
        local local_tsc = root .. "/node_modules/.bin/tsc"

        local cmd = vim.fn.executable(local_tsc) == 1
            and local_tsc
            or "tsc"

        return vim.lsp.rpc.start({
            cmd,
            "--lsp",
            "--stdio",
        }, dispatchers)
    end,

    filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
    },

    root_markers = {
        "tsconfig.json",
        "jsconfig.json",
        "package.json",
        ".git",
    },
}
