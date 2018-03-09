""
" Config
""

if executable('ag')
  " Use `ag` as fzf's search backend
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
endif

let g:fzf_layout = { 'down': '~20%' }

""
" Commands
""

command! ProjectFiles execute 'Files' FindRootDirectory()
command! RelFiles execute 'Files' expand('%:p:h')

""
" Keybindings
""

map <silent> <leader>t :ProjectFiles<CR>
map <silent> <leader>T :RelFiles<CR>
map <leader>/ :Ag<CR>
