-- Documentación: módulo `lua/ai/tabnine-config/init.lua`.
-- Propósito: define integraciones de asistentes de IA dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require('tabnine').setup({`.
require('tabnine').setup({
-- Línea documentada: `disable_auto_comment=true,`.
  disable_auto_comment=true,
-- Línea documentada: `accept_keymap="<C-x>",`.
  accept_keymap="<C-x>",
-- Línea documentada: `dismiss_keymap = "<C-]>",`.
  dismiss_keymap = "<C-]>",
-- Línea documentada: `debounce_ms = 800,`.
  debounce_ms = 800,
-- Línea documentada: `suggestion_color = {gui = "#808080", cterm = 244},`.
  suggestion_color = {gui = "#808080", cterm = 244},
-- Línea documentada: `exclude_filetypes = {"TelescopePrompt", "NvimTree"},`.
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
-- Línea documentada: `log_file_path = nil, -- absolute path to Tabnine log file`.
  log_file_path = nil, -- absolute path to Tabnine log file
-- Línea documentada: `})`.
})
