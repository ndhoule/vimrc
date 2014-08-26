"
" CtrlP Settings
"

" Pattern of files to never include in search results
let ctrlp_ignore_patterns = [
  \'node_modules$',
  \'dist$',
  \'\.DS_Store$',
  \'\.git$',
  \'\.svn$',
  \'\.map$',
  \'\.sass-cache$',
  \'\.pyc$'
\]
let g:ctrlp_custom_ignore = join(ctrlp_ignore_patterns, '\|')

"
" Keybindings
"

" Launch CtrlP
map <leader>t :CtrlP<CR>
