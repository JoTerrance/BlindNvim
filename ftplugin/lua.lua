-- Documentación: módulo `ftplugin/lua.lua`.
-- Propósito: define ajustes específicos por tipo de archivo dentro de BlindNvim sin alterar lógica de ejecución.

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- Línea documentada: `require("neodev").setup({`.
require("neodev").setup({
-- Línea documentada: `library = {`.
    library = {
-- Línea documentada: `enabled = true, -- when not enabled, neodev will not change any settings to the LSP server`.
        enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
-- Línea documentada: `runtime = true, -- runtime path`.
        runtime = true, -- runtime path
-- Línea documentada: `types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others`.
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
-- Línea documentada: `plugins = true, -- installed opt or start plugins in packpath`.
        plugins = true, -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files`.
    setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
    -- for your Neovim config directory, the config.library settings will be used as is
    -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
    -- for any other directory, config.library.enabled will be set to false
-- Línea documentada: `override = function(root_dir, options)`.
    override = function(root_dir, options)
-- Línea documentada: `end,`.
    end,
    -- With lspconfig, Neodev will automatically setup your lua-language-server
    -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
    -- in your lsp start options
-- Línea documentada: `lspconfig = true,`.
    lspconfig = true,
-- Línea documentada: `pathStrict = true,`.
    pathStrict = true,
-- Línea documentada: `})`.
})

-- then setup your lsp server as usual
-- local lspconfig = require('lspconfig')

-- example to setup sumneko and enable call snippets
-- lspconfig.lua_ls.setup({
--  settings = {
--    Lua = {
--      completion = {
--        callSnippet = "Replace"
--      }
--    }
--  }
--})
