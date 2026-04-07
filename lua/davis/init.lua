
require("davis.remaps")
require("davis.options")
require("davis.lazy")

vim.cmd([[
highlight Normal guibg=NONE ctermbg=NONE
highlight NormalNC guibg=NONE ctermbg=NONE
]])


--/nvim/lua/davis/init.lua
require("lazy").setup({
    {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"}
})
--ColorMyPencils({color = "dayfox" , bg = "light"})
ColorMyPencils()
