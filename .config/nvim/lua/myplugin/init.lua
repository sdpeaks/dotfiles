-- lua/myplugin/init.lua

local M = {}
local Terminal = require("myplugin.terminal")

-- Configuración predeterminada
M.config = {
  toggle_key = "<leader>tt", -- Tecla para alternar la terminal
  new_key = "<leader>tn", -- Tecla para crear una nueva terminal
  next_tab_key = "<leader>th", -- Tecla para cambiar al siguiente tab de terminal
  prev_tab_key = "<leader>tl", -- Tecla para cambiar al tab anterior de terminal
}

-- Función de setup para configurar el plugin
function M.setup(user_config)
  -- Combina la configuración predeterminada con la configuración del usuario
  M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

  -- Mapeo de teclas
  vim.api.nvim_set_keymap(
    "n",
    M.config.toggle_key,
    ":lua require'myplugin'.toggle_terminal()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    M.config.new_key,
    ":lua require'myplugin'.new_terminal()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    M.config.next_tab_key,
    ":lua require'myplugin'.next_terminal()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    M.config.prev_tab_key,
    ":lua require'myplugin'.prev_terminal()<CR>",
    { noremap = true, silent = true }
  )
end

-- Función para alternar la terminal
function M.toggle_terminal()
  Terminal.toggle()
end

-- Función para crear una nueva terminal
function M.new_terminal()
  Terminal.new()
end

-- Función para cambiar al siguiente terminal (tab)
function M.next_terminal()
  Terminal.next()
end

-- Función para cambiar al terminal anterior (tab)
function M.prev_terminal()
  Terminal.prev()
end

return M
