"
" https://github.com/sbdchd/neoformat
"

let g:neoformat_only_msg_on_error = 1

" FIXME(ndhoule): Running this on BufWritePre is extremely slow, even on files that contain no
" @format pragma. prettier_d is an option for speeding things up but in testing was still slow
augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.jsx try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
  autocmd BufWritePre *.ts,*.tsx try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry
augroup END
