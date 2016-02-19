if v:progname =~? 'evim'
  finish
endif

"
" Paths
"

" Path to this file's directory
let g:DOTVIM_PATH = expand('<sfile>:p:h')
let g:PLUGINS_PATH = g:DOTVIM_PATH . '/vendor'

"
" Initial Setup
"

let g:mapleader=','

" Activate : using ;
nnoremap ; :

"
" Bundles/Plugin Setup
"

if filereadable(g:DOTVIM_PATH . '/plugins.vim')
  execute('source ' . g:DOTVIM_PATH . '/plugins.vim')
endif

"
" Editor Configuration
"

for filename in split(glob(g:DOTVIM_PATH . '/config/core/**/*.vim'), '\n')
  execute('source ' . filename)
endfor

for filename in split(glob(g:DOTVIM_PATH . '/config/language/**/*.vim'), '\n')
  execute('source ' . filename)
endfor

for filename in split(glob(g:DOTVIM_PATH . '/config/plugins/**/*.vim'), '\n')
  execute('source ' . filename)
endfor

"
" Keybindings
"
" TODO: Move into external configuration files
"

" Cycle through open panes using <Leader>w
nnoremap <Leader>w <C-w>w

" Split panes
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>hs :split<CR>

" Move down by displayed lines, not actual lines
nnoremap j gj
nnoremap k gk

" Remap Q to reformat paragraph text
vmap Q gq
nmap Q gqap

" Copy to system clipboard
map <Leader>y "+yy
" Paste from system clipboard
map <Leader>p "+p

" Make writing files via sudo easier
cmap w!! w !sudo tee % >/dev/null

" Enable paste mode--helps quash indent, etc. problems when pasting blocks of code
nnoremap <F3> :set invpaste paste?<CR>

" Toggle between regular numbering, relative numbering, no numbering
nmap <silent> <F2> :exec &nu==&rnu ? 'se nu!' : 'se rnu!'<CR>

" Toggle spell check
nnoremap <F4> :set spell!<CR>
