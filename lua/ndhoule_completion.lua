local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')
local nvim_lsp = require('lspconfig')

--
-- Configuration
--

vim.o.completeopt = 'menuone,noselect'

cmp.setup({
  sources = {
    -- { name = 'buffer' },
    { name = 'nvim_lsp' },
  }
})

-- nvim-cmp supports LSP completions; advertise to LSP that we want them
local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_servers = { 'tsserver' }

for _, lsp in ipairs(lsp_servers) do
  nvim_lsp[lsp].setup { capabilities = capabilities }
end
