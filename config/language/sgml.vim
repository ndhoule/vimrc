au FileType xhtml,html,htm,slim,php,xml,jade,html,tpl setlocal tabstop=2 softtabstop=2 shiftwidth=2

"
" Embedded/Template Files
"

autocmd FileType ejs,erb setlocal filetype=html

"
" Autocompletion
"

autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Indent descendants of these HTML tags one indentation level; Vim doesn't count
" them toward indentation by default
let g:html_indent_inctags = "html,body,head,tbody"
