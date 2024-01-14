-- return {
--   {
--     "https://github.com/puremourning/vimspector",
--     run = ":VimspectorUpdate",
--     event = "VeryLazy",
--     config = function()
--       -- TODO(ndhoule): Vimspector warned about this once; do I need to set this?
--       vim.g.vimspector_base_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimspector"
--
--       -----------------
--       -- Keybindings --
--       -----------------
--
--       vim.keymap.set("n", "<F5>", "<Plug>VimspectorContinue", {})
--       vim.keymap.set("n", "<S-F5>", "<Plug>VimspectorStop", {})
--       vim.keymap.set("n", "<C-S-F5>", "<Plug>VimspectorRestart", {})
--       vim.keymap.set("n", "<F6>", "<Plug>VimspectorPause", {})
--       vim.keymap.set("n", "<F9>", "<Plug>VimspectorToggleBreakpoint", {})
--       vim.keymap.set("n", "<S-F9>", "<Plug>VimspectorAddFunctionBreakpoint", {})
--       vim.keymap.set("n", "<F10>", "<Plug>VimspectorStepOver", {})
--       vim.keymap.set("n", "<F11>", "<Plug>VimspectorStepInto", {})
--       vim.keymap.set("n", "<S-F11>", "<Plug>VimspectorStepOut", {})
--     end,
--   },
-- }

-- TODO(ndhoule): Test that this works for node and Firefox and document how to use it. Also add
-- some keybindings
return {
  {
    "https://github.com/mfussenegger/nvim-dap",
    lazy = true,
    enabled = vim.fn.has("win32") == 0,
  },

  {
    "https://github.com/rcarriga/nvim-dap-ui",
    dependencies = { "https://github.com/rcarriga/nvim-dap-ui" },
    lazy = true,
    opts = {
      floating = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      dapui.setup(opts)
    end,
  },
}
