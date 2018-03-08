let g:DOTVIM_PATH = expand('<sfile>:p:h')

if v:progname =~? 'evim'
  finish
endif

if has('win32') || has('win64')
  let g:OS = 'Windows'
elseif has('unix')
  " Strip trailing newline
  let g:host_os = substitute(system('uname'), '\(.*\)\n$', '\1', '')
else
  let g:host_os = 'Unknown'
endif

""
" Initial Setup
""

let g:mapleader=','

" Activate : using ;
nnoremap ; :

""
" Bundles/Plugin Setup
""

if filereadable(g:DOTVIM_PATH . '/plugins.vim')
  execute('source ' . g:DOTVIM_PATH . '/plugins.vim')
endif

""
" General config
""

" Enable spellcheck
set spell
set spelllang=en

" Eliminate <Esc> delays
set timeoutlen=2000 ttimeoutlen=0

" Limit syntax highlighting to 300 columns wide
set synmaxcol=300

" Use UTF-8 encoding by default
set encoding=utf-8

" Don't keep backup files
set nobackup

" Write changes to original file
" http://webpack.github.io/docs/webpack-dev-server.html#working-with-editors-ides-supporting-safe-write
set backupcopy=yes

" Don't keep swap files
set noswapfile

" Use persistent undo files
set undofile
execute "set undodir=" . g:DOTVIM_PATH . '/.vimundo'

" Start scrolling five lines from the bottom
set scrolloff=5

" Give vim a long memory
set history=100

" Keep all the undos
set undolevels=1000

" Enable mouse mode
set mouse=a

" Change the terminal window's title
set title

" Use the current file's directory as root for :e
set autochdir

" Show inc commands in status line as they're being typed
set showcmd

" Autosave on make or shell commands
set autowrite

" Better buffer switching menu
set wildmenu

" Taller :e menu
set wildmode=list:longest

" Automatically rebalance splits when window is resized
autocmd VimResized * :wincmd =

""
" Text Display and Formatting
""

syntax on

set termguicolors

set lazyredraw            " Significantly improves redraw speed in terminal Vim

set relativenumber        " Set line numbering relative to current line
set number                " Show the current line number in relative linenum mode

set tabstop=2             " Set tab width to two spaces
set softtabstop=2         " Make tabs easier to delete
set shiftwidth=2          " Auto-indent this many spaces
set shiftround            " <Tab> inserts to the nearest multiple of `shiftwidth`
set expandtab             " <Tab> inserts `tabstop` number of characters

let &colorcolumn=100      " Show max width warning columns
set textwidth=100         " Wrap long lines automatically

set list listchars=tab:→\ ,trail:· " Highlight trailing spaces, tab chars

""
" Search
""

set ignorecase           " Ignore case when searching...
set smartcase            " ...Except when search contains an uppercase char
set hlsearch             " Highlight search items
set incsearch            " Highlight search items while typing

""
" Keybindings
""

" Disable ex mode
nnoremap Q <ESC>

" Prevent F1 from toggling Vim's help menu
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

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

" Move lines
inoremap <A-j> <Esc>:m .+1<CR>==gi
nnoremap <A-j> :m .+1<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-k> :m '<-2<CR>gv=gv

" Copy to system clipboard
map <Leader>y "+yy
" Paste from system clipboard
map <Leader>p "+p

" Make writing files via sudo easier
cmap w!! w !sudo tee % >/dev/null

" Yank the current filename to the OS clipboard
noremap <silent> <F2> :let @+=expand("%:p")<CR>

" Toggle between regular numbering, relative numbering, no numbering
nmap <silent> <F3> :exec &nu==&rnu ? 'se nu!' : 'se rnu!'<CR>

" Toggle spell check
nnoremap <F4> :set spell!<CR>

" Enable paste mode--helps quash indent, etc. problems when pasting blocks of code
nnoremap <F5> :set invpaste paste?<CR>

" TODO(ndhoule): Move to config file

let g:rooter_manual_only = 1
let g:ale_sign_column_always = 1
