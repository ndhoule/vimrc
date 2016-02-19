" Override default man search command with investigate hotkeys
nnoremap K :call investigate#Investigate('n')<CR>
vnoremap K :call investigate#Investigate('v')<CR>

" TODO: Check if is OS X before enabling this
let g:investigate_use_dash=1
