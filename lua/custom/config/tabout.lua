local status_ok, tabout = pcall(require, "tabout")
if not status_ok then
	print("Error: tabout")
	return
end

tabout.setup({
	tabkey = '', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = false, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '', -- reverse shift default action,
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
		{open = "'", close = "'"},
		{open = '"', close = '"'},
		{open = '`', close = '`'},
		{open = '(', close = ')'},
		{open = '[', close = ']'},
		{open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
})

vim.api.nvim_set_keymap('i', '<C-l>', "<Plug>(Tabout)", {silent = true})
vim.api.nvim_set_keymap('i', '<C-h>', "<Plug>(TaboutBack)", {silent = true})
