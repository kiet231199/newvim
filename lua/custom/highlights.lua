-- Syntax vim.api.nvim_set_hl(0, "Group", { fg = "#RGB, bg = "#RGB", bold = true ?, italic = true ?, reverse = true ?, link = "OtherGroup" })

local highlights = {
	-- User defined group
	user = {
		["cNormal"] = { fg = "#bfc7f1", bg = "#1a1b26" },
		["MyHlSearch"] = { fg = "Red", bg = cNormal, bold = true },
	},
	-- Neovim common group
	common = {
		-- Popup
		["Pmenu"] = { bg = cNormal },
		["PmenuSel"] = { fg = None, bg = "#292938" },
		["PmenuSbar"] = { bg = cNormal },
		["PmenuThumb"] = { fg = "#a9b1d6" },
		-- CursorLine
		["CursorLineNr"] = { fg = "Yellow", bold = true },
	},
	-- Plugin group
	plugin = {
		-- Split color line
		["SwapSplitStatusLine"] = { fg = "Black", bg = "Red", bold = true },
		-- Floaterm
		["Floaterm"] = { bg = Normal },
		["FloatermBorder"] = { fg = "Red" },
		-- Scrollview
		["ScrollView"] = { fg = "#a9b1d6" },
		-- Gitsigns
		["GitSignsCurrentLineBlame"] = { fg = "Yellow", bg = cNormal },
		["GitSignsAdd"] = { fg = "Green" },
		["GitSignsAddNr"] = { fg = "Green" },
		["GitSignsChange"] = { fg = "Yellow" },
		["GitSignsChangeNr"] = { fg = "Yellow" },
		["GitSignsDelete"] = { fg = "Red" },
		["GitSignsDelteNr"] = { fg = "Red" },
		-- HlSearch
		["HlSearchNear"] = { link = "IncSearch" },
		["HlSearchLens"] = { link = cNormal },
		["HlSearchLensNear"] = { link = MyHlSearch },
		["HlSearchFloat"] = { link = "IncSearch" },
		-- Trouble
		["TroubleTextInformation"] = { link = "DiagnosticVirtualTextInfo" },
		["TroubleTextError"] = { link = "DiagnosticError" },
		["TroubleTextWarning"] = { link = "DiagnosticWarning" },
		["TroubleTextHint"] = { link = "DiagnosticHint" },
		-- Telescope
		["TelescopeMatching"] = { fg = "Orange", bold = true },
		["TelescopePreviewMatch"] = { link = MyHlSearch },
		-- Cmp
		["CmpItemAbbrMatch"] = { fg = "Orange", bold = true },
		["CmpItemAbbrMatchDefault"] = { fg = "Orange", bold = true },
		["CmpItemAbbrMatchFuzzy"] = { fg = "Red", bold = true },
		["CmpItemAbbrMatchFuzzyDefault"] = { fg = "Red", bold = true },
		["CmpItemKindText"] = { fg = "Yellow", bold = true },
	}
}

return highlights
