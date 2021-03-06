--
-- Configuration
--

vim.g.vista_executive_for = {
  Dockerfile      = 'nvim_lsp',
  css             = 'nvim_lsp',
  javascript      = 'nvim_lsp',
  javascriptreact = 'nvim_lsp',
  typescript      = 'nvim_lsp',
  typescriptreact = 'nvim_lsp',
  vim             = 'nvim_lsp',
}

--
-- Keybindings
--

vim.cmd('nmap <silent> <leader><Tab> :Vista<CR>')
