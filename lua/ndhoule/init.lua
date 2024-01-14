return {
  setup = function()
    require("ndhoule.options")
    require("ndhoule.plugins").setup()
    require("ndhoule.autocmds")
    require("ndhoule.keymaps")
  end,
}
