"
" vim-plug
"

let s:plug_vim_path = g:DOTVIM_PATH . '/autoload/plug.vim'
let s:plugins_path = g:DOTVIM_PATH . '/vendor'

" Install vim-plug if nonexistent
if empty(glob(s:plug_vim_path))
  execute "silent !curl -fLo " . s:plug_vim_path . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

" Load vim-plug
call plug#begin(s:plugins_path)

"
" Plugins
"

" General
Plug 'AndrewRadev/sideways.vim' " TODO: Keep this or vim-swap
Plug 'EinfachToll/DidYouMean'
Plug 'Raimondi/delimitMate' " TODO: Investigate replacing this with paredit
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake' " TODO: Keep an eye on this as a possible Syntastic replacement
Plug 'dgrnbrg/vim-redl'
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-fakeclip'
Plug 'keith/investigate.vim'
Plug 'kurkale6ka/vim-swap' " TODO: Keep this or sideways.vim
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'myusuf3/numbers.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ndhoule/vim-ragtag'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/syntastic'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Rename'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/scratch.vim'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer --racer-completer --tern-completer' }

" Language
Plug 'burnettk/vim-angular'
Plug 'fatih/vim-go', { 'do:': 'gometalinter --install' }
Plug 'hashivim/vim-terraform'
Plug 'heavenshell/vim-jsdoc'
Plug 'mattn/emmet-vim'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'
Plug 'typedclojure/vim-typedclojure'
Plug 'yoppi/fluentd.vim'

" OS X
if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'
endif

"
" Themes
"

" Note that you must install your terminal client's base16 color scripts for
" base16 themes to look correct
" https://github.com/search?q=user%3Achriskempson+base16
Plug 'chriskempson/base16-vim'

call plug#end()
