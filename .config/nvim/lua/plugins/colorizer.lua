return {
  "norcalli/nvim-colorizer.lua",
  event = "FileType",
  ft = { "html", "css" },
  config = function()
    require("colorizer").setup()
  end,
}
