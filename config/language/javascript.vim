au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

"
" Autocompletion
"

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"
" Syntastic
"

let g:syntastic_javascript_checkers = ['eslint', 'jshint']
