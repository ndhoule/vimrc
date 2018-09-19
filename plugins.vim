""
" vim-plug
"
" https://github.com/junegunn/vim-plug
""

let s:plug_vim_path = g:DOTVIM_PATH . '/autoload/plug.vim'
let s:plugins_path = g:DOTVIM_PATH . '/vendor'

" Install vim-plug if not present
if empty(glob(s:plug_vim_path))
  execute "silent !curl -fLo " . s:plug_vim_path . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall --sync
endif

" Load vim-plug
call plug#begin(s:plugins_path)

""
" Plugins
""

" Core behavior
Plug 'tpope/vim-sensible'

Plug 'bfredl/nvim-miniyank'
Plug 'dietsche/vim-lastplace'
Plug 'ntpeters/vim-better-whitespace' " TODO(ndhoule): Still necessary?
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'

" Navigation
Plug 'majutsushi/tagbar'

" UI
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

" New core commands
Plug 'EinfachToll/DidYouMean'
Plug 'mtth/scratch.vim'
Plug 'vim-scripts/Rename'

" Motions
Plug 'christoomey/vim-sort-motion'
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular' " TODO(ndhoule): start using or remove (alt: https://github.com/junegunn/vim-easy-align)
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" Task runners/integrations
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'

" Linting/autofixing
Plug 'w0rp/ale'

" Documentation
Plug 'ndhoule/investigate.vim' " TODO(ndhoule): start or remove

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Environment
Plug 'direnv/direnv.vim'

" Project settings
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-projectionist'

" Text editing
Plug 'Raimondi/delimitMate'

" Language Server Protocol
"
" https://microsoft.github.io/language-server-protocol/
" http://langserver.org/
function! InstallLanguageClientDeps(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
    UpdateRemotePlugins
  endif
endfunction

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'tag': '0.1.120', 'do': function('InstallLanguageClientDeps') }

" Syntax highlighting
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'

" Completion
Plug 'ncm2/ncm2' | Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'

" Cross-platform support
if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim'
endif

" theming
"
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details
Plug 'chriskempson/base16-vim'

" utility libraries
Plug 'dbakker/vim-projectroot'

" Finalize loading vim-plug
call plug#end()
