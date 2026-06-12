-- Documentación: módulo `lua/ui/lualine-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

  require('lualine').setup({
    options = {
      theme = BlindReturn('auto', 'auto'),
      icons_enabled = BlindReturn(false, true),
      component_separators = BlindReturn({ left = '', right = '' }, { left = '', right = '' }),
      section_separators = BlindReturn({ left = '', right = '' }, { left = '', right = '' }),
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = BlindReturn({ 'mode' }, { 'mode' }),
      lualine_b = BlindReturn({ 'filename', 'diagnostics' }, { 'branch', 'diff', 'diagnostics' }),
      lualine_c = BlindReturn({}, { 'filename' }),
      lualine_x = BlindReturn({ 'location' }, { 'encoding', 'fileformat', 'filetype' }),
      lualine_y = BlindReturn({}, { 'progress' }),
      lualine_z = BlindReturn({}, { 'location' })
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
      extensions = {'nvim-tree'}
  })
