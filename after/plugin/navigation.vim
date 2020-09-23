" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

"# Keybindings

" Open the current file in the tree relative to the project root (requires dbakker/vim-projectroot).
nnoremap <silent> <Leader>n :ProjectRootExe NERDTreeFind<cr>

" Search for files relative to the project root
map <silent> <leader>t :ProjectFiles<CR>

" Search for files relative to the current file
map <silent> <leader>T :RelFiles<CR>

" Search file contents relative to the project root
map <leader>/ :Agp<CR>

" Search file contents relative to the current file
map <leader>? :Agr<CR>

"# Configuration

"## Fuzzy Searching

let g:fzf_layout = {'down': '~20%'}

command! ProjectFiles execute 'Files' ProjectRootGuess()
command! RelFiles execute 'Files' expand('%:p:h')

" If available, use `ag` as fzf's backend
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
endif

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   b:fzf_default_options,
      \   <bang>0
      \ )

command! -bang -nargs=* Agp
      \ call fzf#vim#ag(
      \   <q-args>,
      \   '--hidden',
      \   {'dir': ProjectRootGuess()},
      \   <bang>0
      \ )

command! -bang -nargs=* Agr
      \ call fzf#vim#ag(
      \   <q-args>,
      \   '--hidden',
      \   {'dir': fnamemodify(expand(<q-args>), ':p:h')},
      \   <bang>0
      \ )

"## File Tree

" Show hidden files by default
let NERDTreeShowHidden = 1
