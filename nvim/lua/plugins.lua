local utils = require("lua.utils")
local plugin_manager = utils.plugin_manager

plugin_manager()

local pluginslist = {
  -- colorscheme
  { "dotsilas/darcubox-nvim" },
  { "catppuccin/nvim",       name = "catppuccin" },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },

}

require("lazy").setup(pluginslist)

require("lua.configs.init")
