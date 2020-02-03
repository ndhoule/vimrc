" vim:fdm=expr:fdl=0
" vim:fde=getline(v\:lnum)=~'^"#'?'>'.(matchend(getline(v\:lnum),'"#*')-1)\:'='

if &compatible
  set nocompatible
endif

function! PackInit() abort
  "# Minpac setup

  packadd minpac
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "# Plugins

  "## Libraries

  " Add functions for finding the current project's root directory path
  call minpac#add('dbakker/vim-projectroot', {'rev': '68787126ebbbe50e120e497ff63696b22f636840'})

  "## Core behavior

  " Use a common set of vim defaults
  call minpac#add('tpope/vim-sensible')

  " Add a killring
  call minpac#add('bfredl/nvim-miniyank', {'rev': '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b'})

  " Reopen files in the same location
  call minpac#add('dietsche/vim-lastplace', {'rev': '48ba343c8c1ca3039224727096aae214f51327d1'})

  " Highlight trailing whitespace, with support for blacklisting filetypes
  call minpac#add('ntpeters/vim-better-whitespace', {'rev': '166a409f1ddade37d1cfd25ba7c6b60270831a95'})

  " Automatically close word control structures (if/fi, do/end, etc.)
  call minpac#add('tpope/vim-endwise', {'rev': 'bf90d8be447de667f4532b934d1a70881be56dd8'})

  " Add support for `.` (repeat) for plugins
  call minpac#add('tpope/vim-repeat', {'rev': 'c947ad2b6a16983724a0153bdf7f66d7a80a32ca'})

  "## New core commands

  " Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
  call minpac#add('EinfachToll/DidYouMean', {'rev': 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e'})

  " Open a scratch buffer (clone of emacs functionality)
  call minpac#add('mtth/scratch.vim', {'rev': '6df617ebc0695bd9839a4fe365a08df13d24bc05'})

  " Rename the current buffer on the filesystem
  call minpac#add('vim-scripts/Rename', {'rev': '0.3'})

  "## Search

  " Make * and # work on visual selections
  call minpac#add('bronson/vim-visual-star-search', {'rev': 'fa55818903301d61cef67341d3524a63a14bc033'})

  "## Project navigation

  " Fuzzy file finder and file contents searcher
  call minpac#add('junegunn/fzf', {'rev': '4ec403347c803beccffcf7e9f12bacafcb5d24a2', 'do': './install --bin'})
  call minpac#add('junegunn/fzf.vim', {'rev': 'dc4c4c22715c060a2babd5a5187004bdecbcdea7'})

  " Menu for navigating ctags, LSP symbols, etc.
  call minpac#add('liuchengxu/vista.vim', {'rev': 'dd5769ec7a1e4c2c8927a6af4d26f88524faa60c'})

  " File navigation menu
  call minpac#add('scrooloose/nerdtree', {'rev': '26740d1157dc1befe2a088052e10cf00436a5003'})

  "## Statusline

  " Customize statusline
  call minpac#add('itchyny/lightline.vim', {'rev': 'f4fa096a67afbe593bd53cf618850c32512b5d47'})

  "## Motions

  " Add motions for sorting within a line or range of lines
  call minpac#add('christoomey/vim-sort-motion', {'rev': '49dfcabeee2bf3a85a6cc0774b35f687b6c9d0e5'})

  " Add motions for expanding a visual cursor within a group
  call minpac#add('gcmt/wildfire.vim', {'rev': 'e2baded7162260e05d2527f5bca9fca81f0bc8f2'})

  " Add motions for commenting out blocks of code
  call minpac#add('tomtom/tcomment_vim', {'rev': '239c0c08d3e691a2c447278b88de91b602fa50bd'})

  " Add mappings for working on text within pairs of characters (e.g. quotes)
  call minpac#add('tpope/vim-surround', {'rev': 'f51a26d3710629d031806305b6c8727189cd1935'})

  "## Text editing

  " Extras for Markdown editing, including TOC generation
  call minpac#add('SidOfc/mkdx', {'rev': 'ba6f9748258d73ff9f68913f061cdba822343758'})

  "## Job execution

  " Run jobs asynchronously in the background
  call minpac#add('tpope/vim-dispatch', {'rev': '1206e1474fc613caeb1ba56d36b71d7f9f7760ac'})

  " Integrate with linters, fixers, formatters, etc.
  call minpac#add('dense-analysis/ale', {'rev': '4afbf2f25dc0ce86b118261b0cfb904c80ae6ba0'})

  "## Git integration

  " Show Git diff in sign column
  call minpac#add('airblade/vim-gitgutter', {'rev': '2ef4f7e7b20dce7fd89adbeb6a943240b77a7a8e'})

  " Add vim commands for Git operations
  call minpac#add('tpope/vim-fugitive', {'rev': '9d62c677378f5ac5abaa8229eb49aaf133fba3fa'})

  " Add vim-fugitive GitHub integration
  call minpac#add('tpope/vim-rhubarb', {'rev': 'c509c7eedeea641f5b0bdae708581ff610fbff5b'})

  "## Environment

  if executable('direnv')
    " Source direnv files, keeping vim environment/subshells in sync with host shell env
    call minpac#add('direnv/direnv.vim', {'rev': '5e75084465ad37dd0a4d4b1198b5ffa8978ae4e1'})
  endif

  "## Project settings

  " Add integration for .editorconfig files
  call minpac#add('editorconfig/editorconfig-vim', {'rev': '7e5b4a91ad55b992247edb87543ed7855db1a199'})

  " Add support for project configuration files ('projections')
  call minpac#add('tpope/vim-projectionist', {'rev': '17a8b2078a9ca1410d2080419e1cb9c9bb2e4492'})

  " Load project-specific vimrc (.lvimrc) files
  call minpac#add('embear/vim-localvimrc', {'rev': '0b36a367f4d46b7f060836fcbfec029cce870ea9'})

  "## Text editing

  " Insert matching pairs of characters in insert mode (e.g. (), [], '')
  call minpac#add('Raimondi/delimitMate', {'rev': '728b57a6564c1d2bdfb9b9e0f2f8c5ba3d7e0c5c'})

  "## Language Server Protocol

  " - http://langserver.org/
  " - https://microsoft.github.io/language-server-protocol/
  " - :help lsp

  if has('nvim-0.5')
    " neovim 0.5+ comes with a built-in LSP client. Use it when it's available.
    call minpac#add('neovim/nvim-lsp')
  else
    function! s:InstallLanguageClientDeps(hooktype, name)
      if a:hooktype == 'post-update'
  " Install compiled LanguageClient-neovim binary

        !./install.sh
  " Update remote plugin manifest

        UpdateRemotePlugins
      endif
    endfunction

    call minpac#add('autozimu/LanguageClient-neovim', {
          \   'rev': '0.1.156',
          \   'branch': 'next',
          \   'do': function('s:InstallLanguageClientDeps')
          \ })
  endif

  "## Syntax highlighting

  " Hightlight pairs of characters with different colors
  call minpac#add('luochen1990/rainbow', {'rev': '04b7723b810f24152865af656c46e8513489b77a'})
  call minpac#add('nathanaelkane/vim-indent-guides', {'rev': '54d889a63716ee2f1818aa2ec5082db47147147b'}) " Change background color to highlight indentation levels
  " Install syntax files (and language plugins) for most languages
  call minpac#add('sheerun/vim-polyglot', {'rev': 'e8454d66ab8376cf9c7e42f09749d5bd17d98f89'})

  "## Completion

  " Autocompletion engine
  call minpac#add('roxma/nvim-yarp')
  " TODO(ndhoule): Revert to using ncm2/ncm2 once it supports native LSP completion:
  " - https://github.com/ncm2/ncm2/issues/93
  " - https://github.com/ncm2/ncm2/pull/178
  call minpac#add('Anexen/ncm2', {'rev': 'feature/built-in-lsp'})

  " ncm2 plugin for completing words present in current buffer
  call minpac#add('ncm2/ncm2-bufword', {'rev': '1d42750114e47a31286268880affcd66c6ae48d5'})

  " ncm2 plugin for completing file paths
  call minpac#add('ncm2/ncm2-path', {'rev': '84b1e6b5f28ced2245ff08e6694101f029fdfca8'})

  " ncm2 plugin for completing words present in tmux buffers
  call minpac#add('ncm2/ncm2-tmux', {'rev': '17fa16ac1211af3d8e671f1591939d6f37bdd3bd'})

  "## Theming

  " NOTE: You must configure your terminal's color scheme for these themes to render correctly.
  " See http://chriskempson.com/projects/base16/ for details.
  call minpac#add('chriskempson/base16-vim')

  "## Cross-platform support

  if g:host_os == 'Darwin'
    " Improve vim + iTerm2 + tmux interop
    call minpac#add('sjl/vitality.vim', {'rev': '0f693bff572689ad52b781c012dad4926cd924f6'})
  endif
endfunction

" Define user commands for interacting with plugins. Each of these loads minpac and reloads the
" vimrc (running the guarded section below)
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
