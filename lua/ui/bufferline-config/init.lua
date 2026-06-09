-- Documentación: módulo `lua/ui/bufferline-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `if (not vim.g.visual_impairing) then`.
if (not vim.g.visual_impairing) then
-- Línea documentada: `require("bufferline").setup {`.
        require("bufferline").setup {
-- Línea documentada: `options = {`.
    options = {
-- Línea documentada: `buffer_close_icon = "",`.
        buffer_close_icon = "",
-- Línea documentada: `close_command = "bdelete %d",`.
        close_command = "bdelete %d",
-- Línea documentada: `close_icon = "",`.
        close_icon = "",
-- Línea documentada: `indicator = {`.
        indicator = {
-- Línea documentada: `style = "icon",`.
          style = "icon",
-- Línea documentada: `icon = " ",`.
          icon = " ",
-- Línea documentada: `},`.
        },
-- Línea documentada: `left_trunc_marker = "",`.
        left_trunc_marker = "",
-- Línea documentada: `modified_icon = "●",`.
        modified_icon = "●",
-- Línea documentada: `offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },`.
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } },
-- Línea documentada: `right_mouse_command = "bdelete! %d",`.
        right_mouse_command = "bdelete! %d",
-- Línea documentada: `right_trunc_marker = "",`.
        right_trunc_marker = "",
-- Línea documentada: `show_close_icon = false,`.
        show_close_icon = false,
-- Línea documentada: `show_tab_indicators = true,`.
        show_tab_indicators = true,
-- Línea documentada: `},`.
    },
-- Línea documentada: `highlights = {`.
    highlights = {
-- Línea documentada: `fill = {`.
        fill = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "StatusLineNC" },`.
            bg = { attribute = "bg", highlight = "StatusLineNC" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `background = {`.
        background = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "StatusLine" },`.
            bg = { attribute = "bg", highlight = "StatusLine" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `buffer_visible = {`.
        buffer_visible = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "Normal" },`.
            bg = { attribute = "bg", highlight = "Normal" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `buffer_selected = {`.
        buffer_selected = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "Normal" },`.
            bg = { attribute = "bg", highlight = "Normal" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `separator = {`.
        separator = {
-- Línea documentada: `fg = { attribute = "bg", highlight = "Normal" },`.
            fg = { attribute = "bg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "StatusLine" },`.
            bg = { attribute = "bg", highlight = "StatusLine" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `separator_selected = {`.
        separator_selected = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Special" },`.
            fg = { attribute = "fg", highlight = "Special" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "Normal" },`.
            bg = { attribute = "bg", highlight = "Normal" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `separator_visible = {`.
        separator_visible = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "StatusLineNC" },`.
            bg = { attribute = "bg", highlight = "StatusLineNC" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `close_button = {`.
        close_button = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "StatusLine" },`.
            bg = { attribute = "bg", highlight = "StatusLine" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `close_button_selected = {`.
        close_button_selected = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "Normal" },`.
            bg = { attribute = "bg", highlight = "Normal" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `close_button_visible = {`.
        close_button_visible = {
-- Línea documentada: `fg = { attribute = "fg", highlight = "Normal" },`.
            fg = { attribute = "fg", highlight = "Normal" },
-- Línea documentada: `bg = { attribute = "bg", highlight = "Normal" },`.
            bg = { attribute = "bg", highlight = "Normal" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `},`.
    },
-- Línea documentada: `}`.
  }
-- Línea documentada: `end`.
end
