return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = "<leader>tt",
        direction = "float",
        insert_mappings = false, -- whether or not the open mapping applies in insert mode
      })

      -- vim.keymap.set("n", "<leader>tt", ":ToggleTerm")
    end,
  },
}
