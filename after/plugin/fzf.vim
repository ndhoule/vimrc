""
" Config
""

" If installed, use `ag` as fzf's file search backend
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
endif

let g:fzf_layout = {'down': '~20%'}

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   b:fzf_default_options,
      \   <bang>0
      \ )

" Search file contents relative to the project root
command! -bang -nargs=* Agp
      \ call fzf#vim#ag(
      \   <q-args>,
      \   '--hidden',
      \   {'dir': ProjectRootGuess()},
      \   <bang>0
      \ )

" Search file contents relative to the current file
command! -bang -nargs=* Agr
      \ call fzf#vim#ag(
      \   <q-args>,
      \   '--hidden',
      \   {'dir': fnamemodify(expand(<q-args>), ':p:h')},
      \   <bang>0
      \ )

""
" Commands
""

command! ProjectFiles execute 'Files' ProjectRootGuess()
command! RelFiles execute 'Files' expand('%:p:h')

""
" Keybindings
""

map <silent> <leader>t :ProjectFiles<CR>
map <silent> <leader>T :RelFiles<CR>
map <leader>/ :Agp<CR>
map <leader>? :Agr<CR>
