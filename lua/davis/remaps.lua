--:
--remaps
vim.g.mapleader=" "

vim.keymap.set("n","<leader>ex",function() vim.cmd("NvimTreeToggle") end)
vim.keymap.set("n", "<leader>evc", function()
  vim.cmd("NvimTreeOpen /home/davis/.config/nvim/")
end)


vim.keymap.set("n","<leader>ww",":w!<CR>")

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
vim.keymap.set("n", "<C-S-r>", function() vim.lsp.buf.rename() end, opts)

-- compatible with tmux binds
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "gs", function()
    vim.cmd("vsplit")
    vim.cmd("wincmd l")
    vim.lsp.buf.definition()
end, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "g<leader>", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)


vim.keymap.set("n", "<C-b>n" , ":bn<CR>")
vim.keymap.set("n", "<C-b><C-n>" , ":bn<CR>")

--vim.keymap.del("n","<C-b>", nil)
vim.keymap.set("n", "<C-b>p" , ":bp<CR>")
vim.keymap.set("n", "<C-b><C-p>" , ":bp<CR>")


--- open current word in a man page if we are in a c/cpp file
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = { 'c', 'cpp'},
    callback = function ()
    -- opens in vim split
    vim.keymap.set("n","gm", function()
        local word = vim.fn.expand("<cWORD>")
            vim.cmd({cmd = "Man", args = {"3",word}})
        end)
    -- opens in new fg process

    vim.keymap.set("n","gM", function()
        local word = vim.fn.expand("<cWORD>")
            print("Hello")
            vim.cmd("!man " .. word)
        end)
    end
})

vim.keymap.set("n", "!", ":!")


