" Required for operations modifying multiple buffers like rename.
set hidden

" Start language servers automatically
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'dockerfile': ['docker-langserver', '--stdio'],
    \ 'javascript': ['flow-language-server', '--stdio'],
    \ 'javascript.jsx': ['flow-language-server', '--stdio', '--try-flow-bin'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'less': ['css-languageserver', '--stdio'],
    \ 'sass': ['css-languageserver', '--stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }

" https://github.com/autozimu/LanguageClient-neovim/blob/next/doc/LanguageClient.txt
" TODO(ndhoule): Revisit these shortcuts
" TODO(ndhoule): Add mode-specific mappings, or at least warn when a language
"                server doesn't implement a call
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <F10> :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F11> :call LanguageClient_workspace_symbol()<CR>
nnoremap <silent> <F12> :call LanguageClient_textDocument_rename()<CR>
