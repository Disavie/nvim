return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
--        "nvim-tree/nvim-web-devicons",  -- File icons (not necessary for your simple icons, but good to have)
    },
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
                        file = true,  -- Ensure files are also shown
                        git = true,
                    },
                    glyphs = {
                        git = {
                            unstaged = "*",  -- + sign for unstaged git files
                            staged = "+",    -- * sign for changed git files
                        },
                        default = "",
                        folder = {
                            default = ">",
                            open = "v",
                        }
                    },
                },
            },

            filters = {
                dotfiles = true,  -- Hide dotfiles (e.g., .git, .vimrc)
            },
        })
    end,
}
