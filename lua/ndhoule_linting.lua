--
-- Configuration
--

-- Explicitly configure all linters. To override linters on a per-project basis, create a
-- `.projections.json` file (see `./projectionist.vim` for more details).
vim.g.ale_linters_explicit = true
vim.g.ale_sign_column_always = 1
vim.cmd('set signcolumn=yes:1')

vim.g.ale_linters = {
  go         = {'golint', 'govet'},
  html       = {'tidy'},
  javascript = {'eslint'},
  markdown   = {},
  sh         = {'shellcheck'},
  typescript = {'eslint'},
}

-- Decrease delay before running linter after text change
vim.g.ale_lint_delay = 100

-- When available, use eslint_d for faster linting and fixing. (eslint_d delegates to project-local
-- eslint installations.)
if vim.fn.executable('eslint_d') then
  vim.g.ale_javascript_eslint_use_global = true
  vim.g.ale_javascript_eslint_executable = 'eslint_d'
end

--
-- Styling
--

-- Error Format

vim.g.ale_echo_msg_info_str = 'I'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_format = '[%linter%] %s %(code) %[%severity%]'

-- Sign Column

-- Don't hide sign column when there are no lint errors (prevents text from jumping visually)
vim.g.ale_sign_column_always = true

vim.g.ale_sign_info = '➤'
vim.g.ale_sign_warning = '⚠'
vim.g.ale_sign_error = '✖'

-- ALE signs default to different, ugly colors. Make them less bright and more consistent
vim.cmd('highlight link ALEInfoSign todo')
vim.cmd('highlight link ALEWarningSign todo')
vim.cmd('highlight link ALEErrorSign todo')

--
-- Keybindings
--

vim.api.nvim_set_keymap('n', '<Leader>en', '<Plug>(ale_next_wrap)', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ep', '<Plug>(ale_previous_wrap)', { silent = true })
