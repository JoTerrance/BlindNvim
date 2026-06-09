-- Documentación: módulo `init.lua`.
-- Propósito: definir el punto de entrada de BlindNvim y el orden de carga global.
-- Mapa mental rápido:
-- 1) `core.*` prepara opciones base, keymaps y registro de plugins.
-- 2) Se cargan módulos "seguros" para Neovim y VSCode.
-- 3) El resto de integraciones solo se activa fuera de VSCode.

--REQUIRES
--INITIAL LOAD
require('core.options') -- Vim basic options
require('core.keybindings') -- Global keybindings (TTS shoud be there configurated)
require('core.plugins') -- Plugin manager bootstrap and plugin list (lazy.nvim)

--This tools works in NeoVim and VSCode
require('navigation.leap-config') -- Leap: jump quickly to visible targets for faster movement
require('tools.dial-config') -- Dial: increment/decrement numbers, dates, and similar values
require('tools.surround-config') -- nvim-surround: add/change/delete surrounding pairs like quotes/brackets/tags

-- Si se ejecuta dentro de VSCode (`vim.g.vscode`), evitamos módulos con UI pesada,
-- LSP completo y utilidades que asumen runtime puro de Neovim.
if not vim.g.vscode then
    require('lsp') -- LSP configuration

    require('navigation.oil-config') -- Oil: edit and navigate the filesystem as a buffer
    require('navigation.trouble-config') -- Trouble: structured diagnostics/references/location list view
    require('navigation.telescope-config') -- Telescope: fuzzy finder for files, symbols, grep, and pickers

    require("git.gitsigns-config") -- Gitsigns: inline git hunks, blame, and change actions
    require('git.octo-config') -- Octo: review and manage GitHub issues/PRs from Neovim

    require('debug.dap-config') -- nvim-dap stack: debug adapter protocol integration

    require('tools.live-preview-config') -- Live preview: render markdown/html previews while editing
    require('tools.terminal-config') -- Terminal helpers for shell workflows inside Neovim
    require('tools.cmake-config') -- CMake tools integration for configure/build/run commands
    require('tools.null-ls-config') -- none-ls/null-ls sources for formatting and diagnostics
    require('tools.urlview-config') -- URL view/open utilities for links found in buffers
    require('tools.mini-config') -- mini.nvim modules used across editing workflows
    require('tools.nvim-lint-config') -- nvim-lint: asynchronous lint runners per filetype
    require('tools.devcontainer-config') -- Devcontainer tooling integration inside Neovim
    require('tools.orphans-config') -- Orphans: detect/find files not tracked by current project references
    require('tools.fasterbigfile-config') -- Faster: optimize behavior when opening very large files

    require('aerial') -- Aerial: outline/symbol tree for quick code structure navigation

    require('ui.blankline-config') -- indent-blankline: visualize indentation guides
    require('ui.lualine-config') -- lualine: statusline components and sections
    require('ui.bufferline-config') -- bufferline: tab-like buffer list with diagnostics/icons
    require('ui.render-markdown-config') -- render-markdown: enhanced markdown rendering in buffers
    require('ui.dashboard-config') -- dashboard-nvim: startup screen with shortcuts and projects
    require('ui.vscode-theme') -- vscode.nvim theme and highlight tuning

    require('ai.copilot-config') -- GitHub Copilot suggestions and integrations
    require('ai.avante-config')  -- Avante AI assistant integration (loaded early so snacks.nvim UI helpers are ready)
    require('ai.mcphub-config') -- MCP/GP assistant integrations and AI command workflows
   
    -- Theme settings
    -- vim.cmd[[colorscheme tokyonight]]
    -- vim.g.tokyonight_style = 'night'

    --require('ui.noice-config')

end
