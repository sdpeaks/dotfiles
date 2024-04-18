return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 50

    require("which-key").setup()

    -- Document existing key chains
    require("which-key").register({
      -- ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
    })
  end,
}
