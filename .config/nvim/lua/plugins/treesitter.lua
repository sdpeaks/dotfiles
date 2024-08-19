local plugin = { "nvim-treesitter/nvim-treesitter" }

plugin.build = ":TSUpdate"
plugin.opts = true

plugin.config = function(_, opts)
  local configs = require("nvim-treesitter.configs")

  local ensure_installed = {
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
  }

  local incremental_selection_keymaps = {
    init_selection = "<c-space>",
    node_incremental = "<c-space>",
    scope_incremental = "<c-s>",
    node_decremental = "<c-backspace>",
  }

  local textobj_select_keymaps = {
    ["aa"] = "@parameter.outer",
    ["ia"] = "@parameter.inner",
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
  }

  local textobj_move_goto_next_start = {
    ["]m"] = "@function.outer",
    ["]]"] = "@class.outer",
  }

  local textobj_move_goto_next_end = {
    ["]m"] = "@function.outer",
    ["]["] = "@class.outer",
  }

  local textobj_move_goto_previous_start = {
    ["[m"] = "@function.outer",
    ["[["] = "@class.outer",
  }

  local textobj_move_goto_previous_end = {
    ["[m"] = "@function.outer",
    ["[]"] = "@class.outer",
  }

  configs.setup({
    ensure_installed = ensure_installed,
    auto_install = true,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
    endwise = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = incremental_selection_keymaps,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = textobj_select_keymaps,
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = textobj_move_goto_next_start,
        goto_next_end = textobj_move_goto_next_end,
        goto_previous_start = textobj_move_goto_previous_start,
        goto_previous_end = textobj_move_goto_previous_end,
      },
    },
  })
end

return { plugin }

--
--
--
--
-- return {
--   { -- Highlight, edit, and navigate code
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     opts = true,
--     config = function(_, opts)
--       -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
--       require("nvim-treesitter.configs").setup({
--         ensure_installed = {
--           "astro",
--           "bash",
--           "c_sharp",
--           "css",
--           "go",
--           "html",
--           "http",
--           "javascript",
--           "json",
--           "lua",
--           "python",
--           "svelte",
--           "tsx",
--           "typescript",
--         },
--         auto_install = true,
--         highlight = { enable = true },
--         indent = { enable = true },
--         endwise = { enable = true },
--         sync_install = false,
--         highlight = { enable = true },
--         indent = {
--           enable = true,
--           -- disable = {},
--         },
--         autopairs = {
--           enable = true,
--         },
--         autotag = {
--           enable = true,
--         },
--         --[[ context_commentstring = {
--         	enable = true,
--         	enable_autocmd = false,
--         }, ]]
--         incremental_selection = {
--           enable = true,
--           keymaps = {
--             init_selection = "<c-space>",
--             node_incremental = "<c-space>",
--             scope_incremental = "<c-s>",
--             node_decremental = "<c-backspace>",
--           },
--         },
--         textobjects = {
--           select = {
--             enable = true,
--             lookahead = true, -- automatically jump forward to textobj, similar to targets.vim
--             keymaps = {
--               -- you can use the capture groups defined in textobjects.scm
--               ["aa"] = "@parameter.outer",
--               ["ia"] = "@parameter.inner",
--               ["af"] = "@function.outer",
--               ["if"] = "@function.inner",
--               ["ac"] = "@class.outer",
--               ["ic"] = "@class.inner",
--             },
--           },
--           move = {
--             enable = true,
--             set_jumps = true, -- whether to set jumps in the jumplist
--             goto_next_start = {
--               ["]m"] = "@function.outer",
--               ["]]"] = "@class.outer",
--             },
--             goto_next_end = {
--               ["]m"] = "@function.outer",
--               ["]["] = "@class.outer",
--             },
--             goto_previous_start = {
--               ["[m"] = "@function.outer",
--               ["[["] = "@class.outer",
--             },
--             goto_previous_end = {
--               ["[m"] = "@function.outer",
--               ["[]"] = "@class.outer",
--             },
--           },
--         },
--       })
--     end,
--   },
-- }
