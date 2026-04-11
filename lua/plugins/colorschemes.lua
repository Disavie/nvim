-- ~/.config/nvim/lua/davis/plugins/colorschemes.lua
local default_color = "gruvbox"
local default_bg = "dark"

 ColorMyPencils = function(opts)

    local opts = opts or {}

    local color = opts.color or default_color
    local bg = opts.bg or default_bg

	vim.cmd.colorscheme(color)
    vim.o.background = bg

    vim.api.nvim_set_hl(0, "CursorLine", {  bold = true })
   
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "Identifier", { bg = "none" })
    vim.api.nvim_set_hl(0, "Variable", { bg = "none" })
    
end

return {
    {
        "scottmckendry/cyberdream.nvim",
    },
    {
    "catppuccin/nvim",
    },
    {
    "sainnhe/sonokai",
    },
    {
        'zenbones-theme/zenbones.nvim',
        dependencies = {"rktjmp/lush.nvim"},
    },
    {
        'EdenEast/nightfox.nvim',
    },
    {

        'rebelot/kanagawa.nvim',
    },
    {
        "erikbackman/brightburn.vim",
    },
    {
        "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = true,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = true,
                },
            })
        end
    },


}
