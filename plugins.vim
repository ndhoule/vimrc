"
" vim-plug
"

" Install vim-plug if necessary
if empty(glob(g:DOTVIM_PATH . '/autoload/plug.vim'))
  " TODO: Remove this hardcoded `.nvim` path
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Load vim-plug
call plug#begin(g:PLUGINS_PATH)

"
" Bundles
"

Plug 'AndrewRadev/sideways.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'burnettk/vim-angular'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dgrnbrg/vim-redl'
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'haya14busa/incsearch.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-fakeclip'
Plug 'kurkale6ka/vim-swap'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'myusuf3/numbers.vim'
Plug 'ndhoule/vim-ragtag'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rizzatti/funcoo.vim' | Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'stephpy/vim-yaml'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'typedclojure/vim-typedclojure'
Plug 'vim-scripts/Rename'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/guicolorscheme.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/scratch.vim'

"
" Themes
"

" Note that you must install your terminal client's base16 color scripts for
" base16 themes to look correct
" https://github.com/search?q=user%3Achriskempson+base16
Plug 'chriskempson/base16-vim'

call plug#end()
