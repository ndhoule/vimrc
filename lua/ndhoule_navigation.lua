-------------------
-- Configuration --
-------------------

-- Show hidden files by default
vim.g.NERDTreeShowHidden = true

-----------------
-- Keybindings --
-----------------

vim.cmd('nnoremap <leader>/ <cmd>Telescope live_grep<cr>')
vim.cmd('nnoremap <leader>t <cmd>Telescope find_files<cr>')
