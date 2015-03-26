augroup ndhoule_sgml
  autocmd!
augroup END

"
" Filetypes.
"

autocmd ndhoule_sgml FileType ejs,erb setlocal filetype=html

"
" Whitespace.
"

autocmd ndhoule_sgml FileType xhtml,html,htm,slim,php,xml,jade,html,tpl setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Indent descendants of these HTML tags one indentation level; Vim doesn't count
" them toward indentation by default
let g:html_indent_inctags = "html,body,head,tbody"

"
" Autocompletion.
"

autocmd ndhoule_sgml FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd ndhoule_sgml FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
