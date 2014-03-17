au FileType markdown setlocal ts=2 sts=2 sw=2

" Enable spellcheck for any text file
au FileType text,markdown setlocal spell

"
" Autocompletion
"

autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
