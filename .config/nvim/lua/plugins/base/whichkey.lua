return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  opts = {
    preset = "classic",
    delay = 50,
    win = {
      border = "solid",
      padding = { 1, 4 },
    },
    spec = {
      { "<leader>l", group = "LSP" },
      -- ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
      -- ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
    },
  },
}
