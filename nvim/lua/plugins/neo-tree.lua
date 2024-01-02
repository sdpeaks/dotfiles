return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')

    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      default_source = "last",
      -- hide_root_node = true,
      -- retain_hidden_root_indent = true,

      source_selector = {
        winbar = true,
        show_scrolled_off_parent_node = false,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
          { source = "document_symbols" },
        },
        content_layout = "center",
        tabs_layout = "equal",
      },

      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = { "toggle_node", nowait = false, },
          ["<2-LeftMouse>"] = "open",
          ["l"] = { "open", config = { expand_nested_files = true } },
          ["<esc>"] = "cancel", -- close preview or floating neo-tree window
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } },
          -- ["l"] = "focus_preview", -- TODO change
          ["S"] = "open_split",
          -- ["S"] = "split_with_window_picker",
          ["s"] = "open_vsplit",
          -- ["s"] = "vsplit_with_window_picker",
          -- ["t"] = "open_tabnew", -- TODO change
          -- ["<cr>"] = "open_drop",
          -- ["t"] = "open_tab_drop",
          -- ["w"] = "open_with_window_picker",
          ["h"] = { "close_node" },
          ["z"] = "close_all_nodes",
          ["Z"] = "expand_all_nodes",
          ["R"] = "refresh",
          ["a"] = {
            "add",
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none", -- "none", "relative", "absolute"
            }
          },
          ["A"] = "add_directory", -- also accepts the config.show_path and config.insert_as options.
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
          ["m"] = "move", -- takes text input for destination, also accepts the config.show_path and config.insert_as options
          ["e"] = "toggle_auto_expand_width",
          ["q"] = "close_window",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },


    })
  end
}
