return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'ayu_mirage',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false, -- Cambia a true si quieres una sola barra compartida para todos los splits
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- Agregado aquí para mostrar solo el archivo actual
        lualine_c = {
          {
            'filename',
            file_status = true, -- Muestra si el archivo está modificado o es de solo lectura
            new_file_status = false, -- No muestra el tag de nuevo archivo de forma especial
            path = 1, -- 0: Solo nombre, 1: Ruta relativa, 2: Ruta absoluta, 3: Ruta relativa al home
            shorting_target = 40, -- Acorta la ruta si se queda sin espacio en pantalla
            symbols = {
              modified = ' ●', -- Icono/texto cuando el buffer tiene cambios sin guardar
              readonly = ' ', -- Icono/texto cuando es de solo lectura
              unnamed = '[Sin nombre]', -- Texto si el buffer no se ha guardado en un archivo todavía
              newfile = '[Nuevo]', -- Texto para un archivo nuevo no guardado
            },
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
