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
-- Call plugin settings
require("lazy").setup(require("user.plugins"), require("user.lazy"))
-- Call highlight group settings
require("user.highlight")
