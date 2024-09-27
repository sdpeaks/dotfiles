return {
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = "<M-2>",
        direction = "float", -- "horizontal" or "vertical" or "float"
        insert_mappings = false, -- whether or not the open mapping applies in insert mode
        float_opts = {
          title_pos = "right",
        },
      })

      -- vim.keymap.set("n", "<leader>tt", ":ToggleTerm")
    end,
  },
}
