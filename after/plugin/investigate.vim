" Override default man search command with investigate hotkeys
nnoremap K :call investigate#Investigate('n')<CR>
vnoremap K :call investigate#Investigate('v')<CR>

if g:host_os == 'Darwin'
  let g:investigate_use_dash=1
endif
