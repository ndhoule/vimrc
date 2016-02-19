""
" Config
""

" Use `ag` as fzf's search backend
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_layout = { 'down': '~20%' }

""
" Commands
""

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" If inside a Git repository, set search root to repository root. Otherwise
" use vim's current work directory as the search root.
" This is an alternative to :GitFiles that respects .agignore.
command! ProjectFiles execute 'Files' s:find_git_root()

""
" Keybindings
""

map <leader>t :ProjectFiles<CR>
