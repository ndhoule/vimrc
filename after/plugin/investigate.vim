"
" https://github.com/keith/investigate.vim
"

let g:investigate_use_dash_for_javascript=1

""
" Keybindings
""

nnoremap <silent> <F1> :call :call investigate#Investigate('n')<CR>
