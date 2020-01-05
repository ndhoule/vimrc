" Absolute path to .vim directory.
let g:DOTVIM_PATH = expand('<sfile>:p:h')

" Bail if running evim. (They don't deserve a nice config.)
if v:progname =~? 'evim'
  finish
endif

" Export OS nicename as `g:host_os`. Includes (but not limited to):
" Darwin | FreeBSD | Linux | Windows
if has('win32') || has('win64')
  let g:host_os = 'Windows'
elseif has('unix')
  " Strip trailing newline
  let g:host_os = substitute(system('uname'), '\(.*\)\n$', '\1', '')
else
  let g:host_os = 'Unknown'
endif

""
" Plugin Setup
""

" XXX(ndhoule): Fix and remove
let g:scratch_no_mappings = 1

if filereadable(g:DOTVIM_PATH . '/plugins.vim')
  execute('source ' . g:DOTVIM_PATH . '/plugins.vim')
endif

""
" General Config
""

" Enable backup files
set backup
" Write changes to original file. Fixes watch mode for some file watchers (e.g. Webpack's).
" https://webpack.js.org/guides/development/#adjusting-your-text-editor
set backupcopy=yes
let &backupdir = g:DOTVIM_PATH . '/.backup//'
call mkdir(&backupdir, 'p')

" Enable swapfiles
set swapfile
let &directory = g:DOTVIM_PATH . '/.swp//'
call mkdir(&directory, 'p')

" Enable persistent undofiles
set undofile
let &undodir = g:DOTVIM_PATH . '/.undo//'
call mkdir(&undodir, 'p')

autocmd VimResized * :wincmd = " Automatically rebalance splits when window is resized

set clipboard=unnamedplus  " Use the system clipboard
set autochdir              " Set cwd to the current buffer's containing directory
set autowrite              " Save before executing shell commands to prevent working on a stale file
set foldlevelstart=100     " Don't fold on fileopen
set foldmethod=indent      " Use indentation levels to fold
set mouse=a                " Enable mouse in all modes
set scrolljump=5           " Scroll five lines at a time (perf)
set scrolloff=5            " Start scrolling five lines from the bottom (perf)
set synmaxcol=300          " Limit syntax highlighting to 300 columns wide (perf)

""
" UI
""

set colorcolumn=100                 " Show warning column at 100 characters
set list listchars=tab:→\ ,trail:·  " Show glyphs in place of special whitespace characters
set number                          " Show line number in gutter
set termguicolors                   " Use 24-bit color
set title                           " Set terminal title
set wildmode=list:longest           " Show wildmenu in tall list

""
" Text Display/Formatting
""

set expandtab      " <Tab> inserts spaces
set shiftround     " Round indentation to nearest multiple of `shiftwidth`
set shiftwidth=2   " Spaces to use for autoindent
set softtabstop=2  " <Tab> inserts n spaces
set tabstop=2      " <Tab> inserts n spaces
set textwidth=100  " Automatically wrap long lines

""
" Search
""

set hlsearch              " Highlight all search matches
set ignorecase            " Ignore case when searching
set incsearch             " Highlight search items while typing
set smartcase             " Don't ignore case in search when term contains an uppercase char
if has("nvim")
  set inccommand=nosplit  " Show substitutions incrementally, as you type them
endif

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

" Clear any text highlighted by hlsearch
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" FIXME(ndhoule): Doesn't work lately on OS X
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
