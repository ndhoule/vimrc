nnoremap <buffer> <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <buffer> <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <buffer> <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <buffer> <silent> <F10> :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <buffer> <silent> <F11> :call LanguageClient_workspace_symbol()<CR>
nnoremap <buffer> <silent> <F12> :call LanguageClient_textDocument_rename()<CR>
