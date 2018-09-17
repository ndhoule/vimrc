""
" Config
""

if executable('ag')
  " Use `ag` as fzf's search backend
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
endif

let g:fzf_layout = { 'down': '~20%' }

" Make :Ag match file contents only (matches filenames by default)
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

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
map <leader>/ :Ag<CR>
