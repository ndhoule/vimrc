return {
  setup = function()
    require("ndhoule.plugins.bootstrap").setup()

    local lazy = require("lazy")
    local spec = require("ndhoule.plugins.config")

    lazy.setup({
      change_detection = {
        notify = false,
      },
      performance = {
        rtp = {
          disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
          },
        },
      },
      spec = spec,
      ui = {
        border = "rounded",
      },
    })
  end,
}
