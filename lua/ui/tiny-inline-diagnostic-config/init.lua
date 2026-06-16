-- Documentación: módulo `lua/ui/tiny-inline-diagnostic-config/init.lua`.
-- Propósito: configurar tiny-inline-diagnostic con perfiles normal y braille.

local normal = {
  preset = "modern",
  transparent_bg = false,
  transparent_cursorline = true,
  hi = {
    error = "DiagnosticError",
    warn = "DiagnosticWarn",
    info = "DiagnosticInfo",
    hint = "DiagnosticHint",
    arrow = "NonText",
    background = "CursorLine",
    mixing_color = "Normal",
  },
  options = {
    show_source = {
      enabled = false,
      if_many = false,
    },
    show_code = true,
    use_icons_from_diagnostic = false,
    set_arrow_to_diag_color = false,
    throttle = 20,
    softwrap = 30,
    add_messages = {
      messages = true,
      display_count = false,
      use_max_severity = false,
      show_multiple_glyphs = true,
    },
    multilines = {
      enabled = true,
      always_show = false,
    },
  },
}

local braille = {
  preset = "minimal",
  transparent_bg = true,
  transparent_cursorline = true,
  options = {
    show_source = {
      enabled = false,
      if_many = false,
    },
    show_code = false,
    use_icons_from_diagnostic = false,
    set_arrow_to_diag_color = false,
    throttle = 12,
    softwrap = 20,
    add_messages = {
      messages = false,
      display_count = false,
      use_max_severity = true,
      show_multiple_glyphs = false,
    },
    multilines = {
      enabled = false,
      always_show = false,
    },
  },
}

require('tiny-inline-diagnostic').setup(BlindReturn(braille, normal))
vim.diagnostic.config({ virtual_text = false, underline = false, virtual_lines = false })
require('language.tools.diagnostics-whichkey').setup()
