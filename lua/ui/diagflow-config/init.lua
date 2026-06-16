-- Documentación: módulo `lua/ui/diagflow-config/init.lua`.
-- Propósito: configurar diagflow.nvim para el perfil braille y exponer controles
-- de runtime que `which-key` puede reutilizar.

local M = {}

local normal = {
  enable = true,
  max_width = 60,
  max_height = 10,
  severity_colors = {
    error = "DiagnosticFloatingError",
    warning = "DiagnosticFloatingWarn",
    info = "DiagnosticFloatingInfo",
    hint = "DiagnosticFloatingHint",
  },
  format = function(diagnostic)
    return diagnostic.message
  end,
  gap_size = 1,
  scope = "cursor",
  padding_top = 0,
  padding_right = 0,
  text_align = "right",
  placement = "top",
  update_event = { "DiagnosticChanged", "BufReadPost" },
  toggle_event = {},
  show_sign = false,
  render_event = { "DiagnosticChanged", "CursorMoved" },
  show_borders = false,
}

local braille = {
  enable = true,
  max_width = math.max(vim.o.columns, 1),
  max_height = 10,
  severity_colors = {
    error = "DiagnosticFloatingError",
    warning = "DiagnosticFloatingWarn",
    info = "DiagnosticFloatingInfo",
    hint = "DiagnosticFloatingHint",
  },
  format = function(diagnostic)
    return diagnostic.message
  end,
  gap_size = 1,
  scope = "cursor",
  padding_top = 0,
  padding_right = 0,
  text_align = "left",
  placement = "top",
  update_event = { "DiagnosticChanged", "BufReadPost" },
  toggle_event = {},
  show_sign = false,
  render_event = { "DiagnosticChanged", "CursorMoved" },
  show_borders = false,
}

local state = {
  enabled = true,
  scope = "cursor",
}

local base_opts = BlindReturn(braille, normal)

local function apply()
  local opts = vim.deepcopy(base_opts)
  opts.enable = state.enabled
  opts.scope = state.scope
  require("diagflow").setup(opts)
end

function M.enable()
  state.enabled = true
  apply()
end

function M.disable()
  state.enabled = false
  apply()
end

function M.toggle()
  state.enabled = not state.enabled
  apply()
end

function M.set_scope(scope)
  if scope ~= "cursor" and scope ~= "line" then
    return
  end

  state.scope = scope
  apply()
end

function M.toggle_scope()
  state.scope = (state.scope == "cursor") and "line" or "cursor"
  apply()
end

apply()
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
  virtual_lines = false,
})
require("language.tools.diagnostics-whichkey").setup()

return M
