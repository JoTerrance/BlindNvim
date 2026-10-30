-- Documentación: módulo `lua/core/keybindings/init.lua`.
-- Propósito: define atajos globales del editor dentro de BlindNvim sin alterar lógica de ejecución.

-- Complextras.nvim configuration
local map = vim.api.nvim_set_keymap
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })

-- Remap for dealing with word wrap; counted jumps above 5 also go to the jumplist
map('n', 'k', [[v:count == 0 ? 'gk' : (v:count > 5 ? "m'" . v:count : '') . 'k']], { noremap = true, expr = true, silent = true })
map('n', 'j', [[v:count == 0 ? 'gj' : (v:count > 5 ? "m'" . v:count : '') . 'j']], { noremap = true, expr = true, silent = true })

map('v', '<', '<gv', { noremap = true, silent = false })
map('v', '>', '>gv', { noremap = true, silent = false })

-- keeping it centered
map('n', 'N', 'Nzzzv', { noremap = true })
map('n', 'J', 'mzJ`z', { noremap = true })
-- undo break points
map('i', ',', ',<C-g>u', { noremap = true })
map('i', '.', '.<C-g>u', { noremap = true })
map('i', '?', '?<C-g>u', { noremap = true })
map('i', '!', '!<C-g>u', { noremap = true })
-- moving text
map('v', '<M-C-Up>', ':m \'>-2<CR>gv=gv', { noremap = true })
map('v', '<M-C-Down>', ':m \'>+1<CR>gv=gv', { noremap = true })
map('i', '<M-C-Down>', '<esc>:m .+1<CR>==<insert>', { noremap = true })
map('i', '<M-C-Up>', '<esc>:m .-2<CR>==<insert>', { noremap = true })
-- deletei setection  to void register then paste before
map('x', "<leader>p", '"_dP', { noremap = true })
-- command palette vscode similar functionality
map('n', '<M-C-p>', '<cmd>lua Snacks.picker() <CR>', { noremap = true })
-- multiple cursors (<Plug> mappings must be recursive, so no noremap here)
map('n', '<C-LeftMouse>', '<Plug>(VM-Mouse-Cursor)', {})
map('n', '<C-RightMouse>', '<Plug>(VM-Mouse-Word)', {})
map('n', '<M-C-RightMouse>', '<Plug>(VM-Mouse-Word)', {})
