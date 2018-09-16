let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 1

" flow-language-server supports:
"
" - textDocument_hover
" - textDocument_definition
nnoremap <buffer> <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <buffer> <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <buffer> <silent> <F10> :call LanguageClient_textDocument_documentSymbol()<CR>
