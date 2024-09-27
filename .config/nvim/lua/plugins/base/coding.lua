return {
  { "windwp/nvim-ts-autotag", event = "BufNewFile" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  {
    "nmac427/guess-indent.nvim",
    event = "BufRead",
    config = function()
      require("guess-indent").setup({})
    end,
  },
}
