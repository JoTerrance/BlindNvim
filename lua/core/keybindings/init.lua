-- Documentación: módulo `lua/core/keybindings/init.lua`.
-- Propósito: define atajos globales del editor dentro de BlindNvim sin alterar lógica de ejecución.

-- Complextras.nvim configuration
-- Línea documentada: `local map = vim.api.nvim_set_keymap`.
local map = vim.api.nvim_set_keymap
-- Línea documentada: `map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})`.
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = false})
-- Línea documentada: `map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})`.
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = false})
-- Línea documentada: `map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})`.
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = false})
-- Línea documentada: `map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})`.
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = false})

-- Remap for dealing with word wrap
-- Línea documentada: `map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })`.
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- Línea documentada: `map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })`.
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Línea documentada: `map('v', '<', '<gv', {noremap = true, silent = false})`.
map('v', '<', '<gv', {noremap = true, silent = false})
-- Línea documentada: `map('v', '>', '>gv', {noremap = true, silent = false})`.
map('v', '>', '>gv', {noremap = true, silent = false})

-- keeping it centered
-- Línea documentada: `map('n', 'N', 'Nzzzv', {noremap = true})`.
map('n', 'N', 'Nzzzv', {noremap = true})
-- Línea documentada: `map('n', 'J', 'mzJ`z', {noremap = true})`.
map('n', 'J', 'mzJ`z', {noremap = true})
-- undo break points
-- Línea documentada: `map('i', ',', ',<C-g>u', {noremap = true})`.
map('i', ',', ',<C-g>u', {noremap = true})
-- Línea documentada: `map('i', '.', '.<C-g>u', {noremap = true})`.
map('i', '.', '.<C-g>u', {noremap = true})
-- Línea documentada: `map('i', '?', '?<C-g>u', {noremap = true})`.
map('i', '?', '?<C-g>u', {noremap = true})
-- Línea documentada: `map('i', '!', '!<C-g>u', {noremap = true})`.
map('i', '!', '!<C-g>u', {noremap = true})
-- Jumplist mutation
-- Línea documentada: `map('n', '<expr> k', '(v:count > 5 ? "m\'" . v:count : "") . \'k\'', {noremap = true})`.
map('n', '<expr> k', '(v:count > 5 ? "m\'" . v:count : "") . \'k\'', {noremap = true})
-- Línea documentada: `map('n', '<expr> j', '(v:count > 5 ? "m\'" . v:count : "") . \'j\'', {noremap = true})`.
map('n', '<expr> j', '(v:count > 5 ? "m\'" . v:count : "") . \'j\'', {noremap = true})
-- moving text 
-- Línea documentada: `map('v', '<M-C-Up>', ':m \'>-2<CR>gv=gv', {noremap = true})`.
map('v', '<M-C-Up>', ':m \'>-2<CR>gv=gv', {noremap = true})
-- Línea documentada: `map('v', '<M-C-Down>', ':m \'>+1<CR>gv=gv', {noremap = true})`.
map('v', '<M-C-Down>', ':m \'>+1<CR>gv=gv', {noremap = true})
-- Línea documentada: `map('i', '<M-C-Down>', '<esc>:m .+1<CR>==<insert>', {noremap = true})`.
map('i', '<M-C-Down>', '<esc>:m .+1<CR>==<insert>', {noremap = true})
-- Línea documentada: `map('i', '<M-C-Up>', '<esc>:m .-2<CR>==<insert>', {noremap = true})`.
map('i', '<M-C-Up>', '<esc>:m .-2<CR>==<insert>', {noremap = true})
-- deletei setection  to void register then paste before
-- Línea documentada: `map('x', "<leader>p", '"_dP', {noremap = true})`.
map('x', "<leader>p", '"_dP', {noremap = true})
-- command palette vscode similar functionality
-- Línea documentada: `map('n', '<M-C-p>', '<cmd>:Telescope <CR>', {noremap = true})`.
map('n', '<M-C-p>', '<cmd>:Telescope <CR>', {noremap = true})
-- multiple cursors
-- Línea documentada: `map('n', '<C-LeftMouse>', '<Plug>(VM-Mouse-Cursor)', {noremap = true})`.
map('n', '<C-LeftMouse>', '<Plug>(VM-Mouse-Cursor)', {noremap = true})
-- Línea documentada: `map('n', '<C-RightMouse>', '<Plug>(VM-Mouse-Word)', {noremap = true})`.
map('n', '<C-RightMouse>', '<Plug>(VM-Mouse-Word)', {noremap = true})
-- Línea documentada: `map('n', '<M-C-RightMouse>', '<Plug>(VM-Mouse-Word)', {noremap = true})`.
map('n', '<M-C-RightMouse>', '<Plug>(VM-Mouse-Word)', {noremap = true})

