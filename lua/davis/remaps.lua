--remaps
vim.g.mapleader=" "

vim.keymap.set("n","<leader>ex",":Ex<CR>")
vim.keymap.set("n","<leader>evc",":e ~/.config/nvim <CR> ")

vim.keymap.set("n","<leader>ww",":w<CR>")
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")


vim.opt.clipboard = "unnamedplus"
--[[
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
]]


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


-- lsp keybinds
vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.hover, opts)


