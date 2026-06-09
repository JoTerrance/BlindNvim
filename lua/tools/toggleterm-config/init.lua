-- Documentación: módulo `lua/tools/toggleterm-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

require"toggleterm".setup {
  size = 13,
  open_mapping = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
}
