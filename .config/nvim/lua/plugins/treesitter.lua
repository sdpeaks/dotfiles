return {
  { -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = true,
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "bash",
          "c_sharp",
          "css",
          "go",
          "html",
          "http",
          "javascript",
          "json",
          "lua",
          "python",
          "svelte",
          "tsx",
          "typescript",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
          -- disable = {},
        },
        autopairs = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        --[[ context_commentstring = {
        	enable = true,
        	enable_autocmd = false,
        }, ]]
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- you can use the capture groups defined in textobjects.scm
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]m"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[m"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}
