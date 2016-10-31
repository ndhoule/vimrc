""
" Config
""

let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1

""
" Language config
""

"
" Javascript
"

let g:syntastic_javascript_checkers = ['eslint']

" Attempt to resolve a locally installed version of eslint before falling back
" on the global version
let g:syntastic_javascript_eslint_exec = resolve(expand('<sfile>:p:h') . '/scripts/eslint')

"
" Go
"

let g:syntastic_go_checkers = ['gometalinter']

" interfacer, structcheck, and varcheck are moderately slow; if save times are
" too slow, try disabling them first
" \"--enable=interfacer",
" \"--enable=aligncheck",
let g:syntastic_go_gometalinter_args = join([
      \"--sort line",
      \"--disable-all",
      \"--enable=deadcode",
      \"--enable=golint",
      \"--enable=gosimple",
      \"--enable=gotype",
      \"--enable=govet",
      \"--enable=ineffassign",
      \"--enable=staticcheck",
      \"--enable=structcheck",
      \"--enable=unconvert",
      \"--enable=varcheck",
      \], " ")

" metalinter lints the entire project tree; only show errors for the current
" file. This setting must be run when a file is opened and must be buffer-local,
" otherwise the filter will be overwritten each time a new Go buffer is created
autocmd FileType go let b:syntastic_go_gometalinter_quiet_messages = { "!file:p": expand('%:p') }
