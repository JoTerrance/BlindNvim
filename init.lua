-- Documentación: módulo `init.lua`.
-- Propósito: define configuración modular de Neovim dentro de BlindNvim sin alterar lógica de ejecución.

--REQUIRES
--INITIAL LOAD
-- Línea documentada: `require('core.options') -- Vim basic options`.
require('core.options') -- Vim basic options
-- Línea documentada: `require('core.keybindings') -- Global keybindings (TTS shoud be there configurated)`.
require('core.keybindings') -- Global keybindings (TTS shoud be there configurated)
-- Línea documentada: `require('core.plugins') -- Plugin manager bootstrap and plugin list (lazy.nvim)`.
require('core.plugins') -- Plugin manager bootstrap and plugin list (lazy.nvim)

--This tools works in NeoVim and VSCode
-- Línea documentada: `require('navigation.leap-config') -- Leap: jump quickly to visible targets for faster movement`.
require('navigation.leap-config') -- Leap: jump quickly to visible targets for faster movement
-- Línea documentada: `require('tools.dial-config') -- Dial: increment/decrement numbers, dates, and similar values`.
require('tools.dial-config') -- Dial: increment/decrement numbers, dates, and similar values
-- Línea documentada: `require('tools.surround-config') -- nvim-surround: add/change/delete surrounding pairs like quotes/brackets/tags`.
require('tools.surround-config') -- nvim-surround: add/change/delete surrounding pairs like quotes/brackets/tags

--If we dont execute NeoVim on VSCODE -> Load all this modules
-- Línea documentada: `if not vim.g.vscode then`.
if not vim.g.vscode then
-- Línea documentada: `require('lsp') -- LSP configuration`.
    require('lsp') -- LSP configuration

-- Línea documentada: `require('navigation.oil-config') -- Oil: edit and navigate the filesystem as a buffer`.
    require('navigation.oil-config') -- Oil: edit and navigate the filesystem as a buffer
-- Línea documentada: `require('navigation.trouble-config') -- Trouble: structured diagnostics/references/location list view`.
    require('navigation.trouble-config') -- Trouble: structured diagnostics/references/location list view
-- Línea documentada: `require('navigation.telescope-config') -- Telescope: fuzzy finder for files, symbols, grep, and pickers`.
    require('navigation.telescope-config') -- Telescope: fuzzy finder for files, symbols, grep, and pickers

-- Línea documentada: `require("git.gitsigns-config") -- Gitsigns: inline git hunks, blame, and change actions`.
    require("git.gitsigns-config") -- Gitsigns: inline git hunks, blame, and change actions
-- Línea documentada: `require('git.octo-config') -- Octo: review and manage GitHub issues/PRs from Neovim`.
    require('git.octo-config') -- Octo: review and manage GitHub issues/PRs from Neovim

-- Línea documentada: `require('debug.dap-config') -- nvim-dap stack: debug adapter protocol integration`.
    require('debug.dap-config') -- nvim-dap stack: debug adapter protocol integration

-- Línea documentada: `require('tools.live-preview-config') -- Live preview: render markdown/html previews while editing`.
    require('tools.live-preview-config') -- Live preview: render markdown/html previews while editing
-- Línea documentada: `require('tools.terminal-config') -- Terminal helpers for shell workflows inside Neovim`.
    require('tools.terminal-config') -- Terminal helpers for shell workflows inside Neovim
-- Línea documentada: `require('tools.cmake-config') -- CMake tools integration for configure/build/run commands`.
    require('tools.cmake-config') -- CMake tools integration for configure/build/run commands
-- Línea documentada: `require('tools.null-ls-config') -- none-ls/null-ls sources for formatting and diagnostics`.
    require('tools.null-ls-config') -- none-ls/null-ls sources for formatting and diagnostics
-- Línea documentada: `require('tools.urlview-config') -- URL view/open utilities for links found in buffers`.
    require('tools.urlview-config') -- URL view/open utilities for links found in buffers
-- Línea documentada: `require('tools.mini-config') -- mini.nvim modules used across editing workflows`.
    require('tools.mini-config') -- mini.nvim modules used across editing workflows
-- Línea documentada: `require('tools.nvim-lint-config') -- nvim-lint: asynchronous lint runners per filetype`.
    require('tools.nvim-lint-config') -- nvim-lint: asynchronous lint runners per filetype
-- Línea documentada: `require('tools.devcontainer-config') -- Devcontainer tooling integration inside Neovim`.
    require('tools.devcontainer-config') -- Devcontainer tooling integration inside Neovim
-- Línea documentada: `require('tools.orphans-config') -- Orphans: detect/find files not tracked by current project references`.
    require('tools.orphans-config') -- Orphans: detect/find files not tracked by current project references
-- Línea documentada: `require('tools.fasterbigfile-config') -- Faster: optimize behavior when opening very large files`.
    require('tools.fasterbigfile-config') -- Faster: optimize behavior when opening very large files

-- Línea documentada: `require('aerial') -- Aerial: outline/symbol tree for quick code structure navigation`.
    require('aerial') -- Aerial: outline/symbol tree for quick code structure navigation

-- Línea documentada: `require('ui.blankline-config') -- indent-blankline: visualize indentation guides`.
    require('ui.blankline-config') -- indent-blankline: visualize indentation guides
-- Línea documentada: `require('ui.lualine-config') -- lualine: statusline components and sections`.
    require('ui.lualine-config') -- lualine: statusline components and sections
-- Línea documentada: `require('ui.bufferline-config') -- bufferline: tab-like buffer list with diagnostics/icons`.
    require('ui.bufferline-config') -- bufferline: tab-like buffer list with diagnostics/icons
-- Línea documentada: `require('ui.render-markdown-config') -- render-markdown: enhanced markdown rendering in buffers`.
    require('ui.render-markdown-config') -- render-markdown: enhanced markdown rendering in buffers
-- Línea documentada: `require('ui.dashboard-config') -- dashboard-nvim: startup screen with shortcuts and projects`.
    require('ui.dashboard-config') -- dashboard-nvim: startup screen with shortcuts and projects
-- Línea documentada: `require('ui.vscode-theme') -- vscode.nvim theme and highlight tuning`.
    require('ui.vscode-theme') -- vscode.nvim theme and highlight tuning

-- Línea documentada: `require('ai.copilot-config') -- GitHub Copilot suggestions and integrations`.
    require('ai.copilot-config') -- GitHub Copilot suggestions and integrations
-- Línea documentada: `require('ai.avante-config')  -- Avante AI assistant integration (loaded early so snacks.nvim UI helpers are ready)`.
    require('ai.avante-config')  -- Avante AI assistant integration (loaded early so snacks.nvim UI helpers are ready)
-- Línea documentada: `require('ai.mcphub-config') -- MCP/GP assistant integrations and AI command workflows`.
    require('ai.mcphub-config') -- MCP/GP assistant integrations and AI command workflows
   
    -- Theme settings
    -- vim.cmd[[colorscheme tokyonight]]
    -- vim.g.tokyonight_style = 'night'

    --require('ui.noice-config')

-- Línea documentada: `end`.
end
