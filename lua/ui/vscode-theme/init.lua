-- Documentación: módulo `lua/ui/vscode-theme/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme
-- vim.o.background = 'light'

local c = require('vscode.colors').get_colors()
local blind_group_overrides = {
    Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = false },
    LineNr = { fg = c.vscCursorDarkDark },
    CursorLineNr = { fg = c.vscLightBlue, bold = false },
    Visual = { bg = c.vscDarkBlue },
    StatusLine = { fg = c.vscFront, bg = c.vscDarkBlue },
    StatusLineNC = { fg = c.vscFront, bg = c.vscDarkBlue },
    NormalFloat = { bg = c.vscDarkBlue },
    FloatBorder = { fg = c.vscDarkBlue, bg = c.vscDarkBlue },
    Comment = { fg = c.vscCursorDarkGrey, italic = false },
}

require('vscode').setup({
    -- Alternatively set style in setup
     style = 'dark',

    -- Enable transparent background
    transparent = BlindReturn(false, true),

    -- Enable italic comment
    italic_comments = BlindReturn(false, true),

    -- Enable italic inlay type hints
    italic_inlayhints = BlindReturn(false, true),

    -- Underline `@markup.link.*` variants
    underline_links = BlindReturn(false, true),

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Apply theme colors to terminal
    terminal_colors = BlindReturn(false, true),

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = BlindReturn('#A0A0A0', '#FFFFFF'),
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = BlindReturn(blind_group_overrides.Cursor, { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true }),
        LineNr = BlindReturn(blind_group_overrides.LineNr, {}),
        CursorLineNr = BlindReturn(blind_group_overrides.CursorLineNr, {}),
        Visual = BlindReturn(blind_group_overrides.Visual, {}),
        StatusLine = BlindReturn(blind_group_overrides.StatusLine, {}),
        StatusLineNC = BlindReturn(blind_group_overrides.StatusLineNC, {}),
        NormalFloat = BlindReturn(blind_group_overrides.NormalFloat, {}),
        FloatBorder = BlindReturn(blind_group_overrides.FloatBorder, {}),
        Comment = BlindReturn(blind_group_overrides.Comment, {}),
    }
})
-- require('vscode').load()

-- load the theme without affecting devicon colors.
vim.cmd.colorscheme "vscode"