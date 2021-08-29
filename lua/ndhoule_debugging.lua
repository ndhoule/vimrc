--
-- Configuration
--

vim.g.vimspector_install_gadgets = {'debugger-for-chrome', 'vscode-node-debug2'}

--
-- Keybindings
--

vim.api.nvim_set_keymap('n', '<F5>', '<Plug>VimspectorContinue', {})
vim.api.nvim_set_keymap('n', '<S-F5>', '<Plug>VimspectorStop', {})
vim.api.nvim_set_keymap('n', '<C-S-F5>', '<Plug>VimspectorRestart', {})
vim.api.nvim_set_keymap('n', '<F6>', '<Plug>VimspectorPause', {})
vim.api.nvim_set_keymap('n', '<F9>', '<Plug>VimspectorToggleBreakpoint', {})
vim.api.nvim_set_keymap('n', '<S-F9>', '<Plug>VimspectorAddFunctionBreakpoint', {})
vim.api.nvim_set_keymap('n', '<F10>', '<Plug>VimspectorStepOver', {})
vim.api.nvim_set_keymap('n', '<F11>', '<Plug>VimspectorStepInto', {})
vim.api.nvim_set_keymap('n', '<S-F11>', '<Plug>VimspectorStepOut', {})
