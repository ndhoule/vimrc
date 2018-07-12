"
" https://github.com/w0rp/ale
"

nmap <silent> <Leader>en <Plug>(ale_next_wrap)
nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_echo_msg_warning_str = 'W'

let g:ale_completion_enabled = 0

let g:ale_sign_column_always = 1
