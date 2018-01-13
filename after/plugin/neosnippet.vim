"
" https://github.com/Shougo/neosnippet.vim
"

let g:neosnippet#disable_runtime_snippets = {
      \   '_' : 1,
      \ }
let g:neosnippet#snippets_directory = g:DOTVIM_PATH . '/snippets'
let g:neosnippet#enable_completed_snippet = 1

imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
