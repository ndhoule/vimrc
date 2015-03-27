" vim:ft=vim


"
" Install vim-plug if necessary
"

if empty(glob(g:DOTVIM_PATH . '/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin(g:DOTVIM_PATH . '/plugins')

"
" Bundles
"

Plug 'EinfachToll/DidYouMean'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'airblade/vim-gitgutter'
Plug 'amdt/vim-niji'
Plug 'bling/vim-airline'
Plug 'burnettk/vim-angular'
Plug 'dgrnbrg/vim-redl'
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-sneak'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'myusuf3/numbers.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ndhoule/vim-ragtag'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rizzatti/dash.vim'
Plug 'rizzatti/funcoo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
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
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/fakeclip'
Plug 'vim-scripts/guicolorscheme.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/scratch.vim'

"
" Snippets
"

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"
" Themes
"

" Note that you must install your terminal client's base16 color scripts for
" base16 themes to look correct
" https://github.com/search?q=user%3Achriskempson+base16
Plug 'chriskempson/base16-vim'

call plug#end()
