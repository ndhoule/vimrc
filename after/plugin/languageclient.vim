" Required for operations modifying multiple buffers like rename
set hidden

let g:LanguageClient_changeThrottle = 0.50
let g:LanguageClient_hoverPreview = "never"

" Disable diagnostics (e.g. linter errors, compiler errors) support; handle this through ALE
let g:LanguageClient_diagnosticsEnable = 0

let g:LanguageClient_rootMarkers = {
    \ 'javascript': ['.flowconfig', 'package.json'],
    \ 'javascriptreact': ['.flowconfig', 'package.json'],
    \ }

let g:LanguageClient_serverCommands = {
    \ 'css':             ['css-languageserver', '--stdio'],
    \ 'dockerfile':      ['docker-langserver', '--stdio'],
    \ 'javascript':      ['flow', 'lsp'],
    \ 'javascriptreact': ['flow', 'lsp'],
    \ 'json':            ['json-languageserver', '--stdio'],
    \ 'less':            ['css-languageserver', '--stdio'],
    \ 'sass':            ['css-languageserver', '--stdio'],
    \ 'typescript':      ['typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['typescript-language-server', '--stdio'],
    \ }

"
" Generic placeholder keybindings for LanguageClient functionality. Override these with supported,
" completion-server specific commands in `after/ftplugin/<filetype>.vim`. For example, a server that
" supports the full LanguageServer spec could map the following functions:
"
" ```
" nnoremap <buffer> <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <buffer> <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <buffer> <silent> gr :call LanguageClient_textDocument_references()<CR>
" nnoremap <buffer> <silent> <F10> :call LanguageClient_textDocument_documentSymbol()<CR>
" nnoremap <buffer> <silent> <F11> :call LanguageClient_workspace_symbol()<CR>
" nnoremap <buffer> <silent> <F12> :call LanguageClient_textDocument_rename()<CR>
" ```
"
" For a full list of LanguageClient functions, see:
"
" https://github.com/autozimu/LanguageClient-neovim/blob/next/doc/LanguageClient.txt
"

nnoremap <silent> K     :echoerr 'textDocument_hover is not implemented for this filetype'<CR>
nnoremap <silent> gd    :echoerr 'textDocument_definition is not implemented for this filetype'<CR>
nnoremap <silent> gr    :echoerr 'textDocument_references is not implemented for this filetype'<CR>
nnoremap <silent> <F10> :echoerr 'textDocument_documentSymbol is not implemented for this filetype'<CR>
nnoremap <silent> <F11> :echoerr 'workspace_symbol is not implemented for this filetype'<CR>
nnoremap <silent> <F12> :echoerr 'textDocument_rename is not implemented for this filetype'<CR>
