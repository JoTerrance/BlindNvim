-- Documentación: módulo `lua/ui/vscode-theme/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Lua:
-- For dark theme (neovim's default)
-- Línea documentada: `vim.o.background = 'dark'`.
vim.o.background = 'dark'
-- For light theme
-- vim.o.background = 'light'

-- Línea documentada: `local c = require('vscode.colors').get_colors()`.
local c = require('vscode.colors').get_colors()
-- Línea documentada: `require('vscode').setup({`.
require('vscode').setup({
    -- Alternatively set style in setup
-- Línea documentada: `style = 'dark',`.
     style = 'dark',

    -- Enable transparent background
-- Línea documentada: `transparent = true,`.
    transparent = true,

    -- Enable italic comment
-- Línea documentada: `italic_comments = true,`.
    italic_comments = true,

    -- Enable italic inlay type hints
-- Línea documentada: `italic_inlayhints = true,`.
    italic_inlayhints = true,

    -- Underline `@markup.link.*` variants
-- Línea documentada: `underline_links = true,`.
    underline_links = true,

    -- Disable nvim-tree background color
-- Línea documentada: `disable_nvimtree_bg = true,`.
    disable_nvimtree_bg = true,

    -- Apply theme colors to terminal
-- Línea documentada: `terminal_colors = true,`.
    terminal_colors = true,

    -- Override colors (see ./lua/vscode/colors.lua)
-- Línea documentada: `color_overrides = {`.
    color_overrides = {
-- Línea documentada: `vscLineNumber = '#FFFFFF',`.
        vscLineNumber = '#FFFFFF',
-- Línea documentada: `},`.
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
-- Línea documentada: `group_overrides = {`.
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
-- Línea documentada: `Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },`.
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
-- Línea documentada: `}`.
    }
-- Línea documentada: `})`.
})
-- require('vscode').load()

-- load the theme without affecting devicon colors.
-- Línea documentada: `vim.cmd.colorscheme "vscode"`.
vim.cmd.colorscheme "vscode"