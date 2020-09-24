" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Configuration

let g:miniyank_filename = stdpath('cache') . '/miniyank.mpack'
let g:miniyank_maxitems = 30

"# Keybindings

map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <C-P> <Plug>(miniyank-cycle)
