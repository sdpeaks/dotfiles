require("user.options")
require("user.keymaps")
require("user.lazyvim")

local dev = true
if dev then
  -- darcubox-nvim
  vim.opt.runtimepath:append("$HOME/projects/public/darcubox-nvim")
  vim.cmd.colorscheme("darcubox")

  require("myplugin").setup()
else
  vim.cmd.colorscheme("catppuccin")
end

vim.g.zig_fmt_autosave = 0
