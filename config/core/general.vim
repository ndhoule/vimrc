augroup ndhoule_general
  autocmd!
augroup END

"
" Config.
"

" Eliminate <Esc> delays
set timeoutlen=2000 ttimeoutlen=0

" Use UTF-8 encoding by default
set encoding=utf-8

" Don't keep backup files
set nobackup

" Don't keep swap files
set noswapfile

" Start scrolling five lines from the bottom
set scrolloff=5

" Give vim a long memory
set history=100

" Keep all the undos
set undolevels=1000

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
autocmd ndhoule_general VimResized * :wincmd =
