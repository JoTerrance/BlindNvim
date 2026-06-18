-- Módulo `lua/lsp/language_servers.lua`: bootstrap de Mason + lspconfig + blink.cmp.
-- Flujo:
-- 1) Mason instala servidores definidos en `servers`.
-- 2) lsp-zero aplica setup por defecto a cada servidor.
-- 3) handlers especiales sobrescriben casos puntuales (ej. lua_ls).

-- Lista explícita de LSPs a instalar automáticamente.
-- Está vacía por defecto para no forzar toolchains en todos los entornos.
-- Ejemplo: { 'clangd', 'pyright', 'lua_ls' }
-- local servers = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'rust_analyzer' }
local servers = {}

-- Setup lspconfig.
local capabilities = require("blink.cmp").get_lsp_capabilities()
-- Mantener capacidades de completion unificadas evita diferencias de UX entre
-- servidores (sugerencias, snippets y fuentes de completado disponibles).
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig({
  capabilities = capabilities,
})
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({
  ui = BlindReturn({
    width = 1,
    height = 1,
    border = "none",
  }, {
    border = "rounded",
  }),
})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = servers,
    handlers = {
      lsp_zero.default_setup,
      -- `lua_ls` usa ajustes recomendados para runtime de Neovim (`vim` global, etc.).
      lua_ls = function()
        local lua_opts = lsp_zero.nvim_lua_ls()
        require('lspconfig').lua_ls.setup(lua_opts)
      end,
    },

})

