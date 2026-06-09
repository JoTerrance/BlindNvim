--REQUIRES
--INITIAL LOAD
require('core.options') -- Vim basic options
require('core.keybindings') -- Global keybindings (TTS shoud be there configurated)
require('core.plugins') -- Packages manager (lazy.vim)

--This tools works in NeoVim and VSCode
require('navigation.leap-config') --Faster movement on ui
require('tools.dial-config') --Improve numbers management
require('tools.surround-config') -- Add, change and remove surrounding in pairs(parentheses, brackets, quotes, XML tags...)

--If we dont execute NeoVim on VSCODE -> Load all this modules
if not vim.g.vscode then
    require('lsp') -- LSP configuration

    require('navigation.oil-config')
    require('navigation.trouble-config')
    require('navigation.telescope-config')

    require("git.gitsigns-config")
    require('git.octo-config')

    require('debug.dap-config')

    require('tools.live-preview-config')
    require('tools.terminal-config')
    require('tools.cmake-config')
    require('tools.null-ls-config')
    require('tools.urlview-config')
    require('tools.mini-config')
    require('tools.nvim-lint-config')
    require('tools.devcontainer-config')
    require('tools.orphans-config')
    require('tools.fasterbigfile-config')

    require('aerial')

    require('ui.blankline-config')
    require('ui.lualine-config')
    require('ui.bufferline-config')
    require('ui.render-markdown-config')
    require('ui.dashboard-config')
    require('ui.vscode-theme')

    require('ai.copilot-config')
    require('ai.avante-config')  -- Cargar avante temprano para que snacks esté disponible
    require('ai.mcphub-config')
   
    -- Theme settings
    -- vim.cmd[[colorscheme tokyonight]]
    -- vim.g.tokyonight_style = 'night'

    --require('ui.noice-config')

end

