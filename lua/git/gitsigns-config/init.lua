-- Documentación: módulo `lua/git/gitsigns-config/init.lua`.
-- Propósito: define integraciones de flujo de trabajo con Git dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require('gitsigns').setup {`.
require('gitsigns').setup {
-- Línea documentada: `current_line_blame = false,`.
  current_line_blame = false,
-- Línea documentada: `signs = {`.
  signs = {
-- Línea documentada: `add = { text = '+' },`.
    add = { text = '+' },
-- Línea documentada: `change = { text = '~' },`.
    change = { text = '~' },
-- Línea documentada: `delete = { text = '_' },`.
    delete = { text = '_' },
-- Línea documentada: `topdelete = { text = '‾' },`.
    topdelete = { text = '‾' },
-- Línea documentada: `changedelete = { text = '~' },`.
    changedelete = { text = '~' },
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}
