"
" Initial Setup
"

" Path to this file's directory
let dotvim_path = expand('<sfile>:p:h')

" Don't load this file when using evim
if v:progname =~? "evim"
  finish
endif

"Change leader key from \ to ,
let mapleader=","

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

if has("gui_running")
  let gvimrc_path = dotvim_path . '/gvimrc'
  if filereadable(gvimrc_path)
    execute('source ' . gvimrc_path)
  endif

  " Load OS-specific gvimrcs
  if has("gui_macvim")
    let mvimrc_path = dotvim_path . '/mvimrc'
    if filereadable(mvimrc_path)
      execute('source ' . mvimrc_path)
    endif
  endif
endif

"
" Bundles/Plugin Setup
"

if filereadable(dotvim_path . '/bundles')
  execute('source ' . dotvim_path . '/bundles')
endif

"
" Editor Configuration
"

for filename in split(glob(dotvim_path . '/config/core/**/*.vim'), '\n')
  execute('source ' . filename)
endfor

for filename in split(glob(dotvim_path . '/config/language/**/*.vim'), '\n')
  execute('source ' . filename)
endfor

for filename in split(glob(dotvim_path . '/config/bundle/**/*.vim'), '\n')
  execute('source ' . filename)
endfor

"
" Keybindings
"
" TODO: Move into external configuration files
"

" Fugitive bindings
map <leader>gst :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gL :Glog<CR>
map <leader>ga :Gwrite<CR>
map <leader>gd :Gsdiff<CR>
map <leader>gb :Gblame<CR>

" Activate : using ;
nnoremap ; :

" Map leader to pane switching for great victory
nnoremap <leader>w <C-w>w

" Shortcuts for splitting
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>hs :split<CR>

" Fold within curly braces
nnoremap <leader>} zfi}

" Move down by displayed lines, not actual lines
nnoremap j gj
nnoremap k gk

" Remap Q to reformat paragraph text
vmap Q gq
nmap Q gqap

" Copy to system clipboard
map <leader>y "+yy
" Paste from system clipboard
map <leader>p "+p

" Make writing files via sudo easier
cmap w!! w !sudo tee % >/dev/null

" Launch nerdtree plugin
noremap <silent> <leader>n :NERDTreeToggle<CR>

" Open a scratch file
nnoremap <silent> <leader>S :Scratch<CR>

" Toggle between regular numbering, relative numbering, no numbering
nmap <silent> <F2> :exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>

" Enable paste mode--helps quash indent, etc. problems when pasting blocks of code
nnoremap <F3> :set invpaste paste?<CR>

" Toggle spell check
nnoremap <F4> :set spell!<CR>
