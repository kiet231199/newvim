local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	print("Error: tokyonight")
	return
end

local options = ({
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        functions = { italic = true, bold = true },
        variables = {},
        sidebars = "night", -- style for sidebars, see below
        floats = "night", -- style for floating windows
    },
    dim_inactive = true, -- dims inactive windows
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
})

options = require("core.utils").load_override(options, "folke/tokyonight.nvim")

-- tokyonight.setup(options)
