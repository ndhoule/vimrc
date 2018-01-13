"
" https://github.com/keith/investigate.vim
"

let g:investigate_use_dash_for_javascript=1

""
" Keybindings
""

" Override default man search command with investigate hotkeys
nnoremap <silent> K :call investigate#Investigate('n')<CR>
vnoremap <silent> K :call investigate#Investigate('v')<CR>
