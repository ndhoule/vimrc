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
" Bundles/Plugin Setup
""

if filereadable(g:DOTVIM_PATH . '/plugins.vim')
  execute('source ' . g:DOTVIM_PATH . '/plugins.vim')
endif

""
" General config
""

" Limit syntax highlighting to 300 columns wide (perf)
set synmaxcol=300

" Don't keep backup files
" TODO(ndhoule): Does this make sense in conjunction with backupcopy=yes?
set nobackup

" Write changes to original file. Fixes watch mode in some applications.
" https://webpack.js.org/guides/development/#adjusting-your-text-editor
set backupcopy=yes

" Don't keep swap files
set noswapfile

" Use persistent undo files
set undofile
execute "set undodir=" . g:DOTVIM_PATH . '/.vimundo'

" Start scrolling five lines from the bottom
set scrolloff=5

" Scroll five lines at a time (perf)
set scrolljump=5

" Enable mouse mode
set mouse=a

" Change the terminal window's title
set title

" Use the current file's directory as root for :e
set autochdir

" Autosave on make or shell commands
set autowrite

" Taller :e menu
set wildmode=list:longest

" TODO(ndhoule): Revisit these settings
set foldmethod=indent
set foldlevelstart=100 " Don't show any folds on open file

" Automatically rebalance splits when window is resized
autocmd VimResized * :wincmd =

""
" Text Display/Formatting
""

set termguicolors

set number                " Show the current line number
" TODO(ndhoule): Disabled 9/16/18 to test (performance, supposedly very taxing performance-wise)
" set relativenumber        " Set line numbering relative to current line

set tabstop=2             " Set tab width to two spaces
set softtabstop=2         " Make tabs easier to delete
set shiftwidth=2          " Auto-indent this many spaces
set shiftround            " <Tab> inserts to the nearest multiple of `shiftwidth`
set expandtab             " <Tab> inserts `tabstop` number of characters

" TODO(ndhoule): Revisit, can this be set by editorconfig?
let &colorcolumn=100      " Show max width warning columns
" TODO(ndhoule): Revisit; isn't this always annoying?
set textwidth=100         " Wrap long lines automatically

" Highlight whitespace
set list
set listchars=tab:→\ ,trail:·

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


let g:mapleader=','

" Activate : using ;
nnoremap ; :

" Disable ex mode
nnoremap Q <ESC>

" Prevent F1 from toggling Vim's help menu
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Close windows
noremap <leader>w :close<CR>
noremap <leader>W :only<CR>

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
noremap <silent> <Leader>f :let @+=expand("%:p")<CR>

" Toggle between regular numbering, relative numbering, no numbering
nmap <silent> <F3> :exec &nu==&rnu ? 'se nu!' : 'se rnu!'<CR>

" Toggle spell check
nnoremap <F4> :set spell!<CR>

" Enable paste mode--helps quash indent, etc. problems when pasting blocks of code
nnoremap <F5> :set invpaste paste?<CR>

"
" TODO(ndhoule): Move to config file
"

" TODO(ndhoule): No idea why this is here
let g:scratch_no_mappings = 1
