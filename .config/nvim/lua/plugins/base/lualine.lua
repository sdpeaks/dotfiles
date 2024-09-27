return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			  options = {
				-- theme = 'gruvbox',  -- Cambia esto por tu tema preferido
				section_separators = '',
				component_separators = ''
			  },
			  sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
					function()
						local filepath = vim.fn.expand('%:p')  -- Obtiene el path completo del archivo
						local root_dir = vim.fn.getcwd()  -- Obtiene el directorio de trabajo actual
						local filename = vim.fn.expand('%:t')  -- Obtiene solo el nombre del archivo con extensión

						-- Compara el directorio actual con la raíz del proyecto
						if filepath:find(root_dir) then
							local relative_path = filepath:gsub(root_dir .. '/', ''):gsub('/', ' / ') -- :gsub('/' .. filename .. '$', '')
							return relative_path
						else
							return filename  -- Solo nombre del archivo con extensión si no está en el directorio del proyecto
						end
					end,
					}
				},

				lualine_x = {
				  {
					function()
					  local clients = vim.lsp.get_active_clients()
					  return #clients > 0 and 'LSP' or ''  -- Muestra "LSP" si hay clientes activos
					end,
				  },
				},
				lualine_y = {
				  {
					"location"
					-- function()
					--   return string.format('%d:%d', unpack(vim.api.nvim_win_get_cursor(0)))  -- Muestra línea y columna
					-- end,
				  },
				},
				lualine_z = {
				  {
					function()
					  return vim.fn.mode():sub(1, 1):upper()  -- Muestra la inicial del modo en mayúscula
					end,
				  },
				},
			},
		})
	end,
}
