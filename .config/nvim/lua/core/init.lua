local M = {}

M.quick_config = function(config) end

if vim.g.vscode then
  require("user.vscode")
else
  require("core.globals")
  require("core.options")
  require("core.keymaps")
  require("core.lazy-nvim")
  require("core.autocommands")
  require("setups.5_luanvim")

  vim.cmd("colorscheme rose-pine")
end

return M
