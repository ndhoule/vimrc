-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local use = require('packer').use
return require("packer").startup({
  function()
    use 'wbthomason/packer.nvim'

    -- Add functions for finding the current project's root directory path
    -- https://github.com/dbakker/vim-projectroot
    use {'dbakker/vim-projectroot', commit = '68787126ebbbe50e120e497ff63696b22f636840'}

    -- ## Core behavior

    -- Add a killring
    -- https://github.com/bfredl/nvim-miniyank
    use {'bfredl/nvim-miniyank', commit = '2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b'}

    -- Highlight trailing whitespace, with support for blacklisting filetypes
    -- https://github.com/ntpeters/vim-better-whitespace
    use {'ntpeters/vim-better-whitespace', commit = '8cf4b2175dd61416c2fe7d3234324a6c59d678de'}

    -- Automatically close word control structures (if/fi, do/end, etc.)
    -- use {'tpope/vim-endwise', commit = '4289889a2622f9bc7c594a6dd79763781f63dfb5'}

    -- Add support for `.` (repeat) for plugins
    -- https://github.com/tpope/vim-repeat
    use {'tpope/vim-repeat', commit = '24afe922e6a05891756ecf331f39a1f6743d3d5a'}

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    -- https://github.com/EinfachToll/DidYouMean
    use {'EinfachToll/DidYouMean', commit = 'a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e'}

    -- Open a scratch buffer (clone of emacs functionality)
    -- https://github.com/mtth/scratch.vim
    use {'mtth/scratch.vim', commit = 'adf826b1ac067cdb4168cb6066431cff3a2d37a3'}

    -- Rename the current buffer on the filesystem
    -- https://github.com/vim-scripts/Rename
    use {'vim-scripts/Rename', tag = '0.3'}

    -- ## Search

    -- Make * and # work on visual selections
    -- https://github.com/bronson/vim-visual-star-search
    use {'bronson/vim-visual-star-search', commit = '7c32edb9e3c85d473d9be4dec721a4c9d5d4d69c'}

    -- ## Project navigation

    -- Fuzzy file finder and file contents searcher
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
      'nvim-telescope/telescope.nvim',
      commit = '2c573b9d12f421cec74a215f79b25591fe083352',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-lua/popup.nvim'},
      }
    }

    -- Menu for navigating ctags, LSP symbols, etc.
    -- https://github.com/liuchengxu/vista.vim
    use {'liuchengxu/vista.vim', commit = 'cb908f21c23d9c9ebce678c8dbc7a0f876384b8c'}

    -- File navigation menu
    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
      'kyazdani42/nvim-tree.lua',
      commit = '6175d63eaecdc7d80105825f89a6c9864c4dd432',
      requires = 'kyazdani42/nvim-web-devicons',
    }

    -- ## Statusline

    -- Customize statusline
    -- https://github.com/itchyny/lightline.vim
    use {'itchyny/lightline.vim', commit = 'b06d921023cf6536bcbee5754071d122296e8942'}

    -- ## Motions

    -- Add motions for sorting within a line or range of lines
    -- https://github.com/christoomey/vim-sort-motion
    use {'christoomey/vim-sort-motion', commit = 'c8782be8f7da414c6442b3ba4b6abb0345d392d9'}

    -- Add motions for expanding a visual cursor within a group
    -- https://github.com/gcmt/wildfire.vim
    use {'gcmt/wildfire.vim', commit = 'fa91b732fd1c5acd23b7b32d5fbbc884eedafc8d'}

    -- Add motions for commenting out blocks of code
    -- https://github.com/b3nj5m1n/kommentary
    use {'b3nj5m1n/kommentary', commit = 'fe01018a490813a8d89c09947a7ca23fc0e9e728'}

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    -- https://github.com/machakann/vim-sandwich
    use {'machakann/vim-sandwich', commit = '9e6340affe9f53c11a6975a5f50b9bf48adb692c'}
    -- https://github.com/andymass/vim-matchup
    use {'andymass/vim-matchup', commit = '816751e279f1186d10520bad752206d5f91ce173'}

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    -- 602a78430aee47881f8c57f73ba96fdded9a3ace
    use {'SidOfc/mkdx', commit = '439c518cea989c875eea44ce54a36f7e7dc561d9'}

    -- ## Job execution

    -- Run jobs asynchronously in the background
    -- https://github.com/tpope/vim-dispatch
    use {'tpope/vim-dispatch', commit = '250ea269e206445d10700b299afd3eb993e939ad'}

    -- Integrate with linters, fixers, formatters, etc.
    -- https://github.com/dense-analysis/ale
    use {'dense-analysis/ale', commit = 'a099fe24b2e898c93c0aa4391e5a5631932684a6'}

    -- Debugging
    -- https://github.com/puremourning/vimspector
    use {
      'puremourning/vimspector',
      commit = '57ce0992803fcf22c0557550fff45e3fe869f707',
      run = ':VimspectorUpdate'
    }

    -- ## VCS

    -- https://github.com/mhinz/vim-signify
    use {'mhinz/vim-signify', commit = '22f05607d4d7406781af56cafc1121152988c6d2'}

    -- Add vim commands for Git operations
    -- https://github.com/tpope/vim-fugitive
    use {'tpope/vim-fugitive', commit = '8e4a677c7f1554cb1dd34d05a2b068657b42ef0f'}

    -- Add vim-fugitive GitHub integration
    -- https://github.com/tpope/vim-rhubarb
    use {'tpope/vim-rhubarb', commit = 'b4aad6dc43660db554bba2942026fb9965f1a45e'}

    -- ## Environment

    -- FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
    -- if executable('direnv')
    --   -- Source direnv files, keeping vim environment/subshells in sync with host shell env
    --   -- https://github.com/direnv/direnv.vim
    --   use {'direnv/direnv.vim', commit = 'ff37d76da391e1ef299d2f5eb84006cb27a67799'}
    -- endif

    -- ## Project settings

    -- Add integration for .editorconfig files
    -- https://github.com/editorconfig/editorconfig-vim
    use {'editorconfig/editorconfig-vim', commit = '3078cd10b28904e57d878c0d0dab42aa0a9fdc89'}

    -- Add support for project configuration files ('projections')
    -- https://github.com/tpope/vim-projectionist
    use {'tpope/vim-projectionist', commit = '8dda7acb7e24b44ef691ba19b35f585e97e91b30'}

    -- Load project-specific vimrc (.lvimrc) files
    -- https://github.com/embear/vim-localvimrc
    use {'embear/vim-localvimrc', commit = '0206f5f5a8721cc8c5c84ebb8ab2886e9afcd0ac'}

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    -- https://github.com/Raimondi/delimitMate
    use {'Raimondi/delimitMate', commit = '537a1da0fa5eeb88640425c37e545af933c56e1b'}

    -- ## Language Server Protocol

    -- - http://langserver.org/
    -- - https://microsoft.github.io/language-server-protocol/
    -- - :help lsp
    -- https://github.com/neovim/nvim-lspconfig
    use {
      'neovim/nvim-lspconfig',
      commit = '7d6e2211571029ace6ddeefed7df18e4dc51274f',
    }

    -- ## Syntax highlighting

    -- Hightlight pairs of characters with different colors
    -- https://github.com/p00f/nvim-ts-rainbow
    use {'p00f/nvim-ts-rainbow', commit = '94138b1ba193d81f130dbe9fc1f255f97b7697d5'}

    -- Highlight color names and codes in the same color that they represent
    -- https://github.com/chrisbra/Colorizer
    use {'chrisbra/Colorizer', commit = '826d5691ac7d36589591314621047b1b9d89ed34'}

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    -- https://github.com/hashivim/vim-terraform
    use {'hashivim/vim-terraform', commit = 'f0b17ac9f1bbdf3a29dba8b17ab429b1eed5d443'}
    -- https://github.com/kchmck/vim-coffee-script
    use {'kchmck/vim-coffee-script', commit = '28421258a8dde5a50deafbfc19cd9873cacfaa79'}

    -- ## Completion

    use {'hrsh7th/nvim-compe', commit = '8ed6999e005015251b6b05cb5c0bfe857785b1d4'}

    -- ## Theming

    -- https://github.com/sainnhe/sonokai
    use {'sainnhe/sonokai', commit = '0e1af11d2297ae65ba504419cd8d6bbd6ed3534d'}
  end,
  config = {
    max_jobs = 10,
  },
});
