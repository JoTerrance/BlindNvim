-- Documentación: módulo `lua/lsp/language_servers.lua`.
-- Propósito: define integración de LSP y autocompletado dentro de BlindNvim sin alterar lógica de ejecución.

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
-- local servers = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'rust_analyzer' }
-- Línea documentada: `local servers = {}`.
local servers = {}

-- Setup lspconfig.
-- Línea documentada: `local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())`.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Línea documentada: `capabilities.textDocument.completion.completionItem.snippetSupport = true`.
capabilities.textDocument.completion.completionItem.snippetSupport = true
-- Línea documentada: `local lsp = require('lsp-zero')`.
local lsp = require('lsp-zero')

-- Línea documentada: `local lsp_zero = require('lsp-zero')`.
local lsp_zero = require('lsp-zero')
-- Línea documentada: `lsp_zero.on_attach(function(client, bufnr)`.
lsp_zero.on_attach(function(client, bufnr)
-- Línea documentada: `lsp_zero.default_keymaps({buffer = bufnr})`.
  lsp_zero.default_keymaps({buffer = bufnr})
-- Línea documentada: `end)`.
end)

-- Línea documentada: `require('mason').setup({})`.
require('mason').setup({})
-- Línea documentada: `require('mason-lspconfig').setup({`.
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
-- Línea documentada: `ensure_installed = servers,`.
  ensure_installed = servers,
-- Línea documentada: `handlers = {`.
    handlers = {
-- Línea documentada: `lsp_zero.default_setup,`.
      lsp_zero.default_setup,
-- Línea documentada: `lua_ls = function()`.
      lua_ls = function()
-- Línea documentada: `local lua_opts = lsp_zero.nvim_lua_ls()`.
        local lua_opts = lsp_zero.nvim_lua_ls()
-- Línea documentada: `require('lspconfig').lua_ls.setup(lua_opts)`.
        require('lspconfig').lua_ls.setup(lua_opts)
-- Línea documentada: `end,`.
      end,
-- Línea documentada: `},`.
    },

-- Línea documentada: `})`.
})

-- Línea documentada: `require "lsp_signature".setup({`.
require "lsp_signature".setup({
-- Línea documentada: `bind = true, -- This is mandatory, otherwise border config won't get registered.`.
    bind = true, -- This is mandatory, otherwise border config won't get registered.
-- Línea documentada: `handler_opts = {`.
    handler_opts = {
-- Línea documentada: `border = "rounded"`.
      border = "rounded"
-- Línea documentada: `}`.
    }
-- Línea documentada: `})`.
  })

-- local lsp_installer = require('nvim-lsp-installer')
--[[
-- Línea documentada: `lsp_installer.on_server_ready(function(server)`.
lsp_installer.on_server_ready(function(server)
-- Línea documentada: `local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol`.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol
-- Línea documentada: `.make_client_capabilities())`.
                                                                    .make_client_capabilities())
-- Línea documentada: `local opts = {capabilities = capabilities}`.
  local opts = {capabilities = capabilities}
-- Línea documentada: `if server.name == "sumneko_lua" then`.
  if server.name == "sumneko_lua" then
-- Línea documentada: `opts = vim.tbl_deep_extend("force", {`.
    opts = vim.tbl_deep_extend("force", {
-- Línea documentada: `settings = {`.
      settings = {
-- Línea documentada: `Lua = {`.
        Lua = {
-- Línea documentada: `runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},`.
          runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
-- Línea documentada: `diagnostics = {globals = {'vim'}},`.
          diagnostics = {globals = {'vim'}},
-- Línea documentada: `workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},`.
          workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
-- Línea documentada: `telemetry = {enable = false}`.
          telemetry = {enable = false}
-- Línea documentada: `}`.
        }
-- Línea documentada: `}`.
      }

-- Línea documentada: `}, opts)`.
    }, opts)
-- Línea documentada: `end`.
  end
-- Línea documentada: `server:setup(opts)`.
  server:setup(opts)
-- Línea documentada: `end)]]`.
end)]]
