return {
    "VonHeikemen/lsp-zero.nvim",
    event = "VimEnter",
    branch = "v3.x",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/nvim-cmp" },
        { "L3MON4D3/LuaSnip" },
    },

    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

        -- see :help lsp-zero-guide:integrate-with-mason-nvim
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- mason-lspconfig -----------------------------------------------------
        require("mason-lspconfig").setup({
            -- lsp_zero.default_setup,
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "pyright",
                "gopls",
                "marksman",
            },

            handlers = {
                lsp_zero.default_setup,
            },
        })

        -- autocomplete --------------------------------------------------------
        -- local cmp = require("cmp")
        -- local cmp_action = require("lsp-zero").cmp_action()

        -- cmp.setup({
        --     mapping = cmp.mapping.preset.insert({
        --         -- `Enter` key to confirm completion
        --         ["<CR>"] = cmp.mapping.confirm({ select = false }),

        --         -- Ctrl+Space to trigger completion menu
        --         ["<C-Space>"] = cmp.mapping.complete(),

        --         -- Navigate between snippet placeholder
        --         ["<C-n>"] = cmp_action.luasnip_jump_forward(),
        --         ["<C-p>"] = cmp_action.luasnip_jump_backward(),

        --         -- Scroll up and down in the completion documentation
        --         ["<C-S-j>"] = cmp.mapping.scroll_docs(-4),
        --         ["<C-S-k>"] = cmp.mapping.scroll_docs(4),
        --     }),
        -- })
    end,
}
