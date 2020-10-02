" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

" Built-in LSP is only available on NeoVim 0.5+.
if !has('nvim-0.5')
  finish
endif

"# Configuration

lua << EOF
  local nvim_lsp = require 'nvim_lsp'

  nvim_lsp.bashls.setup{}
  nvim_lsp.cssls.setup{}
  nvim_lsp.dockerls.setup{}
  nvim_lsp.html.setup{}
  nvim_lsp.sqlls.setup{}
  nvim_lsp.sumneko_lua.setup{cmd = {"lua-language-server"}}
  nvim_lsp.terraformls.setup{}
  nvim_lsp.tsserver.setup{}
  nvim_lsp.vimls.setup{}
  nvim_lsp.yamlls.setup{}
EOF

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
