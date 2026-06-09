-- Documentación: módulo `lua/tools/null-ls-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local null_ls = require('null-ls')`.
local null_ls = require('null-ls')

-- Línea documentada: `local formatting = null_ls.builtins.formatting`.
local formatting = null_ls.builtins.formatting

-- Línea documentada: `null_ls.setup({`.
null_ls.setup({
-- Línea documentada: `sources = {`.
  sources = {
-- Línea documentada: `formatting.prettier, formatting.gofmt, formatting.shfmt,`.
    formatting.prettier, formatting.gofmt, formatting.shfmt,
-- Línea documentada: `formatting.clang_format, formatting.cmake_format, formatting.dart_format, formatting.google_java_format,`.
    formatting.clang_format, formatting.cmake_format, formatting.dart_format, formatting.google_java_format,
-- Línea documentada: `formatting.isort, formatting.codespell.with({ filetypes = { 'markdown' } })`.
    formatting.isort, formatting.codespell.with({ filetypes = { 'markdown' } })
-- Línea documentada: `},`.
  },
-- Línea documentada: `on_attach = function(client)`.
  on_attach = function(client)
-- Línea documentada: `if client.server_capabilities.document_formatting then`.
    if client.server_capabilities.document_formatting then
-- Línea documentada: `vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")`.
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
-- Línea documentada: `end`.
    end
-- Línea documentada: `end`.
  end
-- Línea documentada: `})`.
})
