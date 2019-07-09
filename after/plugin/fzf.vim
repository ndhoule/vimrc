""
" Config
""

if executable('ag')
  " Use `ag` as fzf's search backend
  let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
endif

let g:fzf_layout = { 'down': '~20%' }

" Default options for :Ag. Only used in this file when overriding commands, below.
let b:fzf_default_options = {'options': '--delimiter : --nth 4..'}

" Make :Ag match file contents only (matches filenames by default)
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, b:fzf_default_options, <bang>0)

" Make :Ag match file contents only (see above) and search relative to the project root
command! -bang -nargs=* Rag call fzf#vim#ag(<q-args>, extend({'dir': ProjectRootGuess(), 'options': '--delimiter : --nth 4..'}, b:fzf_default_options), <bang>0)

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
" FIXME(ndhoule): Fuzzy matching on this command is terrible
map <leader>/ :Rag<CR>
map <leader>? :Ag<CR>
