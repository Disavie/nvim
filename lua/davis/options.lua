--remaps

-- .o = :set
vim.o.wrap = false
vim.o.relativenumber = true
vim.o.number = true
--vim.o.smarttab = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


vim.opt.smartindent = true
--disabled swp file
vim.opt.swapfile = false
--dont keep backup while working
vim.opt.backup = false
--undodirectory 
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--undo across closing
vim.opt.undofile = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

--vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "osc52",
  copy = {
    ["+"] = function(lines, _)
      require("vim.ui.clipboard.osc52").copy("+")(lines)
    end,
    ["*"] = function(lines, _)
      require("vim.ui.clipboard.osc52").copy("*")(lines)
    end,
  },
  paste = {
    ["+"] = function() return {vim.fn.getreg("+")} end,
    ["*"] = function() return {vim.fn.getreg("*")} end,
  },
}
