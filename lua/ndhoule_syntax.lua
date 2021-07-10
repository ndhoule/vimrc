local utils = require("ndhoule_utils")

-- Colorize's built-in auto-colorization doesn't work consistently
-- https://github.com/chrisbra/Colorizer/issues/77
utils.nvim_create_augroups({
  AutoColorize = {
    {
      "BufNewFile,BufRead,BufEnter,BufLeave,WinEnter,WinLeave,WinNew",
      "*.css,*.html,*.js,*.jsx,*.sass,*.scss,*.ts,*.tsx,*.tpl",
      "ColorHighlight",
    },
  },
})

--
-- Configuration
--

-- Treesitter

local tree_sitter = require 'nvim-treesitter.configs'

tree_sitter.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- extended_mode = true,
  },
}
