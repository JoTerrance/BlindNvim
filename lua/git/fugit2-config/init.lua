-- Documentación: módulo `lua/git/fugit2-config/init.lua`.
-- Propósito: define integraciones de flujo de trabajo con Git dentro de BlindNvim sin alterar lógica de ejecución.

require('fugit2').setup {
  width = 70,
  min_width = 50,
  content_width = 60,
  max_width = 100,
  external_diffview = false, -- tell fugit2 to use diffview.nvim instead of builtin implementation.
}
