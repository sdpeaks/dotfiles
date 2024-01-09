return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          diagnostics = "nvim_lsp",
          separator_style = "thin",
          -- separator_style = { "", "" },
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "neo-tree",
              text = "Explorer",
              text_align = "center",
              separator = false,
            },
          },
        },
      })
    end,
  },
}
