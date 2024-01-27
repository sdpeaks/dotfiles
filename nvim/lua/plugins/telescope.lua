return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },

    config = function()
      local find_files = require("telescope.builtin").find_files
      local live_grep = require("telescope.builtin").live_grep
      -- local buffers = require("telescope.builtin").buffers
      vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR><ESC>")
      vim.keymap.set("n", "<leader>ff", find_files)
      vim.keymap.set("n", "<leader>fg", live_grep)
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
