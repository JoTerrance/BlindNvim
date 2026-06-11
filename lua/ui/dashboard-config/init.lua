-- Documentación: módulo `lua/ui/dashboard-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

require('dashboard').setup {
    theme = 'hyper',    -- theme is doom and hyper default is hyper
    disable_move = false,       -- default is false disable move keymap for hyper
    shortcut_type = 'number',      -- shortcut type 'letter' or 'number'
    shuffle_letter = false,     -- default is false, shortcut 'letter' will be randomize, set to false to have ordered letter
--    letter_list = 'abcdefghijklmnopqrstuvwxyz',        -- default is a-z, excluding j and k
    change_to_vcs_root = false, -- default is false,for open file in hyper mru. it will change to the root of vcs
    config = {
    week_header = {
        enable = true,
    },
      shortcut = {
        { desc = BlindReturn('Update', '󰊳 Update'), group = '@property', action = 'Lazy update', key = 'u' },
        {
         icon = BlindReturn('FILES', ' '),
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        
        {
           icon = BlindReturn('RECENT', ' '),
            icon_hl = '@variable',
          desc = 'Recent files',
          group = 'Label',
          action = 'Telescope oldfiles',
          key = 'r',
        },
        {
        icon = BlindReturn('APPS', ' '),
        icon_hl = '@variable',
          desc = 'Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
         icon = BlindReturn('DOTS', ' '),
          icon_hl = '@variable',
          desc = 'dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },
      },
         packages = { enable = true }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a function type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
        project = { enable = true, limit = 8, icon = BlindReturn('PROJECTS', ' '), label = 'projects', action = 'Telescope find_files cwd=' },
        mru = { enable = true, limit = 10, icon = BlindReturn('RECENT', ' '), label = 'recent', cwd_only = false },
        footer = {}, -- footer

    },       -- config used for theme
    hide = {
    statusline = true,       -- hide statusline default is true
    tabline = true,          -- hide the tabline
    winbar = true,           -- hide winbar
    },
   
    
}

--dashboard.custom_footer = {''}
