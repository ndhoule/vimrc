--
-- Whitespace
--

-- By default, vim-better-whitespace strips extra whitespace on save. This is better handled by the
-- configured formatter, so disable this behavior.
vim.g.better_whitespace_enabled = true
vim.g.strip_whitespace_on_save = false

-- Highlight EOL whitespace in red
vim.cmd('highlight ExtraWhitespace ctermbg=1')
