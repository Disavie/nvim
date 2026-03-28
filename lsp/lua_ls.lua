return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },

    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                },
            },
        },
    },
}

