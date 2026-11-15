return {
    "neovim/nvim-lspconfig",
    dependencies = {
        'saghen/blink.cmp',
    },


    config = function()

        local servers = {
            "lua_ls",
            "clangd",
            "pyright",
            "marksman",
            "ols",
            "asm",
        }


        -- Gen default settings
        local cmp_capabilities = require("blink.cmp").get_lsp_capabilities()

        for _, server in ipairs(servers) do
            vim.lsp.config[server] = {
                capabilities = cmp_capabilities
            }
            vim.lsp.enable(server)
        end

    vim.diagnostic.config({
        virtual_text = {
            prefix = '●',
            spacing = 2,
        },
        signs = false,
        update_in_insert = true,
        underline = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            -- source = "always",
            header = "",
            prefix = "",
        },
    })

    end,
}
