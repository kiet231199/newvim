local custom = {}

custom.plugins = {
	-- Colorscheme -------------------------------------------------
	[ "folke/tokyonight.nvim"] = {
		config = function()
      require("plugins.config.tokyonight")
      require("custom.config.tokyonight")
			vim.cmd("colorscheme tokyonight")
		end,
    -- Desc: Colorscheme manager
	},
  -- Icon source (need to be placed at the end) ------------------
  ['ryanoasis/vim-devicons'] = {
    -- Desc: devicons source for vim
  },
	['kyazdani42/nvim-web-devicons'] = {
    -- Desc: devicons source for neovim
  },
}

custom.highlights = require("custom.highlights")

custom.mappings = require("custom.mappings")

return custom
