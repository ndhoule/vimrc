-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

return require("packer").startup({
  function()
    local use = require('packer').use

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

    -- https://github.com/ironhouzi/starlite-nvim
    use {
      'ironhouzi/starlite-nvim',
      commit = 'bc204069859e4e85a057b92ac61700f3f46c3e41',
      config = function()
        -- Change the default behavior for search commands (*, #). By default, these commands
        -- immediately jump to the next match; remap them so they highlight the current word first
        -- and only jump to the next match on subsequent command.
        --
        -- FIXME(ndhoule): Doesn't work with vim-visual-star-search
        vim.api.nvim_set_keymap('n', '*', ':lua require("starlite").star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'g*', ':lua require("starlite").g_star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '#', ':lua require("starlite").hash()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'g#', ':lua require("starlite").g_hash()<CR>', { noremap = true, silent = true })
      end
    }

    -- ## Project navigation

    -- Fuzzy file finder and file contents searcher
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
      'nvim-telescope/telescope.nvim',
      commit = '2c573b9d12f421cec74a215f79b25591fe083352',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
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

    use {
      'romainl/vim-qf',
      commit = '65f115c350934517382ae45198a74232a9069c2a',
      setup = function()
        vim.api.nvim_set_keymap('n', '<Leader>ep', '<Plug>(qf_loc_previous)', { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>en', '<Plug>(qf_loc_next)', { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>Ep', '<Plug>(qf_qf_previous)', { silent = true })
        vim.api.nvim_set_keymap('n', '<Leader>En', '<Plug>(qf_qf_next)', { silent = true })
      end,
    }

    -- Integrate with linters, fixers, formatters, etc.
    -- https://github.com/dense-analysis/ale
    use {
      'dense-analysis/ale',
      commit = 'd53a085096306c890897385692693ee653aaddce',
      config = function()
        -- Override the default LSP diagnostics handler with a handler that sends diagnostics to
        -- ALE. This lets us configure cycling through lint errors, LSP errors, etc. in a single
        -- place.

        local lsp_diagnostic_clear = vim.lsp.diagnostic.clear
        vim.lsp.diagnostic.clear = function(bufnr, client_id, diagnostic_ns, sign_ns)
          lsp_diagnostic_clear(bufnr, client_id, diagnostic_ns, sign_ns)
          vim.api.nvim_call_function('ale#other_source#ShowResults', {bufnr, 'LSP', {}})
        end

        local ale_diagnostic_severity_map = {
          [vim.lsp.protocol.DiagnosticSeverity.Error] = 'E';
          [vim.lsp.protocol.DiagnosticSeverity.Warning] = 'W';
          [vim.lsp.protocol.DiagnosticSeverity.Information] = 'I';
          [vim.lsp.protocol.DiagnosticSeverity.Hint] = 'H';
        }

        local function on_publish_diagnostics(_, _, params, _, _, _)
          local uri = params.uri
          local bufnr = vim.uri_to_bufnr(uri)
          local diagnostics = params.diagnostics

          if diagnostics == nil then
            return
          end

          local items = {}
          for _, item in ipairs(diagnostics) do
            table.insert(items, {
              code = item.code,
              col = item.range.start.character + 1,
              end_col = item.range['end'].character,
              end_lnum = item.range['end'].line,
              lnum = item.range.start.line + 1,
              nr = item.code,
              text = item.message,
              type = ale_diagnostic_severity_map[item.severity],
              bufnr = bufnr,
            })
          end

          vim.api.nvim_call_function('ale#other_source#ShowResults', {bufnr, 'LSP', items})
        end

        vim.lsp.handlers['textDocument/publishDiagnostics'] = on_publish_diagnostics

        ---------------------------
        -- General Configuration --
        ---------------------------

        -- Decrease delay before running linter after text change
        vim.g.ale_lint_delay = 100

        ----------------------
        -- UI Configuration --
        ----------------------

        -- Show sign column even when there are no errors to prevent text from moving while typing
        vim.cmd('set signcolumn=yes:1')
        vim.g.ale_sign_column_always = true

        vim.g.ale_sign_info = '➤'
        vim.g.ale_sign_warning = '⚠'
        vim.g.ale_sign_error = '✖'

        vim.g.ale_echo_msg_info_str = 'I'
        vim.g.ale_echo_msg_warning_str = 'W'
        vim.g.ale_echo_msg_error_str = 'E'
        vim.g.ale_echo_msg_format = '[%linter%] %s %(code) %[%severity%]'

        --------------------------
        -- Linter Configuration --
        --------------------------

        -- Explicitly configure linters. To override linters on a per-project basis, create a
        -- `.projections.json` file (see projectionist configuration for more details).
        vim.g.ale_linters_explicit = true

        vim.g.ale_linters = {
          go         = {'golint', 'govet'},
          html       = {'tidy'},
          javascript = {'eslint'},
          markdown   = {},
          sh         = {'shellcheck'},
          typescript = {'eslint'},
        }

        -- When available, use eslint_d for faster linting and fixing.
        -- eslint_d delegates to project-local eslint installations.
        if vim.fn.executable('eslint_d') then
          vim.g.ale_javascript_eslint_use_global = true
          vim.g.ale_javascript_eslint_executable = 'eslint_d'
        end

        -----------------------------
        -- Formatter Configuration --
        -----------------------------

        vim.g.ale_fixers = {
          go         = {'gofmt'},
          html       = {'prettier'},
          javascript = {'eslint'},
          markdown   = {'remove_trailing_lines'},
          sh         = {'shfmt'},
          typescript = {'eslint'},
        }

        -- Reset shfmt configuration to defaults. By default, ALE will use your editor's
        -- shiftwidth/tabstob settings as the `-i` flag to shfmt; this means shfmt will format files
        -- depending on a user's personal configuration rather than the project configuration,
        -- diminishing the utility of a standardized formatter.
        --
        -- ALE guards against this being an empty value, so this must be a space.
        vim.g.ale_sh_shfmt_options = ' '
      end,
    }

    -- https://github.com/folke/trouble.nvim
    use {
      'folke/trouble.nvim',
      commit = '51dd9175eb506b026189c70f81823dfa77defe86',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup({
          auto_open = true,
          signs = {
            error = '✖',
            warning = '⚠',
            hint = '➤',
            information = '➤',
            other = '➤'
          },
          use_lsp_diagnostic_signs = false,
        })
      end
    }

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

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    -- https://github.com/hashivim/vim-terraform
    use {'hashivim/vim-terraform', commit = 'f0b17ac9f1bbdf3a29dba8b17ab429b1eed5d443'}
    -- https://github.com/kchmck/vim-coffee-script
    use {'kchmck/vim-coffee-script', commit = '28421258a8dde5a50deafbfc19cd9873cacfaa79'}

    -- ## Completion

    -- https://github.com/hrsh7th/nvim-cmp
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
      },
    }

    -- ## Theming

    -- https://github.com/sainnhe/sonokai
    use {'sainnhe/sonokai', commit = 'cb10268587c0f0616242ecb5503e22240a915136'}
  end,
  config = {
    max_jobs = 10,
  },
});
