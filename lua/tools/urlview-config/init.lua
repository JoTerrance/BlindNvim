-- Documentación: módulo `lua/tools/urlview-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("urlview").setup({`.
require("urlview").setup({
  -- Prompt title (`<context> <default_title>`, e.g. `Buffer Links:`)
-- Línea documentada: `default_title = "Links:",`.
  default_title = "Links:",
  -- Default picker to display links with
  -- Options: "native" (vim.ui.select) or "telescope"
-- Línea documentada: `default_picker = "telescope",`.
  default_picker = "telescope",
  -- Set the default protocol for us to prefix URLs with if they don't start with http/https
-- Línea documentada: `default_prefix = "https://",`.
  default_prefix = "https://",
  -- Command or method to open links with
  -- Options: "netrw", "system" (default OS browser), "clipboard"; or "firefox", "chromium" etc.
  -- By default, this is "netrw", or "system" if netrw is disabled
-- Línea documentada: `default_action = "system",`.
  default_action = "system",
  -- Ensure links shown in the picker are unique (no duplicates)
-- Línea documentada: `unique = true,`.
  unique = true,
  -- Ensure links shown in the picker are sorted alphabetically
-- Línea documentada: `sorted = true,`.
  sorted = true,
  -- Minimum log level (recommended at least `vim.log.levels.WARN` for error detection warnings)
-- Línea documentada: `log_level_min = vim.log.levels.INFO,`.
  log_level_min = vim.log.levels.INFO,
  -- Keymaps for jumping to previous / next URL in buffer
-- Línea documentada: `jump = {`.
  jump = {
-- Línea documentada: `prev = "[u",`.
    prev = "[u",
-- Línea documentada: `next = "]u",`.
    next = "]u",
-- Línea documentada: `},`.
  },
-- Línea documentada: `})`.
	})
