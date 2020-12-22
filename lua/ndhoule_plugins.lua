vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- Add functions for finding the current project's root directory path
  use {'dbakker/vim-projectroot', commit = '68787126ebbbe50e120e497ff63696b22f636840'}

  -- ## Core behavior

  -- Use a common set of vim defaults
  use 'tpope/vim-sensible'

  -- Add a killring
  use {'bfredl/nvim-miniyank', commit = '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b'}

  -- Highlight trailing whitespace, with support for blacklisting filetypes
  use {'ntpeters/vim-better-whitespace', commit = '8cf4b2175dd61416c2fe7d3234324a6c59d678de'}

  -- Automatically close word control structures (if/fi, do/end, etc.)
  use {'tpope/vim-endwise', commit = '97180a73ad26e1dcc1eebe8de201f7189eb08344'}

  -- Add support for `.` (repeat) for plugins
  use {'tpope/vim-repeat', commit = 'c947ad2b6a16983724a0153bdf7f66d7a80a32ca'}

  -- ## New core commands

  -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
  use {'EinfachToll/DidYouMean', commit = 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e'}

  -- Open a scratch buffer (clone of emacs functionality)
  use {'mtth/scratch.vim', commit = '6df617ebc0695bd9839a4fe365a08df13d24bc05'}

  -- Rename the current buffer on the filesystem
  use {'vim-scripts/Rename', tag = '0.3'}

  -- ## Search

  -- Make * and # work on visual selections
  use {'bronson/vim-visual-star-search', commit = 'e48c3fe596229e38f5a0e5313455e835c14aeb6a'}

  -- ## Project navigation

  -- Fuzzy file finder and file contents searcher
  use {
    'junegunn/fzf.vim',
    commit = 'e9d62b4c873f5f207202b4ba5bbd63de7003a0d3',
    requires = {
      {
        'junegunn/fzf',
        commit = 'ab3937ee5a62d63bac9307bfe72601eeb4fc9cd2',
        run = './install --bin'
      }
    }
  }

  -- Menu for navigating ctags, LSP symbols, etc.
  use {'liuchengxu/vista.vim', commit = 'd77828b043d980b99e386840d57629f6499e9995'}

  -- File navigation menu
  use {'preservim/nerdtree', commit = '14af89743ac1c31ff9bb43682025eda50333a7d5'}

  -- ## Statusline

  -- Customize statusline
  use {'itchyny/lightline.vim', commit = '709b2d8dc88fa622d6c076f34b05b58fcccf393f'}

  -- ## Motions

  -- Add motions for sorting within a line or range of lines
  use {'christoomey/vim-sort-motion', commit = '49dfcabeee2bf3a85a6cc0774b35f687b6c9d0e5'}

  -- Add motions for expanding a visual cursor within a group
  use {'gcmt/wildfire.vim', commit = 'e2baded7162260e05d2527f5bca9fca81f0bc8f2'}

  -- Add motions for commenting out blocks of code
  use {'tomtom/tcomment_vim', commit = '2037d05870e10e03b2e157a09ae007c179efd253'}

  -- Add mappings for working on text within pairs of characters (e.g. quotes)
  use {'tpope/vim-surround', commit = 'f51a26d3710629d031806305b6c8727189cd1935'}

  -- ## Text editing

  -- Extras for Markdown editing, including TOC generation
  use {'SidOfc/mkdx', commit = '43f602ee353e46171e846a3010f0125b12eab6b4'}

  -- ## Job execution

  -- Run jobs asynchronously in the background
  use {'tpope/vim-dispatch', commit = 'fe6a34322829e466a7e8ce710a6ac5eabddff9fd'}

  -- Integrate with linters, fixers, formatters, etc.
  use {'dense-analysis/ale', commit = 'f996ede5999c99b1b3e3cecc02dbd06cb286d3ff'}

  -- Debugging
  use {
    'puremourning/vimspector',
    commit = '78bec87f4ed058dfad6f8c33f487719db10f1bd3',
    run = ':VimspectorUpdate'
  }

  -- ## VCS

  use {'mhinz/vim-signify', commit = '98c693f7a1a91b73d9232d868765b4d20af892fe'}

  -- Add vim commands for Git operations
  use {'tpope/vim-fugitive', commit = '660d2ba2b60026a9069ee005562ddad6a67f9fb0'}

  -- Add vim-fugitive GitHub integration
  use {'tpope/vim-rhubarb', commit = 'c509c7eedeea641f5b0bdae708581ff610fbff5b'}

  -- ## Environment

  -- FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
  -- if executable('direnv')
  --   -- Source direnv files, keeping vim environment/subshells in sync with host shell env
  --   use {'direnv/direnv.vim', commit = 'ff37d76da391e1ef299d2f5eb84006cb27a67799'}
  -- endif

  -- ## Project settings

  -- Add integration for .editorconfig files
  use {'editorconfig/editorconfig-vim', commit = '047c4b455b9d56adee63a52d6d7cdf5bb6521d53'}

  -- Add support for project configuration files ('projections')
  use {'tpope/vim-projectionist', commit = '0c6967d3a8c3bd3d3b42013531c3f12c843aff80'}

  -- Load project-specific vimrc (.lvimrc) files
  use {'embear/vim-localvimrc', commit = 'ac6444afb5fd11e3f7750f696a0c6b8b0b6ec116'}

  -- ## Text editing

  -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
  use {'Raimondi/delimitMate', commit = '537a1da0fa5eeb88640425c37e545af933c56e1b'}

  -- ## Language Server Protocol

  -- - http://langserver.org/
  -- - https://microsoft.github.io/language-server-protocol/
  -- - :help lsp
  use {
    'neovim/nvim-lspconfig',
    commit = 'dbc4bf514198f9e328e200a9aa63b462d6e1e9f1',
    disable = not vim.g.ENABLE_LSP
  }

  -- ## Syntax highlighting

  -- Hightlight pairs of characters with different colors
  use {'luochen1990/rainbow', commit = '4d15633cdaf61602e1d9fd216a77fc02e0881b2d'}

  -- Change background color to highlight indentation levels
  use {'nathanaelkane/vim-indent-guides', commit = '54d889a63716ee2f1818aa2ec5082db47147147b'}

  -- Highlight color names and codes in the same color that they represent
  use {'chrisbra/Colorizer', commit = '879e6c69c0c02c4ef0f08b3955c60de16efd8fb8'}

  use {
    'nvim-treesitter/nvim-treesitter',
    disable = not vim.g.ENABLE_TREESITTER,
    run = ':TSUpdate'
  }
  use {'sheerun/vim-polyglot', tag = 'v4.16.0'}

  -- ## Completion

  use {
    'nvim-lua/completion-nvim',
    commit = '936bbd17577101a4ffb07ea7f860f77dd8007d43'
  }
  use {
    'steelsojka/completion-buffers',
    commit = '441a58b77c04409e8ccb35fd4970598ae551462f',
    disable = not vim.g.ENABLE_COMPLETION_NVIM
  }
  use {
    'nvim-treesitter/completion-treesitter',
    commit = '45c9b2faff4785539a0d0c655440c2465fed985a',
    disable = not vim.g.ENABLE_TREESITTER and not vim.g.ENABLE_COMPLETION_NVIM
  }

  -- ## Theming

  use {'sainnhe/sonokai', commit = '51e7ee8b13f9c2e4eae33f8d745eaa1f320b0ae6'}
end)
