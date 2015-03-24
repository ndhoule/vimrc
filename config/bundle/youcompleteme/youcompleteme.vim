"
" Config.
"
" TODO: Document this a bit better.
"

let s:PWD = resolve(expand('<sfile>:p:h'))

let g:ycm_add_preview_to_completeopt=0

let g:ycm_confirm_extra_conf=0

set completeopt-=preview

" Set a path to a fallback YCM configuration file. When a project doesn't have
" a local .ycm_extra_conf.py, YCM will use this file.
let g:ycm_global_ycm_extra_conf = s:PWD . '/ycm_extra_conf.py'

"
" Key bindings.
"

let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Jump to definition/declarations. For a list of filetypes supported, check out:
" https://github.com/Valloric/YouCompleteMe#ycmcompleter-subcommands
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jDef :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jDec :YcmCompleter GoToDeclaration<CR>
