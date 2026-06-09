-- Documentación: módulo `lua/lsp/diagnostic_signs.lua`.
-- Propósito: define integración de LSP y autocompletado dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }`.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

-- Línea documentada: `for type, icon in pairs(signs) do`.
for type, icon in pairs(signs) do
-- Línea documentada: `local hl = "DiagnosticSign" .. type`.
  local hl = "DiagnosticSign" .. type
-- Línea documentada: `vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })`.
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- Línea documentada: `end`.
end


-- Línea documentada: `local group = vim.api.nvim_create_augroup('OoO', {})`.
local group = vim.api.nvim_create_augroup('OoO', {})

-- Línea documentada: `local function au(typ, pattern, cmdOrFn)`.
local function au(typ, pattern, cmdOrFn)
-- Línea documentada: `if type(cmdOrFn) == 'function' then`.
	if type(cmdOrFn) == 'function' then
-- Línea documentada: `vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })`.
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
-- Línea documentada: `else`.
	else
-- Línea documentada: `vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })`.
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
-- Línea documentada: `end`.
	end
-- Línea documentada: `end`.
end

-- Línea documentada: `au({ 'CursorHold', 'InsertLeave' }, nil, function()`.
au({ 'CursorHold', 'InsertLeave' }, nil, function()
-- Línea documentada: `local opts = {`.
	local opts = {
-- Línea documentada: `focusable = false,`.
		focusable = false,
-- Línea documentada: `scope = 'cursor',`.
		scope = 'cursor',
-- Línea documentada: `close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },`.
		close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
-- Línea documentada: `}`.
	}
-- Línea documentada: `vim.diagnostic.open_float(nil, opts)`.
	vim.diagnostic.open_float(nil, opts)
-- Línea documentada: `end)`.
end)

-- Línea documentada: `au('InsertEnter', nil, function()`.
au('InsertEnter', nil, function()
-- Línea documentada: `vim.diagnostic.enable(false)`.
	vim.diagnostic.enable(false)
-- Línea documentada: `end)`.
end)

-- Línea documentada: `au('InsertLeave', nil, function()`.
au('InsertLeave', nil, function()
-- Línea documentada: `vim.diagnostic.enable(true)`.
	vim.diagnostic.enable(true)
-- Línea documentada: `end)`.
end)


-- vim.diagnostic.config({
--   virtual_text = true,
--   virtual_lines = { current_line = true },
--   underline = true,
--   update_in_insert = false
-- })
