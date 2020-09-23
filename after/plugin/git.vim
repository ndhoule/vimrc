" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Keybindings

map <Leader>gws :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gl :Glog<CR>
map <Leader>gia :Gwrite<CR>
map <Leader>gwd :Gsdiff<CR>
map <Leader>gb :Gblame<CR>

"# Configuration

" Decrease the time before vim writes the swapfile, which also governs the delay before git gutter
" marks are shown
set updatetime=100
