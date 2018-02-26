"
" https://github.com/sbdchd/neoformat
"

let g:neoformat_only_msg_on_error = 1

function! neoformat#formatters#javascript#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--require-pragma', '--stdin', '--stdin-filepath', '%:p'],
        \ 'stdin': 1,
        \ }
endfunction

" FIXME(ndhoule): Running this on BufWritePre is extremely slow, even on files that contain no
" @format pragma. prettier_d is an option for speeding things up but in testing was still slow
" augroup fmt
"   autocmd!
"   autocmd FileType javascript,javascript.jsx autocmd BufWritePre <buffer> undojoin | Neoformat
" augroup END
