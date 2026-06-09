-- Documentación: módulo `lua/navigation/aerial-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("aerial").setup({`.
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
-- Línea documentada: `on_attach = function(bufnr)`.
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
-- Línea documentada: `vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })`.
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
-- Línea documentada: `vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })`.
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `})`.
})
