-- Documentación: módulo `lua/tools/live-preview-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("live-command").setup {`.
require("live-command").setup {
-- Línea documentada: `enable_highlighting = true,`.
  enable_highlighting = true,
-- Línea documentada: `inline_highlighting = true,`.
  inline_highlighting = true,
-- Línea documentada: `hl_groups = {`.
  hl_groups = {
-- Línea documentada: `insertion = "DiffAdd",`.
    insertion = "DiffAdd",
-- Línea documentada: `deletion = "DiffDelete",`.
    deletion = "DiffDelete",
-- Línea documentada: `change = "DiffChange",`.
    change = "DiffChange",
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}
