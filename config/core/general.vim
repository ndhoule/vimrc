"
" General Settings
"
set timeoutlen=2000
set ttimeoutlen=0

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
