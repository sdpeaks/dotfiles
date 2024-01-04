return {
    {
        "windwp/nvim-autopairs",
        -- cond = enabled(group, "autopairs"),
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({ map_c_w = true })
        end,
    },
}
