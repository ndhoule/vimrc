--
-- Configuration
--

vim.o.completeopt = "menuone,noselect"

require('compe').setup {
  enabled = true;
  autocomplete = true;
  source = {
    path = true;
    buffer = true;
  };
}
