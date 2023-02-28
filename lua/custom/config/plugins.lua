return {
	-- Startup -----------------------------------------------------
	{
		-- Start up screen
		'goolord/alpha-nvim',
		config = function()
			require("user.alpha")
		end,
	},
	{
		-- Boost startup time
		'lewis6991/impatient.nvim',
		priority = 1000,
		config = function()
			require("user.impatient")
		end,
	},
	-- Colorscheme -------------------------------------------------
	{
		-- Colorscheme manager
		'folke/tokyonight.nvim',
		priority = 999,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
			require("user.tokyonight")
		end,
	},
	-- Workspace ---------------------------------------------------
	{
		-- File explorer
		'nvim-tree/nvim-tree.lua',
		config = function()
			require("user.nvim-tree")
		end,
		keys = {
			{ "<F5>", "<cmd>NvimTreeFindFileToggle<CR>", mode = "", silent = true, noremap = true  },
		},
	},
	{
		-- Tab explorer
		'matbme/JABS.nvim',
		config = function()
			require("user.jabs")
		end,
		keys = {
			{ "t", "<cmd>JABSOpen<CR>", mode = "n", silent = true, noremap = true },
		},
	},
	-- Tabline and Statusline --------------------------------------
	{
		-- Status line
		'nvim-lualine/lualine.nvim',
		priority = 998,
		config = function()
			require("user.lualine")
		end,
	},
	{
		-- Tabline
		'kdheepak/tabline.nvim',
		priority = 998,
		config = function()
			require("user.tabline")
		end,
	},
	-- Git ---------------------------------------------------------
	{
		-- Git icon
		'lewis6991/gitsigns.nvim',
		config = function()
			require("user.gitsigns")
		end,
	},
	{
		-- Git show commit contents
		'rhysd/git-messenger.vim',
		config = function()
			require("user.gitmessenger")
		end,
		keys = {
			{ "<F10>", "<Plug>(git-messenger)", mode = "n", silent = true, noremap = true },
		},
	},
	{
		-- Git quick command
		'kdheepak/lazygit.nvim',
		config = function()
			require("user.lazygit")
		end,
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<CR>", mode = "", silent = true, noremap = true },
		},
	},
	{
		-- Git watch diffview
		'sindrets/diffview.nvim',
		pin = true,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		commit = '03deb5',
		config = function()
			require("user.diffview")
		end,
		cmd = "DiffviewOpen",
	},
	{
		-- Git solve conflict quick
		'akinsho/git-conflict.nvim',
		config = function()
			require("user.git-conflict")
		end,
	},
	-- Fuzy finder -------------------------------------------------
	{
		-- Telescope
		'nvim-telescope/telescope.nvim',
		dependencies = {
			-- Prevent duplicate function
			'nvim-lua/plenary.nvim',
			{
				-- Quick search
				'nvim-telescope/telescope-fzf-native.nvim',
				build = "make",
			},
			-- File browser
			'nvim-telescope/telescope-file-browser.nvim',
			-- Project
			'nvim-telescope/telescope-project.nvim',
			-- UI for telescope
			'nvim-telescope/telescope-ui-select.nvim',
			-- Builtin/extension picker for telescope
			'keyvchan/telescope-find-pickers.nvim',
			-- Menu command
			'LinArcX/telescope-command-palette.nvim',
			-- Preview clipboard
			'AckslD/nvim-neoclip.lua',
			-- Show LSP diagnostics
			'folke/trouble.nvim',
			-- Icon quick search
			'ziontee113/icon-picker.nvim',
			-- Color quick search
			'ziontee113/color-picker.nvim',
		},
		config = function()
			require("user.telescope")
		end,
		keys = {
			{ "<space>", mode = "n" },
		},
	},
	{
		-- Preview clipboard
		'AckslD/nvim-neoclip.lua',
		lazy = true,
		config = function()
			require("user.neoclip")
		end,
	},

	-- Language Server Protocol ------------------------------------
	{
		-- LSP config manager
		'neovim/nvim-lspconfig',
		dependencies = {
			'folke/neodev.nvim',
			-- LSP formatter
			'lukas-reineke/lsp-format.nvim',
			'Djancyp/lsp-range-format',
		},
		config = function()
			require("user.lspconfig")
		end,
	},
	{
		-- LSP installer
		'williamboman/mason.nvim',
		config = function()
			require("user.mason")
		end,
		cmd = "Mason",
	},
	{
		-- LSP better UI
		'glepnir/lspsaga.nvim',
		event = 'BufRead',
		dependencies = {
			'anuvyklack/windows.nvim',
		},
		config = function()
			require("user.lspsaga")
		end,
	},
	{
		-- LSP show line diagnostics
		'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
		config = function()
			require("lsp_lines").setup()
		end,
		keys = {
			{ "<F3>", "<cmd> lua require'lsp_lines'.toggle()<CR>", mode = "", silent = true, noremap = true },
		},
	},
	{
		-- Show LSP diagnostics
		'folke/trouble.nvim',
		lazy = true,
		config = function()
			require("user.trouble")
		end,
	},
	{
		-- Language server for builtin language
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			require("user.null-ls")
		end,
	},
	{
		-- Prettier for buitin language
		'MunifTanjim/prettier.nvim',
		config = function()
			require("user.prettier")
		end,
	},

	-- LSP completion source ---------------------------------------
	{
		-- Completion manager
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Completion for LSP
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-document-symbol',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			-- Completion for buffer
			'hrsh7th/cmp-buffer',
			'amarakon/nvim-cmp-buffer-lines',
			-- Completion for directory/file path
			'hrsh7th/cmp-path',
			-- Completion for commandline
			'hrsh7th/cmp-cmdline',
			'dmitmel/cmp-cmdline-history',
			-- Completion for ripgrep
			'lukas-reineke/cmp-rg',
			-- Completion for other stuff
			'petertriho/cmp-git',
			'delphinus/cmp-ctags',
			'bydlw98/cmp-env',
			-- Sorting completion base on priority
			'lukas-reineke/cmp-under-comparator',
			-- Snippet for LSP
			'L3MON4D3/LuaSnip',
			-- Completion for Luasnip
			'saadparwaiz1/cmp_luasnip',
			'doxnit/cmp-luasnip-choice',
		},
		config = function()
			require("user.cmp")
		end,
		event = { "InsertEnter", "CmdlineEnter" },
	},

	-- Highlighter -------------------------------------------------
	{
		-- Code highlight
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require("user.treesitter")
		end,
	},
	{
		-- Bracket color
		'p00f/nvim-ts-rainbow',
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
	},

	-- Bracket -----------------------------------------------------
	{
		-- Auto pair
		'windwp/nvim-autopairs',
		config = function()
			require("user.nvim-autopairs")
		end,
		event = "InsertEnter",
	},
	{
		-- Smart pair
		'kylechui/nvim-surround',
		config = function()
			require("nvim-surround").setup()
		end,
		event = "InsertEnter",
	},
	{
		-- Tabout of bracket
		'abecodes/tabout.nvim',
		config = function()
			require("user.tabout")
		end,
	},

	-- Commenter ---------------------------------------------------
	{
		-- Quick comment
		'numToStr/Comment.nvim',
		config = function()
			require("user.comment")
		end,
	},
	{
		-- Todo comment 
		'folke/todo-comments.nvim',
		config = function()
			require("user.todo")
		end,
	},

	-- Easy editing ------------------------------------------------
	{
		-- Quick replace
		'kqito/vim-easy-replace',
		keys = {
			{ "<leader>ra", "<cmd>EasyReplaceWord<CR>", mode = "n", silent = true, noremap = true },
			{ "<leader>rc", "<cmd>EasyReplaceCword<CR>", mode = "n", silent = true, noremap = true },
			{ "<leader>ra", "<cmd>EasyReplaceWordInVisual<CR>", mode = "v", silent = true, noremap = true },
			{ "<leader>rc", "<cmd>EasyReplaceCwordInVisual<CR>", mode = "v", silent = true, noremap = true },
		},
	},
	{
		-- Quick align
		'Vonr/align.nvim',
		config = function()
			require("user.align")
		end,
		keys = {
			{ "aa", "<cmd>lua require'align'.align_to_char(1, true)<CR>", mode = "x", silent = true, noremap = true },
			{ "as", "<cmd>lua require'align'.align_to_char(2, true, true)<CR>", mode = "x", silent = true, noremap = true },
			{ "aw", "<cmd>lua require'align'.align_to_string(false, true, true)<CR>", mode = "x", silent = true, noremap = true },
			{ "ar", "<cmd>lua require'align'.align_to_string(true, true, true)<CR>", mode = "x", silent = true, noremap = true },
		}
	},
	{
		-- Quick move
		'fedepujol/move.nvim',
		pin = true,
		config = function()
			require("user.move")
		end,
	},
	{
		-- Toggle word (true/false)
		'nguyenvukhang/nvim-toggler',
		config = function()
			require("nvim-toggler").setup()
		end,
	},

	-- Search ------------------------------------------------------
    {
		-- Search box
		'VonHeikemen/searchbox.nvim',
		dependencies = {
			'MunifTanjim/nui.nvim',
		},
		config = function()
			require("user.searchbox")
		end,
	},
	{
		-- Highlight search
		'kevinhwang91/nvim-hlslens',
		config = function()
			require("user.hlslens")
		end,
	},
	{
		-- Structure search
		'cshuaimin/ssr.nvim',
		config = function()
			require("user.ssr")
		end,
		keys = {
			{ "<leader>sr", "<cmd>lua require('ssr).open()<CR>", mode = { "n", "x" }, silent = true, noremap = true },
		},
	},

	-- Scroll ------------------------------------------------------
    {
		-- Smooth scrolling
		'karb94/neoscroll.nvim',
		config = function()
			require("user.neoscroll")
		end,
	},
	{
		-- Scrollbar
		'dstein64/nvim-scrollview',
		config = function()
			require("user.scrollview")
		end,
	},
	{
		-- Cursor pointer
		'gen740/SmoothCursor.nvim',
		config = function()
			require("user.smoothcursor")
		end,
	},

	-- Better UI ---------------------------------------------------
	{
		-- Message popup
		'rcarriga/nvim-notify',
		config = function()
			require("user.notify")
		end,
	},
	{
		-- Show message popup, LSP progress, popup commandline
 		'folke/noice.nvim',
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("user.noice")
		end,
		keys = {
			{ "<F2>", mode = "" },
		},
	},
	{
		-- Make quickfix window better
		'kevinhwang91/nvim-bqf',
		ft = "qf",
		dependencies = {
			'junegunn/fzf',
			build = function()
				vim.fn['fzf#install']()
			end,
		},
		config = function()
			require("bqf").setup()
		end,
	},
	{
		-- Show keymap
		'folke/which-key.nvim',
		config = function()
			require("user.whichkey")
		end,
	},

	-- Window -----------------------------------------------------
	{
		-- Window choose
		'xorid/swap-split.nvim',
		keys = {
			{ "sw", "<cmd>SwapSplit<CR>", mode = "n", silent = true, noremap = true },
		},
	},
	{
		-- Smooth window swap
		'anuvyklack/windows.nvim',
		dependencies = {
			'anuvyklack/middleclass',
			'anuvyklack/animation.nvim',
		},
		config = function ()
			require("user.windows")
		end,
		event = "WinNew",
	},

	-- Picker ------------------------------------------------------
	{
		-- Icon quick search
		'ziontee113/icon-picker.nvim',
		lazy = true,
		dependencies = {
			'stevearc/dressing.nvim',
		},
		config = function()
			require("user.iconpicker")
		end,
	},
	{
		-- Color quick search
		'ziontee113/color-picker.nvim',
		lazy = true,
		config = function()
			require("user.colorpicker")
		end,
	},

	-- Float terminal ----------------------------------------------
	{
		-- Float terminal
		'voldikss/vim-floaterm',
		config = function()
			require("user.floaterm")
		end,
		keys = {
			{ "<F8>", "<cmd>FloatermToggle<CR>", mode = "", silent = true, noremap = true },
		},
	},

	-- Colorful ----------------------------------------------------
	{
		-- Underline word undercursor
		'itchyny/vim-cursorword',
	},
	{
		-- Indentline
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require("user.indent_blankline")
		end,
	},
	{
		-- Fold text
		'anuvyklack/pretty-fold.nvim',
		config = function()
			require("user.pretty-fold")
		end,
	},
    {
		-- Win separator 
		'nvim-zh/colorful-winsep.nvim',
		pin =true,
		commit = 'bb06c86',
		config = function()
			require("user.winsep")
		end,
		event = "WinNew",
	},
	{
		-- Focus on function (pair with twilight)
		'folke/zen-mode.nvim',
		dependencies = {
			'folke/twilight.nvim',
		},
		config = function()
			require("user.zenmode")
		end,
		keys = {
			{ "<F7>", "<cmd>ZenMode<CR>", mode = "", silent = true, noremap = true },
		},
	},
	{
		-- Focus on function
		'folke/twilight.nvim',
		lazy = true,
		config = function()
			require("user.twilight")
		end,
	},

	-- Register, session ---------------------------------------
	{
		-- Registers
		'tversteeg/registers.nvim',
		config = function()
			require("user.registers")
		end,
		keys = {
			{ "<C-r>", "<cmd>Registers<CR>", noremap = true, silent = true },
		},
	},
	{
		-- Session
		'Shatur/neovim-session-manager',
		config = function()
			require("user.sessions")
		end,
		keys = {
			{ "sl", "<cmd>SessionManager load_last_session<CR>", mode = "n", silent = true, noremap = true },
			{ "ss", "<cmd>SessionManager save_current_session<CR>", mode = "n", silent = true, noremap = true },
			{ "sd", "<cmd>SessionManager delete_session<CR>", mode = "n", silent = true, noremap = true },
		},
	},

	-- Minmap --------------------------------------------------
	{
		-- Minimap window
		'gorbit99/codewindow.nvim',
		config = function()
			require("user.codewindow")
		end,
		keys = {
			{ "<F4>", "<cmd>lua require'codewindow'.toggle_minimap()<CR>", mode = "", silent = true, noremap = true },
		}
	},

	-- Test ----------------------------------------------------
	{
		-- Conver dec to hex
		'trmckay/based.nvim',
		config = function()
			require("user.based")
		end,
		keys = {
			{ "<leader>bh", "<cmd>BasedConvert hex<CR>", mode = "n", silent = true, noremap = true },
			{ "<leader>bd", "<cmd>BasedConvert dec<CR>", mode = "n", silent = true, noremap = true },
		},
	},
	{
		-- Note taking
		'phaazon/mind.nvim',
		config = function()
			require("user.mind")
		end,
		cmd = "MindOpenMain",
	},
	{
		-- Auto generate tree
		'cloudysake/asciitree.nvim',
		config = function()
			require("user.asciitree")
		end,
		cmd = "Asciitree",
	},
	-- Icon source (need to be placed at the end) --------------
	{
		'ryanoasis/vim-devicons',
		'kyazdani42/nvim-web-devicons',
	},
}

-- Feature requests
-- TODO: Update nvim-scrollbar
-- TODO: Update from tabline to barbar if it has updated tab icon highlight groups
