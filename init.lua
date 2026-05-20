--REQUIRES
--INITIAL LOAD
require('core.options') -- Vim basic options
require('core.keybindings') -- Global keybindings (TTS shoud be there configurated)
require('core.plugins') -- Packages manager (lazy.vim)

--If we dont execute NeoVim on VSCODE -> Load all this modules
if not vim.g.vscode then
    require('ai.avante-config')  -- Cargar avante temprano para que snacks esté disponible
    require('ui.blankline-config')
    require('lsp')
    require('ui.lualine-config')
    require('ui.bufferline-config')
    require('navigation.telescope-config')
    require('git.octo-config')
    require('debug.dap-config')
    require('tools.live-preview-config')
    require('tools.terminal-config')
    require('ui.vscode-theme')
    require("git.gitsigns-config")
    require('navigation.oil-config')
    require('tools.cmake-config')
    require('tools.null-ls-config')
    require('navigation.trouble-config')
    require('tools.urlview-config')
    require('tools.mini-config')
    require('tools.nvim-lint-config')
    require('tools.devcontainer-config')
    --require('ui.noice-config')
    require('tools.fasterbigfile-config')
    require('ui.render-markdown-config')
    require('aerial')
    require('ai.mcphub-config')
    require('tools.orphans-config')
    require('ai.copilot-config')
    vim.cmd [[colorscheme tokyonight-night]]
end
--This tools works in NeoVim and VSCode
require('tools.dial-config') --Improve numbers management
require('navigation.leap-config') --Faster movement on ui
require('tools.surround-config') -- Add, change and remove surrounding in pairs(parentheses, brackets, quotes, XML tags...)

