function SetNativeLSPShortcuts()
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
endfunction

" TODO(ndhoule): Install and set up
" lua require'nvim_lsp'.gopls.setup{}
function ConfigureNativeLSP()
lua << EOF
local nvim_lsp = require('nvim_lsp')

nvim_lsp.cssls.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.flow.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.vimls.setup{}
EOF
endfunction

if has('nvim-0.5')
  call ConfigureNativeLSP()

  augroup LSP
    autocmd!
    autocmd FileType css,dockerfile,javascript,javascriptreact,json,less,sass,typescript,typescriptreact,vim call SetNativeLSPShortcuts()
  augroup END
endif
