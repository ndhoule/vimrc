""
" Config
""

" Disable completion preview buffer, it conflicts with completion+popover
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

" Seed completion from syntax files
let g:ycm_seed_identifiers_with_syntax = 1

""
" Language config
""

"
" Rust
"

let g:ycm_rust_src_path = $HOME . '/dev/src/github.com/rust-lang/rust/src'

"
" Javascript
"

autocmd FileType javascript nnoremap <silent> gd :YcmCompleter GoToDefinition<cr>
