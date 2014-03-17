autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

au FileType javascript setlocal ts=2 sts=2 sw=2

let javascript_enable_domhtmlcss = 1
let g:javascript_conceal = 1

" Set tagbar to use jsctags on JavaScript files
let g:tagbar_type_javascript = {
  \ 'ctagsbin' : '/usr/local/share/npm/bin/jsctags'
\ }
