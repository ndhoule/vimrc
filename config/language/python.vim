augroup ndhoule_python
  autocmd!
augroup END

"
" Whitespace.
"

autocmd ndhoule_python FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4

"
" Autocompletion.
"

autocmd ndhoule_python FileType python setlocal omnifunc=pythoncomplete#Complete
