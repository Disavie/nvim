local servers = {
    'clangd' , 'pyright', 'lua_ls', 'marksman',
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
for _, server in ipairs(servers) do

    vim.lsp.config(server,{
    capabilities = capabilities,
    })

    vim.lsp.enable(server)
    print("Enabled "  ..server)
end
--[[
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
          vim.lsp.completion.get()
      end)
    end
  end,
})
]]


vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        spacin = 2,
        severity = { min = vim.diagnostic.severity.ERROR },
    },
    signs = false,
    update_in_insert = false,
    underline = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
