-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.neovim_path = "/home/kietpham/neovim"
vim.g.config_path = vim.g.neovim_path .. "/config"

vim.g.python3_host_prog = vim.g.neovim_path .. "/tools/python-3.10.7/bin/python3"
vim.g.node_host_prog = vim.g.neovim_path .. "/tools/node-v16.17.1/lib/node_modules/neovim/bin/cli.js"

vim.cmd [[
	if has('nvim') && executable('nvr')
		let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
	endif
]]

-- Setup plugins manager
local lazypath = vim.g.config_path .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Call default settings
require("core")
require("plugins")

-- Call user settings
pcall(require, "custom")
