""
" Config
""

let s:PWD = resolve(expand('<sfile>:p:h'))
let s:YCM_EXTRA_CONF_PATH = s:PWD . '/ycm_extra_conf.py'

" Set a path to a fallback YCM configuration file. When a project doesn't have
" a local .ycm_extra_conf.py, YCM will use this file.
let g:ycm_global_ycm_extra_conf = s:YCM_EXTRA_CONF_PATH

" A whitelist list of YCM config files
" let g:ycm_extra_conf_globlist = [s:YCM_EXTRA_CONF_PATH]

" Disable completion preview buffer, it conflicts with completion+popover
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview

let g:ycm_seed_identifiers_with_syntax = 1

""
" Key bindings
""

let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

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
