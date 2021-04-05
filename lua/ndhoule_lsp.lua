if not vim.g.ENABLE_LSP then
  return
end

--
-- Configuration
--

local lspconfig = require('lspconfig')

lspconfig.bashls.setup{}
lspconfig.cssls.setup{}
lspconfig.dockerls.setup{}
lspconfig.html.setup{}
lspconfig.sqlls.setup{}
lspconfig.sumneko_lua.setup{cmd = {'lua-language-server'}}
lspconfig.terraformls.setup{}
lspconfig.tsserver.setup{}
lspconfig.vimls.setup{}
lspconfig.yamlls.setup{}

--- Override the default LSP diagnostics handler with a handler that sends diagnostics to ALE.
--- This lets us configure cycling through lint errors, LSP errors, etc. in a single place.

local ale_diagnostic_severity_map = {
  [vim.lsp.protocol.DiagnosticSeverity.Error] = 'E';
  [vim.lsp.protocol.DiagnosticSeverity.Warning] = 'W';
  [vim.lsp.protocol.DiagnosticSeverity.Information] = 'I';
  [vim.lsp.protocol.DiagnosticSeverity.Hint] = 'H';
}

local function handler(_, _, params, _, _, _)
  local uri = params.uri
  local bufnr = vim.uri_to_bufnr(uri)
  local diagnostics = params.diagnostics

  if diagnostics == nil then
    return
  end

  local items = {}
  for _, item in ipairs(diagnostics) do
    table.insert(items, {
        code = item.code,
        col = item.range.start.character + 1,
        end_col = item.range['end'].character,
        end_lnum = item.range['end'].line,
        lnum = item.range.start.line + 1,
        nr = item.code,
        text = item.message,
        type = ale_diagnostic_severity_map[item.severity],
        bufnr = bufnr,
      })
  end

  vim.fn['ale#other_source#ShowResults'](bufnr, 'LSP', items)
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = handler

--
-- Keybindings
--

vim.cmd([[
  nnoremap <silent> <C-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <space>D  <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> <space>q  <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
  nnoremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD        <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> gd        <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
]])
