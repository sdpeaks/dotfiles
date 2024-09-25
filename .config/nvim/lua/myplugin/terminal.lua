-- lua/myplugin/terminal.lua

local Terminal = {}
local terminals = {}
local current_terminal = nil
local tab_bar_win = nil
local terminal_height = 10 -- Ajusta la altura de la terminal en líneas
local tab_bar_height = 1 -- Altura de la barra de tabs en líneas

-- Crear una nueva terminal
function Terminal.new()
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = vim.o.columns,
    height = terminal_height,
    row = vim.o.lines - terminal_height,
    col = 0,
    style = "minimal",
  })
  vim.fn.termopen(vim.o.shell)
  table.insert(terminals, { buf = buf, win = win })
  if not current_terminal then
    current_terminal = #terminals
  end
  Terminal.update_tab_bar()
end

-- Alternar la terminal actual
function Terminal.toggle()
  if #terminals == 0 then
    Terminal.new()
  else
    local term = terminals[current_terminal]
    if vim.api.nvim_win_is_valid(term.win) then
      vim.api.nvim_win_close(term.win, true)
      Terminal.close_tab_bar()
    else
      term.win = vim.api.nvim_open_win(term.buf, true, {
        relative = "editor",
        width = vim.o.columns,
        height = terminal_height,
        row = vim.o.lines - terminal_height,
        col = 0,
        style = "minimal",
      })
      Terminal.update_tab_bar()
    end
  end
end

-- Actualizar la barra de tabs
function Terminal.update_tab_bar()
  -- Cerrar la barra de tabs anterior si existe
  Terminal.close_tab_bar()

  tab_bar_win = vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), false, {
    relative = "editor",
    width = vim.o.columns,
    height = tab_bar_height,
    row = vim.o.lines - terminal_height - tab_bar_height,
    col = 0,
    style = "minimal",
  })

  vim.api.nvim_buf_set_lines(vim.api.nvim_win_get_buf(tab_bar_win), 0, -1, false, Terminal.get_tab_lines())
end

-- Cerrar la barra de tabs
function Terminal.close_tab_bar()
  if tab_bar_win and vim.api.nvim_win_is_valid(tab_bar_win) then
    vim.api.nvim_win_close(tab_bar_win, true)
    tab_bar_win = nil
  end
end

-- Obtener las líneas para la barra de tabs
function Terminal.get_tab_lines()
  local lines = {}
  for i, term in ipairs(terminals) do
    local label = (i == current_terminal) and ("* Tab " .. i) or ("  Tab " .. i)
    table.insert(lines, label)
  end
  return lines
end

-- Cambiar al siguiente terminal
function Terminal.next()
  if #terminals > 1 then
    current_terminal = (current_terminal % #terminals) + 1
    Terminal.toggle()
  end
end

-- Cambiar al terminal anterior
function Terminal.prev()
  if #terminals > 1 then
    current_terminal = (current_terminal - 2 + #terminals) % #terminals + 1
    Terminal.toggle()
  end
end

return Terminal
