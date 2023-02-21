local status_ok, prettier = pcall(require, "prettier")
if not status_ok then
	print("Error: prettier")
	return
end

local null_ls = require("null-ls")

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

			-- format on save
			vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end

		if client.server_capabilities.documentRangeFormattingProvider then
			vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
		end
	end,
})


prettier.setup({
	bin = 'prettier', -- or `'prettierd'` (v0.22+)
	filetypes = {
		"c",
		"cpp",
		"vim",
		"lua",
		"python",
		"bash",
	},
	["null-ls"] = {
		condition = function()
			return prettier.config_exists({
				-- if `false`, skips checking `package.json` for `"prettier"` key
				check_package_json = true,
			})
		end,
		runtime_condition = function(params)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	},
	cli_options = {
		arrow_parens = "always",
		bracket_spacing = true,
		bracket_same_line = true,
		embedded_language_formatting = "auto",
		end_of_line = "lf",
		html_whitespace_sensitivity = "css",
		-- jsx_bracket_same_line = false,
		jsx_single_quote = false,
		print_width = 80,
		prose_wrap = "preserve",
		quote_props = "as-needed",
		semi = true,
		single_attribute_per_line = false,
		single_quote = false,
		tab_width = 4,
		trailing_comma = "es5",
		use_tabs = true,
		vue_indent_script_and_style = false,
	},
})
