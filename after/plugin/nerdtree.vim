"
" https://github.com/scrooloose/nerdtree
"

" Show hidden files by default
let NERDTreeShowHidden = 1

" Find a file relative to the current project root.
" Requires dbakker/vim-projectroot.
nnoremap <silent> <Leader>n :ProjectRootExe NERDTreeFind<cr>
