-- Enable faster (but experimental) Lua module loader
if vim.loader and vim.fn.has("nvim-0.9.1") == 1 then
  vim.loader.enable()
end

-- Install lazy.nvim if it does not exist
local lazy_install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_install_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazy_install_path,
  })
end

vim.opt.rtp:prepend(lazy_install_path)

local plugins = require("ndhoule.plugins")
local lazy = require("lazy")

lazy.setup(plugins, {
  change_detection = {
    enabled = true,
    -- FIXME(ndhoule): This doesn't seem to be working
    notify = false,
  },
})
