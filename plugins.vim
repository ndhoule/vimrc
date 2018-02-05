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

" Utilities

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'EinfachToll/DidYouMean'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'benmills/vimux'
Plug 'bfredl/nvim-miniyank'
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'guns/xterm-color-table.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'kana/vim-fakeclip'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mtth/scratch.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ndhoule/investigate.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sbdchd/neoformat', { 'do': 'yarn global add prettier' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Rename'
Plug 'w0rp/ale'

" Language Server Protocol
"
" https://microsoft.github.io/language-server-protocol/
" http://langserver.org/

function! InstallLanguageClientDeps(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
    UpdateRemotePlugins
  endif

  if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
    !yarn global add javascript-typescript-langserver flow-language-server dockerfile-language-server-nodejs vscode-json-languageserver-bin
  endif
endfunction

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': function('InstallLanguageClientDeps') }

" Filetypes

Plug 'sheerun/vim-polyglot', { 'do:': 'gometalinter --install --update' }

" Completion

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'

" OS

if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'
endif

" Themes
"
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details

Plug 'chriskempson/base16-vim'

" Finalize loading vim-plug
call plug#end()
