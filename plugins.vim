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
Plug 'bfredl/nvim-miniyank', { 'commit': '16880b598a78020d90e56d143723590f0310d3d2' }              " Add a killring
Plug 'dietsche/vim-lastplace', { 'tag': 'v3.1.1' }                                                 " Reopen files in the same location
Plug 'ntpeters/vim-better-whitespace', { 'commit': 'f5726c4bbe84a762d5ec62d57af439138a36af76' }    " Highlight trailing whitespace, with support for blacklisting filetypes
Plug 'tpope/vim-endwise', { 'commit': 'f67d022169bd04d3c000f47b1c03bfcbc4209470'}                  " Automatically close word control structures (if/fi, do/end, etc.)
Plug 'tpope/vim-repeat', { 'tag': 'v1.2' }                                                         " Add support for `.` (repeat) for plugins

" New core commands
Plug 'EinfachToll/DidYouMean', { 'commit': 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e' }            " Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
Plug 'mtth/scratch.vim', { 'commit': '6df617ebc0695bd9839a4fe365a08df13d24bc05' }                  " Open a scratch buffer (clone of emacs functionality)
Plug 'vim-scripts/Rename', { 'tag': '0.3' }                                                        " Rename the current buffer on the filesystem

" Search
Plug 'bronson/vim-visual-star-search', { 'commit': 'fa55818903301d61cef67341d3524a63a14bc033' }    " Make * and # work on visual selections

" Project navigation
Plug 'junegunn/fzf', { 'tag': '0.18.0', 'do': './install --bin' }
Plug 'junegunn/fzf.vim', { 'commit': '359a80e3a34aacbd5257713b6a88aa085337166f' }                  " Fuzzy file finder and file contents searcher
Plug 'majutsushi/tagbar', { 'commit': '387bbadda98e1376ff3871aa461b1f0abd4ece70' }                 " Menu for navigating ctags
Plug 'scrooloose/nerdtree', { 'commit': '2f0d48d632dc303095084b382cb665ae57ad2e63' }               " File navigation menu

" UI
Plug 'itchyny/lightline.vim', { 'commit': '80c242c3c5394fd5143b5d7e2741989ba04ae46a' }             " Customize statusline

" Motions
Plug 'christoomey/vim-sort-motion', { 'commit': '49dfcabeee2bf3a85a6cc0774b35f687b6c9d0e5' }       " Add motions for sorting within a line or range of lines
Plug 'gcmt/wildfire.vim', { 'commit': 'e2baded7162260e05d2527f5bca9fca81f0bc8f2' }                 " Add motions for expanding a visual cursor within a group
Plug 'tomtom/tcomment_vim', { 'commit': '622cc0551bef87a3dfb2846cb339412eeb8ef133' }               " Add motions for commenting out blocks of code
Plug 'tpope/vim-surround', { 'commit': 'ca58a2d886cc18734c90c9665da4775d444b0c04' }                " Add mappings for working on text within pairs of characters (e.g. quotes)

" Text editing
Plug 'mzlogin/vim-markdown-toc', { 'commit': '4c9daef2eaaada5300f9799ab81804d7ed9958ba' }          " Generate a table of contents for a Markdown buffer

" Job execution
Plug 'tpope/vim-dispatch', { 'commit': '5b58b6dc290ece1c37e806e46ee117f5722a535a' }                " Run jobs asynchronously in the background
Plug 'w0rp/ale', { 'tag': 'v2.6.0' }                                                               " Integrate with linters, fixers, formatters, etc.

" Documentation
Plug 'ndhoule/investigate.vim', { 'commit': '2773746099ed6d4adb0cfd252628993cf918c9b3' }           " Open documentation at point (using Dash, browser, shell command, etc.),

" Git integration
Plug 'airblade/vim-gitgutter', { 'commit': '91471746fe687ee867877508dfd809460dab5698' }            " Show Git diff in sign column
Plug 'mattn/gist-vim', { 'commit': 'e485c6c24a62b378a2a4c8687e36e7f54ceca18c' } | Plug 'mattn/webapi-vim' " Create a GitHub Gist from the current buffer
Plug 'tpope/vim-fugitive', { 'commit': '5f9602e12f27bd59e38a0814c524c7c385ef4137' }                " Add vim commands for Git operations
Plug 'tpope/vim-rhubarb', { 'commit': 'c509c7eedeea641f5b0bdae708581ff610fbff5b' }                 " Add vim-fugitive GitHub integration

" Environment
if executable('direnv')
  Plug 'direnv/direnv.vim', { 'commit': '5e75084465ad37dd0a4d4b1198b5ffa8978ae4e1' }               " Source direnv files, keeping vim environment/subshells in sync with host shell env
endif

" Project settings
Plug 'editorconfig/editorconfig-vim', { 'commit': '37bedf88cabb61d4580295b6e347058df7e7f1b4' }     " Add integration for .editorconfig files
Plug 'tpope/vim-projectionist', { 'commit': '92ff29c0c0085ac922cad1a24cf0b0bf69751b4d' }           " Add support for project configuration files ('projections')

" Text editing
Plug 'Raimondi/delimitMate', { 'commit': '728b57a6564c1d2bdfb9b9e0f2f8c5ba3d7e0c5c' }              " Insert matching pairs of characters in insert mode (e.g. (), [], '')

" Language Server Protocol
"
" https://microsoft.github.io/language-server-protocol/
" http://langserver.org/
function! InstallLanguageClientDeps(info)
  if a:info.status == 'installed' || a:info.force
    " Install compiled LanguageClient-neovim binary
    !./install.sh
    " Update remote plugin manifest
    UpdateRemotePlugins
  endif
endfunction

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'tag': '0.1.155',
      \ 'do': function('InstallLanguageClientDeps'),
      \ }

" Syntax highlighting
Plug 'luochen1990/rainbow', { 'commit': '04b7723b810f24152865af656c46e8513489b77a' }               " Hightlight pairs of characters with different colors
Plug 'nathanaelkane/vim-indent-guides', { 'commit': '54d889a63716ee2f1818aa2ec5082db47147147b' }   " Change background color to highlight indentation levels
Plug 'sheerun/vim-polyglot', { 'commit': '4e95df7c7e12cb76e781f2dacf1c07f8984cce58' }              " Install syntax files (and language plugins) for most languages

" Completion
Plug 'roxma/nvim-yarp'                                                                             " ncm2 dependency
Plug 'ncm2/ncm2', { 'commit': 'e5a7976ad175251a96c537488d2d9557fafdcc8b' }                         " Autocompletion engine
Plug 'ncm2/ncm2-bufword', { 'commit': '1d42750114e47a31286268880affcd66c6ae48d5' }                 " ncm2 plugin for completing words present in current buffer
Plug 'ncm2/ncm2-path', { 'commit': '84b1e6b5f28ced2245ff08e6694101f029fdfca8' }                    " ncm2 plugin for completing file paths
Plug 'ncm2/ncm2-tmux', { 'commit': '17fa16ac1211af3d8e671f1591939d6f37bdd3bd' }                    " ncm2 plugin for completing words present in tmux buffers

" Cross-platform support
if g:host_os == 'Darwin'
  Plug 'sjl/vitality.vim', { 'commit': '0f693bff572689ad52b781c012dad4926cd924f6' }                " Improve vim + iTerm2 + tmux interop
endif

" Theming
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details
Plug 'chriskempson/base16-vim'

" Utility libraries
Plug 'dbakker/vim-projectroot', { 'commit': '68787126ebbbe50e120e497ff63696b22f636840' }           " Add functions for finding the current project's root directory path

" Finalize loading vim-plug
call plug#end()
