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
      automatic_installation = true,
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "pyright",
        "gopls",
        -- "omnisharp",
        -- "fsautocomplete",
        -- "marksman",
      },

      handlers = {
        lsp_zero.default_setup,

        -- function(server_name) -- default handler (optional)
        --   require("lspconfig")[server_name].setup({})
        -- end,

        -- language servers --------------------------------------------

        -- lua_ls
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                telemetry = { enable = false },
                runtime = {
                  version = "LuaJIT",
                  special = {
                    reload = "require",
                  },
                },
                diagnostics = {
                  globals = { "vim", "lvim", "reload" },
                },
              },
            },

            diagnostics = {
              globals = { "vim" },
            },
          })
        end,

        -- pyright
        ["pyright"] = function()
          require("lspconfig").pyright.setup({
            settings = {
              python = {
                formatting = {
                  provider = "black",
                },
              },
            },
          })
        end,
      },
    })
  end,
}
