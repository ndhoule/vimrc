--
-- Keybindings
--

-- Open a scratch buffer
vim.api.nvim_set_keymap('n', '<Leader>S', ':Scratch<CR>', { noremap = true, silent = true })

-- Set up surround.vim-compatible keybindings for vim-sandwich
vim.cmd('runtime macros/sandwich/keymap/surround.vim')

require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
})
