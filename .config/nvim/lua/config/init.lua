local M = {}

M.quick_config = function(config) end

if vim.g.vscode then
  require("user.vscode")
else
  require("config.globals")
  require("config.options")
  require("config.keymaps")
  require("config.lazy-nvim")
  require("config.autocommands")

  vim.cmd("colorscheme rose-pine")
end

return M
