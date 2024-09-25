local kind_icons1 = {
  Text = "🅣",
  Method = "🅜",
  Function = "🅕",
  Constructor = "🅒",
  Field = "🅕",
  Variable = "🅥",
  Class = "🅒",
  Interface = "🅘",
  Module = "🅜",
  Property = "🅟",
  Unit = "🅤",
  Value = "🅥",
  Enum = "🅔",
  Keyword = "🅚",
  Snippet = "🅢",
  Color = "🅒",
  File = "🅕",
  Reference = "🅡",
  Folder = "🅕",
  EnumMember = "🅔",
  Constant = "🅒",
  Struct = "🅢",
  Event = "🅔",
  Operator = "🅞",
  TypeParameter = "🅣",
}

local kind_icons2 = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP
      "hrsh7th/cmp-buffer", -- Buffer
      "hrsh7th/cmp-path", -- File paths
      "saadparwaiz1/cmp_luasnip", -- Snippets
      "L3MON4D3/LuaSnip", -- Snippet engine
      "rafamadriz/friendly-snippets", -- Snippet collection
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
      {
        "Exafunction/codeium.nvim",
        config = function()
          require("codeium").setup({})
        end,
      },
    },
    config = function()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        formatting = {
          fields = { "kind", "abbr", "menu" }, -- Incluye "abbr" para controlar el texto de la sugerencia.
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s ", kind_icons1[vim_item.kind])
            vim_item.abbr = string.format("%-25s", vim_item.abbr)
            vim_item.menu = string.format(
              "%s",
              ({ nvim_lsp = "lsp", luasnip = "snip", buffer = "buff", path = "path" })[entry.source.name]
            )
            return vim_item
          end,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<C-c>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "treesitter" },
          { name = "path" },
          { name = "codeium" },
        }),
      })
    end,
  },
}
