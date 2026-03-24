
require("davis.remaps")
require("davis.options")
require("davis.lazy")

--vim.cmd.colorscheme("catppuccin-macchiato")

vim.cmd([[
highlight Normal guibg=NONE ctermbg=NONE
highlight NormalNC guibg=NONE ctermbg=NONE
]])

--/nvim/lua/davis/init.lua
require("lazy").setup({
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"}
})

vim.g.clipboard = {
  name = "osc52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
ColorMyPencils()
