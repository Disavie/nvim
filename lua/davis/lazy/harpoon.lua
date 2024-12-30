return {
    'ThePrimeagen/harpoon',

    config = function()
        require("harpoon").setup({


        vim.keymap.set("n","<a-a>",function() require("harpoon.ui").toggle_quick_menu() end),
        vim.keymap.set("n","<a-e>",function() require("harpoon.mark").add_file() end),

        vim.keymap.set("n","<a-1>", function() require("harpoon.ui").nav_file(1) end),
        vim.keymap.set("n","<a-2>", function() require("harpoon.ui").nav_file(2) end),
        vim.keymap.set("n","<a-3>", function() require("harpoon.ui").nav_file(3) end),
        vim.keymap.set("n","<a-4>", function() require("harpoon.ui").nav_file(4) end),
        vim.keymap.set("n","<a-5>", function() require("harpoon.ui").nav_file(5) end),

    })
end,

}
