return {
    "neovim/nvim-lspconfig",
    
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

            

    config = function()

        local servers = {
            "lua_ls",
            "clangd",
            "pyright",
            "marksman",
        }

        -- Mason makes are stuff is installed
        require("mason").setup({})
        local mason_lsp = require("mason-lspconfig")
        mason_lsp.setup({
            ensure_installed = servers,
        })

        -- Gen default settings
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        for _, server in ipairs(servers) do
            vim.lsp.config[server] = {
                capabilities = capabilities,
            }
            vim.lsp.enable(server)
        end

        -- lua_ls (special config)
        vim.lsp.config["lua_ls"] = {
            capabilities = capabilities,
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

        vim.lsp.enable("lua_ls")
        
        -- setup autocomplete
        -- todo

    end,
}
