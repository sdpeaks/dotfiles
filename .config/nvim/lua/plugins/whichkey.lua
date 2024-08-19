local Plugin = { "folke/which-key.nvim" }

Plugin.event = "VeryLazy"

Plugin.keys = {
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)",
  },
}

Plugin.opts = {
  preset = "helix",
  delay = 50,
  win = {
    border = "rounded",
    padding = { 1, 4 },
  },
  spec = {
    { "<leader>l", group = "LSP" },
    -- ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
    -- ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
  },
}

return Plugin

-- return {
--   "folke/which-key.nvim",
--   event = "VeryLazy",
--   opts = {},
--   init = function()
--     vim.o.timeout = true
--     -- vim.o.timeoutlen = 50
--
--     require("which-key").setup()
--
--     -- Document existing key chains
--     require("which-key").register({
--       ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
--       -- ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
--     })
--   end,
-- }
