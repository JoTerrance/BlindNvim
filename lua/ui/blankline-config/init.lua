-- Documentación: módulo `lua/ui/blankline-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `if not vim.g.visual_impairing then`.
if not vim.g.visual_impairing then

-- Línea documentada: `local highlight = {`.
local highlight = {
-- Línea documentada: `"RainbowRed",`.
    "RainbowRed",
-- Línea documentada: `"RainbowYellow",`.
    "RainbowYellow",
-- Línea documentada: `"RainbowBlue",`.
    "RainbowBlue",
-- Línea documentada: `"RainbowOrange",`.
    "RainbowOrange",
-- Línea documentada: `"RainbowGreen",`.
    "RainbowGreen",
-- Línea documentada: `"RainbowViolet",`.
    "RainbowViolet",
-- Línea documentada: `"RainbowCyan",`.
    "RainbowCyan",
-- Línea documentada: `}`.
}
-- Línea documentada: `local hooks = require "ibl.hooks"`.
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- Línea documentada: `hooks.register(hooks.type.HIGHLIGHT_SETUP, function()`.
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- Línea documentada: `vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })`.
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
-- Línea documentada: `vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })`.
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
-- Línea documentada: `vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })`.
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
-- Línea documentada: `vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })`.
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
-- Línea documentada: `vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })`.
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
-- Línea documentada: `vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })`.
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
-- Línea documentada: `vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })`.
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- Línea documentada: `end)`.
end)

-- Línea documentada: `vim.g.rainbow_delimiters = { highlight = highlight }`.
vim.g.rainbow_delimiters = { highlight = highlight }
-- Línea documentada: `require("ibl").setup {`.
require("ibl").setup { 
-- Línea documentada: `scope = { highlight = highlight, },`.
    scope = { highlight = highlight, }, 
-- Línea documentada: `exclude = {`.
    exclude = {
-- Línea documentada: `filetypes = { 'dashboard', 'alpha', 'startify', 'lspinfo', 'packer' , 'man', 'help', 'gitcommit', 'checkhealth', 'TelescopePrompt', 'TelescopeResults' }, -- exclude these filetypes`.
        filetypes = { 'dashboard', 'alpha', 'startify', 'lspinfo', 'packer' , 'man', 'help', 'gitcommit', 'checkhealth', 'TelescopePrompt', 'TelescopeResults' }, -- exclude these filetypes
-- Línea documentada: `buftypes = { 'terminal', 'nofile', 'quickfix', 'prompt' }, -- exclude these buftypes`.
        buftypes = { 'terminal', 'nofile', 'quickfix', 'prompt' }, -- exclude these buftypes
-- Línea documentada: `},`.
    },
-- Línea documentada: `}`.
}

-- Línea documentada: `hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)`.
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- Línea documentada: `end`.
end
