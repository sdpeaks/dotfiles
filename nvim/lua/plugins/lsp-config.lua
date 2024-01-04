return {
    -- {
    --     "williamboman/mason.nvim",
    --     config = function()
    --         require("mason").setup({
    --             ui = {
    --                 icons = {
    --                     package_installed = "✓",
    --                     package_pending = "➜",
    --                     package_uninstalled = "✗",
    --                 },
    --             },
    --         })
    --     end,
    -- },

    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     config = function()
    --         require("mason-lspconfig").setup({
    --             ensure_installed = {
    --                 "lua_ls",
    --                 "tsserver",
    --                 "pyright",
    --                 "gopls",
    --                 "marksman",
    --             },
    --         })
    --     end,
    -- },

    -- {
    --     "neovim/nvim-lspconfig",
    --     config = function()
    --         local lspconfig = require("lspconfig")
    --         local capabilities = require("cmp_nvim_lsp").default_capabilities()

    --         lspconfig.lua_ls.setup({ capabilities = capabilities })
    --         lspconfig.gopls.setup({ capabilities = capabilities })
    --         lspconfig.pyright.setup({ capabilities = capabilities })
    --         lspconfig.marksman.setup({ capabilities = capabilities })
    --         lspconfig.tsserver.setup({ capabilities = capabilities })

    --         -- keymaps
    --         vim.keymap.set("n", "K", vim.lsp.buf.hover)
    --         vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    --     end,
    -- },
}
