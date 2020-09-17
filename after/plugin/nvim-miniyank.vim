""
" https://github.com/bfredl/nvim-miniyank
""

let g:miniyank_filename = g:DOTVIM_PATH . "/.miniyank.mpack"
let g:miniyank_maxitems = 30

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <C-P> <Plug>(miniyank-cycle)
