-- Documentación: módulo `lua/navigation/leap-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')`.
vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
-- Línea documentada: `vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')`.
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
