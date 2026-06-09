-- Documentación: módulo `lua/tools/toggleterm-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require"toggleterm".setup {`.
require"toggleterm".setup {
-- Línea documentada: `size = 13,`.
  size = 13,
-- Línea documentada: `open_mapping = [[<c-\>]],`.
  open_mapping = [[<c-\>]],
-- Línea documentada: `shade_filetypes = {},`.
  shade_filetypes = {},
-- Línea documentada: `shade_terminals = true,`.
  shade_terminals = true,
-- Línea documentada: `shading_factor = '1',`.
  shading_factor = '1',
-- Línea documentada: `start_in_insert = true,`.
  start_in_insert = true,
-- Línea documentada: `persist_size = true,`.
  persist_size = true,
-- Línea documentada: `direction = 'horizontal'`.
  direction = 'horizontal'
-- Línea documentada: `}`.
}
