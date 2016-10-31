""
" Config
""

" Use gofmt as default formatter (alternative: goimports, which is very slow)
let g:go_fmt_command = "gofmt"

" Enable syntax highlighting
let g:go_highlight_build_constraints = 0
let g:go_highlight_functions = 1
let g:go_highlight_interfaces = 0
let g:go_highlight_methods = 0
let g:go_highlight_operators = 0
let g:go_highlight_structs = 0

" Already highlight trailing whitespace globally
let g:go_highlight_trailing_whitespace_error = 0
