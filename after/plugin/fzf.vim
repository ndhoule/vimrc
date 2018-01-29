""
" Config
""

if executable('ag')
  " Use `ag` as fzf's search backend
  let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
endif

let g:fzf_layout = { 'down': '~20%' }

""
" Commands
""

" TODO(ndhoule): If FindRootDirectory is unavailable, use `git rev-parse
" --show-toplevel` to root this command
command! ProjectFiles execute 'Files' FindRootDirectory()

""
" Keybindings
""

map <silent> <leader>t :ProjectFiles<CR>
" TODO(ndhoule): Use FindRootDirectory to root this command
map <leader>T :Ag<CR>
