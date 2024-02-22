return {
  -- TODO(ndhoule): Needs attention or removal, pretty much never used as is (though it works).
  --                It needs to work with a couple more test runners and add documentation on how
  --                to add more adapters easily
  {
    "https://github.com/nvim-neotest/neotest",
    dependencies = {
      "https://github.com/folke/neoconf.nvim",
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/nvim-treesitter/nvim-treesitter",

      -- Adapters
      "https://github.com/nvim-neotest/neotest-go",
      "https://github.com/nvim-neotest/neotest-jest",
    },
    version = "4.x",
    lazy = true,
    cmd = "Neotest",
    keys = {
      {
        "<Leader>En",
        function()
          require("neotest").jump.next()
        end,
        silent = true,
        noremap = true,
      },
      {
        "<Leader>Ep",
        function()
          require("neotest").jump.prev()
        end,
        silent = true,
        noremap = true,
      },
    },
    opts = function()
      local neoconf = require("neoconf")
      local neoconf_plugins = require("neoconf.plugins")
      local neotest_go = require("neotest-go")
      local neotest_jest = require("neotest-jest")

      local default_config = {
        go = {
          args = { "-count=1", "-timeout=60s" },
          experimental = {
            test_table = true,
          },
        },
        jest = {
          cwd = function()
            return vim.fn.getcwd()
          end,
          env = { CI = true },
          jestCommand = function()
            require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
          end,
          jestConfigFile = nil,
        },
      }

      neoconf_plugins.register({
        on_schema = function(schema)
          schema:import("neotest", default_config)

          -- Go adapter
          schema:set("neotest.go.args", {
            description = "A list of arguments to pass to `go test`.",
            type = "array",
            items = {
              type = "string",
            },
          })

          schema:set("neotest.go.experimental.test_table", {
            description = "A list of arguments to pass to `go test`.",
            type = "boolean",
          })

          -- Jest adapter
          schema:set("neotest.adapters.jest.cwd", {
            description = "The working directory from which to execute the test runner.",
            type = "string",
          })
          schema:set("neotest.adapters.jest.env", {
            description = "A map containing key-value pairs of arbitrary environment variables.",
            type = "object",
            additionalProperties = true,
          })
          schema:set("neotest.jest.jestCommand", {
            description = "The command used to execute Jest tests, e.g. `jest`, `yarn run test`.",
            type = "string",
          })
          schema:set("neotest.jest.jestConfigFile", {
            description = "A path to your desired Jest configuration file.",
            type = "string",
          })
        end,
      })

      return {
        adapters = {
          neotest_go(neoconf.get("neotest.go", default_config.go)),
          neotest_jest(neoconf.get("neotest.jest", default_config.jest)),
        },
        status = {
          virtual_text = true,
        },
        output = {
          open_on_run = true,
        },
        quickfix = {
          open = function()
            vim.cmd("copen")
          end,
        },
      }
    end,
  },

  {
    "https://github.com/nvim-neotest/neotest-go",
    version = "*",
    lazy = true,
  },

  {
    "https://github.com/nvim-neotest/neotest-jest",
    version = "*",
    lazy = true,
  },
}
