return {
  setup = function()
    local lazy_install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazy_install_path) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_install_path,
      })
    end

    vim.opt.rtp:prepend(lazy_install_path)
  end,
}
