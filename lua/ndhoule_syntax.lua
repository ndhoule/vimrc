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

if vim.g.ENABLE_TREESITTER then
  local tree_sitter = require 'nvim-treesitter.configs'

  tree_sitter.setup {
    ensure_installed = 'maintained',
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  }

  -- Highlighting in treesitter overrides the highlighting performed by the
  -- `rainbow` plugin; disable bracket/delimiter highlighting, letting rainbow
  -- handle it instead
  vim.treesitter.highlighter.hl_map.error = nil
  vim.treesitter.highlighter.hl_map['punctuation.delimiter'] = 'Delimiter'
  vim.treesitter.highlighter.hl_map['punctuation.bracket'] = nil
end
