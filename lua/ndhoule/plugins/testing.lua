return {
  -- TODO(ndhoule): Needs attention or removal, pretty much never used as is (though it works).
  --                It needs to work with a couple more test runners and add documentation on how
  --                to add more adapters easily
  {
    "https://github.com/nvim-neotest/neotest",
    dependencies = {
      "https://github.com/nvim-lua/plenary.nvim",
      "https://github.com/nvim-treesitter/nvim-treesitter",

      -- Adapters
      "https://github.com/haydenmeade/neotest-jest",
    },
    lazy = true,
    cmd = "Neotest",
    config = function()
      local neotest = require("neotest")
      local neotestJest = require("neotest-jest")

      neotest.setup({
        adapters = {
          neotestJest({
            jestCommand = "npm run test --",
            env = { CI = true },
            cwd = function()
              -- TODO(ndhoule): Why is this necessary? Because of autochdir?
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
}
