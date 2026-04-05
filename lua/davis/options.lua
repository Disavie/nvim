vim.o.wrap = false
vim.o.relativenumber = true
vim.o.number = true
vim.o.smarttab = true
vim.o.cursorline = true
--vim.o.cursorcolumn = true

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

-- Check if the terminal supports clipboard (e.g., through unnamedplus)
if vim.fn.has('clipboard') == 1 then
    vim.opt.clipboard = "unnamedplus"
else
    vim.g.clipboard = "osc52"
end

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

-- vim.o.equalalways = false
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true



--[[
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local opts = { buffer = true, remap = false }

    -- force sidebar width
    vim.cmd("vertical resize 20")

    -- vertical split in previous window
    vim.keymap.set("n", "v", function()
      local file = vim.fn.expand("<cfile>")
      vim.cmd("wincmd p")       -- go to main window
      vim.cmd("vert split")     -- split main window
      vim.cmd("edit " .. file)  -- open file
    end, opts)

    -- horizontal split in previous window
    vim.keymap.set("n", "s", function()
      local file = vim.fn.expand("<cfile>")
      vim.cmd("wincmd p")
      vim.cmd("split")
      vim.cmd("edit " .. file)
    end, opts)
  end,
})

]]
