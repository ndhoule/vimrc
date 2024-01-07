return {
  --------------------------------------------
  -- XXX(ndhoule): BELOW THIS IS UNREVIEWED --
  --------------------------------------------

  -- Add an Emacs-like killring (yank history)
  {
    "https://github.com/gbprod/yanky.nvim",
    dependencies = { "https://github.com/kkharji/sqlite.lua" },
    lazy = true,
    keys = {
      { "p",     "<Plug>(YankyPutAfter)",     mode = { "n", "x" } },
      { "P",     "<Plug>(YankyPutBefore)",    mode = { "n", "x" } },
      { "<C-P>", "<Plug>(YankyPreviousEntry)" },
      { "<C-N>", "<Plug>(YankyNextEntry)" },
    },
    opts = {
      storage = "sqlite",
      storage_path = vim.fn.stdpath("state") .. "/yanky.db",
    },
    -- init = function()
    --   vim.g.miniyank_filename = vim.fn.stdpath("state") .. "/miniyank.mpack"
    --   vim.g.miniyank_maxitems = 25
    -- end,
  },

  -- TODO(ndhoule): Replace with a less intrusive / more performant version
  -- Highlight trailing whitespace, with support for blacklisting filetypes
  -- {
  --   "https://github.com/ntpeters/vim-better-whitespace",
  --   config = function()
  --     -- By default, vim-better-whitespace strips extra whitespace on save. This is better handled
  --     -- by the configured formatter, so disable this behavior.
  --     vim.g.better_whitespace_enabled = true
  --     vim.g.strip_whitespace_on_save = false

  --     -- Highlight EOL whitespace in red
  --     vim.cmd("highlight ExtraWhitespace ctermbg=1")
  --   end,
  -- },

  -- Add support for `.` (repeat) for plugins
  -- TODO(ndhoule): Not sure if this is actually necessary anymore, though it's only ~150 lines of
  --                vimscript, so leaving it in probably doesn't hurt much
  "https://github.com/tpope/vim-repeat",

  -- ## New core commands

  -- Open a scratch buffer (clone of emacs functionality)
  {
    "https://github.com/mtth/scratch.vim",
    lazy = true,
    cmd = "Scratch",
    keys = {
      { "<leader>S", ":Scratch<CR>", silent = true },
    },
    init = function()
      -- Prevent the plugin from setting up any default keybindings
      vim.g.scratch_no_mappings = 1
    end,
  },

  -- Common filesystem commands
  {
    "https://github.com/tpope/vim-eunuch",
    lazy = true,
    cmd = {
      "Cfind",
      "Chmod",
      "Clocate",
      "Copy",
      "Delete",
      "Duplicate",
      "Lfind",
      "Llocate",
      "Mkdir",
      "Move",
      "Remove",
      "Rename",
      "SudoEdit",
      "SudoWrite",
      "Wall",
    },
  },

  -- ## Search

  -- Change the default behavior for search commands (*, #). By default, these commands
  -- immediately jump to the next match; remap them so they highlight the current word first and
  -- only jump to the next match on subsequent command.
  {
    "https://github.com/ironhouzi/starlite-nvim",
    lazy = true,
    keys = {
      { "*",  function() require("starlite").star() end },
      { "g*", function() require("starlite").g_star() end },
      { "#",  function() require("starlite").hash() end },
      { "g#", function() require("starlite").g_hash() end },
    },
  },

  -- ## Project Navigation

  -- Fuzzy file finder and file contents searcher
  -- TODO(ndhoule): Should this actually be lazy loaded?
  {
    "https://github.com/nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "https://github.com/gbprod/yanky.nvim",
      "https://github.com/nvim-lua/plenary.nvim",

      -- TODO(ndhoule): No longer maintained, consider replacing with which-key?
      "https://github.com/LinArcX/telescope-command-palette.nvim",
    },
    lazy = true,
    keys = {
      { "<leader>/", "<cmd>Telescope live_grep<CR>",                                                                        silent = true },
      { "<leader>t", function() require('telescope.builtin').git_files({ use_git_root = true, show_untracked = true }) end, silent = true },
      { "<C-t>",     "<cmd>Telescope command_palette<CR>",                                                                  silent = true },
    },
    opts = {
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
    },
    config = function()
      local telescope = require("telescope")

      telescope.load_extension("command_palette")
      telescope.load_extension("yank_history")
    end,
  },

  -- TODO(ndhoule): Look into whether this can be lazy loaded
  {
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  },

  -- TODO(ndhoule): Needs attention or removal, pretty much never used
  -- Menu for navigating ctags, LSP symbols, etc.
  {
    "https://github.com/liuchengxu/vista.vim",
    lazy = true,
    keys = {
      { "<leader><Tab>", ":Vista<CR>", silent = true },
    },
    init = function()
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
    end,
  },

  -- ## Motions

  -- Add motions for sorting within a line or range of lines
  -- TODO(ndhoule): Look into whether this can be lazy loaded
  "https://github.com/christoomey/vim-sort-motion",

  -- Add motions for expanding a visual cursor within a group
  {
    "https://github.com/gcmt/wildfire.vim",
    lazy = true,
    keys = {
      { "<Enter>", "<Plug>(wildfire-fuel)",  mode = "" },
      { "<BS>",    "<Plug>(wildfire-water)", mode = "v" },
    },
  },

  -- Add motions for commenting out blocks of code
  {
    "https://github.com/numToStr/Comment.nvim",
    lazy = true,
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = function()
      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- Add mappings for working on text within pairs of characters (e.g. quotes)
  -- TODO(ndhoule): Look into whether this can be lazy loaded
  {
    "https://github.com/machakann/vim-sandwich",
    config = function()
      -- Set up surround.vim-compatible keybindings for vim-sandwich
      vim.cmd("runtime macros/sandwich/keymap/surround.vim")
    end,
  },

  -- TODO(ndhoule): Look into whether this can be lazy loaded
  "https://github.com/andymass/vim-matchup",

  -- ## Text editing

  -- Extras for Markdown editing, e.g. TOC generation
  {
    "https://github.com/SidOfc/mkdx",
    lazy = true,
    ft = "markdown",
  },

  -- ## Job execution

  -- Run jobs asynchronously in the background
  -- TODO(ndhoule): Look into whether this can be lazy loaded.
  -- TODO(ndhoule): Consider removing, is it ever used? I think maybe another plugin like neotest
  --                might rely on it, in which case consider adding `dependencies` to it
  "https://github.com/tpope/vim-dispatch",

  -- TODO(ndhoule): Look into whether this can be lazy loaded
  -- {
  --   "https://github.com/folke/trouble.nvim",
  --   dependencies = { "https://github.com/nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("trouble").setup({
  --       auto_open = true,
  --       auto_preview = false,
  --       mode = "document_diagnostics",
  --       signs = {
  --         error = "✖",
  --         warning = "⚠",
  --         hint = "➤",
  --         information = "➤",
  --         other = "➤",
  --       },
  --     })
  --
  --     -----------------
  --     -- Keybindings --
  --     -----------------
  --
  --     vim.keymap.set(
  --       "n",
  --       "<Leader>ep",
  --       '<cmd>lua require("trouble").previous({ skip_groups = true, jump = true })<CR>',
  --       { silent = true }
  --     )
  --     vim.keymap.set(
  --       "n",
  --       "<Leader>en",
  --       '<cmd>lua require("trouble").next({ skip_groups = true, jump = true })<CR>',
  --       { silent = true }
  --     )
  --   end,
  -- },

  -- ## Environment

  -- Source direnv files, keeping vim environment/subshells in sync with host shell env
  -- TODO(ndhoule): Look into whether this can be loaded via VeryLazy
  {
    "https://github.com/direnv/direnv.vim",
    enabled = vim.fn.executable("direnv") == 1,
  },

  -- ## Project settings

  -- Automatically adjusts editor using settings defined in .editorconfig files
  -- TODO(ndhoule): Look into whether this can be loaded via VeryLazy
  "https://github.com/editorconfig/editorconfig-vim",

  -- ## Text editing

  -- Insert matching pairs of characters in insert mode (e.g. (), [], '')
  -- TODO(ndhoule): Look into whether this can be lazy loaded or loaded via VeryLazy
  {
    "https://github.com/windwp/nvim-autopairs",
    dependencies = { "https://github.com/nvim-treesitter/nvim-treesitter" },
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
  },

  {
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    dependencies = { "https://github.com/MunifTanjim/nui.nvim" },
    branch = "v3.x",
    lazy = true,
    cmd = "Neotree",
    keys = {
      { "<leader>|", ":Neotree<CR>", silent = true },
    },
    opts = {},
  },
}
