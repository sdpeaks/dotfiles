return {

  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- :Format command
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({
          async = true,
          lsp_fallback = true,
          range = range,
        })
      end, { range = true })

      vim.keymap.set({ "n", "v" }, "<leader>lf", ":Format<cr>", { desc = "Format selection or file" })

      local slow_format_filetypes = {}
      require("conform").setup({
        -- notify_on_error = false,
        --
        format_on_save = function(bufnr)
          if slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
          end
          local function on_format(err)
            if err and err:match("timeout$") then
              slow_format_filetypes[vim.bo[bufnr].filetype] = true
            end
          end
          return { timeout_ms = 500, lsp_fallback = true }, on_format
        end,

        format_after_save = function()
          -- if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          --    return
          -- end
          -- ...additional logic...
          return { lsp_fallback = true }
        end,

        formatters_by_ft = {
          -- prettier
          javascript = { "prettier" }, -- sublist run first available
          typescript = { "prettier" }, -- sublist run first available
          javascriptreact = { "prettier" }, -- sublist run first available
          typescriptreact = { "prettier" }, -- sublist run first available
          svelte = { "prettier" }, -- sublist run first available
          astro = { { "astro" } },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          graphql = { "prettier" },
          markdown = { "prettier" },

          -- lua
          lua = { "stylua" },

          -- python
          python = { "isort", "black" },

          -- golang
          go = { "gofmt", "goimports" },
        },
      })

      -- local conform = require("conform")

      -- define formatter
      -- conform.formatters.stylua = {
      -- prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" }, -- 2 spaces instead of tab
      -- }
    end,
  },
}
