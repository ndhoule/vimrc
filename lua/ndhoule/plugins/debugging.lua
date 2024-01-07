return {
  -- TODO(ndhoule): Replace this with nvim-dap
  {
    "https://github.com/puremourning/vimspector",
    run = ":VimspectorUpdate",
    event = "VeryLazy",
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
  },
}
