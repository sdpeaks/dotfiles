return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = function()
            require("bufferline").setup({
                options = {
                    diagnostics = "nvim_lsp",
                    separator_style = "thin",
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
