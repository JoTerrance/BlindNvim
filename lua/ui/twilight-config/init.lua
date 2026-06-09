-- Documentación: módulo `lua/ui/twilight-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("twilight").setup {`.
require("twilight").setup {
-- Línea documentada: `{`.
  {
-- Línea documentada: `dimming = {alpha = 0.25, color = {"Normal", "#ffffff"}, inactive = true},`.
    dimming = {alpha = 0.25, color = {"Normal", "#ffffff"}, inactive = true},
-- Línea documentada: `context = 10,`.
    context = 10,
-- Línea documentada: `treesitter = true,`.
    treesitter = true,
-- Línea documentada: `expand = {"function", "method", "table", "if_statement"}`.
    expand = {"function", "method", "table", "if_statement"}
-- Línea documentada: `}`.
  }
-- Línea documentada: `}`.
}
