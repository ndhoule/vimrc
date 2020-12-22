local utils = require("ndhoule_utils")

--
-- Integrations
--

-- ALE

-- Set project-specific linters and formatters in your `.projections.json`:
--
-- ```json
--
-- {
--   "*": {
--     "formatters": ["eslint"],
--     "linters": ["eslint", "tsserver"]
--   }
-- }
-- ```

function _G.projectionist_ale_set_linters()
  local q_linters = vim.fn['projectionist#query']('linters')
  if (#q_linters > 0 and vim.bo.filetype ~= nil) then
    local linters = q_linters[1][2]
    vim.b.ale_linters = {[vim.bo.filetype] = linters}
  end
end

function _G.projectionist_ale_set_formatters()
  local q_formatters = vim.fn['projectionist#query']('formatters')
  if (#q_formatters > 0 and vim.bo.filetype ~= nil) then
    local formatters = q_formatters[1][2]
    vim.b.ale_fixers = {[vim.bo.filetype] = formatters}
  end
end

utils.nvim_create_augroups({
  AleProjectionistIntegration = {
      {"User", "ProjectionistActivate", "call v:lua.projectionist_ale_set_linters()"},
      {"User", "ProjectionistActivate", "call v:lua.projectionist_ale_set_formatters()"},
  }
})

--
-- Keybindings
--

vim.cmd('nnoremap <Leader>aa :A<CR>')
vim.cmd('nnoremap <Leader>as :AS<CR>')
vim.cmd('nnoremap <Leader>av :AV<CR>')
