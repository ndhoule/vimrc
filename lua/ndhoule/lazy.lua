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
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_install_path,
  })
end

vim.opt.rtp:prepend(lazy_install_path)

local plugins = require("ndhoule.plugins")
local lazy = require("lazy")

lazy.setup(
  plugins,
  {
    change_detection = {
      enabled = true,
      notify = false,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "2html_plugin",
          "bugreport",
          "compiler",
          "ftplugin",
          "getscript",
          "getscriptPlugin",
          "gzip",
          "logipat",
          "matchit",    -- Required for vim-matchup
          "matchparen", -- Required for vim-matchup
          "netrw",
          "netrwFileHandlers",
          "netrwPlugin",
          "netrwSettings",
          "optwin",
          "rplugin",
          "rrhelper",
          "spellfile_plugin",
          "synmenu",
          "tar",
          "tarPlugin",
          "tutor",
          "vimball",
          "vimballPlugin",
          "zip",
          "zipPlugin",

        },
      },
    },
  }
)
