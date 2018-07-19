"
" https://github.com/ncm2/ncm2
"

autocmd BufEnter * call ncm2#enable_for_buffer()
autocmd TextChangedI * call ncm2#auto_trigger()

set completeopt=noinsert,menuone,noselect
set shortmess+=c

let g:ncm2#complete_length = [[1,3],[7,2]]
