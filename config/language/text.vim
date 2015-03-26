augroup ndhoule_text
  autocmd!
augroup END

"
" Whitespace.
"

autocmd ndhoule_text FileType text,markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd ndhoule_text FileType text,markdown setlocal wrap linebreak nolist
autocmd ndhoule_text FileType text,markdown setlocal textwidth=0

"
" Autocompletion.
"

autocmd ndhoule_text FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags

"
" Spellchecking.
"

autocmd ndhoule_text FileType text,markdown setlocal spell

"
" Language support.
"

let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml']
