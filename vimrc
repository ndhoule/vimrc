"
" Initial Setup
"

" Path to this file's directory
let g:DOTVIM_PATH = expand('<sfile>:p:h')

" Don't load this file when using evim
if v:progname =~? 'evim'
  finish
endif

"Change leader key from \ to ,
let g:mapleader=','

" Activate : using ;
nnoremap ; :

" Tell vim to remember certain things when we exit
"   '10  :  marks will be remembered for up to 10 previously edited files
"   "100 :  will save up to 100 lines for each register
"   :20  :  up to 20 lines of command-line history will be remembered
"   %    :  saves and restores the buffer list
"   n... :  where to save the viminfo files
set viminfo='1000,\"100,:100,%,n~/.vim/.viminfo

"
" gvim Settings
"

if has('gui_running')
  let s:gvimrc_path = g:DOTVIM_PATH . '/gvimrc'
  if filereadable(gvimrc_path)
    execute('source ' . gvimrc_path)
  endif

  " Load OS-specific gvimrcs
  if has('gui_macvim')
    let s:mvimrc_path = g:DOTVIM_PATH . '/mvimrc'
    if filereadable(mvimrc_path)
      execute('source ' . mvimrc_path)
    endif
  endif
endif

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

for filename in split(glob(g:DOTVIM_PATH . '/config/bundle/**/*.vim'), '\n')
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
