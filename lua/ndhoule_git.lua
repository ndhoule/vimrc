--
-- Keybindings
--

vim.api.nvim_set_keymap('n', '<Leader>gws', ':Gstatus<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Gcommit<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gl', ':Glog<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gia', ':Gwrite<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gwd', ':Gsdiff<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Gblame<CR>', {})

--
-- Configuration
--

-- Decrease the time before vim writes the swapfile, which also governs the delay before git gutter
-- marks are shown
vim.o.updatetime = 100
