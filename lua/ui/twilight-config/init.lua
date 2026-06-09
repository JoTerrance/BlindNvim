-- Documentación: módulo `lua/ui/twilight-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

require("twilight").setup {
  {
    dimming = {alpha = 0.25, color = {"Normal", "#ffffff"}, inactive = true},
    context = 10,
    treesitter = true,
    expand = {"function", "method", "table", "if_statement"}
  }
}
