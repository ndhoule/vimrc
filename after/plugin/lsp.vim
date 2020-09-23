" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

" Built-in LSP is only available on NeoVim 0.5+.
if !has('nvim-0.5')
  finish
endif

"# Configuration

lua << EOF
  local nvim_lsp = require 'nvim_lsp'

  nvim_lsp.cssls.setup{}
  nvim_lsp.dockerls.setup{}
  nvim_lsp.html.setup{}
  nvim_lsp.tsserver.setup{}
  nvim_lsp.vimls.setup{}
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
  autocmd FileType
        \ css,
        \ dockerfile,
        \ html,
        \ javascript,
        \ javascriptreact,
        \ json,
        \ less,
        \ sass,
        \ typescript,
        \ typescriptreact,
        \ vim call SetLspKeybindings()
augroup END
