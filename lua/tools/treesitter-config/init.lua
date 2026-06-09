-- Documentación: módulo `lua/tools/treesitter-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(`.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
-- Línea documentada: `vim.lsp.diagnostic.on_publish_diagnostics,`.
    vim.lsp.diagnostic.on_publish_diagnostics,
-- Línea documentada: `{`.
    {
-- Línea documentada: `underline = true,`.
        underline = true,
-- Línea documentada: `virtual_text = {`.
        virtual_text = {
-- Línea documentada: `spacing = 5,`.
            spacing = 5,
-- Línea documentada: `min = 'Warning',`.
            min = 'Warning',
-- Línea documentada: `},`.
        },
-- Línea documentada: `update_in_insert = true,`.
        update_in_insert = true,
-- Línea documentada: `}`.
    }
-- Línea documentada: `)`.
)

