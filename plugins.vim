""
" vim-plug
"
" https://github.com/junegunn/vim-plug
""

let s:plug_vim_path = g:DOTVIM_PATH . '/autoload/plug.vim'
let s:plugins_path = g:DOTVIM_PATH . '/vendor'

" Install vim-plug if nonexistent
if empty(glob(s:plug_vim_path))
  execute "silent !curl -fLo " . s:plug_vim_path . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync
endif

" Load vim-plug
call plug#begin(s:plugins_path)

""
" Plugins
""

" TODOs:
" - rainbow not working very well
" - neosnippet + deoplete not working well together;
"     - unclear how to trigger snippets
"     - completion of function args not working (flow)
" - add more completion plugins
" - add jump to def keyboard shortcuts
" - investigate html plugins (vim-ragtag, emmet, etc.)
" - look into paredit
" - look into numbers.vim
" - add sideways.vim or vim-swap

" Utilities
Plug 'EinfachToll/DidYouMean'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'guns/xterm-color-table.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'kana/vim-fakeclip'
Plug 'ndhoule/investigate.vim'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mtth/scratch.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Rename'
Plug 'vim-scripts/YankRing.vim'
Plug 'w0rp/ale'

" Language
"Plug 'flowtype/vim-flow'
Plug 'heavenshell/vim-jsdoc'
Plug 'sheerun/vim-polyglot', { 'do:': 'gometalinter --install --update' }

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'carlitux/deoplete-ternjs'
Plug 'wokalski/autocomplete-flow'

" OS-Specific
if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'
endif

" Themes
"
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details
Plug 'chriskempson/base16-vim'

call plug#end()
