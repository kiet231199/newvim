local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	print("Error: tokyonight")
	return
end

local options = ({
    style = "day", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
})

tokyonight.setup(options)
