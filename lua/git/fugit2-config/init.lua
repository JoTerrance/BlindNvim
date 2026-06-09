-- Documentación: módulo `lua/git/fugit2-config/init.lua`.
-- Propósito: define integraciones de flujo de trabajo con Git dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require('fugit2').setup {`.
require('fugit2').setup {
-- Línea documentada: `width = 70,`.
  width = 70,
-- Línea documentada: `min_width = 50,`.
  min_width = 50,
-- Línea documentada: `content_width = 60,`.
  content_width = 60,
-- Línea documentada: `max_width = 100,`.
  max_width = 100,
-- Línea documentada: `external_diffview = false, -- tell fugit2 to use diffview.nvim instead of builtin implementation.`.
  external_diffview = false, -- tell fugit2 to use diffview.nvim instead of builtin implementation.
-- Línea documentada: `}`.
}
