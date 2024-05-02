require("user.options")
require("user.keymaps")
require("user.lazyvim")

local dev = true
if dev then
  -- darcubox-nvim
  vim.opt.runtimepath:append("/home/silas/src/darcubox-nvim")
end

vim.cmd.colorscheme("darcubox")
