-------------------
-- Configuration --
-------------------

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_update_cwd = 1

-----------------
-- Keybindings --
-----------------

-- Open the current file in the tree relative to the project root (requires dbakker/vim-projectroot).
vim.api.nvim_set_keymap('n', '<leader>n', ':ProjectRootExe NvimTreeFindFile<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope git_files<CR>', { noremap = true })
