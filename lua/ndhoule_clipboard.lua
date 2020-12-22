--
-- Configuration
--

vim.g.miniyank_filename = vim.fn.stdpath('cache') .. '/miniyank.mpack'
vim.g.miniyank_maxitems = 30

--
-- Keybindings
--

vim.cmd('map p <Plug>(miniyank-autoput)')
vim.cmd('map P <Plug>(miniyank-autoPut)')
vim.cmd('map <C-P> <Plug>(miniyank-cycle)')
