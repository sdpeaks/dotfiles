return {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "neovim/nvim-lspconfig" },

    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                ghost_text = { enable = true },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                        require("friendly-snippets").lsp_expand(args.body)
                    end,
                },

                mapping = {
                    ["<C-j>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end,

                    ["<C-k>"] = function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end,

                    ["<CR>"] = function(fallback)
                        if cmp.visible() then
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end,
                },

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
