if not vim.g.ENABLE_COMPLETION_NVIM then
  return
end

--
-- Configuration
--

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.cmd('autocmd BufEnter * lua require\'completion\'.on_attach()')
