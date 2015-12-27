"
" Config.
"

let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
" Silence warning messages. This is mostly because I make heavy usage of
" warnings in ESLint configurations, but that is probably an antipattern/this
" should be removed eventually.
let g:syntastic_quiet_messages = { "level": "warning" }

"
" Language-specific config.
"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = resolve(expand('<sfile>:p:h') . '/scripts/eslint')
