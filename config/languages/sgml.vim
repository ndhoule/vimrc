au FileType xhtml,html,htm,slim,eruby,php,xml,jade setlocal ts=2 sts=2 sw=2

" Indent descendants of these HTML tags one indentation level; Vim doesn't count
" them toward indentation by default
let g:html_indent_inctags = "html,body,head,tbody"

"
" Autocompletion
"

autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
