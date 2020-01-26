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

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" Load vim-plug
call plug#begin(s:plugins_path)

""
" Plugins
""

" Core behavior
Plug 'bfredl/nvim-miniyank', { 'commit': '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b' }              " Add a killring
Plug 'dietsche/vim-lastplace', { 'commit': '48ba343c8c1ca3039224727096aae214f51327d1' }            " Reopen files in the same location
Plug 'ntpeters/vim-better-whitespace', { 'commit': '166a409f1ddade37d1cfd25ba7c6b60270831a95' }    " Highlight trailing whitespace, with support for blacklisting filetypes
Plug 'tpope/vim-endwise', { 'commit': 'bf90d8be447de667f4532b934d1a70881be56dd8'}                  " Automatically close word control structures (if/fi, do/end, etc.)
Plug 'tpope/vim-repeat', { 'commit': 'c947ad2b6a16983724a0153bdf7f66d7a80a32ca' }                  " Add support for `.` (repeat) for plugins

" New core commands
Plug 'EinfachToll/DidYouMean', { 'commit': 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e' }            " Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
Plug 'mtth/scratch.vim', { 'commit': '6df617ebc0695bd9839a4fe365a08df13d24bc05' }                  " Open a scratch buffer (clone of emacs functionality)
Plug 'vim-scripts/Rename', { 'tag': '0.3' }                                                        " Rename the current buffer on the filesystem

" Search
Plug 'bronson/vim-visual-star-search', { 'commit': 'fa55818903301d61cef67341d3524a63a14bc033' }    " Make * and # work on visual selections

" Project navigation
Plug 'junegunn/fzf', { 'commit': '4ec403347c803beccffcf7e9f12bacafcb5d24a2', 'do': './install --bin' }
Plug 'junegunn/fzf.vim', { 'commit': 'dc4c4c22715c060a2babd5a5187004bdecbcdea7' }                  " Fuzzy file finder and file contents searcher
Plug 'majutsushi/tagbar', { 'commit': '6dafb3dfe87dccc055dc6b77b34bd39627226591' }                 " Menu for navigating ctags
Plug 'scrooloose/nerdtree', { 'commit': '26740d1157dc1befe2a088052e10cf00436a5003' }               " File navigation menu

" UI
Plug 'itchyny/lightline.vim', { 'commit': 'f4fa096a67afbe593bd53cf618850c32512b5d47' }             " Customize statusline

" Motions
Plug 'christoomey/vim-sort-motion', { 'commit': '49dfcabeee2bf3a85a6cc0774b35f687b6c9d0e5' }       " Add motions for sorting within a line or range of lines
Plug 'gcmt/wildfire.vim', { 'commit': 'e2baded7162260e05d2527f5bca9fca81f0bc8f2' }                 " Add motions for expanding a visual cursor within a group
Plug 'tomtom/tcomment_vim', { 'commit': '239c0c08d3e691a2c447278b88de91b602fa50bd' }               " Add motions for commenting out blocks of code
Plug 'tpope/vim-surround', { 'commit': 'f51a26d3710629d031806305b6c8727189cd1935' }                " Add mappings for working on text within pairs of characters (e.g. quotes)

" Text editing
Plug 'mzlogin/vim-markdown-toc', { 'commit': '25c6e3d274da6286c9b5c2cc9406c8d113a8426f' }          " Generate a table of contents for a Markdown buffer

" Job execution
Plug 'tpope/vim-dispatch', { 'commit': '1206e1474fc613caeb1ba56d36b71d7f9f7760ac' }                " Run jobs asynchronously in the background
Plug 'dense-analysis/ale', { 'commit': '4afbf2f25dc0ce86b118261b0cfb904c80ae6ba0' }                " Integrate with linters, fixers, formatters, etc.

" Git integration
Plug 'airblade/vim-gitgutter', { 'commit': '2ef4f7e7b20dce7fd89adbeb6a943240b77a7a8e' }            " Show Git diff in sign column
Plug 'tpope/vim-fugitive', { 'commit': '9d62c677378f5ac5abaa8229eb49aaf133fba3fa' }                " Add vim commands for Git operations
Plug 'tpope/vim-rhubarb', { 'commit': 'c509c7eedeea641f5b0bdae708581ff610fbff5b' }                 " Add vim-fugitive GitHub integration

" Environment
Plug 'direnv/direnv.vim', Cond(executable('direnv'), { 'commit': '5e75084465ad37dd0a4d4b1198b5ffa8978ae4e1' }) " Source direnv files, keeping vim environment/subshells in sync with host shell env

" Project settings
Plug 'editorconfig/editorconfig-vim', { 'commit': '7e5b4a91ad55b992247edb87543ed7855db1a199' }     " Add integration for .editorconfig files
Plug 'tpope/vim-projectionist', { 'commit': '17a8b2078a9ca1410d2080419e1cb9c9bb2e4492' }           " Add support for project configuration files ('projections')

" Text editing
Plug 'Raimondi/delimitMate', { 'commit': '728b57a6564c1d2bdfb9b9e0f2f8c5ba3d7e0c5c' }              " Insert matching pairs of characters in insert mode (e.g. (), [], '')

" Language Server Protocol
"
" - http://langserver.org/
" - https://microsoft.github.io/language-server-protocol/
" - :help lsp

function! InstallLanguageClientDeps(info)
  if a:info.status == 'installed' || a:info.force
    " Install compiled LanguageClient-neovim binary
    !./install.sh
    " Update remote plugin manifest
    UpdateRemotePlugins
  endif
endfunction

Plug 'autozimu/LanguageClient-neovim', Cond(!has('nvim-0.5'), {
      \ 'branch': 'next',
      \ 'tag': '0.1.156',
      \ 'do': function('InstallLanguageClientDeps'),
      \ })

Plug 'neovim/nvim-lsp', Cond(has('nvim-0.5'))

" Syntax highlighting
Plug 'luochen1990/rainbow', { 'commit': '04b7723b810f24152865af656c46e8513489b77a' }               " Hightlight pairs of characters with different colors
Plug 'nathanaelkane/vim-indent-guides', { 'commit': '54d889a63716ee2f1818aa2ec5082db47147147b' }   " Change background color to highlight indentation levels
Plug 'sheerun/vim-polyglot', { 'commit': 'e8454d66ab8376cf9c7e42f09749d5bd17d98f89' }              " Install syntax files (and language plugins) for most languages

" Completion
Plug 'roxma/nvim-yarp'                                                                             " ncm2 dependency
Plug 'Anexen/ncm2', { 'branch': 'feature/built-in-lsp' }                                           " Autocompletion engine
Plug 'ncm2/ncm2-bufword', { 'commit': '1d42750114e47a31286268880affcd66c6ae48d5' }                 " ncm2 plugin for completing words present in current buffer
Plug 'ncm2/ncm2-path', { 'commit': '84b1e6b5f28ced2245ff08e6694101f029fdfca8' }                    " ncm2 plugin for completing file paths
Plug 'ncm2/ncm2-tmux', { 'commit': '17fa16ac1211af3d8e671f1591939d6f37bdd3bd' }                    " ncm2 plugin for completing words present in tmux buffers

" Cross-platform support
Plug 'sjl/vitality.vim', Cond(g:host_os == 'Darwin', { 'commit': '0f693bff572689ad52b781c012dad4926cd924f6' }) " Improve vim + iTerm2 + tmux interop

" Theming
" NOTE: You must install your terminal client's base16 color scripts for base16
" themes to look right. See http://chriskempson.com/projects/base16/ for details
Plug 'chriskempson/base16-vim'

" Utility libraries
Plug 'dbakker/vim-projectroot', { 'commit': '68787126ebbbe50e120e497ff63696b22f636840' }           " Add functions for finding the current project's root directory path

" Finalize loading vim-plug
call plug#end()
