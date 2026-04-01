--remaps
vim.g.mapleader=" "

vim.keymap.set("n","<leader>ex",":Ex<CR>")
vim.keymap.set("n","<leader>evc",":e ~/dotfiles/nvim/ <CR> ")

vim.keymap.set("n","<leader>ww",":w<CR>")

vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")



--greatest remap ever -> paste with ' p' to paste and not overwrite clipboard register
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--grab text and move in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--ESC to go to normal mode in terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- disable q+: to show command history
vim.keymap.set('n', 'q:', '<nop>')


-- lsp keybinds
vim.keymap.set("n", "<C-Cr>", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<C-S-Cr>", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<M-Cr>", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
--For some reason I can't seem to get this remap to work
vim.keymap.set("n", "<C-S-r>", function() vim.lsp.buf.rename() end, opts)

vim.keymap.set("n", "<C-S-r>", function() vim.lsp.buf.rename() end, opts) --need to disable foot Ctrl+Shift+r serach bind to use this
