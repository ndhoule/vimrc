"
" Settings
"

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

let ctrlp_ignore_patterns = [
      \'node_modules',
      \'dist$',
      \'\.DS_Store$',
      \'\.git$',
      \'\.svn$',
      \'\.map$',
      \'\.sass-cache$',
      \'\.pyc$'
      \]

let g:ctrlp_custom_ignore = join(ctrlp_ignore_patterns, '\|')

" Use ag when available
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  " Ignores only take effect when using the built-in ctrlp command; ensure we're
  " using the built-in
  unlet g:ctrlp_user_command
endif

" Show dotfiles
let g:ctrlp_show_hidden = 1

"
" Keybindings
"

" Open CtrlP search window
map <leader>t :CtrlP<CR>
