-- Documentación: módulo `lua/ui/zen-mode-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("zen-mode").setup {`.
require("zen-mode").setup {
-- Línea documentada: `window = {`.
  window = {
-- Línea documentada: `backdrop = 0.95,`.
    backdrop = 0.95,
-- Línea documentada: `width = 1,`.
    width = 1,
-- Línea documentada: `height = 1,`.
    height = 1,
-- Línea documentada: `options = {signcolumn = "no", number = false, cursorline = false}`.
    options = {signcolumn = "no", number = false, cursorline = false}
-- Línea documentada: `},`.
  },
-- Línea documentada: `plugins = {`.
  plugins = {
-- Línea documentada: `options = {enabled = true, ruler = false, showcmd = false},`.
    options = {enabled = true, ruler = false, showcmd = false},
-- Línea documentada: `twilight = {enabled = true},`.
    twilight = {enabled = true},
-- Línea documentada: `gitsigns = {enabled = false},`.
    gitsigns = {enabled = false},
-- Línea documentada: `tmux = {enabled = false}`.
    tmux = {enabled = false}
-- Línea documentada: `}`.
  }
-- Línea documentada: `}`.
}
