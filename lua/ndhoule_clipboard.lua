--
-- Configuration
--

vim.g.miniyank_filename = vim.fn.stdpath('cache') .. '/miniyank.mpack'
vim.g.miniyank_maxitems = 30

--
-- Keybindings
--

vim.api.nvim_set_keymap('n', 'p', '<Plug>(miniyank-autoput)', {})
vim.api.nvim_set_keymap('n', 'P', '<Plug>(miniyank-autoPut)', {})
vim.api.nvim_set_keymap('n', '<C-P>', '<Plug>(miniyank-cycle)', {})
