au FileType text,markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
au FileType text,markdown setlocal wrap linebreak nolist
au FileType text,markdown setlocal textwidth=0

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']

"
" Autocompletion
"

autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags

"
" Spellcheck
"

au FileType text,markdown setlocal spell
