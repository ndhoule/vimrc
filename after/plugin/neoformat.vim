"
" https://github.com/sbdchd/neoformat
"

let g:neoformat_only_msg_on_error = 1

" TODO(ndhoule): Investigate prettier_d, eslint_d for TypeScript/JavaScript formatting
" TODO(ndhoule): Investigate setting formatter via projectionist
augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.jsx try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
  autocmd BufWritePre *.ts,*.tsx try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END
