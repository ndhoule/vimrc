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
