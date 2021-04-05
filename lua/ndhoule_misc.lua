--
-- Keybindings
--

-- Open a scratch buffer
vim.cmd('nnoremap <silent> <Leader>S :Scratch<CR>')

-- Set up surround.vim-compatible keybindings for vim-sandwich
vim.cmd('runtime macros/sandwich/keymap/surround.vim')

require('kommentary.config').configure_language("default", {
  prefer_single_line_comments = true,
})
