local M = {
  config = {
    window = {},
  },
}

--- Returns a new version of the wrapped function `fn` that is invoked at most every `ms`
--- milliseconds.
---
--- The throttled function is called at the tail of the specified time period.
---@param fn fun(args...)
---@param ms number
---@return fun(args...)
M.throttle = function(fn, ms)
  local timer = vim.loop.new_timer()
  local running = false
  return function(...)
    if not running then
      timer:start(ms, 0, function()
        running = false
      end)
      running = true
      pcall(vim.schedule_wrap(fn), select(1, ...))
    end
  end
end

--- Forces Treesitter to re-parse the current buffer.
---@return boolean
M.treesitter_parse = function()
  local ts_parsers = require("nvim-treesitter.parsers")

  local lang = ts_parsers.ft_to_lang(vim.bo.filetype)
  local parser = ts_parsers.get_parser(vim.fn.bufnr(), lang)
  if parser then
    parser:parse()
    return true
  else
    return false
  end
end

--- root_pattern accepts one or more file patterns and returns a function that, when invoked with a
--- starting path, returns either the first dirname matching a given pattern or nil if none is
--- found.
---
--- A file pattern can be a filename (e.g. ".git") or a glob (e.g. "*.toml").
---@vararg string patterns
---@return fun(startpath: string): string|nil
M.root_pattern = function(...)
  return require("lspconfig.util").root_pattern(...)
end

M.config.window.bordered = function(opts)
  opts = opts or {}

  return {
    border = opts.border or "rounded",
    winhighlight = opts.winhighlight or "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    zindex = opts.zindex or 1001,
    scrolloff = opts.scrolloff or 0,
    col_offset = opts.col_offset or 0,
    side_padding = opts.side_padding or 1,
    scrollbar = opts.scrollbar == nil and true or opts.scrollbar,
  }
end

return M
