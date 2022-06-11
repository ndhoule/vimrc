---------------------------
-- General Configuration --
---------------------------

-- Disable built-in plugins

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

-- vim.g.loaded_matchit = 1
-- vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

vim.o.modelineexpr = true -- Allow expressions in modelines

-- Enable backup files
vim.o.backup = true
-- Write changes to original file. Fixes watch mode for some file watchers (e.g. Webpack's).
-- https://webpack.js.org/guides/development/#adjusting-your-text-editor
vim.o.backupcopy = "yes"
vim.o.backupdir = vim.fn.stdpath("cache") .. "/backup//"
if vim.fn.isdirectory(vim.o.backupdir) == 0 then
  vim.fn.mkdir(vim.o.backupdir, "p")
end

-- Enable swapfiles
vim.o.swapfile = true
vim.o.directory = vim.fn.stdpath("cache") .. "/swap//"
if vim.fn.isdirectory(vim.o.directory) == 0 then
  vim.fn.mkdir(vim.o.directory, "p")
end

-- Enable persistent undofiles
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo//"
if vim.fn.isdirectory(vim.o.undodir) == 0 then
  vim.fn.mkdir(vim.o.undodir, "p")
end

-- Store netrw files in cache directory
vim.g.netrw_home = vim.fn.stdpath("cache") .. "/nvim"

-- Automatically rebalance splits when window is resized
vim.cmd("autocmd VimResized * :wincmd =")

vim.o.autochdir = true -- Set cwd to the current buffer's containing directory
vim.o.autowrite = true -- Save before executing shell commands to prevent working on a stale file
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.foldlevelstart = 100 -- Don't fold on fileopen
vim.o.foldlevelstart = 100 -- Don't fold on fileopen
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.mouse = "a" -- Enable mouse in all modes
vim.o.scrolljump = 5 -- Scroll five lines at a time (perf)
vim.o.synmaxcol = 300 -- Limit syntax highlighting to 300 columns wide (perf)

--------
-- UI --
--------

vim.o.termguicolors = true -- Use 24-bit color
vim.o.title = true -- Set terminal title
vim.o.wildmode = "list:longest" -- Show wildmenu in tall list
vim.wo.colorcolumn = "100" -- Show warning column at 100 characters
vim.wo.cursorline = true -- Highlight the (horizontal) line the cursor is currently on
vim.wo.list = true
vim.wo.listchars = "tab:→ ,trail:·" -- Show glyphs in place of special whitespace characters
vim.wo.number = true -- Show line number in gutter

-----------------------------
-- Text display/formatting --
-----------------------------

vim.o.expandtab = true -- <Tab> inserts spaces
vim.o.shiftround = true -- Round indentation to nearest multiple of `shiftwidth`
vim.o.shiftwidth = 2 -- Spaces to use for autoindent
vim.o.softtabstop = 2 -- <Tab> inserts n spaces
vim.o.tabstop = 2 -- <Tab> inserts n spaces
vim.o.textwidth = 100 -- Automatically wrap long lines

------------
-- Search --
------------

vim.o.hlsearch = true -- Highlight all search matches
vim.o.ignorecase = true -- Ignore case when searching
vim.o.smartcase = true -- Don't ignore case in search when term contains an uppercase char
vim.o.inccommand = "nosplit" -- Show substitutions incrementally, as you type them

-----------------
-- Keybindings --
-----------------

vim.g.mapleader = ","

-- Activate : using ;
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })

-- Disable ex mode
vim.api.nvim_set_keymap("n", "Q", "<ESC>", { noremap = true })

-- Prevent F1 from toggling Vim's help menu
vim.api.nvim_set_keymap("n", "<F1>", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F1>", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("v", "<F1>", "<ESC>", { noremap = true })

-- Close windows
vim.api.nvim_set_keymap("n", "<leader>w", ":close<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>W", ":only<cr>", { noremap = true })

-- Split panes
vim.api.nvim_set_keymap("n", "<leader>vs", ":vsplit<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>hs", ":split<CR>", { noremap = true })

-- Move down by displayed lines, not actual lines
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

-- Remap Q to reformat paragraph text
vim.api.nvim_set_keymap("v", "Q", "gq", {})
vim.api.nvim_set_keymap("n", "Q", "gqap", {})

-- Move lines
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Clear any text highlighted by hlsearch
vim.api.nvim_set_keymap(
  "n",
  "<C-L>",
  ':nohlsearch<C-R>=has("diff")?"<Bar>diffupdate":""<CR><CR><C-L>',
  { noremap = true, silent = true }
)

-- Yank the current filename to the clipboard
vim.api.nvim_set_keymap("n", "<Leader>f", ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Toggle between regular numbering, relative numbering, no numbering
vim.api.nvim_set_keymap("n", "<F3>", ':exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>', { silent = true })

-- Toggle spell check
vim.api.nvim_set_keymap("n", "<F4>", ":set spell!<CR>", { noremap = true })

-------------
-- Plugins --
-------------

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require("packer").startup({
  function()
    local use = require("packer").use

    use("wbthomason/packer.nvim")

    -- ## Core behavior

    -- Add a killring
    -- https://github.com/bfredl/nvim-miniyank
    use({
      "bfredl/nvim-miniyank",
      commit = "2a3a0f3ae535e1b93a8c17dfdac718b9a12c772b",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.miniyank_filename = vim.fn.stdpath("cache") .. "/miniyank.mpack"
        vim.g.miniyank_maxitems = 30

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "p", "<Plug>(miniyank-autoput)", {})
        vim.api.nvim_set_keymap("n", "P", "<Plug>(miniyank-autoPut)", {})
        vim.api.nvim_set_keymap("n", "<C-P>", "<Plug>(miniyank-cycle)", {})
      end,
    })

    -- Highlight trailing whitespace, with support for blacklisting filetypes
    -- https://github.com/ntpeters/vim-better-whitespace
    use({
      "ntpeters/vim-better-whitespace",
      commit = "c5afbe91d29c5e3be81d5125ddcdc276fd1f1322",
      config = function()
        -- By default, vim-better-whitespace strips extra whitespace on save. This is better handled
        -- by the configured formatter, so disable this behavior.
        vim.g.better_whitespace_enabled = true
        vim.g.strip_whitespace_on_save = false

        -- Highlight EOL whitespace in red
        vim.cmd("highlight ExtraWhitespace ctermbg=1")
      end,
    })

    -- Add support for `.` (repeat) for plugins
    -- https://github.com/tpope/vim-repeat
    use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    -- https://github.com/EinfachToll/DidYouMean
    use({ "EinfachToll/DidYouMean", commit = "a98fb17ba16aa2eb69b3f9cc7a70e8a736890e4e" })

    -- Open a scratch buffer (clone of emacs functionality)
    -- https://github.com/mtth/scratch.vim
    use({
      "mtth/scratch.vim",
      commit = "adf826b1ac067cdb4168cb6066431cff3a2d37a3",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.scratch_no_mappings = 1

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<Leader>S", ":Scratch<CR>", { noremap = true, silent = true })
      end,
    })

    -- Rename the current buffer on the filesystem
    -- https://github.com/vim-scripts/Rename
    use({ "vim-scripts/Rename", tag = "0.3" })

    -- ## Search

    -- Make * and # work on visual selections
    -- https://github.com/bronson/vim-visual-star-search
    use({ "bronson/vim-visual-star-search", commit = "7c32edb9e3c85d473d9be4dec721a4c9d5d4d69c" })

    -- https://github.com/ironhouzi/starlite-nvim
    use({
      "ironhouzi/starlite-nvim",
      commit = "bc204069859e4e85a057b92ac61700f3f46c3e41",
      config = function()
        -- Change the default behavior for search commands (*, #). By default, these commands
        -- immediately jump to the next match; remap them so they highlight the current word first
        -- and only jump to the next match on subsequent command.
        --
        -- FIXME(ndhoule): Doesn't work with vim-visual-star-search
        vim.api.nvim_set_keymap("n", "*", ':lua require("starlite").star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "g*", ':lua require("starlite").g_star()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "#", ':lua require("starlite").hash()<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "g#", ':lua require("starlite").g_hash()<CR>', { noremap = true, silent = true })
      end,
    })

    -- ## Project navigation

    -- Fuzzy file finder and file contents searcher
    -- https://github.com/nvim-telescope/telescope.nvim
    use({
      "nvim-telescope/telescope.nvim",
      commit = "01fc5a9274b553937bae3910e520732eb0a49bc6",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
      },
      config = function()
        vim.api.nvim_set_keymap("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope git_files<CR>", { noremap = true })
      end,
    })

    -- Menu for navigating ctags, LSP symbols, etc.
    -- https://github.com/liuchengxu/vista.vim
    use({
      "liuchengxu/vista.vim",
      commit = "f9c8c8ad4135346a945e1ebfb00b723976d92dfc",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------
        vim.g.vista_disable_statusline = 0

        vim.g.vista_executive_for = {
          bash = "nvim_lsp",
          css = "nvim_lsp",
          dockerfile = "nvim_lsp",
          graphql = "nvim_lsp",
          html = "nvim_lsp",
          javascript = "nvim_lsp",
          javascriptreact = "nvim_lsp",
          json = "nvim_lsp",
          lua = "nvim_lsp",
          markdown = "toc",
          pandoc = "markdown",
          sql = "nvim_lsp",
          terraform = "nvim_lsp",
          typescript = "nvim_lsp",
          typescriptreact = "nvim_lsp",
          vim = "nvim_lsp",
          vimwiki = "markdown",
          yaml = "nvim_lsp",
        }

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<leader><Tab>", ":Vista<CR>", { silent = true })
      end,
    })

    -- File navigation menu
    -- https://github.com/kyazdani42/nvim-tree.lua
    use({
      "kyazdani42/nvim-tree.lua",
      commit = "9d26594b6caf3caee46dc12ceae62b5dcbbc28d6",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = function()
        local nvim_tree = require("nvim-tree")

        ---------------------------
        -- General Configuration --
        ---------------------------

        nvim_tree.setup({
          -- TODO(ndhoule): Replace me
          -- auto_close = true,
          -- TODO(ndhoule): Replace me
          -- auto_open = true,
          update_cwd = true,
        })

        -----------------
        -- Keybindings --
        -----------------

        -- Open the current file in the tree relative to the project root.
        vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true })
      end,
    })

    -- https://github.com/folke/zen-mode.nvim
    use({
      "folke/zen-mode.nvim",
      commit = "f1cc53d32b49cf962fb89a2eb0a31b85bb270f7c",
      config = function()
        vim.api.nvim_set_keymap("n", "<Leader>gz", '<cmd>lua require("zen-mode").toggle()<CR>', { silent = true })
      end,
    })

    -- ## Statusline

    -- https://github.com/nvim-lualine/lualine.nvim
    use({
      "nvim-lualine/lualine.nvim",
      commit = "a4e4517ac32441dd92ba869944741f0b5f468531",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("lualine").setup({
          theme = "jellybeans",
        })
      end,
    })

    -- ## Motions

    -- Add motions for sorting within a line or range of lines
    -- https://github.com/christoomey/vim-sort-motion
    use({ "christoomey/vim-sort-motion", commit = "c8782be8f7da414c6442b3ba4b6abb0345d392d9" })

    -- Add motions for expanding a visual cursor within a group
    -- https://github.com/gcmt/wildfire.vim
    use({ "gcmt/wildfire.vim", commit = "b371e2b1d938ae0e164146136051de164ecb9aa5" })

    -- Add motions for commenting out blocks of code
    -- https://github.com/b3nj5m1n/kommentary
    use({ "b3nj5m1n/kommentary", commit = "a190d052fca4ce74ffddb1c87c87ccf15f9111d5" })

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    -- https://github.com/machakann/vim-sandwich
    use({
      "machakann/vim-sandwich",
      commit = "17266bab12c4f2ca9ce871f706176d971613487e",
      config = function()
        -- Set up surround.vim-compatible keybindings for vim-sandwich
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")

        require("kommentary.config").configure_language("default", {
          prefer_single_line_comments = true,
        })
      end,
    })

    -- https://github.com/andymass/vim-matchup
    use({ "andymass/vim-matchup", commit = "485e71120fea7be22f0ba051a05a00675276ced0" })

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    -- https://github.com/SidOfc/mkdx
    use({ "SidOfc/mkdx", commit = "d8e29b48f959aef96df2cb2ff5875ee02970f2a7" })

    -- ## Job execution

    -- Run jobs asynchronously in the background
    -- https://github.com/tpope/vim-dispatch
    use({ "tpope/vim-dispatch", commit = "00e77d90452e3c710014b26dc61ea919bc895e92" })

    -- https://github.com/folke/trouble.nvim
    use({
      "folke/trouble.nvim",
      commit = "da61737d860ddc12f78e638152834487eabf0ee5",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup({
          auto_open = true,
          mode = "document_diagnostics",
          signs = {
            error = "✖",
            warning = "⚠",
            hint = "➤",
            information = "➤",
            other = "➤",
          },
        })

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap(
          "n",
          "<Leader>ep",
          '<cmd>lua require("trouble").previous({ skip_groups = true, jump = true })<CR>',
          { silent = true }
        )
        vim.api.nvim_set_keymap(
          "n",
          "<Leader>en",
          '<cmd>lua require("trouble").next({ skip_groups = true, jump = true })<CR>',
          { silent = true }
        )
      end,
    })

    -- Debugging
    -- https://github.com/puremourning/vimspector
    use({
      "puremourning/vimspector",
      commit = "960f0444d21ebb20303e1796e4b478df042c3bd3",
      run = ":VimspectorUpdate",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.vimspector_install_gadgets = {
          "debugger-for-chrome",
          "vscode-node-debug2",
        }

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<F5>", "<Plug>VimspectorContinue", {})
        vim.api.nvim_set_keymap("n", "<S-F5>", "<Plug>VimspectorStop", {})
        vim.api.nvim_set_keymap("n", "<C-S-F5>", "<Plug>VimspectorRestart", {})
        vim.api.nvim_set_keymap("n", "<F6>", "<Plug>VimspectorPause", {})
        vim.api.nvim_set_keymap("n", "<F9>", "<Plug>VimspectorToggleBreakpoint", {})
        vim.api.nvim_set_keymap("n", "<S-F9>", "<Plug>VimspectorAddFunctionBreakpoint", {})
        vim.api.nvim_set_keymap("n", "<F10>", "<Plug>VimspectorStepOver", {})
        vim.api.nvim_set_keymap("n", "<F11>", "<Plug>VimspectorStepInto", {})
        vim.api.nvim_set_keymap("n", "<S-F11>", "<Plug>VimspectorStepOut", {})
      end,
    })

    -- ## VCS

    -- https://github.com/mhinz/vim-signify
    use({ "mhinz/vim-signify", commit = "69498f6d49f3eeac06870012416dd9bf867b84f3" })
    use({
      "tanvirtin/vgit.nvim",
      commit = "9ffd228466782d5bdcaedd8927f6327c4a14f665",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- Add vim commands for Git operations
    -- https://github.com/tpope/vim-fugitive
    use({
      "tpope/vim-fugitive",
      commit = "5b62c75238bf04b3156ffe62f821930827de8578",
      requires = {
        -- https://github.com/tpope/vim-rhubarb
        { "tpope/vim-rhubarb", commit = "ab0d42bb31b3317aa66dd1c0b506837cc6ca2835" },
      },
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        -- Decrease the time before vim writes the swapfile, which also governs the delay before git gutter
        -- marks are shown
        vim.o.updatetime = 100

        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<Leader>gws", ":Git status<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gc", ":Git commit<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gl", ":Git log<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gia", ":Gwrite<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gwd", ":Git diff<CR>", {})
        vim.api.nvim_set_keymap("n", "<Leader>gb", ":Git blame<CR>", {})
      end,
    })

    -- https://github.com/pwntester/octo.nvim
    use({
      "pwntester/octo.nvim",
      commit = "f5bd0c0336d6585a18b3ea95b4a40be068c74bbb",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-telescope/telescope.nvim",
      },
      disable = vim.fn.executable("gh") == 0,
      config = function()
        require("octo").setup()
      end,
    })

    -- ## Environment

    -- FIXME(ndhoule): direnv + autochdir throws errors when changing directory via fzf on neovim 0.5+.
    -- if executable('direnv')
    --   -- Source direnv files, keeping vim environment/subshells in sync with host shell env
    --   -- https://github.com/direnv/direnv.vim
    --   use { "direnv/direnv.vim", commit = "4c858b8cd8cbfac998534096e6ffb710d7a07358" }
    -- endif

    -- ## Project settings

    -- Add integration for .editorconfig files
    -- https://github.com/editorconfig/editorconfig-vim
    use({ "editorconfig/editorconfig-vim", commit = "a8e3e66deefb6122f476c27cee505aaae93f7109" })

    -- Add support for project configuration files ('projections')
    -- https://github.com/tpope/vim-projectionist
    use({
      "tpope/vim-projectionist",
      commit = "d4aee3035699b82b3789cee0e88dad0e38c423ab",
      config = function()
        -----------------
        -- Keybindings --
        -----------------

        vim.api.nvim_set_keymap("n", "<Leader>aa", ":A<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>as", ":AS<CR>", { noremap = true })
        vim.api.nvim_set_keymap("n", "<Leader>av", ":AV<CR>", { noremap = true })
      end,
    })

    -- Load project-specific vimrc (.lvimrc) files
    -- https://github.com/embear/vim-localvimrc
    use({ "embear/vim-localvimrc", commit = "244a92ceae63b8c23a74022eaf205b431745fcb6" })

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    -- https://github.com/windwp/nvim-autopairs
    use({
      "windwp/nvim-autopairs",
      commit = "aea913109d30c87df329ec9b8fea9aed6ef9f52a",
      after = "nvim-treesitter",
      config = function()
        local npairs = require("nvim-autopairs")

        npairs.setup({
          check_ts = true,
          ts_config = {
            javascript = { "string", "template_string" },
            javascriptreact = { "string", "template_string" },
            lua = { "string" },
            typescript = { "string", "template_string" },
            typescriptreact = { "string", "template_string" },
          },
        })
      end,
    })

    -- ## Language Server Protocol

    -- - http://langserver.org/
    -- - https://microsoft.github.io/language-server-protocol/
    -- - :help lsp
    -- https://github.com/neovim/nvim-lspconfig
    use({
      "neovim/nvim-lspconfig",
      commit = "0f06f7ba286efd4ae187abd3391f1574580ff929",
      requires = { "jose-elias-alvarez/null-ls.nvim", "hrsh7th/cmp-nvim-lsp" },
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------
        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")

        -- nvim-cmp supports LSP completions; advertise to LSP that we want them
        local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

        local on_attach = function(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
          end

          -----------------
          -- Keybindings --
          -----------------

          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<space>f",
              "<cmd>lua vim.lsp.buf.formatting()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.referencesProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gr",
              "<cmd>lua vim.lsp.buf.references()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.definitionProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "gd",
              "<cmd>lua vim.lsp.buf.definition()<CR>",
              { noremap = true, silent = true }
            )
          end

          if client.server_capabilities.hoverProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "K",
              "<cmd>lua vim.lsp.buf.hover()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.renameProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<space>rn",
              "<cmd>lua vim.lsp.buf.rename()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.signatureHelpProvider then
            vim.api.nvim_buf_set_keymap(
              bufnr,
              "n",
              "<C-k>",
              "<cmd>lua vim.lsp.buf.signature_help()<CR>",
              { noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Conditionally assign these keybindings
          vim.api.nvim_set_keymap(
            "n",
            "<space>D",
            "<cmd>lua vim.lsp.buf.type_definition()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_set_keymap(
            "n",
            "<space>q",
            "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_set_keymap(
            "n",
            "gD",
            "<cmd>lua vim.lsp.buf.declaration()<CR>",
            { noremap = true, silent = true }
          )
          vim.api.nvim_set_keymap(
            "n",
            "gi",
            "<cmd>lua vim.lsp.buf.implementation()<CR>",
            { noremap = true, silent = true }
          )
        end

        lspconfig.bashls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.cssls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.dockerls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.eslint.setup({
          capabilities,
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client, bufnr)
          end,
        })

        lspconfig.html.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.sqlls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.sumneko_lua.setup({
          capabilities,
          cmd = { "lua-language-server" },
          on_attach = on_attach,
        })

        lspconfig.terraformls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.tsserver.setup({
          capabilities,
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client, bufnr)
          end,
        })

        lspconfig.vimls.setup({
          capabilities,
          on_attach = on_attach,
        })

        lspconfig.yamlls.setup({
          capabilities,
          on_attach = on_attach,
        })

        local null_ls = require("null-ls")

        null_ls.setup({
          capabilities,
          on_attach = on_attach,
          sources = {
            null_ls.builtins.diagnostics.shellcheck,
            null_ls.builtins.diagnostics.write_good,
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.prettier.with({ filetypes = { "html" } }),
            null_ls.builtins.formatting.stylua,
          },
        })
      end,
    })

    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    use({
      "jose-elias-alvarez/null-ls.nvim",
      commit = "47e9164d497d5bc303d7c2b15258b81a8b470a48",
    })

    -- ## Syntax highlighting

    -- Highlight pairs of characters with different colors
    -- https://github.com/p00f/nvim-ts-rainbow
    use({ "p00f/nvim-ts-rainbow", commit = "190f8c83abb29504877b91c84ed3ceb6009ad3bd" })

    -- Highlight color names and codes in the same color that they represent
    -- https://github.com/norcalli/nvim-colorizer.lua
    use({
      "norcalli/nvim-colorizer.lua",
      commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
      config = function()
        require("colorizer").setup({ "*" }, {
          mode = "background",
          css = true,
        })
      end,
    })

    -- https://github.com/nvim-treesitter/nvim-treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      commit = "c9ebd16c2884c3ab7463c6cafa0385971db7456b",
      run = ":TSUpdate",
      config = function()
        local tree_sitter = require("nvim-treesitter.configs")

        ---------------------------
        -- General Configuration --
        ---------------------------

        tree_sitter.setup({
          ensure_installed = "all",

          autopairs = {
            enable = true,
          },
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
          matchup = {
            enable = true,
          },
          rainbow = {
            enable = true,
          },
        })
      end,
    })

    -- https://github.com/hashivim/vim-terraform
    use({ "hashivim/vim-terraform", commit = "f0b17ac9f1bbdf3a29dba8b17ab429b1eed5d443" })
    -- https://github.com/kchmck/vim-coffee-script
    use({ "kchmck/vim-coffee-script", commit = "28421258a8dde5a50deafbfc19cd9873cacfaa79" })

    -- ## Completion

    -- https://github.com/hrsh7th/nvim-cmp
    use({
      "hrsh7th/nvim-cmp",
      commit = "cd694b8944eb1ae98f1d0e01cf837e66b15c2857",
      requires = {
        -- https://github.com/hrsh7th/cmp-buffer
        { "hrsh7th/cmp-buffer", commit = "12463cfcd9b14052f9effccbf1d84caa7a2d57f0" },
        -- https://github.com/hrsh7th/cmp-vsnip
        {
          "hrsh7th/cmp-vsnip",
          commit = "0abfa1860f5e095a07c477da940cfcb0d273b700",
          requires = {
            -- https://github.com/hrsh7th/vim-vsnip
            { "hrsh7th/vim-vsnip", commit = "8f199ef690ed26dcbb8973d9a6760d1332449ac9" },
          },
        },
      },
      config = function()
        local cmp = require("cmp")

        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.o.completeopt = "menuone,noselect"

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          sources = {
            { name = "buffer" },
            { name = "nvim_lsp" },
            { name = "vsnip" },
          },
        })
      end,
    })

    -- ## Theming

    -- https://github.com/sainnhe/sonokai
    use({
      "sainnhe/sonokai",
      commit = "06b51526ad1db6359ec65ef5326a020bcae46ab9",
      config = function()
        vim.g.sonokai_diagnostic_text_highlight = 1

        vim.cmd("colorscheme sonokai")
      end,
    })
  end,
  config = {
    max_jobs = 10,
  },
})
