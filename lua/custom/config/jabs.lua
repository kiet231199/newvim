local status_ok, jabs = pcall(require, "jabs")
if not status_ok then
	print("Error: jabs")
	return
end

jabs.setup({
	-- Options for the main window
    position = 'corner', -- center, corner. Default corner
    width = 50, -- default 50
    height = 10, -- default 10
    border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

    offset = { -- window position offset
        top = 2, -- default 0
        bottom = 2, -- default 0
        left = 2, -- default 0
        right = 2, -- default 0
    },

    -- Options for preview window
    preview_position = 'left', -- top, bottom, left, right. Default top
    preview = {
        width = 100, -- default 70
        height = 30, -- default 30
        border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
    },

    -- Default highlights (must be a valid :highlight)
    highlight = {
        current = "Title", -- default StatusLine
        hidden = "StatusLineNC", -- default ModeMsg
        split = "WarningMsg", -- default StatusLine
        alternate = "StatusLine" -- default WarningMsg
    },

    -- Default symbols
    -- symbols = {
    --     current = "C", -- default 
    --     split = "S", -- default 
    --     alternate = "A", -- default 
    --     hidden = "H", -- default ﬘
    --     locked = "L", -- default 
    --     ro = "R", -- default 
    --     edited = "E", -- default 
    --     terminal = "T", -- default 
    --     default_file = "D", -- Filetype icon if not present in nvim-web-devicons. Default 
    -- },

    -- Keymaps
    keymap = {
        close = "d", -- Close buffer. Default D
        jump = "<cr>", -- Jump to buffer. Default <cr>
        h_split = "h", -- Horizontally split buffer. Default s
        v_split = "v", -- Vertically split buffer. Default v
        preview = "<space>", -- Open buffer preview. Default P
    },

    -- Whether to use nvim-web-devicons next to filenames
    use_devicons = true -- true or false. Default true
})

-- vim.keymap.set("n", "t", ":JABSOpen<CR>", { noremap = true, silent = true })
