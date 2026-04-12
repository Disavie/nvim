--disabled swp file
vim.opt.swapfile = false
--dont keep backup while working
vim.opt.backup = false
vim.o.writebackup = false       -- disable backup files



vim.o.wrap = false
vim.o.relativenumber = true
vim.o.number = true
vim.o.smarttab = true
vim.o.cursorline = true
vim.o.cursorcolumn = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


vim.opt.smartindent = true
--undodirectory 
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--undo across closing
vim.opt.undofile = true


vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

--vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = 'osc52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost',{
    group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true } ) ,
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.newtrw_browse_split = 4
vim.g.netrw_winsize = 20
vim.g.netrw_keepdir = 1 



