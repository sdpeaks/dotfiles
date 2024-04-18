return {
  { "windwp/nvim-ts-autotag" },
  { "windwp/nvim-autopairs" },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
      require("nvim-autopairs").setup()
    end,
  },

  -- indentation
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
  },
}
