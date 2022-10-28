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
vim.keymap.set("n", ";", ":", { noremap = true })

-- Disable ex mode
vim.keymap.set("n", "Q", "<ESC>", { noremap = true })

-- Prevent F1 from toggling Vim's help menu
vim.keymap.set("n", "<F1>", "<ESC>", { noremap = true })
vim.keymap.set("i", "<F1>", "<ESC>", { noremap = true })
vim.keymap.set("v", "<F1>", "<ESC>", { noremap = true })

-- Close windows
vim.keymap.set("n", "<leader>w", ":close<CR>", { noremap = true })
vim.keymap.set("n", "<leader>W", ":only<cr>", { noremap = true })

-- Split panes
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { noremap = true })
vim.keymap.set("n", "<leader>hs", ":split<CR>", { noremap = true })

-- Move down by displayed lines, not actual lines
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- Remap Q to reformat paragraph text
vim.keymap.set("v", "Q", "gq", {})
vim.keymap.set("n", "Q", "gqap", {})

-- Move lines
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- Clear any text highlighted by hlsearch
vim.keymap.set(
  "n",
  "<C-L>",
  ':nohlsearch<C-R>=has("diff")?"<Bar>diffupdate":""<CR><CR><C-L>',
  { noremap = true, silent = true }
)

-- Yank the current filename to the clipboard
vim.keymap.set("n", "<Leader>f", ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })

-- Toggle between regular numbering, relative numbering, no numbering
vim.keymap.set("n", "<F3>", ':exec &nu==&rnu ? "se nu!" : "se rnu!"<CR>', { silent = true })

-- Toggle spell check
vim.keymap.set("n", "<F4>", ":set spell!<CR>", { noremap = true })

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

    -- Fix issues with CursorHold, CursorHoldI events
    -- https://github.com/antoinemadec/FixCursorHold.nvim
    use({ "antoinemadec/FixCursorHold.nvim" })

    -- Add a killring
    -- https://github.com/bfredl/nvim-miniyank
    use({
      "bfredl/nvim-miniyank",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.miniyank_filename = vim.fn.stdpath("cache") .. "/miniyank.mpack"
        vim.g.miniyank_maxitems = 30

        -----------------
        -- Keybindings --
        -----------------

        vim.keymap.set("n", "p", "<Plug>(miniyank-autoput)", {})
        vim.keymap.set("n", "P", "<Plug>(miniyank-autoPut)", {})
        vim.keymap.set("n", "<C-P>", "<Plug>(miniyank-cycle)", {})
      end,
    })

    -- Highlight trailing whitespace, with support for blacklisting filetypes
    -- https://github.com/ntpeters/vim-better-whitespace
    use({
      "ntpeters/vim-better-whitespace",
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
    use({ "tpope/vim-repeat" })

    -- ## New core commands

    -- Suggest alternatives when opening a misspelled file (e.g. 'index.j' -> 'index.js')
    -- https://github.com/EinfachToll/DidYouMean
    use({ "EinfachToll/DidYouMean" })

    -- Open a scratch buffer (clone of emacs functionality)
    -- https://github.com/mtth/scratch.vim
    use({
      "mtth/scratch.vim",
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------

        vim.g.scratch_no_mappings = 1

        -----------------
        -- Keybindings --
        -----------------

        vim.keymap.set("n", "<Leader>S", ":Scratch<CR>", { noremap = true, silent = true })
      end,
    })

    -- Rename the current buffer on the filesystem
    -- https://github.com/vim-scripts/Rename
    use({ "vim-scripts/Rename" })

    -- ## Search

    -- Make * and # work on visual selections
    -- https://github.com/bronson/vim-visual-star-search
    use({ "bronson/vim-visual-star-search" })

    -- https://github.com/ironhouzi/starlite-nvim
    use({
      "ironhouzi/starlite-nvim",
      config = function()
        -- Change the default behavior for search commands (*, #). By default, these commands
        -- immediately jump to the next match; remap them so they highlight the current word first
        -- and only jump to the next match on subsequent command.
        --
        -- FIXME(ndhoule): Doesn't work with vim-visual-star-search
        vim.keymap.set("n", "*", ':lua require("starlite").star()<CR>', { noremap = true, silent = true })
        vim.keymap.set("n", "g*", ':lua require("starlite").g_star()<CR>', { noremap = true, silent = true })
        vim.keymap.set("n", "#", ':lua require("starlite").hash()<CR>', { noremap = true, silent = true })
        vim.keymap.set("n", "g#", ':lua require("starlite").g_hash()<CR>', { noremap = true, silent = true })
      end,
    })

    -- ## Project navigation

    -- Fuzzy file finder and file contents searcher
    -- https://github.com/nvim-telescope/telescope.nvim
    use({
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      requires = {
        "LinArcX/telescope-command-palette.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
      },
      config = function()
        local telescope = require("telescope")

        telescope.setup({
          extensions = {
            command_palette = {
              {
                "Test",
                {
                  "run current file",
                  ":lua require('neotest').run.run({ vim.fn.expand('%') })",
                },
                {
                  "attach to current file",
                  ":lua require('neotest').run.attach({ vim.fn.expand('%') })",
                },
                {
                  "stop current file",
                  ":lua require('neotest').run.stop({ vim.fn.expand('%') })",
                },
                {
                  "re-run last test",
                  ":lua require('neotest').run.run_last()",
                },
                {
                  "open summary window",
                  ":lua require('neotest').summary.open()",
                },
                {
                  "open output window",
                  ":lua require('neotest').summary.open()",
                },
              },
            },
          },
        })

        telescope.load_extension("command_palette")

        -----------------
        -- Keybindings --
        -----------------

        vim.keymap.set("n", "<leader>/", "<cmd>Telescope live_grep<CR>", { noremap = true })
        vim.keymap.set("n", "<leader>t", "<cmd>Telescope git_files<CR>", { noremap = true })
        vim.keymap.set("n", "<C-t>", "<cmd>Telescope command_palette<CR>", { noremap = true })
      end,
    })

    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    })

    -- Menu for navigating ctags, LSP symbols, etc.
    -- https://github.com/liuchengxu/vista.vim
    use({
      "liuchengxu/vista.vim",
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

        vim.keymap.set("n", "<leader><Tab>", ":Vista<CR>", { silent = true })
      end,
    })

    -- File navigation menu
    -- https://github.com/SidOfc/carbon.nvim
    use({
      "SidOfc/carbon.nvim",
      config = function()
        require("carbon").setup({
          auto_open = true,
        })

        vim.keymap.set("n", "<leader>n", ":Lexplore<CR>", { noremap = true })
      end,
    })

    -- ## Statusline

    -- https://github.com/nvim-lualine/lualine.nvim
    use({
      "nvim-lualine/lualine.nvim",
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
    use({ "christoomey/vim-sort-motion" })

    -- Add motions for expanding a visual cursor within a group
    -- https://github.com/gcmt/wildfire.vim
    use({ "gcmt/wildfire.vim" })

    -- Add motions for commenting out blocks of code
    -- https://github.com/b3nj5m1n/kommentary
    use({ "b3nj5m1n/kommentary" })

    -- Add mappings for working on text within pairs of characters (e.g. quotes)
    -- https://github.com/machakann/vim-sandwich
    use({
      "machakann/vim-sandwich",
      config = function()
        -- Set up surround.vim-compatible keybindings for vim-sandwich
        vim.cmd("runtime macros/sandwich/keymap/surround.vim")

        require("kommentary.config").configure_language("default", {
          prefer_single_line_comments = true,
        })
      end,
    })

    -- https://github.com/andymass/vim-matchup
    use({ "andymass/vim-matchup" })

    -- ## Text editing

    -- Extras for Markdown editing, including TOC generation
    -- https://github.com/SidOfc/mkdx
    use({ "SidOfc/mkdx" })

    -- ## Job execution

    -- Run jobs asynchronously in the background
    -- https://github.com/tpope/vim-dispatch
    use({ "tpope/vim-dispatch" })

    -- https://github.com/folke/trouble.nvim
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup({
          auto_open = true,
          auto_preview = false,
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

        vim.keymap.set(
          "n",
          "<Leader>ep",
          '<cmd>lua require("trouble").previous({ skip_groups = true, jump = true })<CR>',
          { silent = true }
        )
        vim.keymap.set(
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
      run = ":VimspectorUpdate",
      config = function()
        -- TODO(ndhoule): Vimspector warned about this once; do I need to set this?
        vim.g.vimspector_base_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimspector"

        -----------------
        -- Keybindings --
        -----------------

        vim.keymap.set("n", "<F5>", "<Plug>VimspectorContinue", {})
        vim.keymap.set("n", "<S-F5>", "<Plug>VimspectorStop", {})
        vim.keymap.set("n", "<C-S-F5>", "<Plug>VimspectorRestart", {})
        vim.keymap.set("n", "<F6>", "<Plug>VimspectorPause", {})
        vim.keymap.set("n", "<F9>", "<Plug>VimspectorToggleBreakpoint", {})
        vim.keymap.set("n", "<S-F9>", "<Plug>VimspectorAddFunctionBreakpoint", {})
        vim.keymap.set("n", "<F10>", "<Plug>VimspectorStepOver", {})
        vim.keymap.set("n", "<F11>", "<Plug>VimspectorStepInto", {})
        vim.keymap.set("n", "<S-F11>", "<Plug>VimspectorStepOut", {})
      end,
    })

    use({
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",

        -- Adapters
        "haydenmeade/neotest-jest",
      },
      config = function()
        local neotest = require("neotest")
        local neotestJest = require("neotest-jest")

        neotest.setup({
          adapters = {
            neotestJest({
              jestCommand = "npm run test --",
              env = { CI = true },
              cwd = function()
                return vim.fn.getcwd()
              end,
            }),
          },
        })

        -----------------
        -- Keybindings --
        -----------------
      end,
    })

    -- ## VCS

    -- https://github.com/mhinz/vim-signify
    use({ "mhinz/vim-signify" })

    use({
      "tanvirtin/vgit.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- Add vim commands for Git operations
    -- https://github.com/tpope/vim-fugitive
    use({
      "tpope/vim-fugitive",
      requires = {
        -- https://github.com/tpope/vim-rhubarb
        { "tpope/vim-rhubarb" },
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

        vim.keymap.set("n", "<Leader>gws", ":Git status<CR>", {})
        vim.keymap.set("n", "<Leader>gc", ":Git commit<CR>", {})
        vim.keymap.set("n", "<Leader>gl", ":Git log<CR>", {})
        vim.keymap.set("n", "<Leader>gia", ":Gwrite<CR>", {})
        vim.keymap.set("n", "<Leader>gwd", ":Git diff<CR>", {})
        vim.keymap.set("n", "<Leader>gb", ":Git blame<CR>", {})
      end,
    })

    -- https://github.com/pwntester/octo.nvim
    use({
      "pwntester/octo.nvim",
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

    -- Source direnv files, keeping vim environment/subshells in sync with host shell env
    -- https://github.com/direnv/direnv.vim
    use({
      "direnv/direnv.vim",
      disable = vim.fn.executable("direnv") ~= 1,
    })

    -- ## Project settings

    -- Add integration for .editorconfig files
    -- https://github.com/editorconfig/editorconfig-vim
    use({ "editorconfig/editorconfig-vim" })

    -- ## Text editing

    -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
    -- https://github.com/windwp/nvim-autopairs
    use({
      "windwp/nvim-autopairs",
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
      requires = {
        "folke/neodev.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
        "jose-elias-alvarez/null-ls.nvim",
      },
      config = function()
        ---------------------------
        -- General Configuration --
        ---------------------------
        local cmp_lsp = require("cmp_nvim_lsp")
        local fidget = require("fidget")
        local lspconfig = require("lspconfig")
        local neodev = require("neodev")

        fidget.setup()

        neodev.setup()

        -- nvim-cmp supports LSP completions; advertise to LSP that we want them
        local capabilities = cmp_lsp.default_capabilities()

        local on_attach = function(client)
          if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
              augroup format
                autocmd!
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true, timeout_ms = 10000 })
              augroup END
            ]])
          end

          -----------------
          -- Keybindings --
          -----------------

          vim.keymap.set(
            "n",
            "<leader>ca",
            "<cmd>lua vim.lsp.buf.code_action()<CR>",
            { buffer = true, noremap = true, silent = true }
          )

          if client.server_capabilities.documentFormattingProvider then
            vim.keymap.set(
              "n",
              "<space>f",
              "<cmd>lua vim.lsp.buf.format({ async = true, timeout_ms = 10000 })<CR>",
              { buffer = true, noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.referencesProvider then
            vim.keymap.set(
              "n",
              "gr",
              "<cmd>lua vim.lsp.buf.references()<CR>",
              { buffer = true, noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.definitionProvider then
            vim.keymap.set(
              "n",
              "gd",
              "<cmd>lua vim.lsp.buf.definition()<CR>",
              { buffer = true, noremap = true, silent = true }
            )
          end

          if client.server_capabilities.hoverProvider then
            vim.keymap.set(
              "n",
              "K",
              "<cmd>lua vim.lsp.buf.hover()<CR>",
              { buffer = true, noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.renameProvider then
            vim.keymap.set(
              "n",
              "<space>rn",
              "<cmd>lua vim.lsp.buf.rename()<CR>",
              { buffer = true, noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Define default mapping for this that warns when the LSP does not support
          -- this functionality
          if client.server_capabilities.signatureHelpProvider then
            vim.keymap.set(
              "n",
              "<C-k>",
              "<cmd>lua vim.lsp.buf.signature_help()<CR>",
              { buffer = true, noremap = true, silent = true }
            )
          end

          -- TODO(ndhoule): Conditionally assign these keybindings
          vim.keymap.set(
            "n",
            "<space>D",
            "<cmd>lua vim.lsp.buf.type_definition()<CR>",
            { noremap = true, silent = true }
          )
          vim.keymap.set(
            "n",
            "<space>q",
            "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
            { noremap = true, silent = true }
          )
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
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
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client)
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
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            on_attach(client)
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

    -- https://github.com/kosayoda/nvim-lightbulb
    use({
      "kosayoda/nvim-lightbulb",
      requires = "antoinemadec/FixCursorHold.nvim",
      config = function()
        local lightbulb = require("nvim-lightbulb")

        lightbulb.setup({
          autocmd = {
            enabled = true,
          },
          sign = {
            enabled = true,
            priority = 90,
          },
        })
      end,
    })

    use({ "stevearc/dressing.nvim" })

    -- https://github.com/jose-elias-alvarez/null-ls.nvim
    use({ "jose-elias-alvarez/null-ls.nvim" })

    -- ## Syntax highlighting

    -- Highlight pairs of characters with different colors
    -- https://github.com/p00f/nvim-ts-rainbow
    use({ "p00f/nvim-ts-rainbow" })

    -- Highlight color names and codes in the same color that they represent
    -- https://github.com/norcalli/nvim-colorizer.lua
    use({
      "norcalli/nvim-colorizer.lua",
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

    -- https://github.com/isobit/vim-caddyfile
    use({ "isobit/vim-caddyfile" })
    -- ## Completion

    -- https://github.com/hrsh7th/nvim-cmp
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        -- https://github.com/hrsh7th/cmp-buffer
        { "hrsh7th/cmp-buffer" },
        -- https://github.com/hrsh7th/cmp-vsnip
        {
          "hrsh7th/cmp-vsnip",
          requires = {
            -- https://github.com/hrsh7th/vim-vsnip
            { "hrsh7th/vim-vsnip" },
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
          view = {
            entries = "native",
          },
        })
      end,
    })

    -- ## Theming

    -- https://github.com/sainnhe/sonokai
    use({
      "sainnhe/sonokai",
      config = function()
        vim.g.sonokai_diagnostic_text_highlight = 1

        vim.cmd("colorscheme sonokai")
      end,
    })
  end,
  config = {
    max_jobs = 10,
    snapshot = "versions.json",
    snapshot_path = vim.fn.stdpath("config"),
  },
})
