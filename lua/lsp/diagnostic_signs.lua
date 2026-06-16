-- Documentación: módulo `lua/lsp/diagnostic_signs.lua`.
-- Propósito: define integración de LSP y autocompletado dentro de BlindNvim sin alterar lógica de ejecución.

local signs = BlindReturn(
  { Error = "E ", Warn = "W ", Hint = "H ", Info = "I " },
  { Error = " ", Warn = " ", Hint = " ", Info = " " }
)

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  underline = BlindReturn(false, true),
  virtual_text = {
    spacing = 5,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  update_in_insert = BlindReturn(false, true),
})


local group = vim.api.nvim_create_augroup('OoO', {})

local function au(typ, pattern, cmdOrFn)
	if type(cmdOrFn) == 'function' then
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
	else
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
	end
end

if not vim.g.visual_impairing then
  au({ 'CursorHold', 'InsertLeave' }, nil, function()
    local opts = {
      focusable = false,
      scope = 'cursor',
      close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
    }
    vim.diagnostic.open_float(nil, opts)
  end)
end

au('InsertEnter', nil, function()
	vim.diagnostic.enable(false)
end)

au('InsertLeave', nil, function()
	vim.diagnostic.enable(true)
end)


