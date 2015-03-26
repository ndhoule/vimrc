augroup ndhoule_ruby
  autocmd!
augroup END

"
" Whitespace.
"

autocmd ndhoule_ruby FileType ruby,eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

"
" Autocompletion.
"

autocmd ndhoule_ruby FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd ndhoule_ruby FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd ndhoule_ruby FileType ruby,eruby let g:rubycomplete_rails = 1
