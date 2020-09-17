""
" https://github.com/neovim/nvim-lspconfig
""

if !has('nvim-0.5')
  finish
endif

lua require('nvim_lsp').cssls.setup{}
lua require('nvim_lsp').dockerls.setup{}
lua require('nvim_lsp').html.setup{}
lua require('nvim_lsp').tsserver.setup{}
lua require('nvim_lsp').vimls.setup{}

function! SetNativeLspShortcuts()
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
  autocmd FileType css,dockerfile,html,javascript,javascriptreact,json,less,sass,typescript,typescriptreact,vim call SetNativeLspShortcuts()
augroup END
