return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,  -- Width of the tree window
            },
            renderer = {
                group_empty = true,  -- Group empty folders together
                icons = {
                    show = {
                        folder = false,
                        folder_arrow = false,
                        file = true,
                        git = true,
                    },
                    glyphs = {
                        default = "-",
                        git = {
                            unstaged = "*",  -- + sign for unstaged git files
                            staged = "+",    -- * sign for changed git files
                        },
                        folder = {
                            default = ">",
                            open = "v",
                        }
                    },
                },
            },

            filters = {
                dotfiles = false,  -- true to hide dotfiles (e.g., .git, .vimrc)
            },
        })
    end,
}
