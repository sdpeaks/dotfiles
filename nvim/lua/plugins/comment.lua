return {
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup({
                ignore = "^$",
                toggler = {
                    line = "gc",
                    block = "gb",
                },
                opleader = {
                    line = "gc",
                    block = "gb",
                },
            })
        end,
    },
}
