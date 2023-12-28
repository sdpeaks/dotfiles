require "settings"
require "autocmds"
require "bindings"
require "plugins"

-- colorscheme: darcubox
require('darcubox').setup {
  options = {
    transparent = true,
    styles = {
      comments = { italic = true },
      functions = { bold = true },
      keywords = { italic = true },
      types = { italic = true, bold = true },
    }
  }
}

vim.cmd "colorscheme catppuccin"

-- whick-key setup variables
local wk = require("which-key")
wk.register()
