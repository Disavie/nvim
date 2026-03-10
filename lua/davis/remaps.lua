--remaps


vim.g.mapleader=" "

vim.keymap.set("n","<leader>ex",":Ex<CR>")
vim.keymap.set("n","<leader>evc",":e ~/.config/nvim <CR> ")

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


-- grab pwd to system clipboard
vim.keymap.set("n"," pwd", ":let @+ = getcwd()<CR>")


--resource
--[[
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
]]

