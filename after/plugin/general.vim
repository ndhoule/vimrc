" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Keybindings

" Open a scratch buffer
nnoremap <silent> <Leader>S :Scratch<CR>
