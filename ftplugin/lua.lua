-- Documentación: módulo `ftplugin/lua.lua`.
-- Propósito: define ajustes específicos por tipo de archivo dentro de BlindNvim sin alterar lógica de ejecución.

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

require('tools.neogen-whichkey').setup()
