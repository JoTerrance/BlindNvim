-- Documentación: módulo `lua/ui/lualine-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require('lualine').setup({`.
  require('lualine').setup({
-- Línea documentada: `options = {`.
    options = {
-- Línea documentada: `theme = 'vscode',`.
      theme = 'vscode', 
-- Línea documentada: `icons_enabled = BlindReturn( false, true),`.
      icons_enabled = BlindReturn( false, true),
-- Línea documentada: `component_separators = BlindReturn({left = '', right = ''} ,{ left = '', right = ''}),`.
      component_separators = BlindReturn({left = '', right = ''} ,{ left = '', right = ''}),
-- Línea documentada: `section_separators = BlindReturn({left = '', right = ''} , { left = '', right = ''}),`.
      section_separators = BlindReturn({left = '', right = ''} , { left = '', right = ''}),
-- Línea documentada: `disabled_filetypes = {},`.
      disabled_filetypes = {},
-- Línea documentada: `always_divide_middle = true,`.
      always_divide_middle = true,
-- Línea documentada: `},`.
    },
-- Línea documentada: `sections = {`.
    sections = {
-- Línea documentada: `lualine_a = {'mode'},`.
      lualine_a = {'mode'},
-- Línea documentada: `lualine_b = {'branch', 'diff', 'diagnostics'},`.
      lualine_b = {'branch', 'diff', 'diagnostics'},
-- Línea documentada: `lualine_c = {'filename'},`.
      lualine_c = {'filename'},
-- Línea documentada: `lualine_x = {'encoding', 'fileformat', 'filetype'},`.
      lualine_x = {'encoding', 'fileformat', 'filetype'},
-- Línea documentada: `lualine_y = {'progress'},`.
      lualine_y = {'progress'},
-- Línea documentada: `lualine_z = {'location'}`.
      lualine_z = {'location'}
-- Línea documentada: `},`.
    },
-- Línea documentada: `inactive_sections = {`.
    inactive_sections = {
-- Línea documentada: `lualine_a = {},`.
      lualine_a = {},
-- Línea documentada: `lualine_b = {},`.
      lualine_b = {},
-- Línea documentada: `lualine_c = {'filename'},`.
      lualine_c = {'filename'},
-- Línea documentada: `lualine_x = {'location'},`.
      lualine_x = {'location'},
-- Línea documentada: `lualine_y = {},`.
      lualine_y = {},
-- Línea documentada: `lualine_z = {}`.
      lualine_z = {}
-- Línea documentada: `},`.
    },
-- Línea documentada: `tabline = {},`.
    tabline = {},
-- Línea documentada: `extensions = {'nvim-tree'}`.
      extensions = {'nvim-tree'}
-- Línea documentada: `})`.
  })
