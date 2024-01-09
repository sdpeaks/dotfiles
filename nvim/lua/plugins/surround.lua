return {
    "kylechui/nvim-surround",
    cmd = "VimEnter",
    config = function()
        require("nvim-surround").setup()
    end,
}
