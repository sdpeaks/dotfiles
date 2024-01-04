return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {},
        config = function()
            require("toggleterm").setup({

                size = function(term)
                    if term.direction == "horizontal" then
                        return 10
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.3
                    end
                end,

                float_opts = {
                    border = "single",
                    winblend = 6,
                },
            })

            vim.keymap.set({ "n", "i", "v", "t" }, "<M-1>", "<cmd>:1ToggleTerm direction=horizontal size=12<CR>")
            vim.keymap.set({ "n", "i", "v", "t" }, "<M-2>", "<cmd>:2ToggleTerm direction=vertical size=50<CR>")
            vim.keymap.set({ "n", "i", "v", "t" }, "<M-3>", "<cmd>:3ToggleTerm direction=float<CR>")
        end,
    },
}
