"
" Initial Setup
"

" Don't load this file when using evim
if v:progname =~? "evim"
  finish
endif

"
" Bundles and Plugin Setup
"

" Use local bundles if available
if filereadable(expand('<sfile>:p:h') . '/vimrc.bundles')
  execute('source ' . expand('<sfile>:p:h') . '/vimrc.bundles')
endif

"Change leader key from \ to ,
let mapleader=","

" TODO: MOVE THIS; we need to map mapleader before we can load these files, though
" Load all files in the `config` folder
for filename in split(glob(expand('<sfile>:p:h') . '/config/**/*.vim'), '\n')
  execute('source ' . filename)
endfor

"
" Editor Configuration
"

" Disable ex mode
nnoremap Q <ESC>

" Prevent F1 from toggling Vim's help menu
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Tell vim to remember certain things when we exit
"   '10  :  marks will be remembered for up to 10 previously edited files
"   "100 :  will save up to 100 lines for each register
"   :20  :  up to 20 lines of command-line history will be remembered
"   %    :  saves and restores the buffer list
"   n... :  where to save the viminfo files
set viminfo='1000,\"100,:100,%,n~/.vim/.viminfo

" Restore the cursor to the location it was in last time a given file was edited
function! RestoreCursor()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup restoreCursor
  autocmd!
  autocmd BufWinEnter * call RestoreCursor()
augroup END

"
" General Settings
"

set encoding=utf-8        " Use UTF-8 encoding by default
set scrolloff=5           " Start scrolling five lines from the bottom
set history=100           " Give vim a long memory
set undolevels=1000       " Keep all the undos
set title                 " Change the terminal window's title
set showcmd               " Show inc commands in status line as they're being typed
set nobackup              " Backups go down the hole
set noswapfile            " Swap files go down the hole
set autowrite             " Autosave on make or shell commands
set wildmenu              " Better buffer switching menu
set wildmode=list:longest " Taller :e menu
set autochdir             " Always change to the current file's directory

"
" Text Display and Formatting
"

syntax on                " Turn syntax highlighting on
set cursorline           " Highlight the current line
set cursorcolumn         " Highlight the current column
set relativenumber       " Set line numbering relative to current line
set colorcolumn=80       " Show a max width warning column
set textwidth=100        " Keep text files from getting too wide
set tabstop=2            " Set tab width to four spaces
set softtabstop=2        " Make tabs easier to delete
set shiftwidth=2         " Auto-indent this many spaces
set expandtab            " Turn <Tab> into spaces indicated in tabstop
set relativenumber       " Set line numbering relative to current line
set list listchars=tab:→\ ,trail:· " Highlight trailing spaces, tab chars

"
" Plaintext Editing
"

" Set spelling to English
set spelllang=en

"
" ## Searching
"

set ignorecase           " Ignore case when searching...
set smartcase            " ...Except when search contains an uppercase char
set hlsearch             " Highlight search items
set incsearch            " Highlight search items while typing

"
" Keybindings
"

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

" Toggle rainbow parens (defaults to parens only)
function Rainbows()
  :RainbowParenthesesToggle
  :RainbowParenthesesLoadRound
endfunction

nnoremap <silent> <leader>r :exec Rainbows()<CR>

" Open a scratch file
nnoremap <silent> <leader>s :Scratch<CR>

" Toggle between regular numbering, relative numbering, no numbering
nmap <silent> <F2> :exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>

" Enable paste mode--helps quash indent, etc. problems when pasting blocks of code
nnoremap <F3> :set invpaste paste?<CR>

" Toggle spell check
nnoremap <F4> :set spell!<CR>

" Slimux commands - Send stuff to a REPL for great virtousness
map \sl :SlimuxREPLSendLine<CR>
map \sp :SlimuxShellPrompt<CR>
map \sl :SlimuxShellLast<CR>
map \ss :SlimuxREPLSendSelection<CR>
map \ssc :SlimuxShellConfigure<CR>
map \src :SlimuxShellConfigure<CR>
