local plugin = { "nvim-treesitter/nvim-treesitter", event = "BufRead" }

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
