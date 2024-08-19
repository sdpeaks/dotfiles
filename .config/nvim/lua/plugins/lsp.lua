local plugin = { "neovim/nvim-lspconfig" }

plugin.dependencies = {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  { "j-hui/fidget.nvim", opts = {} },
  { "folke/neodev.nvim", opts = {} },
}

function plugin.init()
  local sign = function(opts)
    vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = "",
    })
  end

  sign({ name = "DiagnosticSignError", text = "✘" })
  sign({ name = "DiagnosticSignWarn", text = "▲" })
  sign({ name = "DiagnosticSignHint", text = "⚑" })
  sign({ name = "DiagnosticSignInfo", text = "»" })

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
      border = "rounded",
      source = "always",
    },
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

plugin.config = function()
  -- Función para mapear teclas con descripción y contexto específico
  local function map_lsp_keys(buf)
    local function map(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
    end

    local telescope_builtin = require("telescope.builtin")
    map("<leader>ld", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
    map("<leader>lD", vim.lsp.buf.declaration, "Goto [D]eclaration")
    map("<leader>lr", telescope_builtin.lsp_references, "Goto References")
    map("<leader>lI", telescope_builtin.lsp_implementations, "Goto [I]mplementation")
    map("<leader>lt", telescope_builtin.lsp_type_definitions, "[T]ype Definition")
    map("<leader>ls", telescope_builtin.lsp_document_symbols, "Document [s]ymbols")
    map("<leader>lS", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>ln", vim.lsp.buf.rename, "Re[n]ame")
    map("<leader>la", vim.lsp.buf.code_action, "Code [A]ction")
    map("<leader>K", vim.lsp.buf.hover, "Hover Documentation")
  end

  -- Configuración de autocomandos para LSP
  local function setup_lsp_autocommands(buf, client)
    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end

  -- Evento de adjuntar LSP a un buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
      map_lsp_keys(event.buf)
      setup_lsp_autocommands(event.buf, vim.lsp.get_client_by_id(event.data.client_id))
    end,
  })

  -- Capabilities
  local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
  )

  -- Configuración de servidores LSP
  local servers = {
    astro = {},
    bashls = {},
    jsonls = {},
    gopls = {},
    pyright = {},
    tsserver = {},
    svelte = {},
    lua_ls = {
      settings = {
        Lua = {
          codelens = { enable = true },
          telemetry = { enable = false },
          completion = { callSnippet = "Replace" },
          workspace = { library = { "/usr/share/awesome/lib/" } },
          diagnostics = {
            globals = { "vim", "awesome", "awful", "client", "screen", "tag" },
            disable = { "missing-fields" },
          },
        },
      },
    },
  }

  local ensure_installed = vim.tbl_keys(servers)
  vim.list_extend(ensure_installed, {
    "stylua",
    "isort",
    "black",
    "ruff",
    "prettier",
    "eslint_d",
    "gofumpt",
    "goimports",
    "gomodifytags",
    "golangci-lint",
    "gotests",
    "iferr",
    "impl",
  })

  -- Configuración de Mason y LSP
  require("mason").setup()
  require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
  require("mason-lspconfig").setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        require("lspconfig")[server_name].setup(server)
      end,
    },
  })
end

return { plugin }

-- return {
--
--   -- "simrat39/inlay-hints.nvim",
--   -- "jose-elias-alvarez/nvim-lsp-ts-utils",
--   -- "b0o/schemastore.nvim",
--
--   { -- LSP Configuration & Plugins
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--       "WhoIsSethDaniel/mason-tool-installer.nvim",
--       { "j-hui/fidget.nvim", opts = {} },
--       { "folke/neodev.nvim", opts = {} },
--     },
--
--     config = function()
--       -- on attach function
--       vim.api.nvim_create_autocmd("LspAttach", {
--         group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
--         callback = function(event)
--           local map = function(keys, func, desc)
--             vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
--           end
--
--           -- Jump to the definition of the word under your cursor.
--           --  To jump back, press <C-t>.
--           map("<leader>ld", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
--
--           -- WARN: This is not Goto Definition, this is Goto Declaration.
--           map("<leader>lD", vim.lsp.buf.declaration, "Goto [D]eclaration")
--
--           -- Find references for the word under your cursor.
--           map("<leader>lr", require("telescope.builtin").lsp_references, "Goto References")
--
--           --  Useful when your language has ways of declaring types without an actual implementation.
--           map("<leader>lI", require("telescope.builtin").lsp_implementations, "Goto [I]mplementation")
--
--           --  Useful when you're not sure what type a variable is and you want to see
--           map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "[T]ype Definition")
--
--           -- Fuzzy find all the symbols in your current document.
--           map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Document [s]ymbols")
--
--           --  Similar to document symbols, except searches over your whole project.
--           map("<leader>lS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
--
--           -- Rename the variable under your cursor
--           map("<leader>ln", vim.lsp.buf.rename, "Re[n]ame")
--
--           -- Execute a code action, usually your cursor needs to be on top of an error
--           map("<leader>la", vim.lsp.buf.code_action, "Code [A]ction")
--
--           -- Opens a popup that displays documentation about the word under your cursor
--           map("<leader>K", vim.lsp.buf.hover, "Hover Documentation")
--
--           -- The following two autocommands are used to highlight references of the word under your cursor
--           -- When you move your cursor, the highlights will be cleared (the second autocommand).
--           local client = vim.lsp.get_client_by_id(event.data.client_id)
--           if client and client.server_capabilities.documentHighlightProvider then
--             vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--               buffer = event.buf,
--               callback = vim.lsp.buf.document_highlight,
--             })
--
--             vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--               buffer = event.buf,
--               callback = vim.lsp.buf.clear_references,
--             })
--           end
--         end,
--       })
--
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
--
--       local servers = {
--         astro = {},
--         bashls = {},
--         jsonls = {},
--         gopls = {},
--         pyright = {},
--         tsserver = {},
--         -- csharp_ls = {},
--         svelte = {},
--         lua_ls = {
--           -- cmd = {...},
--           -- filetypes { ...},
--           -- capabilities = {},
--           settings = {
--             Lua = {
--               codelens = { enable = true },
--               telemetry = { enable = false },
--               completion = {
--                 callSnippet = "Replace",
--               },
--               workspace = {
--                 library = {
--                   -- awesome
--                   "/usr/share/awesome/lib/",
--                 },
--               },
--               -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--               diagnostics = {
--                 globals = {
--                   -- vim
--                   "vim",
--
--                   -- awesomewm
--                   "awesome",
--                   "awful",
--                   "client",
--                   "screen",
--                   "tag",
--                 },
--                 disable = { "missing-fields" },
--               },
--             },
--           },
--         },
--       }
--
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         "stylua", -- Used to format lua code
--
--         -- python
--         "isort",
--         "black",
--         "ruff",
--
--         -- javascript
--         "prettier",
--         -- "prettierd",
--         "eslint_d",
--
--         -- c#
--
--         -- go
--         "gofumpt",
--         "goimports",
--         "gomodifytags",
--         "golangci-lint",
--         "gotests",
--         "iferr",
--         "impl",
--       })
--
--       require("mason").setup()
--       require("mason-tool-installer").setup({
--         ensure_installed = ensure_installed,
--       })
--
--       require("mason-lspconfig").setup({
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             -- This handles overriding only values explicitly passed
--             -- by the server configuration above. Useful when disabling
--             -- certain features of an LSP (for example, turning off formatting for tsserver)
--             server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
--             require("lspconfig")[server_name].setup(server)
--           end,
--         },
--       })
--     end,
--   },
-- }

-- {
--   "jinzhongjia/LspUI.nvim",
--   branch = "main",
--   config = function()
--     require("LspUI").setup({
--       -- config options go here
--     })
--   end,
-- },
