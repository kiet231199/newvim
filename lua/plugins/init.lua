local plugins = {
	-- Colorscheme -------------------------------------------------
	[ "folke/tokyonight.nvim"] = {
		config = function()
      require("plugins.config.tokyonight")
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

-- Load lazy (plugin manager)
local lazy_exits, lazy = pcall(require, "lazy") 

if lazy_exits then
  -- Override with default plugins with user ones
  plugins = require("core.utils").merge_plugins(plugins)

  -- Overide lazy options with user ones
  local options = require("plugins.config.lazy")
  options = require("core.utils").load_override(options, "folke/lazy.nvim")

  -- Load plugins and options
  lazy.setup(plugins, options)
end
