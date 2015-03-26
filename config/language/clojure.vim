augroup ndhoule_clojure
  autocmd!
augroup END

"
" Plugins.
"

" Use paredit instead of delimitMate.
autocmd ndhoule_clojure FileType clojure let b:loaded_delimitMate = 1

" Speclj highlighting.
autocmd ndhoule_clojure FileType clojure setlocal lispwords+=describe,it,xit,context,around,should=,should-not,should,should-be,with,run-specs
