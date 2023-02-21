local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	print("Error: cmp")
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	print("Error: luasnip")
	return
end

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text          = "",
	Method        = "m",
	Function      = "",
	Constructor   = "",
	Field         = "",
	Variable      = "",
	Class         = "",
	Interface     = "",
	Module        = "",
	Property      = "",
	Unit          = "",
	Value         = "",
	Enum          = "",
	Keyword       = "",
	Snippet       = "",
	Color         = "",
	File          = "",
	Reference     = "",
	Folder        = "",
	EnumMember    = "",
	Constant      = "",
	Struct        = "",
	Event         = "",
	Operator      = "",
	TypeParameter = "",
}

local kinds = {
	nvim_lsp = "[LSP]",
	nvim_lsp_document_symbols = "[Doc]",
	luasnip = "[Snippet]",
	buffer = "[Buffer]",
	luasnip_choice = "[Snippet]",
	buffer_lines = "[Buffer]",
	cmdline = "[Cmd]",
	cmdline_history = "[History]",
	path = "[Path]",
	rg = "[RG]",
	ctags = "[Ctags]",
	env = "[Env]",
}

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-j>"] = require("cmp").mapping(function(fallback)
			if luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		["<C-k>"] = require("cmp").mapping(function(fallback)
			if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { 'i', 's' }),
		["<C-Space>"] = require("cmp").mapping(require("cmp").mapping.complete(), { "i", "c" }),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = require("cmp").mapping.confirm(),
		["<Tab>"] = require("cmp").mapping(function(fallback)
			if require("cmp").visible() then
				require("cmp").select_next_item()
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
			elseif has_words_before() then
				require("cmp").complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = require("cmp").mapping(function(fallback)
			if require("cmp").visible() then
				require("cmp").select_prev_item()
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		fields = { "abbr" ,"kind", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = (kinds)[entry.source.name]
			vim_item.dup = ({	-- Remove duplicate in source
				ctags = 0,
				cmdline_history = 0,
				rg = 0,
			})[entry.source.name] or 0
			local maxwidth = 40
			vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
			return vim_item
		end,
		expandable_indicator = true,
	},
	sources = require("cmp").config.sources({
		{ name = "luasnip", option = { show_autosnippets = true }, priority = 9 },
		{ name = "luasnip_choice", priority = 9 },		
		{ name = "nvim_lsp", priority = 8 },
		{ name = "nvim_lsp_signature_help", priority = 8 },
		{ name = "buffer", priority = 7 },
		{ name = "ctags", priority = 6 },
		{ name = "path", priority = 5 },
		{ name = "env", priority = 4 },
		{ name = "rg", priority = 3 },
	}),
	confirm_opts = {
		behavior = require("cmp").ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		completion = {
			scrollbar = false,
			max_width = 40,
			max_height = 25,
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	sorting = {
		priority_weight = 2,
        comparators = {
            require("cmp-under-comparator").under,
            require("cmp").config.compare.offset,
            require("cmp").config.compare.exact,
            require("cmp").config.compare.score,
            require("cmp").config.compare.recently_used,
            require("cmp").config.compare.kind,
            require("cmp").config.compare.sort_text,
            require("cmp").config.compare.length,
            require("cmp").config.compare.order,
        },
    },
})

-- Set configuration for specific filetype.
require("cmp").setup.filetype('gitcommit', {
	sources = require("cmp").config.sources({
		{ name = 'cmp_git', priority = 4 }, -- You can specify the `cmp_git` source if you were installed it.
		{ name = 'buffer', priority = 3 },
		{ name = 'path', priority = 2 },
		{ name = 'ctags', priority = 1 },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
require("cmp").setup.cmdline({ '/', '?' }, {
	mapping = require("cmp").mapping.preset.cmdline(),
	sources = require("cmp").config.sources({
		{ name = 'nvim_lsp_document_symbols', priority = 4 },
		{
			name = 'buffer',
			option = { keyword_pattern = [[\k\+]] },
			priority = 3,
		},
		{
			name = 'buffer-lines',
			option = {
				words = true,
				comments = true,
			},
			priority = 2,
		},
		{ name = 'ctags', priority = 1 },
	})
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
require("cmp").setup.cmdline(':', {
	mapping = require("cmp").mapping.preset.cmdline(),
	sources = require("cmp").config.sources({
		{ name = 'cmdline', priority = 3 },
		{ name = 'path', priority = 2 },
		{
			name = 'cmdline_history',
			priority = 1,
			max_item_count = 3,
		},
	})
})

require('cmp_luasnip_choice').setup({ auto_open = true });
