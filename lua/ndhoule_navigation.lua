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
vim.cmd('nnoremap <leader>n :ProjectRootExe NvimTreeFindFile<CR>')

vim.cmd('nnoremap <leader>/ <cmd>Telescope live_grep<cr>')
vim.cmd('nnoremap <leader>t <cmd>Telescope git_files<cr>')
