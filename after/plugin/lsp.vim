" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

if !g:ENABLE_LSP
  finish
endif

"# Configuration

lua << EOF
  local lspconfig = require('lspconfig')
  local diagnostic_nvim = require('diagnostic')

  lspconfig.bashls.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.cssls.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.dockerls.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.html.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.sqlls.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.sumneko_lua.setup{cmd = {"lua-language-server"}; on_attach=diagnostic_nvim.on_attach}
  lspconfig.terraformls.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.tsserver.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.vimls.setup{on_attach=diagnostic_nvim.on_attach}
  lspconfig.yamlls.setup{on_attach=diagnostic_nvim.on_attach}
EOF

" Report LSP diagnostic messages (provided by `diagnostic-nvim`) to ALE
let g:diagnostic_enable_ale = 1

"# Keybindings

function! SetLspKeybindings()
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
endfunction

augroup Lsp
  autocmd!
  autocmd FileType css,less,sass call SetLspKeybindings()
  autocmd FileType dockerfile call SetLspKeybindings()
  autocmd FileType html call SetLspKeybindings()
  autocmd FileType javascript,javascriptreact call SetLspKeybindings()
  autocmd FileType json call SetLspKeybindings()
  autocmd FileType lua call SetLspKeybindings()
  autocmd FileType sh call SetLspKeybindings()
  autocmd FileType sql call SetLspKeybindings()
  autocmd FileType terraform call SetLspKeybindings()
  autocmd FileType typescript,typescriptreact call SetLspKeybindings()
  autocmd FileType vim call SetLspKeybindings()
  autocmd FileType yaml call SetLspKeybindings()
augroup END
