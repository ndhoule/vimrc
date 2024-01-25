-- TODO(ndhoule): Move at least some of these plugins to different files
return {
  -- Add support for `.` (repeat) for plugins that use vim-repeat. Most modern plugins don't plug
  -- into vim-repeat anymore, but a few (e.g. mkdx, vimspector, luasnip) still do, and it's ~175
  -- lines of vimscript, so there's not much harm in including it.
  {
    "https://github.com/tpope/vim-repeat",
    lazy = false,
  },

  -- Add an Emacs-like killring (yank history)
  {
    "https://github.com/gbprod/yanky.nvim",
    dependencies = { "https://github.com/kkharji/sqlite.lua" },
    lazy = true,
    keys = {
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
      { "<C-P>", "<Plug>(YankyPreviousEntry)" },
      { "<C-N>", "<Plug>(YankyNextEntry)" },
    },
    opts = {
      storage = "sqlite",
      storage_path = vim.fn.stdpath("state") .. "/yanky.db",
    },
  },

  -- Add a terminal manager
  {
    "https://github.com/akinsho/toggleterm.nvim",
    lazy = true,
    cmd = {
      "TermExec",
      "TermSelect",
      "ToggleTerm",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
      "ToggleTermSetName",
      "ToggleTermToggleAll",
    },
    keys = {
      { "<Space>s", ":ToggleTerm<CR>", silent = true },
      { "<Space>s", ":ToggleTermSendVisualSelection<CR>", mode = "v", silent = true },
    },
    opts = {},
  },

  -- Highlight trailing whitespace
  {
    "echasnovski/mini.trailspace",
    version = "*",
    lazy = true,
    event = "User LazyFile",
    opts = {},
  },

  -- Add an Emacs-like scratch buffer
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

  -- Add common filesystem commands (e.g. rename, delete) for buffers
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

  -- Re-open files at their last editing position
  {
    "https://github.com/vladdoster/remember.nvim",
    lazy = false,
    opts = {},
  },

  -- Make * and # work more sanely on visual selections by escaping all special characters
  {
    "https://github.com/bronson/vim-visual-star-search",
    lazy = true,
  },

  -- Change the default behavior for search commands (*, #). By default, these commands
  -- immediately jump to the next match; remap them so they highlight the current word first and
  -- only jump to the next match when the command is repeated.
  {
    "https://github.com/ironhouzi/starlite-nvim",
    dependencies = { "https://github.com/bronson/vim-visual-star-search" },
    lazy = true,
    keys = {
      {
        "*",
        function()
          require("starlite").star()
        end,
      },
      {
        "g*",
        function()
          require("starlite").g_star()
        end,
      },
      {
        "#",
        function()
          require("starlite").hash()
        end,
      },
      {
        "g#",
        function()
          require("starlite").g_hash()
        end,
      },
    },
  },

  {
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/nvim-telescope/telescope.nvim",
    },
    version = "*",
    lazy = true,
  },

  -- Add [fzf search syntax](https://github.com/junegunn/fzf#search-syntax) to telescope, enabling
  -- searches like e.g. ".lua$ 'com !autocommands" (only results that end in .lua, contain the
  -- literal string "com", and don't contain the literal string "autocommands").
  {
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "https://github.com/nvim-telescope/telescope.nvim" },
    build = "make",
    lazy = true,
  },

  -- Add a command palette via Telescope
  {
    "https://github.com/LinArcX/telescope-command-palette.nvim",
    dependencies = { "https://github.com/nvim-telescope/telescope.nvim" },
    lazy = true,
  },

  -- Fuzzy file finder and file contents searcher
  -- TODO(ndhoule): Revisit the config here; I set this up quickly and am not using it to its full potential
  -- TODO(ndhoule): The popup window's colors don't match my theme colors (e.g. doesn't match :Lazy or :Mason)
  {
    "https://github.com/nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = {
      "https://github.com/LinArcX/telescope-command-palette.nvim",
      "https://github.com/gbprod/yanky.nvim",
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/nvim-telescope/telescope-file-browser.nvim",
      "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
      "https://github.com/dbakker/vim-projectroot",
    },
    lazy = true,
    keys = {
      {
        "<leader>/",
        function()
          require("telescope.builtin").live_grep({
            cwd = vim.api.nvim_call_function("projectroot#guess", {}),
          })
        end,
        desc = "Search by file contents within the current workspace",
        silent = true,
      },
      {
        "<leader>t",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.api.nvim_call_function("projectroot#guess", {}),
            hidden = true,
          })
        end,
        desc = "Search by filename within the current workspace",
        silent = true,
      },
      {
        "<leader>T",
        function()
          require("telescope.builtin").git_files({ show_untracked = true })
        end,
        silent = true,
      },
      {
        "<C-t>",
        "<cmd>Telescope command_palette<CR>",
        desc = "Open the command palette",
        silent = true,
      },
      {
        "<leader>n",
        function()
          require("telescope").extensions.file_browser.file_browser()
        end,
        desc = "Open file browser relative to the current buffer",
        silent = true,
      },
      {
        "<leader>N",
        function()
          local telescope = require("telescope")

          telescope.extensions.file_browser.file_browser({
            cwd = vim.api.nvim_call_function("projectroot#guess", {}),
          })
        end,
        desc = "Open file browser relative to the current workspace's root directory",
        silent = true,
      },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup({
        extensions = {
          command_palette = {
            {
              "Registers",
              {
                "open yank register history",
                ":Telescope yank_history",
              },
            },
            {
              "Test",
              {
                "run current file",
                ":lua require('neotest').run.run({ vim.fn.expand('%') })",
              },
              {
                "run current file (debug)",
                ":lua require('neotest').run.run({ vim.fn.expand('%'), strategy = dap })",
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
          file_browser = {
            hijack_netrw = true,
          },
        },
      })

      telescope.load_extension("command_palette")
      telescope.load_extension("file_browser")
      telescope.load_extension("fzf")
      telescope.load_extension("yank_history")
    end,
  },

  -- Source direnv files, keeping vim environment/subshells in sync with host shell env
  {
    "https://github.com/direnv/direnv.vim",
    lazy = true,
    event = "VeryLazy",
    enabled = vim.fn.executable("direnv") == 1,
  },

  -- Add key maps for working on text within pairs of characters (e.g. quotes, parens, brackets)
  {
    "https://github.com/kylechui/nvim-surround",
    version = "*",
    lazy = true,
    event = "User LazyFile",
    opts = {},
  },

  -- Add motions for expanding a visual selection
  {
    "https://github.com/sustech-data/wildfire.nvim",
    dependencies = { "https://github.com/nvim-treesitter/nvim-treesitter" },
    lazy = true,
    keys = function(self)
      local wildfire = require("wildfire")

      local filetype_excludes = self.opts and self.opts.filetype_exclude or {}

      local callback = function()
        for _, filetype in filetype_excludes do
          if vim.opt_local.filetype:get() ~= filetype then
            return
          end
        end
      end

      return {
        {
          "<Enter>",
          wildfire.init_selection,
          desc = "Start visually selecting nodes with treesitter",
          mode = "n",
          callback = callback,
          silent = true,
          noremap = true,
        },
        {
          "<Enter>",
          wildfire.node_incremental,
          desc = "Increment selection to next named node",
          mode = "x",
          callback = callback,
          silent = true,
          noremap = true,
        },
        {
          "<BS>",
          wildfire.node_decremental,
          desc = "Shrink selection to previous named node",
          mode = "x",
          callback = callback,
          silent = true,
          noremap = true,
        },
      }
    end,
    opts = {
      filetype_exclude = {
        "lazy",
        "mason",
        "qf",
      },
      keymaps = {
        -- Don't assign any key bindings here; instead, see the spec's `keys` table. (This empty
        -- table is required in order to prevent the plugin from assigning default key bindings.)
      },
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
      local ft = require("Comment.ft")

      -- Add multiline HCL comment support
      ft.hcl = { "# %s", "/* %s */" }

      return {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- Add motions for sorting within a line or range of lines
  {
    "https://github.com/christoomey/vim-sort-motion",
    lazy = true,
    keys = {
      { "gs", "<Plug>SortMotion", mode = "n", remap = true, silent = true },
      { "gs", "<Plug>SortMotionVisual", mode = "x", remap = true, silent = true },
      { "gss", "<Plug>SortLines", mode = "n", remap = true, silent = true },
    },
  },

  -- Enhanced matchit/matchparen (% motion) replacement
  {
    "https://github.com/andymass/vim-matchup",
    lazy = true,
    event = "VeryLazy",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Insert matching pairs of characters (e.g. (), [], '')
  {
    "https://github.com/windwp/nvim-autopairs",
    dependencies = { "https://github.com/nvim-treesitter/nvim-treesitter" },
    lazy = true,
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "alpha", "vim" },
      check_ts = true,
      ts_config = { java = false },
    },
  },

  -- Extras for Markdown editing, e.g. TOC generation
  {
    "https://github.com/SidOfc/mkdx",
    lazy = true,
    ft = "markdown",
  },
}
