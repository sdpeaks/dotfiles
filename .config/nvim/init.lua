local dev = false

require("config")

if dev then
  -- darcubox-nvim
  vim.opt.runtimepath:append("$HOME/projects/public/darcubox-nvim")
  vim.cmd.colorscheme("darcubox")
  require("myplugin").setup()
else
  vim.cmd.colorscheme("rose-pine")
end

vim.g.zig_fmt_autosave = 0
