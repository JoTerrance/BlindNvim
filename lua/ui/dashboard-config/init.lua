-- Documentación: módulo `lua/ui/dashboard-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require('dashboard').setup {`.
require('dashboard').setup {
-- Línea documentada: `theme = 'hyper',    -- theme is doom and hyper default is hyper`.
    theme = 'hyper',    -- theme is doom and hyper default is hyper
-- Línea documentada: `disable_move = false,       -- default is false disable move keymap for hyper`.
    disable_move = false,       -- default is false disable move keymap for hyper
-- Línea documentada: `shortcut_type = 'number',      -- shortcut type 'letter' or 'number'`.
    shortcut_type = 'number',      -- shortcut type 'letter' or 'number'
-- Línea documentada: `shuffle_letter = false,     -- default is false, shortcut 'letter' will be randomize, set to false to have ordered letter`.
    shuffle_letter = false,     -- default is false, shortcut 'letter' will be randomize, set to false to have ordered letter
--    letter_list = 'abcdefghijklmnopqrstuvwxyz',        -- default is a-z, excluding j and k
-- Línea documentada: `change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs`.
    change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
-- Línea documentada: `config = {`.
    config = {
-- Línea documentada: `week_header = {`.
    week_header = {
-- Línea documentada: `enable = true,`.
        enable = true,
-- Línea documentada: `},`.
    },
-- Línea documentada: `shortcut = {`.
      shortcut = {
-- Línea documentada: `{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },`.
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
-- Línea documentada: `{`.
        {
-- Línea documentada: `icon = ' ',`.
          icon = ' ',
-- Línea documentada: `icon_hl = '@variable',`.
          icon_hl = '@variable',
-- Línea documentada: `desc = 'Files',`.
          desc = 'Files',
-- Línea documentada: `group = 'Label',`.
          group = 'Label',
-- Línea documentada: `action = 'Telescope find_files',`.
          action = 'Telescope find_files',
-- Línea documentada: `key = 'f',`.
          key = 'f',
-- Línea documentada: `},`.
        },
        
-- Línea documentada: `{`.
        {
-- Línea documentada: `icon = ' ',`.
            icon = ' ',
-- Línea documentada: `icon_hl = '@variable',`.
            icon_hl = '@variable',
-- Línea documentada: `desc = 'Recent files',`.
          desc = 'Recent files',
-- Línea documentada: `group = 'Label',`.
          group = 'Label',
-- Línea documentada: `action = 'Telescope oldfiles',`.
          action = 'Telescope oldfiles',
-- Línea documentada: `key = 'r',`.
          key = 'r',
-- Línea documentada: `},`.
        },
-- Línea documentada: `{`.
        {
-- Línea documentada: `icon = ' ',`.
        icon = ' ',
-- Línea documentada: `icon_hl = '@variable',`.
        icon_hl = '@variable',
-- Línea documentada: `desc = 'Apps',`.
          desc = 'Apps',
-- Línea documentada: `group = 'DiagnosticHint',`.
          group = 'DiagnosticHint',
-- Línea documentada: `action = 'Telescope app',`.
          action = 'Telescope app',
-- Línea documentada: `key = 'a',`.
          key = 'a',
-- Línea documentada: `},`.
        },
-- Línea documentada: `{`.
        {
-- Línea documentada: `icon = ' ',`.
          icon = ' ',
-- Línea documentada: `icon_hl = '@variable',`.
          icon_hl = '@variable',
-- Línea documentada: `desc = 'dotfiles',`.
          desc = 'dotfiles',
-- Línea documentada: `group = 'Number',`.
          group = 'Number',
-- Línea documentada: `action = 'Telescope dotfiles',`.
          action = 'Telescope dotfiles',
-- Línea documentada: `key = 'd',`.
          key = 'd',
-- Línea documentada: `},`.
        },
-- Línea documentada: `},`.
      },
-- Línea documentada: `packages = { enable = true }, -- show how many plugins neovim loaded`.
         packages = { enable = true }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a function type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
-- Línea documentada: `project = { enable = true, limit = 8, icon = ' ', label = 'projects', action = 'Telescope find_files cwd=' },`.
        project = { enable = true, limit = 8, icon = ' ', label = 'projects', action = 'Telescope find_files cwd=' },
-- Línea documentada: `mru = { enable = true, limit = 10, icon = ' ', label = 'recent', cwd_only = false },`.
        mru = { enable = true, limit = 10, icon = ' ', label = 'recent', cwd_only = false },
-- Línea documentada: `footer = {}, -- footer`.
        footer = {}, -- footer

-- Línea documentada: `},       -- config used for theme`.
    },       -- config used for theme
-- Línea documentada: `hide = {`.
    hide = {
-- Línea documentada: `statusline = true,       -- hide statusline default is true`.
    statusline = true,       -- hide statusline default is true
-- Línea documentada: `tabline = true,          -- hide the tabline`.
    tabline = true,          -- hide the tabline
-- Línea documentada: `winbar = true,           -- hide winbar`.
    winbar = true,           -- hide winbar
-- Línea documentada: `},`.
    },
   
    
-- Línea documentada: `}`.
}

--dashboard.custom_footer = {''}
